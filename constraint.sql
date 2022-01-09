
# 主键
-- primary key 不能重复而且不能为null
-- 一张表最多只能有一个主键，但可以是复合主键
-- 主键的指定方式有两种
-- 直接在字段后指定：字段名  primary key
-- 在表定义最后写 primary key(列名)
-- 使用desc 表名，可以看到primary key的情况
CREATE TABLE t2 (
	id INT PRIMARY KEY,
	`name` VARCHAR(32)
);
CREATE TABLE t2 (
	id INT,
	`name` VARCHAR(32),
	PRIMARY KEY(id, `name`) -- 复合主键
);


# 首先创建主表
CREATE TABLE my_calss (
	id INT PRIMARY KEY,
	`name` VARCHAR(32) NOT NULL DEFAULT ''
);
# 创建 从表
CREATE TABLE my_stu (
	id INT PRIMARY KEY,
	`name` VARCHAR(32) NOT NULL DEFAULT ''
	class_id INT,
	FOREIGN KEY(calss_id) REFERENCES my_calss(id)
);
