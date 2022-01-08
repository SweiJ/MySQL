# 删除数据库
DROP DATABASE db02

# utf8_bin区分大小写 utf8_general_ci不区分大小写
# 创建db02数据库，默认为utf8字符集，utf8_general_ci排序规则
CREATE DATABASE db03

# 创建一个使用utf8字符集的db04数据库
CREATE DATABASE db04 CHARACTER SET utf8
# 创建一个使用utf8字符集，并带有排序规则的db05
CREATE DATABASE db05 CHARACTER SET utf8 COLLATE utf8_bin

# 下面是一条查询的sql，select查询 * 表示所有字段FROM从哪个表
# WHERE 从哪个字段 NAME = 'TOM' 查询名字是tom
SELECT *
	FROM users
	WHERE NAME = '关羽'
	
# 查看当前数据库服务器中所有数据库
SHOW DATABASES
# 查看前面创建的db01数据库的定义信息
SHOW CREATE DATABASE t1
# 在创建数据库，表的时候，为了规避关键字，可以使用`
# create database `CREATE`

