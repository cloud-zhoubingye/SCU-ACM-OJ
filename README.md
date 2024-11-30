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
__URL__
'/api/user_login'
__Incoming Parameters__
username: string
password: string (without encryption)
__Return Parameters__
isLoginSucc: string ('success' or 'fail')
token: string

#### 2. User Register
__URL__
'/api/user_register'
__Incoming Parameters__
email: string
username: string
password: string (without encryption)
__Return Parameters__
isRegisterSucc: string ('success' or 'fail')

#### 3. User Reset Password
__URL__
'/api/reset_password'
__Incoming Parameters__
email: string
username: string
password: string (without encryption)
email_captcha: string
__Return Parameters__
isResetSucc: string ('success' or 'fail')

#### 4. Get Contest Time
__URL__
'/api/get_contest_time'
__Incoming Parameters__
contest_name: string
__Return Parameters__
contest_id: int
start_time: string (format example: '2024-11-30 12:00:00')
end_time: string (format example: '2024-11-30 12:00:00')
create_time: string (format example: '2024-11-30 12:00:00')

#### 5. Get Contest List
__URL__
'/api/get_contest_list'
__Incoming Parameters__
username: string
__Return Parameters__
contestList: list of dict (format example: [
                        {
                            name: 'Contest 1'
                        }
                    ])  
(The returned contestList should only include contests that the user has participated in. Contests that the user has not participated in should not be included in the list.)

#### 6. Get Problem List
__URL__
'/api/get_problems_by_contest'
__Incoming Parameters__
contestID: int
__Return Parameters__
problemList: list of dict (format example: [{
                        id: 1,
                        title: 'A+B Problem',
                        result: 'AC',
                        timeCost: '10ms',
                        memoryCost: '10KB',
                    }])
(The returned problemList should only include problems from the current contest identified by contestID.)

#### 7. Get User's Rank
__URL__
'/api/get_contest_rank_for_user'
__Incoming Parameters__
userID: int
contestID: int
__Return Parameters__
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
                    }])
(Data only contains one term for only current user.)
#### 8. Get Contest Rank
__URL__
'/api/get_contest_rank'
__Incoming Parameters__
contestID: int
__Return Parameters__
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
                    }])

#### 9. Submit Code
__URL__
'/api/submit_code'
__Incoming Parameters__
prob_id: int
language: string (Language can be in 'C++'/'Java'/'Python')
code: string
__Return Parameters__
timeCost: int
memoryCost: int
judgeTime: string (format example: '2024-11-30 12:00:00')
resultInformation: string
compileMessage: string

#### 10. Get File Name
__URL__
'/api/getDownloadFile'
__Incoming Parameters__
prob_id: int
__Return Parameters__
fileName: string (format example: 'problem.zip')

#### 11. Get Problem Details
__URL__
'/api/getProblemDetails'
__Incoming Parameters__
prob_name: string
__Return Parameters__
timeLimit: int
memoryLimit: int

#### 12. Get Judge Records
__URL__
'/api/judge_records'
__Incoming Parameters__
username: string
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
__URL__
'/api/savePersonInfo'
__Incoming Parameters__
userID: int
username: string
nickname: string
password: string (without encryption)
email: string
gender: string
__Return Parameters__
isModifySucc: string ('success' or 'fail')

#### 14. Get Personal Information
__URL__
'/api/getPersonInfo'
__Incoming Parameters__
username: string
__Return Parameters__
userID: int
nickname: string
password: string (encrypted)
email: string
gender: string
auth: int (Auth is int, which means 0: 'User', 1: 'Admin', 2: 'Super Admin')
