-- 查询加强

# 使用where子句
# 查找1992.1.1后入职的员工
SELECT * FROM emp
	WHERE hiredate > '1992-01-01'
	
# 如何使用like操作符
# 	% : 表示0到多个任意字符 _ : 表示单个任意字符
#	如何显示首字符为s的员工姓名和工资
SELECT ename, sal FROM emp
	WHERE ename LIKE 'S%'
#	如何显示第三个字符为大写O的所有员工的姓名和工资
SELECT ename, sal FROM emp
	WHERE ename LIKE '__O%'
# 如何显示没有上级的雇员的情况
SELECT * FROM emp
	WHERE mgr IS NULL;
# 查询表结构 
DESC emp;



-- 使用order by 子句

# 如何按照工资的从低到高的顺序，显示雇员的信息
SELECT * FROM emp
	ORDER BY sal
# 按照部门号升序 雇员的工资降序排列，显示雇员信息
SELECT * FROM emp
	ORDER BY  deptno ASC, sal DESC;



-- 分页查询
# 从第一行显示，显示3行
SELECT * FROM emp
	ORDER BY empno
	LIMIT 0, 3;

SELECT * FROM emp
	ORDER BY empno
	LIMIT 3, 3;
SELECT * FROM emp
	ORDER BY empno
	LIMIT 6, 3;
SELECT * FROM emp
	ORDER BY empno
	LIMIT 9, 3;
SELECT * FROM emp
	ORDER BY empno
	LIMIT 12, 3;

# 公式
# select * from emp
# 	order by empno
#	limit 每页显示记录数 * (第几页-1), 每页显示记录数

SELECT * FROM emp
	ORDER BY empno DESC
	LIMIT 0, 5;

SELECT * FROM emp
DESC	LIMIT 20, 5;



-- 增强group by使用

# 显示每种岗位的雇员总数，平均工资
SELECT COUNT(*), AVG(sal), job
	FROM emp
	GROUP BY job;

# 显示雇员总数，以及获得补助的雇员数
SELECT COUNT(*), COUNT(comm)
	FROM emp

# 显示管理者总人数
SELECT COUNT(mgr) FROM emp;

# 显示雇员工资的最大差额
SELECT MAX(sal) - MIN(sal) FROM emp;




-- 加强查询
# 统计各个部门group by 的平均工资avg
# 并且是大于1000的having， 并且按照平均工资从高到低顺序
# 取出前两行记录
SELECT deptno, AVG(sal) AS avg_sal
	FROM emp
	GROUP BY deptno
	HAVING avg_sal > 1000
	ORDER BY avg_sal DESC
	LIMIT 0, 2;
	
# 多表查询
# 查询雇员名，雇员工资以及所在部门的名字[笛卡尔]

# 多表查询的条件不能少于 表个数-1 否则会出现笛卡尔积
SELECT ename, sal, dname, emp.`deptno`
	FROM emp, dept
	WHERE emp.`deptno` = dept.`deptno`


# 显示各个员工的姓名，工资，以及工资级别

SELECT ename, sal, salgrade.`grade`
	FROM emp, salgrade
	WHERE sal BETWEEN salgrade.`losal` AND salgrade.`hisal`;

SELECT * FROM salgrade
SELECT * FROM emp
SELECT * FROM dept

# 显示雇员名，雇员工资以及所在部门的名字，并按部门排序[降序]
SELECT ename, sal, dname, emp.`deptno`
	FROM emp, dept
	WHERE emp.`deptno` = dept.`deptno`
	ORDER BY emp.deptno DESC;


-- 自连接
# 自连接特点
# 1、把同一张表当做两张表使用
# 2、需要给表取别名 表名 表别名
# 3、列名不明确 可以指定列的别名 列名as列的别名

# 显示公司员工名字和他上级的名字

SELECT worker.`ename`, boss.`ename` FROM emp worker, emp boss
	WHERE worker.`mgr` = boss.`empno`



-- 子查询
# 如何显示与smith同部门的所有员工
# 先查询smith的部门号 在把它当做一个子查询使用
SELECT deptno FROM emp
	WHERE ename = 'SMITH';
SELECT * FROM emp
	WHERE deptno = (
		SELECT deptno FROM emp
		WHERE ename = 'SMITH'
	);


# 如何查询和部门10工作相同的雇员
# 名字、岗位、工资、部门号、但是不含10号部门自己的雇员
SELECT DISTINCT job FROM emp
	WHERE deptno = 10;
	
SELECT ename, job, sal, deptno
	FROM emp
	WHERE job IN (
		SELECT DISTINCT job FROM emp
		WHERE deptno = 10
	) AND deptno != 10;

# 显示工资比部门30的所有员工的工资高的员工姓名、工资和部门号
SELECT ename, sal, deptno
	FROM emp
	WHERE sal < ALL(
		SELECT sal
			FROM emp
			WHERE deptno = 30
		);
# 显示工资比部门30的任意员工的工资的员工姓名、工资和部门号
SELECT ename, sal, deptno
	FROM emp
	WHERE sal > ANY(
		SELECT sal
			FROM emp
			WHERE deptno = 30
		);

# 查询与smith的部门和岗位完全相同的所有雇员(并且不含smith本人)
SELECT * FROM emp
	WHERE (deptno, job) = (
		SELECT deptno, job FROM emp
			WHERE ename = 'SMITH'
		) AND ename != 'SMITH';

# 查询每个部门的信息(部门名，编号，地址)和人员数量
SELECT COUNT(*), deptno
	FROM emp
	ORDER BY deptno;
	
SELECT dname, dept.`deptno`, loc, tmp.per_num AS '人数'
	FROM dept, (
		SELECT COUNT(*) AS per_num, deptno
		FROM emp
		ORDER BY deptno
	) tmp
	WHERE tmp.deptno = dept.`deptno`



CREATE TABLE my_table ( 
	id INT,
	`name` VARCHAR(32),
	sal DOUBLE,
	job VARCHAR(32),
	deptno INT);
DESC my_table;
SELECT * FROM my_table;
  
-- 自我复制
# 把emp表的记录复制到my_table表中
INSERT INTO my_table (
	id, `name`, sal, job, deptno)
	SELECT empno, ename, sal, job, deptno FROM emp;

# 自我复制
INSERT INTO my_table
	SELECT * FROM emp;

# 删除一张表中重复记录
# 创建一张和emp表结构相同的表
CREATE TABLE my_tab01 LIKE emp;

INSERT INTO my_tab01
	SELECT * FROM emp;

SELECT * FROM my_tab01;

/*
	思路
	1、先创建一张临时表my_tmp，该表的结构和my_tab01一样
	2、把my_tmp的记录通过distinct关键字处理后 把记录复制到my_tmp
	3、清除掉my_tab01记录
	4、把my_tmp表的记录复制到my_tab01
	5、drop掉临时表my_tmp
*/
CREATE TABLE my_tmp LIKE my_tab01;

INSERT INTO my_tmp
	SELECT DISTINCT * FROM my_tab01;

DELETE FROM my_tab01;

INSERT INTO my_tab01
	SELECT * FROM my_tmp;

DROP TABLE my_tmp;


-- 合并查询
SELECT ename, sal, job FROM emp WHERE sal>2500
SELECT ename, sal, job FROM emp WHERE job='MANAGER'

# union all就是将两个查询结果合并，不会去重
SELECT ename, sal, job FROM emp WHERE sal>2500
UNION ALL
SELECT ename, sal, job FROM emp WHERE job='MANAGER'
# 会自动去掉重复行
SELECT ename, sal, job FROM emp WHERE sal>2500
UNION
SELECT ename, sal, job FROM emp WHERE job='MANAGER'


-- 外连接
CREATE TABLE stu (
	id INT ,
	`name` VARCHAR(32)
);
INSERT INTO stu VALUES(1, 'jack'),(2,'tom'),(3,'kity'),(4,'nono');

CREATE TABLE exam (
	id INT,
	grade INT
);
INSERT INTO exam VALUES(1, 56),(2,48),(11,78);	

SELECT * FROM stu;
SELECT * FROM exam;
DROP TABLE stu;
# 显示所有人的成绩，如果没有成绩，也要显示该人的姓名和id号，成绩显示为空

SELECT `name`, stu.id
	FROM stu, exam
	WHERE stu.id = exam.id;
	
SELECT `name`, stu.`id`, grade
	FROM stu LEFT JOIN exam
	ON stu.`id` = exam.`id`;
	
SELECT `name`, exam.`id`, grade
	FROM stu RIGHT JOIN exam
	ON stu.`id` = exam.`id`;
	
