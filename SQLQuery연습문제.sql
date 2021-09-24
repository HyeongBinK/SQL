/*
USE master
GO
--PracticeMatter 데이터베이스를 생성.
CREATE DATABASE PracticeMatter
GO
USE PracticeMatter
GO
--customer Table 생성.
CREATE TABLE customer
(
id       varchar(20) PRIMARY KEY,             --아이디
pwd      varchar(20) NOT NULL,                -- 비밀번호
name     varchar(20) NOT NULL,                --이름
phone    varchar(11) NOT NULL,                --전화번호
register datetime DEFAULT(CURRENT_TIMESTAMP), --등록일자
address  varchar(100) NOT NULL                --주소
)
GO

--Products Table 생성.
CREATE TABLE Products
(
pcode		varchar(20) PRIMARY KEY CHECK(pcode LIKE('P%')), --상품 코드
pname       varchar(20),                                     --상품명
price       int DEFAULT(0)                                   --상품가격
)
GO

--Orders Table 생성.
CREATE TABLE Orders(
oseq	    int PRIMARY KEY IDENTITY,	     -- 주문번호
quantity	int DEFAULT(1),				                 -- 수량
indate      datetime DEFAULT(CURRENT_TIMESTAMP),         -- 주문일자
id          varchar(20) CONSTRAINT FK_id Foreign Key(id) REFERENCES customer(id),         -- 주문자아이디
pcode       varchar(20) CONSTRAINT FK_pcode Foreign Key(pcode) REFERENCES Products(pcode) -- 상품 코드
)
*/


--INSERT INTO customer(id, pwd, name, phone, address) VALUES('a', 'a', 'A', '0', '0')
--INSERT INTO Products(pcode, pname) VALUES('P1', '쌀')
--INSERT INTO orders(id, pcode) VALUES('a','P1')


Select * From customer
Select * From Products
Select * From Orders
