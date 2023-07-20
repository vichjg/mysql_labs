
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
DROP TABLE IF EXISTS t3;

CREATE TABLE t1 (
    id INT UNSIGNED PRIMARY KEY,
    data VARCHAR(16)
);

CREATE TABLE t2 (
    i INT UNSIGNED
);

CREATE TABLE t3 (
    data VARCHAR(16),
    i INT UNSIGNED
);

INSERT INTO t1 VALUES (1, 'A');
INSERT INTO t1 VALUES (2, 'B');

INSERT INTO t2 VALUES (10);
INSERT INTO t2 VALUES (20);

SELECT "-------------------------t1-------------------------";
SELECT * FROM t1;
SELECT "-------------------------t2-------------------------";
SELECT * FROM t2;
SELECT "-------------------------t3-------------------------";
SELECT * FROM t3;
SELECT "----------------------------------------------------";

-- CURSOR
DELIMITER $$
DROP PROCEDURE IF EXISTS curdemo;
CREATE PROCEDURE curdemo() BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE a CHAR(16);
    DECLARE b, c INT;
    DECLARE cur1 CURSOR FOR SELECT id,data FROM t1;
    DECLARE cur2 CURSOR FOR SELECT i FROM t2;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; -- exit condition in last cursor row

    OPEN cur1;
    OPEN cur2;

    read_loop: LOOP
    FETCH cur1 INTO b, a;
        FETCH cur2 INTO c;
        IF done THEN
            LEAVE read_loop;
        END IF;
        IF b < c THEN
            INSERT INTO t3 VALUES (a,b);
        ELSE
            INSERT INTO t3 VALUES (a,c);
        END IF;
    END LOOP;

    CLOSE cur1;
    CLOSE cur2;
END
$$

DELIMITER ;
CALL curdemo();

SELECT "-------------------------t3-------------------------";
SELECT * FROM t3;

