
use finance1;

-- 在金融应用场景数据库中，编程实现一个转账操作的存储过程sp_transfer_balance，实现从一个帐户向另一个帐户转账。
-- 请补充代码完成该过程：
delimiter $$
create procedure sp_transfer(
	                 IN applicant_id int,      
                     IN source_card_id char(30),
					 IN receiver_id int, 
                     IN dest_card_id char(30),
					 IN	amount numeric(10,2),
					 OUT return_code int)
BEGIN
SET autocommit = OFF;
START TRANSACTION;
    UPDATE bank_card SET b_balance = b_balance-amount WHERE b_number = source_card_id AND b_c_id = applicant_id AND b_type = "储蓄卡";
    UPDATE bank_card SET b_balance = b_balance+amount WHERE b_number = dest_card_id AND b_c_id = receiver_id AND b_type = "储蓄卡";
    UPDATE bank_card SET b_balance = b_balance-amount WHERE b_number = dest_card_id AND b_c_id = receiver_id AND b_type = "信用卡";

    IF NOT EXISTS(SELECT * FROM bank_card WHERE b_number = source_card_id AND b_c_id = applicant_id AND b_type = "储蓄卡" AND b_balance > 0) THEN
        SET return_code = 0;
        ROLLBACK;
    ELSEIF NOT EXISTS(SELECT * FROM bank_card WHERE b_number = dest_card_id AND b_c_id = receiver_id) THEN
        SET return_code = 0;
        ROLLBACK;
    ELSE
        SET return_code = 1;
        COMMIT;
    END IF;
SET autocommit = TRUE;

END$$

delimiter ;

/*  end  of  your code  */ 
