CREATE DATABASE bai_tap_SQL;
use bai_tap_SQL;


CREATE TABLE restaurant(
		res_id int PRIMARY key auto_INCREMENT,
		res_name VARCHAR(50),
		image VARCHAR(200),
		description VARCHAR(200)
);
INSERT INTO restaurant (res_id, res_name, image, description) VALUES
		('Restaurant A', 'http://example.com/restaurantA.jpg', 'A cozy restaurant with a variety of cuisines.'),
		('Restaurant B', 'http://example.com/restaurantB.jpg', 'An elegant dining experience with a focus on seafood.'),
		('Restaurant C', 'http://example.com/restaurantC.jpg', 'A family-friendly place known for its pizza and pasta.'),
		('Restaurant D', 'http://example.com/restaurantD.jpg', 'A Thai-style restaurant.'),
		('Restaurant E', 'http://example.com/restaurantE.jpg', 'A traditional restaurant with great food.'),
		('Restaurant F', 'http://example.com/restaurantF.jpg', 'The most luxurious restaurant in the city.');


CREATE TABLE users(
		user_id int PRIMARY key auto_INCREMENT,
		full_name VARCHAR(50),
		email VARCHAR(50),
		password VARCHAR(50)
);
INSERT INTO users (user_id, full_name, email, password) VALUES
		('Tran Thi Ngoc Trinh', 'ngoctrinh2000@gmail.com', 'password123'),
		('Tran Phuong Nhi', 'nhine1234@gmail.com', 'nhinhi123'),
		('Bui Minh Anh', 'buiminhanh123@gmail.com', 'minhanh345'),
		('Nguyen Tran Phuong', 'phuongoi@gmail.com', 'phuongoi122'),
		('Bui Nguyen Anh Thu', 'thubui2378@gmail.com', 'thubuiii'),
		('Vo Nhu Quynh', 'quynh123@gmail.com', 'quynhquynh12'),
		('Nguyen Linh Chi', 'linhchi789@gmail.com', 'linhchi888'),
		('Trinh Anh Thu'. 'anhthutrinh@gmail.com', 'anhthu5926');
		
		
CREATE TABLE food(
		food_id int PRIMARY key auto_INCREMENT,
		food_name VARCHAR(50),
		image VARCHAR(200),
		price FLOAT,
		description VARCHAR(200),
		type_id int,
		FOREIGN key (type_id) REFERENCES food_type(type_id)
);
INSERT INTO food (food_id, food_name, image, price, description, type_id) VALUES
		('Pizza', 'http://example.com/pizza.jpg', 350000, 'pizza big size'),
		('Mi Y', 'http://example.com/miy.jpg', 60000, 'fast food'),
		('Sushi', 'http://example.com/miy.jpg', 60000, 'fresh'),
		('Pasta', 'http://example.com/miy.jpg', 60000, 'bqxq udhqwjd'),
		('Steak', 'http://example.com/miy.jpg', 60000, 'scrrg56y'),
		

CREATE TABLE rate_res(
		rate_res_id int PRIMARY key auto_INCREMENT,
		user_id int,
		FOREIGN key (user_id) REFERENCES users(user_id),
		res_id int,
		FOREIGN key (res_id) REFERENCES restaurant(res_id),
		amount int,
		date_rate datetime
);
INSERT INTO rate_res (amount) VALUES
		()

CREATE TABLE like_res(
		like_res_id int PRIMARY key auto_INCREMENT,
		user_id int,
		FOREIGN key (user_id) REFERENCES users(user_id),
		res_id int,
		FOREIGN key (res_id) REFERENCES restaurant(res_id),
		date_like datetime 
);
INSERT INTO like_res (user_id, res_id) VALUES
		(1,1),
		(1,3),
		(5,6),
		(3,2),
		(8,5),
		(8,6),
		(7,2),
		(5,1),
		(3,6),
		(3,4),
		(2,5);


CREATE TABLE orders(
		order_food int PRIMARY key auto_INCREMENT,
		user_id int,
		FOREIGN key (user_id) REFERENCES users(user_id),
		food_id int,
		FOREIGN key (food_id) REFERENCES food(food_id),
		amount int,
		code VARCHAR(50),
		arr_sub_id VARCHAR(50)
);


CREATE TABLE sub_food(
		sub_id int PRIMARY key auto_INCREMENT,
		sub_name VARCHAR(50),
		sub_price float,
		food_id int,
		FOREIGN key (food_id) REFERENCES food(food_id)
);
INSERT INTO sub_food (food_id) VALUES
		(1),
		(2),
		(3),
		(4),
		(5),
		(6),
		(7),
		(8);


CREATE TABLE food_type(
		type_id int PRIMARY key auto_INCREMENT,
		type_name VARCHAR(50)
);





-- Tim 5 nguoi da like nha hang nhieu nhat 
SELECT COUNT(lr.user_id) as like_user_count, u.full_name, u.email, lr.user_id
FROM like_res as lr 
inner join users as u on lr.user_id = u.user_id
GROUP BY u.full_name, u.email, lr.user_id
ORDER BY like_user_count DESC
limit 5;

-- Tim 2 nha hang co luot like nhieu nhat
SELECT COUNT(lr.like_res_id) as like_count, r.res_name
FROM restaurant as r 
inner JOIN like_res as lr on r.res_id = lr.res_id
GROUP BY r.res_name 
ORDER BY like_count DESC
LIMIT 2;


-- Tim nguoi da dat hang nhieu nhat
SELECT COUNT(o.order_food) as order_count, u.full_name
FROM users as u 
inner JOIN orders as o on u.user_id = o.user_id
GROUP BY u.full_name 
ORDER BY order_count DESC
LIMIT 1;


-- Tim nguoi dung khong hoat dong trong he thong (khong dat hang, khong like, khong danh gia nha hang)
SELECT u.full_name
FROM users as u 
LEFT JOIN orders as o on u.user_id = o.user_id
LEFT JOIN like_res as lr on u.user_id = lr.user_id
LEFT JOIN rate_res as rr on u.user_id = rr.user_id
WHERE o.user_id IS NULL and lr.user_id is null and rr.user_id is null; 





















