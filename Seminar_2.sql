-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.
-- Создаем таблицу 'sales'.
 CREATE TABLE `seminar_2`. `sales`(
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 order_date VARCHAR(45) NOT NULL,
 bucket VARCHAR(45) NOT NULL
 );
 -- Заполняем ее данными.
 INSERT INTO `seminar_2`. `sales` (`order_date`, `bucket`) VALUES 
 ('22.05.23', '101'), 
 ('23.05.23', '300'),
 ('24.05.23', '250'),
 ('25.05.23', '350'),
 ('26.05.23', '90'),
 ('27.05.23', '21'),
 ('20.05.23', '15'),
 ('21.05.23', '101'),
 ('22.05.23', '1000'),
 ('23.05.23', '500');
 
 -- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
 -- Добавляем новый столбец 'note'.
 ALTER TABLE sales ADD note TEXT NOT NULL;
 -- Группируем значения на 3 сегмента.
 -- Не пропускает консоль. Прописываем:
 SET SQL_SAFE_UPDATES = 0; 
 UPDATE sales SET note=
 CASE WHEN sales.bucket > 300 THEN "БОЛЬШОЙ ЗАКАЗ"
 WHEN sales.bucket > 100 THEN "СРЕДНИЙ ЗАКАЗ"
 WHEN sales.bucket > 1 THEN "МАЛЕНЬКИЙ ЗАКАЗ"
 END;

 -- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE.
 -- Создаем таблицу “orders”.
 CREATE TABLE `seminar_2`. `orders` (
 id INT AUTO_INCREMENT PRIMARY KEY,
 orders_status VARCHAR(45) NOT NULL
 );
 -- Заполняем значениями.
 INSERT INTO `seminar_2`. `orders` (`orders_status`) VALUES 
 ('OPEN'), 
 ('CLOSED'),
 ('CANCELLES'),
 ('CLOSED'),
 ('OPEN'),
 ('CANCELLES'),
 ('CLOSED'),
 ('OPEN'),
 ('CLOSED'),
 ('OPEN');
-- Добавляем новый столбец для отображения полного статуса заказа.
ALTER TABLE orders ADD  orders_note VARCHAR(45) NOT NULL;
-- Заполняем статус значениями.
 UPDATE orders SET orders_note=
 CASE WHEN orders.orders_status = 'OPEN' THEN 'Order in open state.'
 WHEN orders.orders_status = 'CLOSED' THEN 'Order in closed.'
 WHEN orders.orders_status = 'CANCELLES' THEN 'Order in canceled.'
 END;
 -- 4. Чем NULL отличается от 0?
 /* NULL это специальное значение, трактующееся, как "значение не определено".
 И при сравнениях оно ведёт себя особым образом, 
 всегда выдаёт NULL вместо true или false, 
 не участвует в агрегатных функциях вроде среднего арифметического или count с указанием явного столбца. 
 
 PS: Ответы маил.ру)
 */
 