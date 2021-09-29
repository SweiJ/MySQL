
DROP TABLE IF EXISTS book;
CREATE TABLE book(
	Book_num CHAR(3) PRIMARY KEY,
	Book_ISBN CHAR(10) NOT NULL,
	Book_name VARCHAR(255) NOT NULL,
	Book_zh	VARCHAR(50) NOT NULL,
	Book_cbs VARCHAR(100) NOT NULL,
	Book_year DATE NOT NULL,
	Book_price FLOAT NOT NULL
);

CREATE TABLE student(
	Stu_num CHAR(6) PRIMARY KEY,
	Stu_name CHAR(10) NOT NULL,
	Stu_sex CHAR(3) NOT NULL,
	Stu_phone VARCHAR(20) NOT NULL,
	Stu_yx VARCHAR(50) NOT NULL,
	Stu_qx TINYINT DEFAULT 1
);

CREATE TABLE rule(
	Rule_bt INT PRIMARY KEY,
	Rule_stu_bt CHAR(10) NOT NULL,
	Rule_days CHAR(20) NOT NULL,
	Rule_num CHAR(10) NOT NULL,
	Rule_ot DATETIME NOT NULL
);

CREATE TABLE borrow(
	Borrow_num CHAR(3) PRIMARY KEY,
	Borrow_stu_num CHAR(6) NOT NULL,
	Borrow_jyrq DATETIME NOT NULL,
	Borrow_yhrq DATETIME NOT NULL
);

CREATE TABLE preconcert(
	Pre_stu_num CHAR(6) PRIMARY KEY,
	Pre_book_num CHAR(3) NOT NULL,
	Pre_date DATE NOT NULL
);

CREATE TABLE manmger(
	Manager_num CHAR(6) PRIMARY KEY,
	Manager_pass VARCHAR(10) NOT NULL,
	Manager_account VARCHAR(20) NOT NULL
);