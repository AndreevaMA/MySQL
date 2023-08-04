CREATE DATABASE homework6;
USE homework6;

/* Задание 1.
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 -> '1 days 10 hours 17 minutes 36 seconds'.
*/

DELIMITER //
CREATE FUNCTION timecalc(sec INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN

	DECLARE formatted VARCHAR(100);
	DECLARE dys INT;
	DECLARE hrs INT;
	DECLARE min INT;

	SET dys = FLOOR(sec / 60 / 60 / 24);
	SET sec = sec - (dys * 24 * 60 * 60);
    SET hrs = FLOOR(sec / 60 / 60);
    SET sec = sec - (hrs * 60 * 60);
    SET min = FLOOR(sec / 60);
    SET sec = sec - (min * 60);
    
	SET formatted = CONCAT(dys, " days ", hrs, " hours ", min, " minutes ", sec, " seconds");
    
	RETURN formatted;
END;

SELECT timecalc(123456) AS formatted_time;

/* Задание 2.
Выведите только чётные числа от 1 до 10. Пример: 2,4,6,8,10.
*/

DELIMITER //
CREATE PROCEDURE even_numbers(num INT)
BEGIN
	
    DECLARE result VARCHAR(100) DEFAULT "";
    DECLARE n INT;
	SET n = 2;

    WHILE n <= num DO
		IF n % 2 = 0 THEN 
			SET result = CONCAT(result, n, ", ");
		END IF;
        SET n = n + 2;
    END WHILE;

SELECT result;
END;

CALL even_numbers(10);