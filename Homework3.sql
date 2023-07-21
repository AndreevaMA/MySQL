CREATE DATABASE homework3;
USE homework3;

/* Задание 1.
1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.
2. Напишите запрос, который сосчитал бы число различных,
отличных от NULL значений поля city в таблице заказчиков.
3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.
4. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г.
Используется оператор "LIKE".
5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе.
*/

CREATE TABLE salespeople
(
	snum INT NOT NULL PRIMARY KEY,
    sname VARCHAR(20) NULL,
    city VARCHAR(20) NULL,
    comm VARCHAR(3) NULL
);

INSERT INTO salespeople(snum, sname, city, comm)
VALUES (1001, "Peel", "London", ".12"),
	   (1002, "Serres", "San Jose", ".13"),
       (1004, "Motika", "London", ".11"),
       (1007, "Rifkin", "Barcelona", ".15"),
       (1003, "Axelrod", "New York", ".10");

CREATE TABLE customers
(
	cnum INT NOT NULL PRIMARY KEY,
    cname VARCHAR(20) NULL,
    city VARCHAR(20) NULL,
    rating INT NULL,
    snum INT NULL
);

INSERT INTO customers(cnum, cname, city, rating, snum)
VALUES (2001, "Hoffman", "London", 100, 1001),
	   (2002, "Giovanni", "Rome", 200, 1003),
       (2003, "Liu", "San Jose", 200, 1002),
       (2004, "Grass", "Berlin", 300, 1002),
       (2006, "Clemens", "London", 100, 1001),
       (2008, "Cisneros", "San Jose", 300, 1007),
       (2007, "Pereira", "Rome", 100, 1004);

CREATE TABLE orders
(
	onum INT NOT NULL PRIMARY KEY,
    amt DECIMAL(7,2) NULL,
    odate DATE NULL,
    cnum INT NULL,
    snum INT NULL
);

INSERT INTO orders(onum, amt, odate, cnum, snum)
VALUES (3001, 18.69, "2016-01-01", 2008, 1007),
	   (3003, 767.19, "2023-05-12", 2001, 1001),
       (3002, 1900.10, "2016-01-01", 2007, 1004),
       (3005, 5160.45, "2016-01-01", 2003, 1002),
       (3006, 1098.16, "2016-01-01", 2008, 1007),
       (3009, 1713.23, "2023-05-12", 2002, 1003),
       (3007, 75.75, "2023-05-12", 2004, 1002),
       (3008, 4723.00, "2023-05-12", 2006, 1001),
       (3010, 1309.95, "2016-01-01", 2004, 1002),
       (3011, 9891.88, "2023-05-12", 2006, 1001);

-- 1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.

SELECT amt FROM orders
WHERE odate = "2016-01-01";

SELECT SUM(amt) FROM orders
WHERE odate = "2016-01-01";

-- 2. Напишите запрос, который сосчитал бы число различных,
-- отличных от NULL значений поля city в таблице заказчиков.

SELECT COUNT(DISTINCT city) FROM customers;

-- 3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.

SELECT cnum, MIN(amt) FROM orders
GROUP BY cnum
ORDER BY cnum;

-- 4. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г.
-- Используется оператор "LIKE".

SELECT cname FROM customers
WHERE cname LIKE "G%";

-- 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе.

SELECT city, MAX(rating) FROM customers
GROUP BY city;


/* Задание 2.
1. Отсортируйте поле “сумма” в порядке убывания и возрастания.
2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой.
3. Выполните группировку всех сотрудников по специальности “рабочий”,
зарплата которых превышает 20000.
*/

CREATE TABLE employees
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ename VARCHAR(100) NULL,
    esurname VARCHAR(100) NULL,
    speciality VARCHAR(100) NULL,
    seniority INT NULL,
    salary INT NULL,
    age INT NULL
);

INSERT INTO employees(ename, esurname, speciality, seniority, salary, age)
VALUES ("Вася", "Васькин", "начальник", 40, 100000, 60),
	   ("Петя", "Петькин", "начальник", 8, 70000, 30),
       ("Катя", "Катькина", "инженер", 2, 70000, 25),
       ("Саша", "Сашкин", "инженер", 12, 50000, 35),
       ("Иван", "Иванов", "рабочий", 40, 30000, 59);
       
INSERT INTO employees(ename, esurname, speciality, seniority, salary, age)
VALUES ("Маша", "Машкина", "начальница", 40, 100000, 90);

-- 1. Отсортируйте поле “сумма” в порядке убывания и возрастания.

SELECT speciality, SUM(salary) AS salary_sum FROM employees
GROUP BY speciality
ORDER BY salary_sum DESC;

SELECT speciality, SUM(salary) AS salary_sum FROM employees
GROUP BY speciality
ORDER BY salary_sum;

-- 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк
-- с наибольшей заработной платой.

SELECT COUNT(*) FROM employees;

SELECT * FROM employees
ORDER BY salary
LIMIT 6, 5;

-- 3. Выполните группировку всех сотрудников по специальности “рабочий”,
-- зарплата которых превышает 20000.

SELECT * FROM employees
WHERE speciality = "рабочий" AND salary > 20000;

