-- CRUD语句
# C[create]、R{read]、U[update]、D[delete]

-- 一、insert
# insert into 表名 列名[(column [, column...])]
# values 值(value [, value...]); 
-- 注意
# 字符和日期数据应包含在单引号中
# 列可以插入空值[前提是该字段允许为空]
# 如果是给表中所有字段添加数据，可以不写前面的字段名称
# 默认值的使用，当不给某个字段值时，如果有默认值就会添加，否则报错

# insert into table_name (列名...) values (),(),() 添加多条记录
INSERT INTO goods (id,goods_name,price) 
VALUES (1,'小米手机', 2300),(2,'vivo手机',2500),(3,'三星手机',3000)

CREATE TABLE goods(
	id INT,
	goods_name VARCHAR(10),
	price DOUBLE);
	
INSERT INTO goods (id, goods_name, price)
VALUES (10, '华为手机', 4000);

INSERT INTO goods (id, goods_name, price)
VALUES (20, 'iphone手机', 5000);

SELECT * FROM t8

-- 二、update

# update table_name set col_name=expr1 where 
# set子句指示要修改哪些列和要给与哪些值
# where子句指定更新哪些行，如没有where子句，则更新所有的行
# 将t8表中薪水修改为18000。[如果没有带where条件，会修改所有的记录]
UPDATE t8 
SET Salary = 18000
WHERE user_name = '小姜'

INSERT INTO t8
VALUES (1,'小李','男', '2000-10-10','2022-10-10','测试工程师',12000,'爱自由', '');

-- 三、delete

# delete from table_name
# where ...
# delete不能删除某一列值，只能删除记录，不能删除整个表

# 删除小李记录 不加where会删除所有记录
DELETE FROM t8
WHERE user_name = '小李'

-- 四、select

# select [distinct] *|{column1,column2,column3..}
# from table_name;
# select 指定查询哪些列的数据
# column指定列名
# *代表查询所有列
# from 指定查询那张表
# distinct 可选，指显示结果时，是否去掉重复数据

CREATE TABLE student(
	id INT NOT NULL DEFAULT 1,
	`name` VARCHAR(20) NOT NULL DEFAULT '',
	chinese FLOAT NOT NULL DEFAULT 0,
	english FLOAT NOT NULL DEFAULT 0,
	math FLOAT NOT NULL DEFAULT 0 );
INSERT INTO student(id, `name`, chinese, english, math) VALUES(1,'韩顺平',89,78,90);
INSERT INTO student(id, `name`, chinese, english, math) VALUES(2,'张飞',67,98,56);
INSERT INTO student(id, `name`, chinese, english, math) VALUES(3,'宋江',87,78,77);
INSERT INTO student(id, `name`, chinese, english, math) VALUES(4,'关羽',88,98,90);
INSERT INTO student(id, `name`, chinese, english, math) VALUES(5,'赵云',82,84,67);
INSERT INTO student(id, `name`, chinese, english, math) VALUES(6,'欧阳锋', 55,85,45);
INSERT INTO student(id, `name`, chinese, english, math) VALUES(7,'黄蓉',75,65,30);
INSERT INTO student(id, `name`, chinese, english, math) VALUES(8,'宋心',75,75,80);

SELECT * FROM student

DELETE FROM student
# 筛选出english 和 name 字段，相同字段只显示一条
SELECT DISTINCT english, `name` FROM student

# 统计每个学生的总分
SELECT `name` ,(chinese+english+math) FROM student
# 所有学生加10分
SELECT `name`, (chinese+english+math+10) FROM student
# 使用别名
SELECT `name` AS '名字', (chinese+english+math+10) AS total_sorce FROM student

SELECT * FROM student
WHERE `name` = '赵云'

SELECT * FROM student
WHERE english > 90

SELECT `name`, (english+math+chinese) AS total_scorse FROM student
WHERE (english+math+chinese) > 200

SELECT * FROM student
WHERE math > 60 AND english > 90

SELECT * FROM student
WHERE english > chinese

# 赵% 表示 名字以韩开头的就可以
SELECT * FROM student
WHERE (english+math+chinese) > 200 AND math < chinese AND `name` LIKE '赵%'

# 查询语文成绩在80 - 90 之间的同学
SELECT * FROM student
WHERE chinese >= 80 AND chinese <= 90
# between and 是一个闭区间
SELECT * FROM student
WHERE chinese BETWEEN 80 AND 90

# 查询分数为89,90,91的同学
SELECT * FROM student
WHERE math = 89 OR math = 90 OR math = 91
SELECT * FROM student
WHERE math IN (89,90,91)

# 查询性李的同学
SELECT * FROM student
WHERE `name` LIKE '李%'

SELECT * FROM student
WHERE math > 80 AND chinese > 80


SELECT * FROM student
WHERE chinese BETWEEN 70 AND 80

# 查询总分为 221,190,192 同学的姓名和总成绩
SELECT `name`, (english+math+chinese)AS '总分' FROM student
WHERE (english+math+chinese) IN (221,190,192)

# 查询所有姓韩和姓宋的成绩
SELECT * FROM student
WHERE `name` LIKE '韩%' OR  `name` LIKE '宋%'

# 查询语文成绩比数学多30分的同学
SELECT * FROM student
WHERE math+30 < chinese


-- order by 使用
# 数学成绩排序后输出
SELECT * FROM student
  ORDER BY math;

# 对总分按从高到低顺序输出（不写默认升序asc, 降序为desc）
SELECT `name`, (chinese+math+english) AS total_scorse FROM student
ORDER BY total_scorse DESC;

# 对姓宋学生成绩排序
SELECT `name`, (chinese+math+english) AS total_scorse FROM student
WHERE `name` LIKE '宋%'
ORDER BY total_scorse;
