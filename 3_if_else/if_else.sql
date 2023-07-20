
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

-- FUNCTION WITH AN INPUT PARAMETER
DELIMITER $$
DROP FUNCTION IF EXISTS count_products;
CREATE FUNCTION count_products(input_name VARCHAR(50)) RETURNS INT UNSIGNED DETERMINISTIC BEGIN
    DECLARE total INT UNSIGNED;
    SET total = (SELECT COUNT(*) FROM products_list WHERE product = input_name);
    IF total = 0 THEN
        RETURN 0;
    ELSE
        RETURN total;
    END IF;
END
$$

DELIMITER ;
SELECT count_products("toy_car");

