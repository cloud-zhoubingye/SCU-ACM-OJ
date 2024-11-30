-- 使用数据库
use scuoj;

-- 用户表
create table user (
    id int unsigned primary key auto_increment comment 'ID',
    username varchar(20) not null unique comment '用户名',
    password varchar(32)  comment '密码',
    nickname varchar(10)  default '' comment '昵称',
    email varchar(128) default '' comment '邮箱',
    user_pic varchar(128) default '' comment '头像',
    gender char default '' comment '性别',
    auth int default 3 comment '权限',
    create_time datetime not null comment '创建时间',
    update_time datetime not null comment '修改时间'
) comment '用户表';

-- 题目表
create table problem(
    id int unsigned primary key auto_increment comment 'ID',
    title varchar(30) not null comment '题目标题',
    problem_url varchar(128) default '' comment '题目配置',
    #     content varchar(10000) not null comment '题目内容',
    memory_limit int unsigned not null comment '内存限制',
    time_limit int unsigned not null comment '时间限制',
    create_user int unsigned not null comment '创建人ID',
    create_time datetime not null comment '创建时间',
    update_time datetime not null comment '修改时间',
    constraint fk_problem_user foreign key (create_user) references user(id) -- 外键约束
) comment '题目表';

-- 比赛表
create table contest(
    id int unsigned primary key auto_increment comment 'ID',
    title varchar(30) not null comment '比赛标题',
    create_user int unsigned not null comment '创建人ID',
    start_time datetime not null comment '开始时间',
    end_time datetime not null comment '结束时间',
    create_time datetime not null comment '创建时间',
    update_time datetime not null comment '修改时间',
    constraint fk_contest_user foreign key (create_user) references user(id) -- 外键约束
) comment '题目表';

-- 评测模板表
create table judgeTemplate(
    id int unsigned primary key auto_increment comment 'ID',
    name varchar(30) not null comment '模板名称'
) comment '评测模板表';

-- 题目归属表
create table belong(
    problem_id int unsigned not null comment '题目ID',
    contest_id int unsigned not null comment '比赛ID',
    constraint fk_belong_problem foreign key (problem_id) references problem(id), -- 外键约束
    constraint fk_belong_contest foreign key (contest_id) references contest(id) -- 外键约束
) comment '题目归属表';

-- 评测记录表
create table judgeRecord(
    id int unsigned primary key auto_increment comment 'ID',
    problem_id int unsigned not null comment '评测题目ID',
    user_id int unsigned not null comment '评测用户ID',
    template_id int unsigned not null comment '评测模板ID',
    judge_time datetime not null comment '评测时间',
    judge_result varchar(10) not null comment '评测结果',
    runtime int unsigned not null comment '运行时间',
    runmemory int unsigned not null comment '运行内存',
    constraint fk_judgeRecord_problem foreign key (problem_id) references problem(id), -- 外键约束
    constraint fk_judgeRecord_user foreign key (user_id) references user(id), -- 外键约束
    constraint fk_judgeRecord_judgeTemplate foreign key (template_id) references judgeTemplate(id) -- 外键约束
) comment '评测记录表';

-- 比赛记录表
create table contestRecord(
    id int unsigned primary key auto_increment comment 'ID',
    contest_id int unsigned not null comment '比赛ID',
    user_id int unsigned not null comment '用户ID',
    ranking int unsigned not null comment '比赛排名',
    acnum int unsigned default 0 comment '过题数量',
    alltime int unsigned default 0 comment '总罚时',
    constraint fk_contestRecord_contest foreign key (contest_id) references contest(id), -- 外键约束
    constraint fk_contestRecord_user foreign key (user_id) references user(id) -- 外键约束
) comment '比赛记录表';
