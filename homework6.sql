-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP DATABASE IF EXISTS lesson6;
CREATE DATABASE lesson6;
USE lesson6;

DELIMITER //

DROP FUNCTION IF EXISTS seconds_format;
CREATE FUNCTION seconds_format (seconds INT)
RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE result TEXT;

    SET days = FLOOR(seconds / (24 * 3600));
    SET seconds = seconds % (24 * 3600);
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

    RETURN result;
END //

DELIMITER ;

SELECT seconds_format(123456);


-- Выведите только четные числа от 1 до 10 (через цикл). Пример: 2,4,6,8,10.

DELIMITER //

DROP PROCEDURE IF EXISTS even_numbers;
CREATE PROCEDURE even_numbers()
BEGIN
    DECLARE current_number INT;
    
    SET current_number = 1;

    WHILE current_number <= 10 DO
        IF current_number % 2 = 0 THEN
            SELECT current_number AS even_number;
        END IF;

        SET current_number = current_number + 1;
    END WHILE;
END //

DELIMITER ;

CALL even_numbers();