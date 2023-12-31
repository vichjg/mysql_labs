
-- DECLARE CONTINUE HANDLER
DROP TABLE IF EXISTS t;

CREATE TABLE t (s1 INT, PRIMARY KEY (s1));

DELIMITER $$
DROP PROCEDURE IF EXISTS handlerdemo;
CREATE PROCEDURE handlerdemo() BEGIN
    DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @x = 1;
    SET @x = 1;
    INSERT INTO t VALUES (1);
    SET @x = 2;
    INSERT INTO t VALUES (1);
    SET @x = 3;
END
$$

DELIMITER ;
CALL handlerdemo();
SELECT @x; 

DELETE FROM t;

-- DECLARE EXIT HANDLER
DELIMITER $$
DROP PROCEDURE IF EXISTS handlerdemo2;
CREATE PROCEDURE handlerdemo2() BEGIN
    DECLARE EXIT HANDLER FOR SQLSTATE '23000' SET @x = 1;
    SET @x = 1;
    INSERT INTO t VALUES (1);
    SET @x = 2;
    INSERT INTO t VALUES (1);
    SET @x = 3;
END
$$

DELIMITER ;
CALL handlerdemo2();
SELECT @x;

