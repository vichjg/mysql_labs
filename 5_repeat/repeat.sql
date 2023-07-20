
-- REPEAT
DELIMITER $$
DROP PROCEDURE IF EXISTS example_loop_repeat;
CREATE PROCEDURE example_loop_repeat(IN plimit INT, OUT res INT) BEGIN
    DECLARE counter INT;

    SET counter = 0;
    SET res = 0;

    REPEAT
        SET res = res + counter;
        SET counter = counter + 1;
    UNTIL counter > plimit
    END REPEAT;
END
$$

DELIMITER ;
CALL example_loop_repeat(10, @res);
SELECT @res;

