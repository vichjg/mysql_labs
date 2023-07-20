
-- WHILE
DELIMITER $$
DROP PROCEDURE IF EXISTS example_loop_while;
CREATE PROCEDURE example_loop_while(IN plimit INT, OUT res INT) BEGIN
    DECLARE counter INT;

    SET counter = 0;
    SET res = 0;

    WHILE counter <= plimit DO
        SET res = res + counter;
        SET counter = counter + 1;
    END WHILE;
END
$$

DELIMITER ;
CALL example_loop_while(10, @res);
SELECT @res;

