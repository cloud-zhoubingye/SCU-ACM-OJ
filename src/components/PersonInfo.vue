<style>
.layout{
    border: 1px solid #c693eb;
    background: hsl(275, 26%, 91%);
    position: relative;
    border-radius: 4px;
    overflow: hidden;
}
.rate-demo {
    display: flex;
    justify-content: space-between;
    align-items: center;   
}
.layout-logo{
    width: 80px;
    height: 50px;
    background: #921a9d;
    border-radius: 2px;
    float: left;
    position: relative;
    top: 5px;
    left: 30px;
}
.demo-split{
    height: 250px;
    border: 1px solid #dcdee2;
}
.demo-split-1{
    height: 400px;
    border: 1px solid #dcdee2;
}
.demo-split-pane{
    padding: 10px;
    height: 255px;
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
                        <MenuItem name="4" @click="on_select_categorized_exercises">
                            <Icon type="ios-navigate"></Icon>
                            比赛列表
                        </MenuItem>                        
                        <MenuItem name="3" @click="on_select_hard_based_exercises">
                            <Icon type="ios-navigate"></Icon>
                            比赛详情
                        </MenuItem>
                        <MenuItem name="2" @click="on_select_history">
                            <Icon type="ios-navigate"></Icon>
                            评测记录
                        </MenuItem>
                        <MenuItem name="1" @click="on_select_person_info">
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
        <BreadcrumbItem>Personal Information</BreadcrumbItem>
    </Breadcrumb>
    <br>
    <Card style="width:96%; left: 2%; height: 700px;">
        <template #title>                        
            <Space size="large" style="margin-left: 10px;">
                <Avatar icon="ios-person" size="large" /> 
                <h2>{{ username }}</h2>
            </Space>
        </template>
        <div class="demo-split" style="height: 600px;">
            <Split v-model="split1" >
                <template #left>
                    <img src="../../public/person/person_head.png" alt="info" style="width: 260px; height: 250px; margin-left: 50px; margin-top: 40px;"/> 
                </template>
                <template #right>
                    <Card style="margin-top: 2%; margin-left: 2%;">
                        <h4>User ID <Icon type="ios-chatbubbles-outline" /></h4>
                        <Paragraph v-model="userID" /><br>
                        <h4>User Name <Icon type="ios-chatbubbles-outline" /></h4>
                        <Paragraph v-model="username" editable /><br>
                        <h4>Nickname <Icon type="ios-chatbubbles-outline" /></h4>
                        <Paragraph v-model="nickname" editable /><br>
                        <h4>Password <Icon type="ios-chatbubbles-outline" /></h4>
                        <Paragraph v-model="password" editable /><br>
                        <h4>Email <Icon type="ios-chatbubbles-outline" /></h4>
                        <Paragraph v-model="email" editable /><br>
                        <h4>Gender <Icon type="ios-chatbubbles-outline" /></h4>
                        <Paragraph v-model="gender" editable /><br>
                        <h4>Permission <Icon type="ios-chatbubbles-outline" /></h4>
                        <Paragraph v-model="permission" /><br>
                        <Button type="primary" @click="save_personal_info">Save</Button>
                    </Card>
                </template>
            </Split>
        </div>
    </Card>
    <br>
    <Card style="width:96%; left: 2%;">
        <div class="demo-split-1">
            <Split v-model="split2">
                <template #left>
                    <Card style="width:96%; left: 2%; top: 2%;">
                        <div>
                            <Calendar :cell-height="40">
                            </Calendar>
                        </div>
                    </Card>
                </template>
                <template #right>
                    <Card style="width:96%; left: 2%; top: 2%;" >
                        <template #title>
                            <Icon type="ios-film-outline"></Icon>
                            Related Links
                        </template>
                        <template #extra>
                            <a href="#" @click.prevent="changeLimit">
                                <Icon type="ios-loop-strong"></Icon>
                                More
                            </a>
                        </template>
                        <p class="rate-demo" v-for="item in randomWebsiteList" :key="item.name">
                            <a :href="item.url" target="_blank">{{ item.name }}</a>
                            <span>
                                <Rate disabled v-model="item.rate" />{{ item.rate }}
                            </span>
                        </p>
                    </Card>
                </template>
            </Split>
        </div>
    </Card>
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
                WebsiteList: [
                    {
                        name: 'LuoGu',
                        url: 'https://www.luogu.com.cn/',
                        rate: 10
                    },
                    {
                        name: 'POJ',
                        url: 'http://poj.org/',
                        rate: 10
                    },
                    {
                        name: 'CowCoder',
                        url: 'https://www.nowcoder.com/',
                        rate: 10
                    },
                    {
                        name: 'LiBreOJ',
                        url: 'https://loj.ac/',
                        rate: 10
                    },
                    {
                        name: 'CodeForce',
                        url: 'http://codeforces.com/',
                        rate: 10
                    },
                    {
                        name: '51Nod',
                        url: 'https://www.51nod.com/',
                        rate: 10
                    },
                    {
                        name: 'HihoCoder',
                        url: 'http://hihocoder.com/',
                        rate: 10
                    },
                    {
                        name: 'LeetCode',
                        url: 'https://leetcode-cn.com/',
                        rate: 10
                    },
                    {
                        name: 'HDU',
                        url: 'https://acm.hdu.edu.cn/',
                        rate: 10
                    },
                    {
                        name: 'BestCoder',
                        url: 'http://bestcoder.hdu.edu.cn/',
                        rate: 10
                    },
                    {
                        name: 'AtCoder',
                        url: 'https://atcoder.jp/',
                        rate: 10
                    },
                    {
                        name: 'AcWing',
                        url: 'https://www.acwing.com/about/',
                        rate: 10
                    },
                    {
                        name: 'CodeChef',
                        url: 'https://www.codechef.com/',
                        rate: 10
                    },
                    {
                        name: 'TopCoder',
                        url: 'https://www.topcoder.com/',
                        rate: 10
                    },
                    {
                        name: 'GoogleCodeJam',
                        url: 'https://codingcompetitions.withgoogle.com/codejam',
                        rate: 10
                    },
                    {
                        name: 'FacebookHackerCup',
                        url: 'https://www.facebook.com/codingcompetitions/hacker-cup',
                        rate: 10
                    },
                    {
                        name: 'KickStart',
                        url: 'https://codingcompetitions.withgoogle.com/kickstart',
                        rate: 10
                    },
                    {
                        name: 'HackerRank',
                        url: 'https://www.hackerrank.com/',
                        rate: 10
                    },
                    {
                        name: 'ACM Class',
                        url: 'https://acm.sjtu.edu.cn/OnlineJudge/',
                        rate: 10
                    }
                ],
                randomWebsiteList: [],
                split1: 0.3,
                split2: 0.5,
                // user-info
                username: localStorage.getItem('username'),
                userID: '',
                nickname: '',
                password: '',
                email: '',
                gender: '',
                permission: '',
                auth: 0,
                auth_to_permission: {
                    0: 'User',
                    1: 'Admin',
                    2: 'Super Admin'
                }
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
            changeLimit () {
                function getArrayItems(arr, num) {
                    const temp_array = [];
                    for (let index in arr) {
                        temp_array.push(arr[index]);
                    }
                    const return_array = [];
                    for (let i = 0; i<num; i++) {
                        if (temp_array.length>0) {
                            const arrIndex = Math.floor(Math.random()*temp_array.length);
                            return_array[i] = temp_array[arrIndex];
                            temp_array.splice(arrIndex, 1);
                        } else {
                            break;
                        }
                    }
                    return return_array;
                }
                this.randomWebsiteList = getArrayItems(this.WebsiteList, 5);
            },
            save_personal_info() {
                if (this.username === '') {
                    this.$Modal.error({
                        title: 'Error',
                        content: 'Username cannot be empty!'
                    });
                    return;
                }
                if (this.nickname === '') {
                    this.$Modal.error({
                        title: 'Error',
                        content: 'Nickname cannot be empty!'
                    });
                    return;
                }
                if (this.password === '') {
                    this.$Modal.error({
                        title: 'Error',
                        content: 'Password cannot be empty!'
                    });
                    return;
                }
                if (this.email === '') {
                    this.$Modal.error({
                        title: 'Error',
                        content: 'Email cannot be empty!'
                    });
                    return;
                }
                if(this.gender === '') {
                    this.$Modal.error({
                        title: 'Error',
                        content: 'Gender cannot be empty!'
                    });
                    return;
                }

                axios.post('/api/savePersonInfo', {
                    userID: this.userID,
                    username: this.username,
                    nickname: this.nickname,
                    password: this.password,
                    email: this.email,
                    gender: this.gender,
                })
                .then(response => {
                    console.log(response);
                    localStorage.setItem('username', this.username);
                    this.$Modal.success({
                        title: 'Success',
                        content: 'Successfully saved ' + this.username + '\'s personal information'
                    });
                })
                .catch(error => {
                    console.log(error);
                    this.$Modal.error({
                        title: 'Error',
                        content: 'Failed to save ' + this.username + '\'s personal information' + error
                    });
                });
            }
        },
        mounted() {
            this.changeLimit();
            axios.get('/api/getPersonInfo', {
                params: {
                    username: this.username
                }
            })
            .then(response => {
                const data = response.data;
                this.userID = data.userID;
                this.nickname = data.nickname;
                this.password = data.password;
                this.email = data.email;
                this.gender = data.gender;
                this.auth = data.auth;
                this.permission = this.auth_to_permission[this.auth];
            })
            .catch(error => {
                console.log(error);
                this.$Message.error('Failed to get ' + this.username + '\'s person information' + error);
            });
        }
    }
</script>
