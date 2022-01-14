CREATE TABLE t2 (
	id INT, 
	`name` VARCHAR(32));
-- 开启事务
START TRANSACTION
-- 设置保存点
SAVEPOINT a
-- 执行dml
INSERT INTO t2 VALUES(100, 'tom');
SELECT * FROM t2;

-- 设置保存点
SAVEPOINT b
INSERT INTO t2 VALUES(200, 'jack');
SELECT * FROM t2;
-- 回退到b
ROLLBACK TO b;

ROLLBACK TO a;
DELETE FROM t2
WHERE id IN (100, 200);