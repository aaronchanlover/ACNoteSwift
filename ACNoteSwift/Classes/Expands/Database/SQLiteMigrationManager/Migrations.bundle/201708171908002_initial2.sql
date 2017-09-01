--创建记录表
CREATE TABLE records(
recordid integer PRIMARY KEY autoincrement,-- 设置主键
propertyid integer ,
recordtypeid integer，
recorddatetime datetime，
registerdatetime datetime,
amount decimal(18,2),
remark varchar(1000)
);


 


