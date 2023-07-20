
DROP TABLE IF EXISTS products_list;

CREATE TABLE products_list (
    id int,
    product varchar(50),
    price double,
    description  varchar(500),
    primary key(id)
);

INSERT INTO products_list (id,product,price,description) VALUES
    (1,"toy_car",2.5,"Toy car driveable by friction, color red, inspired in cars movie"),
    (2,"tablet",54.99,"Amazon Fire 7 tablet, 7 in. display, 16 GB, 10 hours battery life, light and portable for entertainment at home"),
    (3,"watch",89.99,"Smart Watch for Android iPhone, Alexa Built-In, GPS Fitness Sports Watch with 150 Sports Modes"),
    (4,"laptop",440.61,"Dell Inspiron14 in. Laptop Computer - FHD+ (1920 x 1200) Display, AMD Ryzen7 5825U, 8GB DDR4 RAM, 512GB SSD, AMD Radeon Graphics");


-- PROCEDURE WITHOUT PARAMETERS
DELIMITER $$
DROP PROCEDURE IF EXISTS listing_products;
CREATE PROCEDURE listing_products() BEGIN
    SELECT * FROM products_list;
END
$$

DELIMITER ;
CALL listing_products();

-- PROCEDURE WITH AN INPUT PARAMETER
DELIMITER $$
DROP PROCEDURE IF EXISTS listing_products_by_name;
CREATE PROCEDURE listing_products_by_name(IN input_name VARCHAR(50)) BEGIN
    SELECT * FROM products_list WHERE product = input_name;
END
$$

DELIMITER ;
CALL listing_products_by_name("toy_car");

-- PROCEDURE WITH INPUT AND OUTPUT PARAMETERS
DELIMITER $$
DROP PROCEDURE IF EXISTS count_products;
CREATE PROCEDURE count_products(IN input_name VARCHAR(50), OUT total INT UNSIGNED) BEGIN
    SET total = (SELECT COUNT(*) FROM products_list WHERE product = input_name);
END
$$

DELIMITER ;
CALL count_products("toy_car", @total);
SELECT @total;


-- PROCEDURE WITH AN INPUT AND MULTIPLE OUTPUT PARAMETERS
DELIMITER $$
DROP PROCEDURE IF EXISTS calculate_max_min_avg;
CREATE PROCEDURE calculate_max_min_avg(
    IN  input_name VARCHAR(50),
    OUT maximum DECIMAL(15, 2),
    OUT minimum DECIMAL(15, 2),
    OUT average DECIMAL(15, 2)
) BEGIN
    SELECT MAX(price), MIN(price), AVG(price)
    FROM products_list
    WHERE product = input_name
    INTO maximum, minimum, average;
END
$$

DELIMITER ;
CALL calculate_max_min_avg('toy_car', @maximum, @minimum, @average);
SELECT @maximum, @minimum, @average;













