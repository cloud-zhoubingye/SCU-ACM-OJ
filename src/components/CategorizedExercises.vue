<style>
.layout{
    border: 1px solid #c693eb;
    background: hsl(275, 26%, 91%);
    position: relative;
    border-radius: 4px;
    overflow: hidden;
}
.layout-logo{
    width: 80px;
    height: 50px;
    background: #7523ab;
    border-radius: 2px;
    float: left;
    position: relative;
    top: 5px;
    left: 30px;
}
.layout-nav{
    width: 550px;
    margin: 0 auto;
    margin-right: 20px;
    color: #fff;
}
.demo-split{
        height: 800px;
        border: 1px solid #dcdee2;
}
.demo-split-pane{
    padding: 10px;
}
.demo-split-pane.no-padding{
    height: 200px;
    padding: 0;
}
.time{
    font-size: 14px;
    font-weight: bold;
}
.content{
    padding-left: 5px;
}
</style>
<template>
    <div class="layout">
        <Layout>
            <Header>
                <Menu mode="horizontal" theme="dark" active-name="1">
                    <div class="layout-logo"> 
                        <img src="../../public/background/proj_icon.png" alt="logo" style="width: 100%; height: 100%;"/> 
                    </div>
                    <div class="layout-nav">
                        <MenuItem name="1" @click="on_select_categorized_exercises">
                            <Icon type="ios-navigate"></Icon>
                            比赛列表
                        </MenuItem>                        
                        <MenuItem name="2" @click="on_select_hard_based_exercises">
                            <Icon type="ios-navigate"></Icon>
                            比赛详情
                        </MenuItem>
                        <MenuItem name="3" @click="on_select_history">
                            <Icon type="ios-navigate"></Icon>
                            评测记录
                        </MenuItem>
                        <MenuItem name="4" @click="on_select_person_info">
                            <Icon type="ios-navigate"></Icon>
                            个人信息
                        </MenuItem>
                    </div>
                </Menu>
            </Header>
            <Layout>
                <Layout :style="{padding: '0 24px 24px'}">
                    <Breadcrumb :style="{margin: '24px 0'}" >
                        <BreadcrumbItem>Home</BreadcrumbItem>
                        <BreadcrumbItem>Contest List</BreadcrumbItem>
                    </Breadcrumb>
                    <Card style="width:98%; left: 1%;">
                        <template #title><h2 style="color: #8c0776;">Contests</h2></template>
                        <div class="demo-split" style="height: 500px;">
                            <Split v-model="split">
                                <template #left>
                                    <div class="demo-split-pane">
                                        <Card>
                                            <Table :columns="columns" :data="contestList" height="440">
                                                <template #id="{ row }">
                                                    <span>{{ row.id }}</span>
                                                </template>
                                                <template #name="{ row }">
                                                    <span>{{ row.name }}</span>
                                                </template>
                                                <template #action="{ row }">
                                                    <div>
                                                        <Button @click="handleView(row)">View</Button>
                                                    </div>
                                                </template>
                                            </Table>
                                        </Card>
                                    </div>
                                </template>
                                <template #right>
                                    <div class="demo-split-pane" style="margin-left: 8px;">
                                        <Card>
                                            <template #title><h2><Trend flag="up">{{ recentContestTitle }}</Trend></h2></template>
                                            <div style="margin-left: 20px;">
                                                <br>
                                                <Timeline>
                                                    <TimelineItem>
                                                        <p class="time">{{ recentContestCreateTime }}</p>
                                                        <p class="content">比赛创建</p>
                                                    </TimelineItem>
                                                    <TimelineItem>
                                                        <p class="time">{{ recentContestStartTime }}</p>
                                                        <p class="content">比赛开始</p>
                                                    </TimelineItem>
                                                    <TimelineItem>
                                                        <p class="time">{{ recentContestEndTime }}</p>
                                                        <p class="content">比赛结束</p>
                                                    </TimelineItem>
                                                </Timeline>
                                                <br>
                                                <Button type="primary" @click="submit" style="width: 100px;">Enter</Button>
                                            </div>
                                        </Card>
                                    </div>
                                </template>
                            </Split>
                        </div>
                    </Card>
                </Layout>
            </Layout>
        </Layout>
    </div>
    <Footer> </Footer>
</template>

<script>
    import { Editor, Toolbar } from '@wangeditor/editor-for-vue'
    import Footer from '@/components/Footer.vue'
    import axios from 'axios'
    export default {
        components: { Editor, Toolbar, Footer },
        data () {
            return {
                columns: [
                    {
                        title: 'Contest',
                        slot: 'name'
                    },
                    {
                        title: 'View',
                        slot: 'action',
                        width: 150,
                        align: 'center'
                    }
                ],
                contestList: [
                    {
                        name: 'Contest 1',
                    },
                    {
                        name: 'Contest 2',
                    },
                    {
                        name: 'Contest 3',
                    },
                    {
                        name: 'Contest 4',
                    },
                    {
                        name: 'Contest 5',
                    },
                ],
                split: 0.5,
                prob: '',
                catogory_choose: '',
                recentContestTitle: 'No chosen contests',
                recentContestStartTime: new Date(),
                recentContestEndTime: new Date(),
                recentContestCreateTime: new Date(),
                recentContestID: -1,
            }
        },
        methods: {
            on_select_categorized_exercises() {
                this.$router.push({ path: '/contest_list' });
            },
            on_select_hard_based_exercises() {
                this.$router.push({ path: '/contest_details' });
            },
            on_select_history(){
                this.$router.push({ path: '/history' });
            },
            on_select_person_info(){
                this.$router.push({ path: '/person_info' });
            },
            handleView(row) {
                this.recentContestTitle = row.name
                this.get_contest();
            },
            submit(){
                if (this.recentContestID == -1){
                    this.$Modal.error({
                        title: 'Error',
                        content: 'No contests selected!'
                    });
                    return;
                }
                localStorage.setItem('contest_name', this.recentContestTitle);
                localStorage.setItem('contest_id', this.recentContestID);
                localStorage.setItem('contest_start_time', this.recentContestStartTime);
                localStorage.setItem('contest_end_time', this.recentContestEndTime);
                this.$router.push({ path: '/contest_details' });
            },
            get_contest(){
                axios.get('/api/get_contest_details', {
                    params: {
                        contest_name: this.recentContestTitle
                    }
                })
                .then(res => {
                    console.log(res.data);
                    data = res.data;
                    this.recentContestID = data.contest_id;
                    this.recentContestStartTime = data.start_time;
                    this.recentContestEndTime = data.end_time;
                    this.recentContestCreateTime = data.create_time;
                })
                .catch(err => {
                    console.log(err);
                    this.$Message.error('Failed to get contest details');
                });
            },
            
        },
        mounted() {
            axios.get('/api/get_contest_list', {
                params: {
                    username: localStorage.getItem('username')
                }
            })
            .then(res => {
                console.log(res.data);
                this.contestList = res.data.contestList;
            })
            .catch(err => {
                console.log(err);
                this.$Message.error('Failed to get contest list');
            });
        }
    }

</script>
