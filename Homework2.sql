-- Используя операторы языка SQL, создайте табличку “sales”. Заполните её данными.

CREATE DATABASE homework2;
USE homework2;

CREATE TABLE sales
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	retail_chain VARCHAR(20),
	product VARCHAR(100),
	sales_qty INT
);

INSERT INTO sales(retail_chain, product, sales_qty)
VALUES ("mvideo", "Samsung Galaxy S7 Edge", 150),
       ("dns", "Samsung Galaxy Note5", 450),
       ("eldorado", "Samsung Galaxy Tab3", 200),
       ("dns", "Samsung Galaxy S8", 450),
       ("dns", "Samsung Galaxy A5 (2017)", 1150),
       ("mvideo", "Samsung Galaxy Tab3", 50),
       ("eldorado", "Samsung Galaxy Note4", 180),
       ("dns", "Samsung Galaxy S8+", 220),
       ("eldorado", "Samsung Galaxy S8 LE", 240),
       ("mvideo", "Samsung Galaxy Note4", 670),
       ("euroset", "Samsung Galaxy A5 (2017)", 305),
       ("mvideo", "Samsung Galaxy S8", 215),
       ("eldorado", "Samsung Galaxy S7 Edge", 30),
       ("eldorado", "Samsung Galaxy S7", 15),
       ("dns", "Samsung Galaxy Tab4", 800);
       
-- Сгруппируйте значения количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT
	retail_chain,
	product,
	sales_qty,
	CASE
		WHEN sales_qty > 300 THEN "Greater than 300"
		WHEN sales_qty >= 100 AND sales_qty <= 300 THEN "100 to 300"
		ELSE "Less than 100"
	END sales_group
FROM sales;

-- Создайте таблицу “orders”, заполните ее значениями.
-- Покажите “полный” статус заказа, используя оператор CASE.

CREATE TABLE orders
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	order_date DATE,
	amount_usd DECIMAL(5,2),
	order_status VARCHAR(10)
);

INSERT INTO orders(order_date, amount_usd, order_status)
VALUES ("2023-01-20", 20.16, "OPEN"),
       ("2023-04-29", 45.00, "CANCELLED"),
       ("2023-02-14", 12.87, "CLOSED"),
       ("2023-04-15", 31.00, "CLOSED"),
       ("2023-05-30", 18.40, "OPEN"),
       ("2023-03-17", 95.32, "OPEN"),
       ("2023-02-09", 100.00, "OPEN"),
       ("2023-06-27", 20.03, "CLOSED"),
       ("2023-04-18", 47.89, "OPEN"),
       ("2023-03-08", 12.08, "CANCELLED"),
       ("2023-03-01", 50.00, "CLOSED"),
       ("2023-01-21", 25.30, "OPEN"),
       ("2023-02-24", 25.17, "CLOSED"),
       ("2023-03-13", 65.32, "OPEN"),
       ("2023-05-21", 19.81, "CANCELLED");
       
SELECT
	order_date,
	amount_usd,
	order_status,
	CASE
		WHEN order_status = "OPEN" THEN "Order is open state"
		WHEN order_status = "CLOSED" THEN "Order is closed"
		ELSE "Order is cancelled"
	END full_order_status
FROM orders;

-- Чем NULL отличается от 0?

/*
Ответ:
0 - это константа, значение которой равно нулю.
NULL - специальное значение, которое используется для обозначения отсутствия данных,
а также для указания на неопределённый результат вычислений (например при делении на ноль).
Для работы с NULL используются вспомогательные операторы IS NULL и IS NOT NULL.
*/

