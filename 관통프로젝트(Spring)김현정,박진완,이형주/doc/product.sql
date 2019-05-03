DROP TABLE product;

CREATE TABLE product(
	id VARCHAR(10) PRIMARY KEY,
	name VARCHAR(10),
	price INT,
	description VARCHAR(20)
);
INSERT INTO product VALUES(1, '볼펜', 1000, '끊김없이 써지는 볼펜');
INSERT INTO product VALUES(2, '공책', 2000, '눈의 피로가 적은 공책');

SELECT * FROM product;

UPDATE product SET name = '필통', price = 3000, description = '많이담을수있는 필통' WHERE id = 1;

DELETE FROM product WHERE id = 1;