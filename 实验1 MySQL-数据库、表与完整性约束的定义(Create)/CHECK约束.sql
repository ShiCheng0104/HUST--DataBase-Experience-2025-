# 请在以下空白处填写完成任务的语句，空白行可通过回车换行添加。
# 你也可以在命令行窗口完成任务，不过，在命令行键入的语句不会被保存。

use MyDb;
CREATE TABLE products
(
    pid char(10) PRIMARY KEY,
    name VArCHAR(32),
    brand CHAR(10) constraint CK_products_brand CHECK(brand in ('A','B'),
    price INT constraint CK_products_price CHECK(price > 0)
);


# 结束 