# 请填写语句，完成以下功能：
use finance;
#(1) 创建用户tom和jerry，初始密码均为'123456'；
DROP USER IF EXISTS 'tom';
CREATE USER 'tom' IDENTIFIED BY '123456';
DROP USER IF EXISTS 'jerry';
CREATE USER 'jerry' IDENTIFIED BY '123456';
#(2) 授予用户tom查询客户的姓名，邮箱和电话的权限,且tom可转授权限；
GRANT SELECT (c_name, c_mail, c_phone) ON finance.client TO 'tom' WITH GRANT OPTION;
#(3) 授予用户jerry修改银行卡余额的权限；
GRANT UPDATE (b_balance) ON finance.bank_card TO 'jerry';
#(4) 收回用户Cindy查询银行卡信息的权限。
REVOKE SELECT ON finance.bank_card FROM 'Cindy';
