CREATE DATABASE homework4;
USE homework4;

/* Задание 1.
1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA.
2. Вывести на экран марку авто и количество AUTO не этой марки.
*/

CREATE TABLE AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10),
	COLOR VARCHAR(15),
	RELEASEDT DATE,
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
      (111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
      (111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
      (111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
      (111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
      (111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
      (111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
      (111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
      (111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);
      
-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA.

SELECT MARK, COLOR, COUNT(COLOR) FROM AUTO
GROUP BY MARK, COLOR
HAVING MARK = "BMW" OR MARK = "LADA"
ORDER BY MARK;

-- 2. Вывести на экран марку авто и количество AUTO не этой марки.

SELECT COUNT(*) FROM AUTO;

SELECT MARK, 9 - COUNT(MARK) AS NOT_MARK_QTY FROM AUTO
GROUP BY MARK;

/* Задание 2.
1. Даны 2 таблицы.
Напишите запрос, который вернёт строки из таблицы test_a, id которых нет в таблице test_b,
НЕ используя ключевого слова NOT.
*/

CREATE TABLE test_a
(
	id INT,
	a_data VARCHAR(1)
);

CREATE TABLE test_b
(
	id INT
);

INSERT INTO test_a(id, a_data)
VALUES(10, 'A'),
      (20, 'A'),
      (30, 'F'),
      (40, 'D'),
      (50, 'C');
      
INSERT INTO test_b(id)
VALUES(10),
      (30),
      (50);
      
SELECT * FROM test_a a
LEFT JOIN test_b b ON a.id = b.id
WHERE b.id IS NULL;


