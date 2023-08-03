CREATE DATABASE homework5;
USE homework5;

CREATE TABLE cars
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	car_name VARCHAR(20) NULL,
	cost INT NOT NULL
);

INSERT INTO cars(car_name, cost)
VALUES("Audi", 52642),
      ("Mercedes", 57127),
      ("Skoda", 9000),
      ("Volvo", 29000),
      ("Bentley", 350000),
      ("Citroen", 21000),
      ("Hummer", 41400),
      ("Volkswagen", 21600);
      
/* Задание 1.
Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов.
*/

CREATE VIEW low_end AS
SELECT * FROM cars
WHERE cost < 25000;

/* Задание 2.
Изменить в существующем представлении порог для стоимости:
пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW).
*/

ALTER VIEW low_end AS
SELECT * FROM cars
WHERE cost < 30000;

/* Задание 3.
Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично).
*/

CREATE VIEW sk_au AS
SELECT * FROM cars
WHERE car_name IN ("Skoda", "Audi");

/* Задание 4.
Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
*/

CREATE TABLE Analysis
(
	an_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	an_name VARCHAR(20) NULL,
	an_cost INT NOT NULL,
	an_price INT NOT NULL,
	an_group VARCHAR(20) NULL
);

CREATE TABLE An_groups
(
	gr_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	gr_name VARCHAR(20) NULL,
	gr_temp INT NOT NULL
);

CREATE TABLE Orders
(
	ord_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ord_datetime DATE NULL,
	ord_an VARCHAR(20) NOT NULL
);

INSERT INTO Analysis(an_name, an_cost, an_price, an_group)
VALUES("Head", 198, 250, "A"),
      ("Legs", 78, 114, "B"),
      ("Arms", 90, 120, "B"),
      ("Feet", 203, 450, "A"),
      ("Eyes", 378, 1000, "C"),
      ("Blood", 12, 46, "C");
      
INSERT INTO An_groups(gr_name, gr_temp)
VALUES("A", -30),
      ("B", -15),
      ("C", -10),
      ("D", -5);
      
INSERT INTO Orders(ord_datetime, ord_an)
VALUES("2020-02-03", "Head"),
      ("2020-02-04", "Arms"),
      ("2020-02-05", "Head"),
      ("2020-02-07", "Head"),
      ("2020-02-08", "Eyes"),
      ("2020-02-08", "Eyes"),
      ("2020-02-09", "Arms"),
      ("2020-02-11", "Feet"),
      ("2020-02-12", "Feet"),
      ("2020-02-15", "Eyes"),
      ("2020-02-17", "Blood"),
      ("2020-02-23", "Blood");
      
SELECT o.ord_an, a.an_price
FROM Orders o LEFT JOIN Analysis a ON o.ord_an = a.an_name
WHERE o.ord_datetime BETWEEN "2020-02-05" AND "2020-02-12";

