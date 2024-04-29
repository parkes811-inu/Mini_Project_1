-- product 테이블 삭제 후 재생성
DROP TABLE IF EXISTS product;
CREATE TABLE product (
  product_id VARCHAR(100) NOT NULL,
  name VARCHAR(200),
  price DECIMAL,
  category VARCHAR(100),
  description VARCHAR(2000),
  image_path VARCHAR(1000),
  PRIMARY KEY (product_id)
);

-- users 테이블 삭제 후 재생성
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  phone VARCHAR(100) NOT NULL,
  point INT DEFAULT 0,
  join_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (phone)
);

-- cart 테이블 삭제 후 재생성
DROP TABLE IF EXISTS cart;
CREATE TABLE cart (
  table_no INT,
  user_id VARCHAR(200),
  product_name VARCHAR(200) NOT NULL,
  amount INT DEFAULT 1 NOT NULL,
  price DECIMAL NOT NULL
);

-- orders 테이블 삭제 후 재생성
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  order_no INT NOT NULL AUTO_INCREMENT,
  table_no INT NOT NULL,
  menu_name VARCHAR(200),
  amount INT,
  price DECIMAL,
  order_date DATETIME,
  status VARCHAR(200),
  phone VARCHAR(200),
  use_point INT DEFAULT 0,
  payment VARCHAR(200),
  classification VARCHAR(100),
  PRIMARY KEY (order_no)
);

-- persistent_logins 테이블 삭제 후 재생성
DROP TABLE IF EXISTS persistent_logins;
CREATE TABLE persistent_logins (
  p_no INT NOT NULL AUTO_INCREMENT,
  id VARCHAR(255) NOT NULL,
  token VARCHAR(255) NOT NULL,
  reg_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  upd_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (p_no)
);


DROP TABLE IF EXISTS owner;
CREATE TABLE owner (
  id VARCHAR(200) NOT NULL,
  pw VARCHAR(200) NOT NULL,
  PRIMARY KEY (id)
);


-- 샘플 테이터
INSERT INTO owner VALUES ('admin', '123123');






