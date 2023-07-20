
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    mother_lastname VARCHAR(50), 
    score FLOAT
);

-- TRIGGER
DELIMITER $$
DROP TRIGGER IF EXISTS trigger_check_score_before_insert;
CREATE TRIGGER trigger_check_score_before_insert BEFORE INSERT ON students FOR EACH ROW BEGIN
    IF NEW.score < 0 THEN
        set NEW.score = 0;
    ELSEIF NEW.score > 10 THEN
        set NEW.score = 10;
    END IF;
END$$

-- TRIGGER
DELIMITER $$
DROP TRIGGER IF EXISTS trigger_check_score_before_update;
CREATE TRIGGER trigger_check_score_before_update BEFORE UPDATE ON students FOR EACH ROW BEGIN
    IF NEW.score < 0 THEN
        set NEW.score = 0;
    ELSEIF NEW.score > 10 THEN
        set NEW.score = 10;
    END IF;
END$$

DELIMITER ;
INSERT INTO students VALUES (1, 'Pepe', 'López', 'López', -1);
INSERT INTO students VALUES (2, 'María', 'Sánchez', 'Sánchez', 11);
INSERT INTO students VALUES (3, 'Juan', 'Pérez', 'Pérez', 8.5);

SELECT * FROM students;

UPDATE students SET score = -4 WHERE id = 3;
UPDATE students SET score = 14 WHERE id = 3;
UPDATE students SET score = 9.5 WHERE id = 3;

SELECT * FROM students;

