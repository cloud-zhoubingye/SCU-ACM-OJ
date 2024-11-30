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
    background: #aa50e1;
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
                        <MenuItem name="3" @click="on_select_categorized_exercises">
                            <Icon type="ios-navigate"></Icon>
                            比赛列表
                        </MenuItem>                        
                        <MenuItem name="2" @click="on_select_hard_based_exercises">
                            <Icon type="ios-navigate"></Icon>
                            比赛详情
                        </MenuItem>
                        <MenuItem name="1" @click="on_select_history">
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
        </Layout>
    </div>
    <Breadcrumb style="margin-left: 25px; margin-top: 25px;" >
        <BreadcrumbItem>Home</BreadcrumbItem>
        <BreadcrumbItem>Judge History</BreadcrumbItem>
    </Breadcrumb>
    <Card style="width:98%; left: 1%; margin-top: 15px;">
        <template #title><h2 style="color: #8c0776">Judge Records</h2></template>
        <Table border stripe :columns="columns" :data="data" ref="table"></Table>
        <br>
        <Button type="primary" @click="exportData" style="margin-left: 20px;"><Icon type="ios-download-outline"></Icon> Export source data</Button>
    </Card>
    <br><br>
    <Footer></Footer>
</template>
<script>
    import Footer from '@/components/Footer.vue'
    import axios from 'axios';
    export default {
        components: {
            Footer
        },
        data () {
            return {
                columns: [
                    {
                        title: 'Record ID',
                        key: 'record_id',
                        width: 150,
                        fixed: 'left',
                        sortable: true,
                    },
                    {
                        title: 'Problem Title',
                        key: 'problem_title',
                        width: 300,
                        sortable: true,
                    },
                    {
                        title: 'User Name',
                        key: 'user_name',
                        width: 150,
                        sortable: true,
                    },
                    {
                        title: 'Template Name',
                        key: 'template_name',
                        width: 150,
                        sortable: true,
                    },
                    {
                        title: 'Judge Time',
                        key: 'judge_time',
                        width: 300,
                        sortable: true,
                    },
                    {
                        title: 'Judge Result',
                        key: 'judge_result',
                        width: 200,
                        sortable: true,
                    },
                    {
                        title: 'Time Usage',
                        key: 'time_usage',
                        width: 150,
                        sortable: true,
                    },
                    {
                        title: 'Memory Usage',
                        key: 'memory_usage',
                        width: 150,
                        sortable: true,
                    }
                ],
                data: [
                    {
                        record_id: '1',
                        problem_title: 'A+B Problem',
                        user_name: 'Bob',
                        template_name: 'C++',
                        judge_time: '2024-01-01 14:00:00',
                        judge_result: 'Accepted',
                        time_usage: '1000ms',
                        memory_usage: '1000KB'
                    },
                    {
                        record_id: '2',
                        problem_title: 'A+B Problem',
                        user_name: 'Bob',
                        template_name: 'C++',
                        judge_time: '2024-01-01 13:00:00',
                        judge_result: 'Accepted',
                        time_usage: '200ms',
                        memory_usage: '400KB'
                    }
                ]
            }
        },
        mounted() {
            axios.get('/api/judge_records', {
                params: {
                    username: localStorage.getItem('username')
                }
            })
            .then(response => {
                this.data = response.data.judgeRecords;
            })
            .catch(error => {
                console.log(error);
                this.$Message.error('Failed to get judge records');
            });
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
            exportData(){
                this.$refs.table.exportCsv({
                    filename: 'JudgeRecords'
                }); 
            }
        }
    }
</script>

