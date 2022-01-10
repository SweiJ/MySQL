-- mysql统计函数的使用

# count(*)和count(列)的区别
# count(*) 返回满足条件的记录行数
# count(列) 统计满足条件的某列有多少个，但是会排除null

# 返回math>80的所有同学个数
SELECT COUNT(*) FROM student
WHERE math > 80;

# 返回id字段不为null的个数
SELECT COUNT(id) FROM student
WHERE chinese > 80

# 统计所有学生math总成绩
SELECT SUM(math) FROM student;

# 统计所有学生数学、语文、英语各科总成绩
SELECT SUM(math),SUM(chinese),SUM(english) FROM student;

# 统计所有学生数学、语文、英语总成绩
SELECT SUM(math+chinese+english) FROM student;

# 统计所有学生语文成绩平均分
SELECT SUM(chinese)/COUNT(chinese) FROM student
SELECT AVG(chinese) FROM student

 -- max 和 min使用
SELECT MAX(math + english + chinese), MIN(math + english + chinese)
FROM student;

CREATE DATABASE t1


-- 分组统计

# 创建部门表
CREATE TABLE dept(
 deptno MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
 dname VARCHAR(20) NOT NULL DEFAULT "",
 loc VARCHAR(13) NOT NULL DEFAULT ""
);

INSERT INTO dept VALUES(10, 'ACCONTLNG', 'NEW YORK'),(20,'RESEARCH', 'DALLAS'),(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON');
SELECT * FROM DEPT

#创建表EMP雇员
CREATE TABLE emp(
 empno MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,/*编号*/
 ename VARCHAR(20) NOT NULL DEFAULT "" , /*名字*/
 job VARCHAR(9) NOT NULL DEFAULT "", /*工作*/
 mgr MEDIUMINT UNSIGNED , /*上级编号*/
 hiredate DATE NOT NULL, /*入职时间*/
 sal DECIMAL(7,2) NOT NULL, /*薪水*/
 comm DECIMAL(7,2), /*红利*/
 deptno MEDIUMINT UNSIGNED NOT NULL DEFAULT 0 /*部门编号*/
);
INSERT INTO emp VALUES
(7369, 'SMITH', 'CLERK',7902,'1990-12-17',800.00,NULL, 20),
(7499, 'ALLEN', 'SALESMAN',7698,'1991-2-20',1600.00,300.00,30),
(7521, 'WARD', 'SALESMAN',7698,'1991-2-22',1250.00,500.00,30),
(7566, 'JONES', 'MANAGER',7839,'1991-4-2',2975.00,NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1991-9-28',1250.00,1400.00,30),
(7698, 'BLAKE', 'MANAGER',7839, '1991-5-1',2850.00,NULL, 30),
(7782, 'CLARK', 'MANAGER',7839,'1991-6-9',2450.00,NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566,'1997-4-19',3000.0,NULL, 20),
(7839, 'KING', 'PRESTDENT', NULL, '1991-11-17',5000.00,NULL,10),
(7844, 'TURNER', 'SALESMAN', 7698,'1991-9-8',1500.00,NULL, 30),
(7900, 'JAMES', 'CLERK', 7698, '1991-12-3',950.00,NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1991-12-3', 3000.00, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1992-1-23', 1300.00, NULL, 10);

SELECT * FROM emp

CREATE TABLE salgrade (
grade MEDIUMINT UNSIGNED NOT NULL DEFAULT 0, /*工资级别*/
losal DECIMAL (17,2) NOT NULL, /*该级别的最低工资*/
hisal DECIMAL (17,2) NOT NULL /*该级别的最高工资*/
);
INSERT INTO salgrade VALUES (1,700,1200);
INSERT INTO salgrade VALUES (2,1201,1400);
INSERT INTO salgrade VALUES (3,1401,2000);
INSERT INTO salgrade VALUES (4,2001,3000);
INSERT INTO salgrade VALUES (5,3001,9999);

SELECT * FROM salgrade

# 按照部门分组查询
SELECT AVG(sal), MAX(sal), deptno
FROM emp GROUP BY deptno;

# 显示每个部门的每种岗位的平均工资和最低工资
SELECT AVG(sal), MIN(sal), deptno, job
FROM emp GROUP BY deptno, job;

# 显示平均工资低于2000的部门号和它的平均工资
SELECT AVG(sal), deptno
FROM emp
GROUP BY deptno
HAVING AVG(sal) < 2000



-- 演示字符串相关函数的使用

# charset(str) 返回字符串字符集
SELECT CHARSET(ename) FROM emp

# concat(string2 [,...]) 连接字符串
SELECT CONCAT(ename, ' job is', job) FROM emp

# instr(string, substring) 返回substring在string中出现的位置，没有返回0
SELECT INSTR('i am jiangshouwei', 'shouwei') FROM DUAL;

# ucase(string) 转换成大写
SELECT UCASE(ename) FROM emp;

# lcase(string) 转换成小写
SELECT LCASE(ename) FROM emp;

# left(string , length) 从string中的左边取length个字符
SELECT LEFT('jiangshouwei', 5)
SELECT RIGHT('jiangshouwei', 7)
SELECT LEFT('姜守威', 1)

# length(string) 返回string的长度[字节返回]
SELECT LENGTH('姜守威')

# replace(str, search_str, replace_str) 在str中用replace_str替换search_str
SELECT REPLACE('jiangshouwei', 'jiang', 'xiao');

# strcmp(string1, string2) 逐字符比较两字符大小
SELECT STRCMP('jsw','zjq');

# substring(str, position, [length])
# 从str的position开始[从1开始计算]，取length个字符
# 从ename列的第一个位置开始取出2个字符
SELECT SUBSTRING(ename, 1, 2) FROM emp;

# ltrim(string) rtrim(string) trim(string)
# 去掉前端空格或者后端空格
SELECT LTRIM(' jiang');
SELECT RTRIM('jiang ');
SELECT TRIM(' jiang ');

# 以首字母小写的方式显示所有员工emp表的姓名
SELECT REPLACE(ename,LEFT(ename,1),LCASE(LEFT(ename,1))) FROM emp;
SELECT CONCAT(LCASE(LEFT(ename,1)), SUBSTRING(ename, 2, LENGTH(ename))) FROM emp;



-- 数学相关函数
# abs(num) 绝对值
SELECT ABS(-10);

# bin(decimal_number) 十进制转二进制
SELECT BIN(10);

# ceiling(number2) 向上取整， 得到比num2大的最小整数
SELECT CEILING(-1.1);

# conv(number, from_base, to_base) 进制转换
# 十进制的8 转换成2进制
SELECT CONV(8,10,2);
SELECT CONV('a',16,2);

# floor(number) 向下取整，得到比num小的最大整数
SELECT FLOOR(1.1);

# format(number, decimal_places) 保留小数位数
SELECT FORMAT(78.123456, 2);

# hex(decimalNumber) 转十六进制
SELECT HEX(10);

# least(number, number1 ...) 求最小值
SELECT LEAST(12,3,2,4,2,25);

# mod(number, denominator) 求余
SELECT MOD(10,3);

# rand([seed]) rand([seed]) 返回随机数 范围为 0 <= v >= 1.0
#  如果使用rand()每次返回不同的随机数在0 <= v >= 1.0
#  如果使用rand(seed)返回随机数， 范围0 <= v >= 1.0，如果seed不变
#  随机数不变
SELECT RAND(3);



-- 时间日期相关函数
# current_date() 当前日期
SELECT CURRENT_DATE();

# current_time() 当前时间
SELECT CURRENT_TIME();

# current_timestamp() 当前时间戳
SELECT CURRENT_TIMESTAMP();

# 创建测试表 信息表
CREATE TABLE mes(
	id INT,
	comtent VARCHAR(30),
	send_time DATETIME);
INSERT INTO mes
	VALUES(1,'新闻', CURRENT_TIMESTAMP());
INSERT INTO mes VALUES(2,'新闻', NOW());

SELECT * FROM mes;

# 显示所有新闻信息，发布日期只显示日期，不显示时间
SELECT id, comtent, DATE(send_time) FROM mes;

# 查询10分钟内发布的新闻
SELECT * FROM mes
	WHERE DATE_ADD(send_time, INTERVAL 10 MINUTE) >= NOW();

# 在mysql的sql语句中求出2011-11-11 和 1990-1-1相差多少天
SELECT DATEDIFF('2011-11-11','1990-1-1');

# 请用mysql的sql语句求出你活了多少天
SELECT DATEDIFF(NOW(), '2000-06-01');

# 如果你能活80岁，求出你还能活多少天
# INTERVAL 80 YEAR : YEAR可以是年月日时分秒
SELECT DATEDIFF(DATE_ADD('2000-06-01',INTERVAL 80 YEAR), NOW());

SELECT TIMEDIFF('10:11:11','06:10:10');

# year|month|day|date(datetime)
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT YEAR('2021-10-27');

# unix_tiemstap(); 返回的是1970-1-1到现在毫秒数
SELECT UNIX_TIMESTAMP();

# from_unixtime(); 可以把一个unix_tiemstap() 秒数，转成指定格式
# 在开发中，可以存放一个整数，然后表示时间。
SELECT FROM_UNIXTIME(1640524903, '%Y-%m-%d');
SELECT FROM_UNIXTIME(1640524903, '%Y-%m-%d %H:%i:%s');
SELECT FROM_UNIXTIME(1640524903);




-- 流程控制语句
# if(expr1,expr2,expr3) 如果expr1为true，则返回expr2 否则返回expr3
SELECT IF(TRUE, '北京', '上海');

# ifnull(expr1, expr2) 如果expr1 不为空，则返回expr1，否则返回expr2
SELECT IFNULL(NULL, 'xiaojiang');

# select case when expr1 then expr2 when expr3 then expr4 else expr5 end;
# 如果epxr1为true，则返回expr2，如果expr2 为true，返回expr4，否则返回expr5
SELECT CASE
	WHEN TRUE THEN 'jack'
	WHEN FALSE THEN 'tom'
	ELSE 'mary' END
# 查询emp表，如果comm是null，则显示0.0
SELECT ename, IF(comm IS NULL,0.0,comm) FROM emp;
SELECT ename, IFNULL(comm, 0.0) FROM emp;

SELECT ename, (SELECT CASE
	WHEN job = 'CLERK' THEN '职员'
	WHEN job = 'MANAGER' THEN '经理'
	WHEN job = 'SALESMAN' THEN '销售人员'
	ELSE job END) AS job
	FROM emp;

