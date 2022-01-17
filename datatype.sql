# Mysql列类型 即数据类型
# 数值类型 包括整型和小数类型
#	整型：
#		tinyint[1字节]
#		smallint[2字节]
#		mediumint[3字节]
#		int[4字节]
#		bigint[8字节]
#	小数类型：
#		float[单精度4字节]
#		double[双精度8字节]
#		decimal[M,D]大小不确定
# 文本类型 也是字符串类型
# 	char 0-255
#	varchar 0-65535[0-2^16-1]
#	text [0-2^16-1]
#	longtext [0-2^32-1]
# 二进制数据类型
#	blob [0-2^16-1]
#	longblob [0-2^32-1]
# 日期类型
#	date [日期 年月日]
#	time[时间 时分秒]
#	datetime [年月日 时分秒 YYYY-MM-DD HH:mm:ss] 
#	timestamp [时间戳]
#	year [年]

CREATE TABLE `user` (
  id INT,
  `name` VARCHAR (255),
  `password` VARCHAR (32),
  `brithday` DATE
) CHARACTER SET utf8 COLLATE utf8_bin ENGINE INNODB ;

-- 一、数值 整数类型
# tinyint 范围 有符号 -128-127 如果没有符号 0-255
CREATE TABLE t1(
	id TINYINT);
CREATE TABLE t2(
	id TINYINT UNSIGNED);
	
INSERT INTO t1 VALUES(127);
SELECT * FROM t1

INSERT INTO t2 VALUES(255);
SELECT * FROM t2

-- 二、数值 小数类型
# decimal类型、float、double类型
# 创建表
CREATE TABLE T3 (
	num1 FLOAT,
	num2 DOUBLE,
	num3 DECIMAL(30,20) );
# 添加数据
INSERT INTO t3 
VALUES
  (
    88.12345678912345,
    88.123456789123456789,
    88.12345678912345
  ) ;
SELECT * FROM t3;
  
-- 三、文本类型
# char(4)是定长 也就是说存放'aa'也会分配4字节空间
# varchar(4)是变长 就是说，如果你插入了'aa'，实际占用
# 空间大小并不是4个字符，而是按照实际占用空间来分配
# varchar本身还需要占用1-3字节来记录存放内容长度

CREATE TABLE T4 (
	tel CHAR(11),
	`name` VARCHAR(20),
	brief_introduct TEXT);
	
INSERT INTO t4
VALUES
  (
    '12345678910',
    '小姜',
    '我是一个超级幸运的人！'
  ) ;
SELECT * FROM t4;

-- 四、二进制类型
CREATE TABLE T5 (
	num1 BLOB,
	num2 LONGBLOB);
	
INSERT INTO t5
VALUES
  (
    80,
    215646661313
  ) ;
SELECT * FROM t5;

-- 五、时间相关的类型
# date、datetime、timestamp
CREATE TABLE t6 (
  birthday DATE,
  -- 生日
  jobtime DATETIME,
  -- 记录年月日
  login_time TIMESTAMP 
	NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ; -- 登陆时间

# 如果没有写时间戳，会自动填写当前的时间戳
INSERT INTO t6 (birthday,jobtime,login_time)
  VALUES('2021-12-24','2021-12-24 9:17:50','2021-12-24 9:17:51');

SELECT * FROM t6

-- 六、位类型
# 以二进制显示
CREATE TABLE T7 (
	num1 BIT(8) -- 范围1-64
);
	
INSERT INTO t7
VALUES
  (
    80
  ) ;
SELECT * FROM t7;


DROP TABLE t4
DROP DATABASE db02	