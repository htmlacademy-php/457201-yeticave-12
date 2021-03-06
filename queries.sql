/* categories data */
INSERT INTO Categories (id, code, category)
    VALUES (null, 'boards', 'Доски и лыжи');
INSERT INTO Categories (id, code, category)
    VALUES (null, 'attachment', 'Крепления');
INSERT INTO Categories (id, code, category)
    VALUES (null, 'boots', 'Ботинки');
INSERT INTO Categories (id, code, category)
    VALUES (null, 'clothing', 'Одежда');
INSERT INTO Categories (id, code, category)
    VALUES (null, 'tools', 'Инструменты');
INSERT INTO Categories (id, code, category)
    VALUES (null, 'other', 'Разное');

/* users data */
INSERT INTO Users (id, registration_date, user_email, user_name, user_password, user_contacts)
    VALUES (null, '2020-04-27', 'finn@atime.ooo', 'Финн', 'qwerty', 'контактный номер +75 222 33 44');
INSERT INTO Users (id, registration_date, user_email, user_name, user_password, user_contacts)
    VALUES (null, '2020-04-28', 'jake@atime.ooo', 'Джейк', '12345', 'звоните мне на пятку');
INSERT INTO Users (id, registration_date, user_email, user_name, user_password, user_contacts)
    VALUES (null, '2020-04-29', 'simon@atime.ooo', 'Саймон', 'password', 'деду на деревню почтой до востребования');

/* lots data */
INSERT INTO Lots (id, lot_name, create_date, lot_info, image_link, start_price, final_date, step_rate, author, winner, cat_code)
    VALUES (null, '2014 Rossignol District Snowboard', '2020-05-01', 'какой-никакой, а сноуборд', 'img/lot-1.jpg', '10999', '2020-07-30', '100', 1, null, 1);
INSERT INTO Lots (id, lot_name, create_date, lot_info, image_link, start_price, final_date, step_rate, author, winner, cat_code)
    VALUES (null, 'DC Ply Mens 2016/2017 Snowboard', '2020-05-02', 'это сноуборд что надо сноуборд', 'img/lot-2.jpg', '15999', '2020-07-31', '50', 3, null, 1);
INSERT INTO Lots (id, lot_name, create_date, lot_info, image_link, start_price, final_date, step_rate, author, winner, cat_code)
    VALUES (null, 'Крепления Union Contact Pro 2015 года размер L/XL', '2020-05-03', 'крепёж от бога', 'img/lot-3.jpg', '8000', '2020-08-01', '50', 1, null, 2);
INSERT INTO Lots (id, lot_name, create_date, lot_info, image_link, start_price, final_date, step_rate, author, winner, cat_code)
    VALUES (null, 'Ботинки для сноуборда DC Mutiny Charocal', '2020-05-04', 'на любой размер', 'img/lot-4.jpg', '10999', '2020-08-02', '50', 2, null, 3);
INSERT INTO Lots (id, lot_name, create_date, lot_info, image_link, start_price, final_date, step_rate, author, winner, cat_code)
    VALUES (null, 'Куртка для сноуборда DC Mutiny Charocal', '2020-05-05', '5 лет, почти как новая', 'img/lot-5.jpg', '7500', '2020-08-03', '100', 3, 2, 4);
INSERT INTO Lots (id, lot_name, create_date, lot_info, image_link, start_price, final_date, step_rate, author, winner, cat_code)
    VALUES (null, 'Маска Oakley Canopy', '2020-05-06', 'весёлая маска для детского утренника', 'img/lot-6.jpg', '5400', '2020-08-04', '100', 2, null, 6);

/* rates data */
INSERT INTO Rates (id, lot_id, user_id, rate, date_rate)
    VALUES (null, 5, 1, 7600, '2020-05-25');
INSERT INTO Rates (id, lot_id, user_id, rate, date_rate)
    VALUES (null, 5, 2, 7700, '2020-05-26');
INSERT INTO Rates (id, lot_id, user_id, rate, date_rate)
    VALUES (null, 6, 1, 6400, '2020-05-27');
INSERT INTO Rates (id, lot_id, user_id, rate, date_rate)
    VALUES (null, 6, 3, 8400, '2020-05-28');

	
/* queries */

/* получить все категории */
SELECT category FROM Categories;


/* получить самые новые открытые лоты, включая текущую цену и название категории каждого лота */
SELECT lot_name, image_link, start_price, final_date, rate, category
  FROM Lots
       LEFT JOIN
         (SELECT lot_id, date_rate, MAX(rate) AS rate
            FROM Rates
           GROUP BY lot_id) Rates
              ON Lots.id = Rates.lot_id
       LEFT JOIN Categories
              ON Lots.cat_code = Categories.id
 WHERE final_date > now()
 ORDER BY create_date DESC;


/* показать лот по его id, включая название категории, к которой он относится */
SELECT lot_name, image_link, lot_info, category
  FROM Lots
       INNER JOIN Categories
               ON Lots.cat_code = Categories.id
 WHERE Lots.id = 5;


/* обновить название лота по его id */
UPDATE Lots
   SET lot_name = 'Хурма вяленая'
 WHERE id = 5;
 /* и сразу же обратно, хурма долго не хранится: */
UPDATE Lots
   SET lot_name = 'Куртка для сноуборда DC Mutiny Charocal'
 WHERE id = 5;


/* получить список ставок для лота по его идентификатору с сортировкой по дате */
SELECT lot_name, rate
  FROM Lots
       INNER JOIN Rates
               ON Lots.id = Rates.lot_id
 WHERE Lots.id = 5
 ORDER BY date_rate DESC;
 