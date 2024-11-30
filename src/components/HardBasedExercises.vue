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
.ivu-table .success {
    background-color: #97ed26;
    color: #000000;
}
.ivu-table .error {
    background-color: #e66e8c;
    color: #000000;
}
.ivu-table .no-trial {
    background-color: #dedada;
    color: #000000;
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
                        <MenuItem name="2" @click="on_select_categorized_exercises">
                            <Icon type="ios-navigate"></Icon>
                            比赛列表
                        </MenuItem>                        
                        <MenuItem name="1" @click="on_select_hard_based_exercises">
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
                    <Breadcrumb :style="{margin: '24px 0'}">
                        <BreadcrumbItem>Home</BreadcrumbItem>
                        <BreadcrumbItem>Contest Details</BreadcrumbItem>
                    </Breadcrumb>
                    <Card>
                        <template #title>
                            <h2 style="color: #8c0776;">Contest<Button type="primary" @click="on_select_show_contest" style="margin-left:80%;">Show</Button></h2>
                        </template>
                        <h3>Contest ID: {{ contestID }}</h3>
                        <h3>Contest Title: {{ contestTitle }}</h3>
                        <h3>Start Time: {{ contestStartTime }}</h3>
                        <h3>End Time: {{ contestEndTime }}</h3>
                        <h3>Current Time: <Time :time="currentTime" type="datetime" /></h3>
                    </Card>
                    <br>
                    <Card>
                        <template #title><h2 style="color: #8c0776;">Problems</h2></template>
                        <Table :columns="columns" :data="problemList">
                            <template #id="{ row }">
                                <span>{{ row.id }}</span>
                            </template>
                            <template #title="{ row }">
                                <span>{{ row.title }}</span>
                            </template>
                            <template #result="{ row }">
                                <span>{{ row.result }}</span>
                            </template>
                            <template #timeCost="{ row }">
                                <span>{{ row.timeCost }}</span>
                            </template>
                            <template #memoryCost="{ row }">
                                <span>{{ row.memoryCost }}</span>
                            </template>
                            <template #view="{ row }">
                                <div>
                                    <Button @click="handleView(row)">View</Button>
                                </div>
                            </template>
                        </Table>
                    </Card>
                    <br>
                    <Card>
                        <template #title><h2 style="color: #8c0776;">Results</h2></template>
                        <Table border :columns="rankColumns" :data="contestRankForCurrentUser" >
                            <template #userName="{ row }">
                                <span>{{ row.userName }}</span>
                            </template>
                            <template #rank="{ row }">
                                <span>{{ row.rank }}</span>
                            </template>
                            <template #acNum="{ row }">
                                <span>{{ row.acNum }}</span>
                            </template>
                            <template #allTime="{ row }">
                                <span>{{ row.allTime }}</span>
                            </template>
                            <template #a="{ row }">
                                <span>{{ row.a }}</span>
                            </template>
                            <template #b="{ row }">
                                <span>{{ row.b }}</span>
                            </template>
                            <template #c="{ row }">
                                <span>{{ row.c }}</span>
                            </template>
                            <template #d="{ row }">
                                <span>{{ row.d }}</span>
                            </template>
                            <template #e="{ row }">
                                <span>{{ row.e }}</span>
                            </template>
                            <template #f="{ row }">
                                <span>{{ row.f }}</span>
                            </template>
                            <template #g="{ row }">
                                <span>{{ row.g }}</span>
                            </template>
                            <template #h="{ row }">
                                <span>{{ row.h }}</span>
                            </template>
                            <template #i="{ row }">
                                <span>{{ row.i }}</span>
                            </template>
                            <template #j="{ row }">
                                <span>{{ row.j }}</span>
                            </template>
                            <template #k="{ row }">
                                <span>{{ row.k }}</span>
                            </template>
                            <template #l="{ row }">
                                <span>{{ row.l }}</span>
                            </template>
                            <template #m="{ row }">
                                <span>{{ row.m }}</span>
                            </template>
                        </Table>
                        <br>
                        <Table border :columns="rankColumns" :data="contestRank" >
                            <template #userName="{ row }">
                                <span>{{ row.userName }}</span>
                            </template>
                            <template #rank="{ row }">
                                <span>{{ row.rank }}</span>
                            </template>
                            <template #acNum="{ row }">
                                <span>{{ row.acNum }}</span>
                            </template>
                            <template #allTime="{ row }">
                                <span>{{ row.allTime }}</span>
                            </template>
                            <template #a="{ row }">
                                <span>{{ row.a }}</span>
                            </template>
                            <template #b="{ row }">
                                <span>{{ row.b }}</span>
                            </template>
                            <template #c="{ row }">
                                <span>{{ row.c }}</span>
                            </template>
                            <template #d="{ row }">
                                <span>{{ row.d }}</span>
                            </template>
                            <template #e="{ row }">
                                <span>{{ row.e }}</span>
                            </template>
                            <template #f="{ row }">
                                <span>{{ row.f }}</span>
                            </template>
                            <template #g="{ row }">
                                <span>{{ row.g }}</span>
                            </template>
                            <template #h="{ row }">
                                <span>{{ row.h }}</span>
                            </template>
                            <template #i="{ row }">
                                <span>{{ row.i }}</span>
                            </template>
                            <template #j="{ row }">
                                <span>{{ row.j }}</span>
                            </template>
                            <template #k="{ row }">
                                <span>{{ row.k }}</span>
                            </template>
                            <template #l="{ row }">
                                <span>{{ row.l }}</span>
                            </template>
                            <template #m="{ row }">
                                <span>{{ row.m }}</span>
                            </template>
                        </Table>
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
    import axios from 'axios';
    export default {
        components: { Editor, Toolbar, Footer },
        data () {
            return {
                columns: [
                    {
                        title: 'Problem ID',
                        slot: 'id',
                    },
                    {
                        title: 'Problem Title',
                        slot: 'title',
                    },
                    {
                        title: 'Result',
                        slot: 'result',
                    },
                    {
                        title: 'Time Cost',
                        slot: 'timeCost',
                    },
                    {
                        title: 'Memory Cost',
                        slot: 'memoryCost',
                    },
                    {
                        title: 'View',
                        slot: 'view',
                        align: 'center',
                    }
                ],
                problemList: [
                    {
                        id: 1,
                        title: 'A+B Problem',
                        result: 'AC',
                        timeCost: '10ms',
                        memoryCost: '10KB',
                    },
                    {
                        id: 2,
                        title: 'A-B Problem',
                        result: 'RE',
                        timeCost: '80ms',
                        memoryCost: '20KB',
                    },
                    {
                        id: 3,
                        title: 'A*B Problem',
                        result: '',
                        timeCost: '',
                        memoryCost: '',
                    },
                    {
                        id: 4,
                        title: 'A/B Problem',
                        result: 'WA',
                        timeCost: '100ms',
                        memoryCost: '120KB',
                    },

                ],
                rankColumns:[ 
                    {
                        title: 'User Name',
                        key: 'userName',
                        width: 150,
                        fixed: 'left',
                        resizable: true,
                        align: 'center',
                    },
                    {
                        title: 'Rank',
                        key: 'rank',
                        width: 100,
                        fixed: 'right',
                        sortable: true,
                        align: 'center',
                    },
                    {
                        title: 'Solved',
                        key: 'acNum',
                        width: 120,
                        sortable: true,
                        align: 'center',
                    },
                    {
                        title: 'Penalty',
                        key: 'allTime',
                        width: 120,
                        sortable: true,
                        align: 'center',
                    },
                    {
                        title: 'A',
                        key: 'a',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'B',
                        key: 'b',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'C',
                        key: 'c',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'D',
                        key: 'd',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'E',
                        key: 'e',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'F',
                        key: 'f',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'G',
                        key: 'g',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'H',
                        key: 'h',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'I',
                        key: 'i',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'J',
                        key: 'j',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'K',
                        key: 'k',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'L',
                        key: 'l',
                        width: 80,
                        align: 'center',
                    },
                    {
                        title: 'M',
                        key: 'm',
                        width: 80,
                        align: 'center',
                    }
                ],
                contestRank: [
                    {
                        userName: 'Alice',
                        rank: 1,
                        acNum: 3,
                        allTime: 100,
                        a: 'AC',
                        b: 'AC',
                        c: 'AC',
                        d: 'WA',
                        e: 'AC',
                        f: 'AC',
                        g: 'AC',
                        h: 'AC',
                        i: 'AC',
                        j: 'AC',
                        k: 'AC',
                        l: '',
                        m: 'AC',
                        cellClassName: {
                            a: 'success',
                            b: 'success',
                            c: 'success',
                            d: 'error',
                            e: 'success',
                            f: 'success',
                            g: 'success',
                            h: 'success',
                            i: 'success',
                            j: 'success',
                            k: 'success',
                            l: 'no-trial',
                            m: 'success',
                        }
                    },
                    {
                        userName: 'Cathy',
                        rank: 2,
                        acNum: 1,
                        allTime: 300,
                        a: 'AC',
                        b: 'TE',
                        c: 'AC',
                        d: 'AC',
                        e: 'AC',
                        f: 'AC',
                        g: 'RE',
                        h: 'AC',
                        i: 'AC',
                        j: '',
                        k: 'AC',
                        l: 'AC',
                        m: 'AC',
                        cellClassName: {
                            a: 'success',
                            b: 'error',
                            c: 'success',
                            d: 'success',
                            e: 'success',
                            f: 'success',
                            g: 'error',
                            h: 'success',
                            i: 'success',
                            j: 'no-trial',
                            k: 'success',
                            l: 'success',
                            m: 'success',
                        }
                    }
                ],
                contestRankForCurrentUser:[
                    {
                        userName: 'Alice',
                        rank: 1,
                        acNum: 3,
                        allTime: 100,
                        a: 'AC',
                        b: 'AC',
                        c: 'AC',
                        d: 'WA',
                        e: 'AC',
                        f: 'AC',
                        g: 'AC',
                        h: 'AC',
                        i: 'AC',
                        j: 'AC',
                        k: 'AC',
                        l: '',
                        m: 'AC',
                        cellClassName: {
                            a: 'first-success',
                            b: 'success',
                            c: 'success',
                            d: 'error',
                            e: 'success',
                            f: 'success',
                            g: 'success',
                            h: 'success',
                            i: 'first-success',
                            j: 'success',
                            k: 'success',
                            l: 'no-trial',
                            m: 'success',
                        }
                    },
                ],
                chosenProblemID: -1,
                contestID: -1,
                contestTitle: '',
                contestStartTime: null,
                contestEndTime: null,
                currentTime: new Date()
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
                const currentTime = this.currentTime; 
                const contestStartTime = this.contestStartTime; 
                const contestEndTime = this.contestEndTime;
                if (!(contestStartTime instanceof Date) || isNaN(contestStartTime)) { 
                    this.$Modal.error({ 
                        title: 'Error', 
                        content: 'Contest start time is invalid.' 
                    });
                    return; 
                } 
                if (!(contestEndTime instanceof Date) || isNaN(contestEndTime)) { 
                    this.$Modal.error({ 
                        title: 'Error', 
                        content: 'Contest end time is invalid.' 
                    });
                    return;  
                }
                if (currentTime < contestStartTime) { 
                    this.$Modal.error({ 
                        title: 'Error', 
                        content: 'The contest has not started yet.' 
                    });
                    return; 
                } 
                else if (currentTime > contestEndTime) { 
                    this.$Modal.error({ 
                        title: 'Error', 
                        content: 'The contest has ended.' 
                    });
                    return;
                }
                this.chosenProblemID = row.id;
                localStorage.setItem('chosenProblemID', this.chosenProblemID);
                localStorage.setItem('chosenProblemTitle', row.title);
                this.$router.push({ path: '/problem_page' });
            },
            on_select_show_contest() {
                if (this.contestID === null || this.contestID === -1) {
                    this.$Modal.error({
                        title: 'Error',
                        content: 'No contest selected! <br>Contest ID is not initialized!'
                    });
                    return;
                }
                if (this.contestTitle === null || this.contestTitle === '') {
                    this.$Modal.error({
                        title: 'Error',
                        content: 'No contest selected! <br>Contest Title is not initialized!'
                    });
                    return;
                }
                if (this.contestStartTime === null || this.contestStartTime === '') {
                    this.$Modal.error({
                        title: 'Error',
                        content: 'No contest selected! <br>Contest Start Time is not initialized!'
                    });
                    return;
                }
                if (this.contestEndTime === null || this.contestEndTime === '') {
                    this.$Modal.error({
                        title: 'Error',
                        content: 'No contest selected! <br>Contest End Time is not initialized!'
                    });
                    return;
                }
                axios.get('/api/get_problems_by_contest', {
                    params: {
                        contestID: this.contestID
                    }
                })
                .then(response => {
                    this.problemList = response.data.problemList;
                })
                .catch(error => {
                    console.log(error);
                    this.$Message.error('Failed to get problems');
                });
                axios.get('/api/get_contest_rank_for_user', { 
                    params: { 
                        userID: this.currentUserID, 
                        contestID: this.contestID 
                    } 
                }) 
                .then(response => { 
                    this.contestRankForCurrentUser = response.data.contestRankForCurrentUser; 
                }) 
                .catch(error => { 
                    console.log(error); 
                    this.$Message.error('Failed to get contest rank for current user'); 
                }); 
                axios.get('/api/get_contest_rank', { 
                    params: { 
                        contestID: this.contestID 
                    } 
                }) 
                .then(response => { 
                    this.contestRank = response.data.contestRank; 
                }) 
                .catch(error => { 
                    console.log(error); 
                    this.$Message.error('Failed to get contest rank'); 
                }); 
            },
            updateTime() {
                this.currentTime = new Date();
            },
            updateData() { 
                axios.get('/api/get_problems_by_contest', { 
                    params: { 
                        contestID: this.contestID 
                    }
                }) 
                .then(response => { 
                    this.problemList = response.data.problemList; 
                }) 
                .catch(error => { 
                    console.log(error);  
                }); 
                axios.get('/api/get_contest_rank_for_user', { 
                    params: { 
                        userID: this.currentUserID, 
                        contestID: this.contestID 
                    } 
                }) 
                .then(response => { 
                    this.contestRankForCurrentUser = response.data.contestRankForCurrentUser; 
                }) 
                .catch(error => { 
                    console.log(error); 
                }); 
                axios.get('/api/get_contest_rank', { 
                    params: { 
                        contestID: this.contestID 
                    } 
                }) 
                .then(response => { 
                    this.contestRank = response.data.contestRank; 
                }) 
                .catch(error => { 
                    console.log(error); 
                }); 
            },
        },
        mounted() {
            this.contestID = localStorage.getItem('contest_id');
            this.contestTitle = localStorage.getItem('contest_name');
            this.contestStartTime = localStorage.getItem('contest_start_time');
            this.contestEndTime = localStorage.getItem('contest_end_time');
            this.updateTime(); 
            this.interval = setInterval(this.updateTime, 1000);
            this.updateData();
            this.dataInterval = setInterval(this.updateData, 5000);

        },
        beforeDestroy() { 
            clearInterval(this.interval); 
            clearInterval(this.dataInterval); 
        }
    }

</script>