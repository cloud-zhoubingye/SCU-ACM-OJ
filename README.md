# SCU-ACM-OJ
__This is the code repositories for front-end code of users (instead of admin) in our programme.__ 

## Install
```shell
npm install
```

## Run
```shell
npm run serve
npm run dev
```

## Introduction
SCU-ACM-OJ is a dedicated online judge platform tailored for university-level ACM competitions, featuring roles for users, administrators, and super administrators. Users can engage with the platform through various interactive functions, enhancing their experience as they participate in contests. They can submit solutions in Java, Python, or C/C++ within the given contest timeframe, ensuring a versatile and accessible coding environment. Administrators oversee the smooth operation of contests and manage essential aspects of the platform, ensuring a seamless and organized competition experience for all participants.

## Teams
|Members|Responsiblity|
|-|-|
|Yunlong Huang|Multi-language code evaluation engine|
|Bingye Zhou |Front-end development for user interface|
|Liaotian Feng|Front-end development for administrator interface|
|Hao Li|Database operations|
|Yiheng Zhang|Back-end business logic development|

## Interface with Back-end
Tips: all axios operations are done with 'axios.get()' !
#### 1. User Login
__URL__<br>
'/api/user_login'<br>
__Incoming Parameters__<br>
username: string<br>
password: string (without encryption)<br>
__Return Parameters__<br>
isLoginSucc: string ('success' or 'fail')<br>
token: string

#### 2. User Register
__URL__<br>
'/api/user_register'<br>
__Incoming Parameters__<br>
email: string<br>
username: string<br>
password: string (without encryption)<br>
__Return Parameters__<br>
isRegisterSucc: string ('success' or 'fail')

#### 3. User Reset Password
__URL__<br>
'/api/reset_password'<br>
__Incoming Parameters__<br>
email: string<br>
username: string<br>
password: string (without encryption)<br>
email_captcha: string<br>
__Return Parameters__<br>
isResetSucc: string ('success' or 'fail')

#### 4. Get Contest Time
__URL__<br>
'/api/get_contest_time'<br>
__Incoming Parameters__<br>
contest_name: string<br>
__Return Parameters__<br>
contest_id: int<br>
start_time: string (format example: '2024-11-30 12:00:00')<br>
end_time: string (format example: '2024-11-30 12:00:00')<br>
create_time: string (format example: '2024-11-30 12:00:00')

#### 5. Get Contest List
__URL__<br>
'/api/get_contest_list'<br>
__Incoming Parameters__<br>
username: string<br>
__Return Parameters__<br>
contestList: list of dict (format example: [
                        { name: 'Contest 1' }
                    ])<br>
(The returned contestList should only include contests that the user has participated in. Contests that the user has not participated in should not be included in the list.)

#### 6. Get Problem List
__URL__<br>
'/api/get_problems_by_contest'<br>
__Incoming Parameters__<br>
contestID: int<br>
__Return Parameters__<br>
problemList: list of dict (format example: [{
                        id: 1, 
                        title: 'A+B Problem', 
                        result: 'AC', 
                        timeCost: '10ms', 
                        memoryCost: '10KB', 
                    }])<br>
(The returned problemList should only include problems from the current contest identified by contestID.)

#### 7. Get User's Rank
__URL__<br>
'/api/get_contest_rank_for_user'<br>
__Incoming Parameters__<br>
userID: int<br>
contestID: int<br>
__Return Parameters__<br>
contestRankForCurrentUser: list of dict (format example: [{ 
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
                    }])<br>
(Data only contains one term for only current user.)

#### 8. Get Contest Rank
__URL__<br>
'/api/get_contest_rank'<br>
__Incoming Parameters__<br>
contestID: int<br>
__Return Parameters__<br>
contestRank: list of dict (format example: [{ 
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
                    }])<br>

#### 9. Submit Code
__URL__<br>
'/api/submit_code'<br>
__Incoming Parameters__<br>
prob_id: int<br>
language: string (Language can be in 'C++'/'Java'/'Python')<br>
code: string<br>
__Return Parameters__<br>
timeCost: int<br>
memoryCost: int<br>
judgeTime: string (format example: '2024-11-30 12:00:00')<br>
resultInformation: string<br>
compileMessage: string

#### 10. Get File Name
__URL__<br>
'/api/getDownloadFile'<br>
__Incoming Parameters__<br>
prob_id: int<br>
__Return Parameters__<br>
fileName: string (format example: 'problem.zip')

#### 11. Get Problem Details
__URL__<br>
'/api/getProblemDetails'<br>
__Incoming Parameters__<br>
prob_name: string<br>
__Return Parameters__<br>
timeLimit: int<br>
memoryLimit: int

#### 12. Get Judge Records
__URL__<br>
'/api/judge_records'<br>
__Incoming Parameters__<br>
username: string<br>
__Return Parameters__
judgeRecords: list of dict (format example: [{ 
                        record_id: '1', 
                        problem_title: 'A+B Problem', 
                        user_name: 'Bob', 
                        template_name: 'C++', 
                        judge_time: '2024-01-01 14:00:00', 
                        judge_result: 'Accepted', 
                        time_usage: '1000ms', 
                        memory_usage: '1000KB' 
                    }])

#### 13. Save Personal Information
__URL__<br>
'/api/savePersonInfo'<br>
__Incoming Parameters__<br>
userID: int<br>
username: string<br>
nickname: string<br>
password: string (without encryption)<br>
email: string<br>
gender: string<br>
__Return Parameters__<br>
isModifySucc: string ('success' or 'fail')

#### 14. Get Personal Information
__URL__<br>
'/api/getPersonInfo'<br>
__Incoming Parameters__<br>
username: string<br>
__Return Parameters__<br>
userID: int<br>
nickname: string<br>
password: string (encrypted)<br>
email: string<br>
gender: string<br>
auth: int (Auth is int, which means 0: 'User', 1: 'Admin', 2: 'Super Admin')
