/*
USE master
GO
--PracticeMatter �����ͺ��̽��� ����.
CREATE DATABASE PracticeMatter
GO
USE PracticeMatter
GO
--customer Table ����.
CREATE TABLE customer
(
id       varchar(20) PRIMARY KEY,             --���̵�
pwd      varchar(20) NOT NULL,                -- ��й�ȣ
name     varchar(20) NOT NULL,                --�̸�
phone    varchar(11) NOT NULL,                --��ȭ��ȣ
register datetime DEFAULT(CURRENT_TIMESTAMP), --�������
address  varchar(100) NOT NULL                --�ּ�
)
GO

--Products Table ����.
CREATE TABLE Products
(
pcode		varchar(20) PRIMARY KEY CHECK(pcode LIKE('P%')), --��ǰ �ڵ�
pname       varchar(20),                                     --��ǰ��
price       int DEFAULT(0)                                   --��ǰ����
)
GO

--Orders Table ����.
CREATE TABLE Orders(
oseq	    int PRIMARY KEY IDENTITY,	     -- �ֹ���ȣ
quantity	int DEFAULT(1),				                 -- ����
indate      datetime DEFAULT(CURRENT_TIMESTAMP),         -- �ֹ�����
id          varchar(20) CONSTRAINT FK_id Foreign Key(id) REFERENCES customer(id),         -- �ֹ��ھ��̵�
pcode       varchar(20) CONSTRAINT FK_pcode Foreign Key(pcode) REFERENCES Products(pcode) -- ��ǰ �ڵ�
)
*/


--INSERT INTO customer(id, pwd, name, phone, address) VALUES('a', 'a', 'A', '0', '0')
--INSERT INTO Products(pcode, pname) VALUES('P1', '��')
--INSERT INTO orders(id, pcode) VALUES('a','P1')


Select * From customer
Select * From Products
Select * From Orders
