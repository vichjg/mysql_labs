
-- LOOP
DELIMITER $$
DROP PROCEDURE IF EXISTS summation;
CREATE PROCEDURE summation(p1 INT UNSIGNED) BEGIN
    DECLARE res INT;
    DECLARE idx INT;
    SET res = 0;
    SET idx = 0;
    label1: LOOP
        SET res = res + idx;
        SET idx = idx + 1;
        IF idx <= p1 THEN
            ITERATE label1;
        END IF;
        LEAVE label1;
    END LOOP label1;
    
    SET @x = res;
    SELECT @x;
END$$

DELIMITER ;
CALL summation(4);

