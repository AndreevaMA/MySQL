-- Задание:
-- Создайте таблицу с мобильными телефонами. Заполните БД данными.
-- Выведите название, производителя и цену для товаров, количество которых превышает 2.
-- Выведите весь ассортимент товаров марки “Samsung”.

CREATE DATABASE homework1;
USE homework1;

CREATE TABLE mobilephones
(
	id int not null auto_increment primary key,
    brand varchar(10),
    model_name varchar(30),
    color varchar(10),
    inbuilt_memory int,
    price_usd int,
    q_ty int
);

INSERT INTO mobilephones(brand, model_name, color, inbuilt_memory, price_usd, q_ty)
VALUES ("Samsung", "Galaxy S23", "yellow", 256, 1000, 304),
       ("Samsung", "Galaxy S23+", "pink", 256, 1500, 10),
       ("Apple", "iPhone 8", "black", 500, 780, 1),
       ("Huawei", "P60", "white", 128, 900, 1),
       ("Huawei", "P60", "gray", 256, 850, 2),
       ("Samsung", "Galaxy S23+", "green", 64, 300, 53),
       ("Samsung", "Galaxy S23", "gold", 128, 350, 247),
       ("Xiaomi", "Redmi 10C", "brown", 128, 550, 12),
       ("Apple", "iPhone 10", "blue", 256, 1200, 1),
       ("Samsung", "Galaxy S23+", "silver", 1000, 1300, 1),
       ("Xiaomi", "Redmi 10C", "orange", 500, 870, 6);
       
SELECT model_name, brand, price_usd FROM mobilephones
WHERE q_ty > 2;

SELECT * FROM mobilephones
WHERE brand = "Samsung";


