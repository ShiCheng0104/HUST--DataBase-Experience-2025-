DROP DATABASE TestDb;
CREATE DATABASE TestDb;
use TestDb;

CREATE TABLE t_emp
(
    id INT PRIMARY KEY,
    name VARCHAR(32),
    deptId INT,
    salary FLOAT
);
