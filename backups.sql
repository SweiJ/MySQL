# 备份，要在Dos下执行Mysqldump指令 其实在mysql安装目录\bin
# 备份 db01 和 db02两个数据库
mysqldump -u root -pjsw -B db01 db02 > d:\\bak.sql
# 备份 db01 表 不要带-B，带上-B会以为db01和users都是数据库
mysqldump -u root -pjsw db01 users > d:\\bak.sql

DROP DATABASE db01
DROP DATABASE db02
# 恢复数据库(注意：进入Mysql命令行再执行
source d:\\bak.sql
# 第二个恢复方法，直接将bak.sql的内容放到查询编辑器中，执行