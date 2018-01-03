--创建记录属性表
CREATE TABLE recordproperty(
propertyid integer PRIMARY KEY autoincrement,-- 设置主键
propertyname varchar (50)
);

INSERT INTO recordproperty (propertyname)
VALUES ('收入');
INSERT INTO recordproperty (propertyname)
VALUES ('支出');

--创建记录类型表
CREATE TABLE recordtype(
typeid integer PRIMARY KEY autoincrement,-- 设置主键
propertyid integer,
typename varchar (50),
orderno integer
);

INSERT INTO recordtype (propertyid,typename,orderno)
VALUES (1,'工资',1);
INSERT INTO recordtype (propertyid,typename,orderno)
VALUES (1,'奖金',2);
INSERT INTO recordtype (propertyid,typename,orderno)
VALUES (1,'其他',3);


INSERT INTO recordtype (propertyid,typename,orderno)
VALUES (2,'早中晚餐',1);
INSERT INTO recordtype (propertyid,typename,orderno)
VALUES (2,'超市购物',2);
INSERT INTO recordtype (propertyid,typename,orderno)
VALUES (2,'服饰',3);


--创建账户类型表
CREATE TABLE accounttype(
typeid integer PRIMARY KEY autoincrement,-- 设置主键
typename varchar (50),
orderno integer
);


INSERT INTO recordtype (typename,orderno)
VALUES ('银行卡',1);
INSERT INTO recordtype (typename,orderno)
VALUES ('金融账户',2);
INSERT INTO recordtype (typename,orderno)
VALUES ('现金',3);

--创建账户表
CREATE TABLE account(
accountid integer PRIMARY KEY autoincrement,-- 设置主键
typeid integer,
accountname varchar (50),
orderno integer
);


INSERT INTO account (typeid,accountname,orderno)
VALUES (1,'中信信用卡',1);
INSERT INTO account (typeid,accountname,orderno)
VALUES (1,'招商信用卡',2);
INSERT INTO account (typeid,accountname,orderno)
VALUES (1,'招商银行卡',3);
INSERT INTO account (typeid,accountname,orderno)
VALUES (1,'建设银行卡',4);

INSERT INTO account (typeid,accountname,orderno)
VALUES (2,'余额宝',1);
INSERT INTO account (typeid,accountname,orderno)
VALUES (2,'京东',1);
INSERT INTO account (typeid,accountname,orderno)
VALUES (2,'苏宁',1);

INSERT INTO account (typeid,accountname,orderno)
VALUES (3,'现金',1);




