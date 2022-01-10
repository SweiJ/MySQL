-- 修改表

-- 添加列
# ALTER TABLE tablename
# 	ADD field datatype [default expr],
#	ADD field datatype [default expr],
#	...;

-- 修改列
# alter table tablename
# 	modify COLUMN datatype [DEFAULT expr],
#	modify COLUMN datatype [DEFAULT expr],
#	...;

-- 删除列	
# ALTER TABLE tablename
# drop (COLUMN);

# desc 表名

-- 修改表名
# rename table 表名 to 新表名
# alter table 表名 character set 字符集;

CREATE TABLE t8 (
	id INT,
	`name` VARCHAR(100),
	sex CHAR(3),
	brithday DATE,
	entry_date DATE,
	job VARCHAR(255),
	Salary FLOAT,
	`resume` TEXT);
 
INSERT INTO t8
  VALUES(
	001,
	'小姜',
	'男',
	'2000-06-01',
	'2022-08-20',
	'Java工程师',
	15000.80,
	'一个超级幸运的人！');
	
SELECT * FROM t8

# 在t8表中resume后面添加image 并且不为空 默认给'' 
ALTER TABLE t8
	ADD image VARCHAR(32) NOT NULL DEFAULT '' AFTER `resume`,
	ADD num CHAR(11) AFTER job
DESC t8 -- 显示表结构

# 修改job类型为60
ALTER TABLE t8
MODIFY job VARCHAR(60) NOT NULL DEFAULT ''

# 删除sex
ALTER TABLE t8
DROP num

# 修改表名
RENAME t8 TO employee
RENAME employ TO t8

# 修改字符集
ALTER TABLE t8 CHARACTER SET utf8
# 修改t8表中name 为 user_name
ALTER TABLE t8 CHANGE `name` `user_name` VARCHAR(20) NOT NULL DEFAULT ''
 