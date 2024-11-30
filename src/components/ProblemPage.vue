<template>
    <div>
        <div class="header-bar">
            <span class="header-text">Problem View</span>
            <div class="header-buttons">
                <Button class="header-button" @click="goToCategorized">返回比赛列表</Button>
                <Button class="header-button" @click="goToHardBased">返回比赛详情</Button>
            </div>
        </div>
        <br>
        <Card style="width:96%; left: 2%; margin-right: 2%; margin-top: 2%;">
            <template #title><h2 style="color: purple;">Contest End Time</h2></template>
            <h4>Contest will end at {{ contestEndTime }} !</h4>
        </Card><br>
        <div class="demo-split" style="width: 96%; margin-left: 2%; margin-right: 2%; height: 850px;">
            <Split v-model="split">
                <template #left>
                    <Card style="width:96%; left: 2%; margin-right: 2%; margin-top: 2%;">
                        <template #title><h2 style="color: purple;">Problem View</h2></template>
                        <h4>Problem ID</h4>
                        {{ problemID }}<br><br>
                        <h4>Problem Name</h4>
                        {{ problemName }}<br><br>
                        <h4>Problem File</h4>
                        <Button type="primary" @click="download">下载文件</Button><br><br>
                        <h4>Memory Limit</h4>
                        {{ memoryLimit }} MB<br><br>
                        <h4>Time Limit</h4>
                        {{ timeLimit }} ms<br>
                    </Card>
                    <Divider style="color: purple;">Result</Divider>
                    <Card style="width:96%; left: 2%; margin-right: 2%; margin-top: 2%;">
                        <template #title><h2 style="color: purple;">Judge Result</h2></template>
                        <h4>Judge Time <Icon type="ios-arrow-dropdown" /></h4>
                        <Text>{{ judgeTime }}</Text><br><br>
                        <h4>Time Cost <Icon type="ios-arrow-dropdown" /></h4>
                        <Text>{{ timeCost }} ms</Text><br><br>
                        <h4>Memory Cost <Icon type="ios-arrow-dropdown" /></h4>
                        <Text>{{ memoryCost }} MB</Text><br><br>
                        <h4>Result Information <Icon type="ios-arrow-dropdown" /></h4>
                        <Text>{{ resultInformation }}</Text><br><br>
                        <h4>Compile Message <Icon type="ios-arrow-dropdown" /></h4>
                        <Text>{{ compileMessage }}</Text><br><br>
                    </Card>
                </template>
                <template #right>
                        <div style="margin-left: 25px;">
                            <Divider style="color: purple;">Settings</Divider>
                            <Card style="width:96%; left: 2%; margin-right: 2%; margin-top: 2%;">
                                <template #title><h2 style="color: purple;"> Langauge </h2></template>
                                <RadioGroup v-model="language" >
                                    <Radio label="C++"> C/C++ </Radio>
                                    <Radio label="Java"> Java </Radio>
                                    <Radio label="Python"> Python </Radio>
                                </RadioGroup>
                            </Card>
                            <Divider style="color: purple;">Code</Divider>
                            <Card style="width:96%; left: 2%; margin-right: 2%; margin-top: 2%;">
                                <template #title><h2 style="color: purple;"> Answer </h2></template>
                                <Input v-model="code" type="textarea" :autosize="{minRows: 20,maxRows: 1000}" placeholder="Enter your code here..." />
                                <br><br>
                                <Button type="primary" @click="submitCode">提交</Button>
                            </Card>
                        </div>
                </template>
            </Split>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data () {
            return {
                split: 0.5,
                contestEndTime: localStorage.getItem('contest_end_time'),
                language: '',
                problemName: localStorage.getItem('chosenProblemTitle'),
                problemID: localStorage.getItem('chosenProblemID'),
                problemFile: '',
                memoryLimit: 0,
                timeLimit: 0,
                judgeTime: new Date(),
                timeCost: 0,
                memoryCost: 0,
                resultInformation: '',
                compileMessage: '',
                code: '',
            }
        },
        methods: {
            goToCategorized() {
                this.$router.push('/contest_list')
            },
            goToHardBased() {
                this.$router.push('/contest_details')
            },
            submitCode() {
                if (this.language === '') {
                    this.$Modal.error({
                        title: 'Error',
                        content: 'Please select a language!'
                    });
                    return;
                }
                if (this.code.trim() === '') {
                    this.$Modal.error({
                        title: 'Error',
                        content: 'Please enter your code!'
                    });
                    return;
                }
                const postData = {
                    prob_id: this.problemID,
                    language: this.language,
                    code: this.code
                };
                axios.post('/api/submitCode' , postData, {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => {
                    const data = response.data;
                    this.timeCost = data.timeCost;
                    this.memoryCost = data.memoryCost;
                    this.resultScore = data.resultScore;
                    this.resultInformation = data.resultInformation;
                    this.compileMessage = data.compileMessage;
                    this.$Modal.success({
                        title: 'Result',
                        content: 'Your code has been submitted successfully!'
                    });
                })
                .catch(error => {
                    this.compileMessage = error;
                    this.$Modal.error({
                        title: 'Error',
                        content: 'Failed to submit your code!'
                    });
                });
            },
            download(){
                if (this.problemFile === '') {
                    axios.get('/api/getDownloadFile', {
                        params: {
                            prob_id: this.problemID
                        }
                    })
                    .then(response => {
                        this.problemFile = response.data.fileName;
                    })
                    .catch(error => {
                        this.$Modal.error({
                            title: 'Error',
                            content: 'Failed to get URL of download file!'
                        });
                    });
                }
                if (this.problemFile === '') {
                    return;
                }
                const fileUrl = '/static/problems/' + this.problemFile; // 文件的URL地址
                window.open(fileUrl);
                this.$Modal.success({
                    title: 'Success',
                    content: 'File has been downloaded successfully!'
                });
            },

        },
        mounted() {
            axios.get('/api/getProblem', {
                params: {
                    prob: this.problemName
                }
            })
            .then(response => {
                const data = response.data;
                this.problemDescription = data.problemDescription;
                this.problemInputDescription = data.problemInputDescription;
                this.problemOutputDescription = data.problemOutputDescription;
                this.problemInputOutputSample = data.problemInputOutputSample;
                this.timeLimit = data.timeLimit;
                this.memoryLimit = data.memoryLimit;
                this.difficultyLevel = data.difficultyLevel;
                this.problemCategory = data.problemCategory;
            })
            .catch(error => {
                this.$Message.error('Failed to get ' + this.problemName + '\'s information!');
            });
        }
    }
</script>

<style>
    .header-bar {
        background-color: purple;
        padding: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: white;
    }
    .header-text {
        font-weight: bold;
        font-size: 25px;
    }
    .header-buttons {
        display: flex;
        gap: 10px;
    }
    .header-button {
        background-color: lavender;
        color: white;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        font-size: 14px;
        border-radius: 5px;
    }
    .header-button:hover {
        background-color: lightpurple;
    }
    .demo-split {
        height: 200px;
        border: 1px solid #dcdee2;
    }
</style>
