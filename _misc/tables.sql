USE fs_customers;

CREATE TABLE fs_customers (
  fs_customer_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  full_name VARCHAR(80) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone CHAR(10) NOT NULL,
  password VARCHAR(40) NOT NULL,
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(fs_customer_id)
)ENGINE = InnoDB;

INSERT INTO fs_customers(full_name, email, phone, password) VALUES
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM');

DELETE from fs_customers WHERE fs_customer_id = 'FROM LOGGED IN USER INFO';

CREATE TABLE fs_admins (
  fs_admin_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  full_name VARCHAR(80) NOT NULL,
  position VARCHAR(40) NOT NULL,
  employee_id_num MEDIUMINT NOT NULL,
  PRIMARY KEY(fs_admin_id)
)ENGINE = InnoDB;

INSERT INTO fs_admins(full_name, position, employee_id_num) VALUES
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM');

DELETE from fs_admins WHERE fs_admin_id = 'FROM LOGGED IN USER INFO';

CREATE TABLE fs_addresses (
  fs_address_id MEDIUMINT NOT NULL AUTO_INCREMENT,
  fs_customer_id MEDIUMINT UNSIGNED NOT NULL,
  type TINYINT NOT NULL,
  address_street1 VARCHAR(100) NOT NULL,
  address_street2 VARCHAR(100) NOT NULL,
  city VARCHAR(40) NOT NULL,
  state CHAR(2) NOT NULL,
  zip CHAR(5) NOT NULL,
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(fs_address_id),
  INDEX ind_customer_id(fs_customer_id),
  CONSTRAINT fk_customer_id FOREIGN KEY (fs_customer_id) REFERENCES fs_customers(fs_customer_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO fs_addresses(fs_customer_id, type, address_street1, address_street2, city, state, zip) VALUES
  ('FROM LOGGED IN USER INFO'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM');

DELETE from fs_addresses WHERE fs_address_id = 'FROM SELECTED PHP ELEMENT (RADIO)';

CREATE TABLE fs_address_types (
  fs_address_type_id TINYINT NOT NULL AUTO_INCREMENT,
  type VARCHAR(9) NOT NULL,
  PRIMARY KEY(fs_address_type_id)
)ENGINE = InnoDB;

INSERT INTO fs_address_types(type) VALUES
  ('business'),
  ('home'),
  ('apartment');

CREATE TABLE fs_credit_cards (
  fs_credit_card_id MEDIUMINT NOT NULL AUTO_INCREMENT,
  fs_customer_id MEDIUMINT UNSIGNED NOT NULL,
  fs_address_id MEDIUMINT NOT NULL,
  fs_credit_card_type_id TINYINT NOT NULL,
  credit_card_number CHAR(16) NOT NULL,
  exp_month CHAR(2) NOT NULL,
  exp_year CHAR(2) NOT NULL,
  PRIMARY KEY(fs_credit_card_id),
  INDEX ind_customer_id(fs_customer_id),
  CONSTRAINT fk_customer_cc_id FOREIGN KEY (fs_customer_id) REFERENCES fs_customers(fs_customer_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO fs_credit_cards(fs_customer_id, fs_address_id, fs_credit_card_type_id, credit_card_number, exp_month, exp_year) VALUES
  ('LOGGED IN USER INFO'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM');

DELETE from fs_credit_cards WHERE fs_credit_card_id = 'FROM SELECTED PHP ELEMENT (RADIO)';

CREATE TABLE fs_credit_card_types (
  fs_credit_card_type_id TINYINT NOT NULL AUTO_INCREMENT,
  card_type VARCHAR(10) NOT NULL,
  PRIMARY KEY(fs_credit_card_type_id)
)ENGINE = InnoDB;

INSERT INTO fs_credit_card_types(card_type) VALUES
  ('Visa'),
  ('MasterCard'),
  ('American Express'),
  ('Discover');

CREATE TABLE fs_carts (
  fs_case_id MEDIUMINT NOT NULL AUTO_INCREMENT,
  fs_cart_id MEDIUMINT NOT NULL,
  fs_customer_id MEDIUMINT UNSIGNED NOT NULL,
  fs_clothing_id MEDIUMINT NOT NULL,
  fs_clothing_size_id TINYINT NOT NULL,
  fs_clothing_color_id TINYINT NOT NULL,
  fs_clothing_price_id DOUBLE(5,2) NOT NULL,
  quantity TINYINT NOT NULL,
  date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(fs_case_id),
  INDEX ind_customer_id(fs_customer_id),
  CONSTRAINT fk_customer_cart_id FOREIGN KEY (fs_customer_id) REFERENCES fs_customers(fs_customer_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO fs_carts(fs_card_id, fs_customer_id, fs_clothing_id, fs_clothing_size_id, fs_clothing_color_id, fs_clothing_price_id, quantity) VALUES
  ('STATIC VALUE PER USER SESSION, WILL CREATE A NEW CART # EACH TIME THE USER VISITS THE WEBSITE'),
  ('LOGGED IN USER INFO'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM');

DELETE from fs_carts WHERE fs_case_id = 'FROM (MULTIPLE) SELECTED ITEMS FROM CART VIEW BASED ON USER INPUT';

CREATE TABLE fs_transactions (
  fs_transaction_id MEDIUMINT NOT NULL AUTO_INCREMENT,
  fs_customer_id MEDIUMINT UNSIGNED NOT NULL,
  shipping_type_id TINYINT NOT NULL,
  shipping_cost DOUBLE(5,2) NOT NULL,
  shipping_address_id MEDIUMINT NOT NULL,
  credit_card_id MEDIUMINT NOT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(fs_transaction_id),
  INDEX ind_customer_id(fs_customer_id),
  CONSTRAINT fk_customer_trans_id FOREIGN KEY (fs_customer_id) REFERENCES fs_customers(fs_customer_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO fs_transactions(customer_id, shipping_type_id, shipping_cost, shipping_address_id, credit_card_id) VALUES
  ('LOGGED IN USER INFO'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM'),
  ('FROM PHP FORM');

CREATE TABLE fs_shipping_types (
  fs_shipping_type_id TINYINT NOT NULL AUTO_INCREMENT,
  carrier VARCHAR(5) NOT NULL,
  type VARCHAR(9) NOT NULL,
  PRIMARY KEY(fs_shipping_type_id)
)ENGINE = InnoDB;

INSERT INTO fs_shipping_types(carrier, type) VALUES
  ('UPS', 'Ground'),
  ('UPS', 'Second Day'),
  ('USPS', 'Standard'),
  ('USPS', 'Expedited'),
  ('FedEx', 'Ground'),
  ('FedEx', 'Overnight');

CREATE TABLE fs_clothing_items (
  fs_clothing_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  fs_item_id TINYINT NOT NULL,
  clothing_type_id TINYINT NOT NULL,
  clothing_title CHAR(20),
  clothing_description_id MEDIUMINT NOT NULL,
  clothing_color_id TINYINT NOT NULL,
  clothing_photo MEDIUMINT NOT NULL,
  clothing_price DOUBLE(5,2) NOT NULL,
  clothing_sale_price DOUBLE(5,2) NOT NULL,
  qty_xxs MEDIUMINT NOT NULL,
  qty_xs MEDIUMINT NOT NULL,
  qty_s MEDIUMINT NOT NULL,
  qty_m MEDIUMINT NOT NULL,
  qty_l MEDIUMINT NOT NULL,
  qty_xl MEDIUMINT NOT NULL,
  qty_xxl MEDIUMINT NOT NULL,
  weight DOUBLE(2,1) NOT NULL,
  date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(fs_clothing_id)
)ENGINE = InnoDB;

INSERT INTO fs_clothing_items(clothing_type_id, clothing_description_id, clothing_size_id, clothing_color_id, clothing_photo, clothing_price, clothing_stock_quantity, weight) VALUES

INSERT INTO `fs_clothing_items` (`fs_clothing_id`, `fs_item_id`, `clothing_type_id`, `clothing_title`, `clothing_description_id`, `clothing_color_id`, `clothing_photo`, `clothing_price`, `clothing_sale_price`, `qty_xxs`, `qty_xs`, `qty_s`, `qty_m`, `qty_l`, `qty_xl`, `qty_xxl`, `weight`, `date_added`) VALUES
/* Coat 01 */
/* Black */
('', '1', '1', 'Long Winter Coat', '2', '9', '1', '120', '120', '20', '20', '20', '20', '20', '20', '20', '1.6', CURRENT_TIMESTAMP),
/* Green */
('', '1', '1', 'Long Winter Coat', '2', '11', '3', '120', '120', '20', '20', '20', '20', '20', '20', '20', '1.6', CURRENT_TIMESTAMP),
/* Grey */
('', '1', '1', 'Long Winter Coat', '2', '13', '4', '120', '120', '20', '20', '20', '20', '20', '20', '20', '1.6',  CURRENT_TIMESTAMP),

/* Coat 02 */
/* Black */
('', '2', '1', 'Short Winter Coat', '3', '9', '5', '145', '145', '20', '20', '20', '20', '20', '20', '20', '1.7', CURRENT_TIMESTAMP),
/* Blue */
('', '2', '1', 'Short Winter Coat', '3', '11', '6', '145', '145', '20', '20', '20', '20', '20', '20', '20', '1.7', CURRENT_TIMESTAMP),
/* Green */
('', '2', '1', 'Short Winter Coat', '3', '11', '7', '145', '145', '20', '20', '20', '20', '20', '20', '20', '1.7', CURRENT_TIMESTAMP),
/* Grey */
('', '2', '1', 'Short Winter Coat', '3', '13', '8', '145', '145', '20', '20', '20', '20', '20', '20', '20', '1.7', CURRENT_TIMESTAMP),
/* Red */
('', '2', '1', 'Short Winter Coat', '3', '13', '9', '145', '145', '20', '20', '20', '20', '20', '20', '20', '1.7', CURRENT_TIMESTAMP),

/* Coat 03 */
/* Black */
('', '3', '1', 'Long Coat', '4', '9', '10', '80', '80', '20', '20', '20', '20', '20', '20', '20', '1.5', CURRENT_TIMESTAMP),
/* Blue */
('', '3', '1', 'Long Coat', '4', '11', '11', '80', '80', '20', '20', '20', '20', '20', '20', '20', '1.5', CURRENT_TIMESTAMP),
/* Green */
('', '3', '1', 'Long Coat', '4', '11', '12', '80', '80', '20', '20', '20', '20', '20', '20', '20', '1.5', CURRENT_TIMESTAMP),
/* Grey */
('', '3', '1', 'Long Coat', '4', '13', '13', '80', '80', '20', '20', '20', '20', '20', '20', '20', '1.5', CURRENT_TIMESTAMP);

/* Pants */
INSERT INTO `fs_clothing_items` (`fs_clothing_id`, `fs_item_id`, `clothing_type_id`, `clothing_title`, `clothing_description_id`, `clothing_color_id`, `clothing_photo`, `clothing_price`, `clothing_sale_price`, `qty_xxs`, `qty_xs`, `qty_s`, `qty_m`, `qty_l`, `qty_xl`, `qty_xxl`, `weight`, `date_added`) VALUES
/* Pant 01 */
/* Grey */
('', '4', '4', 'Dress Slacks', '5', '13', '14', '60', '60', '20', '20', '20', '20', '20', '20', '20', '1.0', CURRENT_TIMESTAMP),

/* Pant 02 */
/* Blue */
('', '5', '4', 'Casual Slacks', '6', '1', '15', '40', '40', '20', '20', '20', '20', '20', '20', '20', '1.1', CURRENT_TIMESTAMP),
/* Green */
('', '5', '4', 'Casual Slacks', '6', '11', '16', '40', '40', '20', '20', '20', '20', '20', '20', '20', '1.1', CURRENT_TIMESTAMP),

/* Pant 03 */
/* Blue */
('', '6', '4', 'Blue Jeans', '7', '1', '17', '50', '50', '20', '20', '20', '20', '20', '20', '20', '1.3', CURRENT_TIMESTAMP);

/* Shirts */
INSERT INTO `fs_clothing_items` (`fs_clothing_id`, `fs_item_id`, `clothing_type_id`, `clothing_title`, `clothing_description_id`, `clothing_color_id`, `clothing_photo`, `clothing_price`, `clothing_sale_price`, `qty_xxs`, `qty_xs`, `qty_s`, `qty_m`, `qty_l`, `qty_xl`, `qty_xxl`, `weight`, `date_added`) VALUES
/* Shirt 01 */
/* Blue */
('', '7', '2', 'Dress Shirt', '8', '1', '18', '40', '40', '20', '20', '20', '20', '20', '20', '20', '0.5', CURRENT_TIMESTAMP),
/* White */
('', '7', '2', 'Dress Shirt', '8', '10', '19', '40', '40', '20', '20', '20', '20', '20', '20', '20', '0.5', CURRENT_TIMESTAMP),

/* Shirt 02 */
/* Plaid Green */
('', '8', '2', 'Flannel Shirt', '9', '7', '20', '30', '30', '20', '20', '20', '20', '20', '20', '20', '0.6', CURRENT_TIMESTAMP),
/* Plaid Red */
('', '8', '2', 'Flannel Shirt', '9', '5', '21', '30', '30', '20', '20', '20', '20', '20', '20', '20', '0.6', CURRENT_TIMESTAMP),

/* Shirt 03 */
/* Black */
('', '9', '2', 'Flannel Shirt', '10', '9', '22', '30', '30', '20', '20', '20', '20', '20', '20', '20', '0.6', CURRENT_TIMESTAMP),
/* Plaid Blue */
('', '9', '2', 'Flannel Shirt', '10', '4', '23', '30', '30', '20', '20', '20', '20', '20', '20', '20', '0.6', CURRENT_TIMESTAMP),
/* Plaid Green */
('', '9', '2', 'Flannel Shirt', '10', '7', '24', '30', '30', '20', '20', '20', '20', '20', '20', '20', '0.6', CURRENT_TIMESTAMP),
/* Plaid Red */
('', '9', '2', 'Flannel Shirt', '10', '5', '25', '30', '30', '20', '20', '20', '20', '20', '20', '20', '0.6', CURRENT_TIMESTAMP),

/* Shirt 04 */
/* Black */
('', '10', '2', 'Shirt', '11', '9', '26', '40', '40', '20', '20', '20', '20', '20', '20', '20', '0.5', CURRENT_TIMESTAMP),
/* Blue */
('', '10', '2', 'Shirt', '11', '1', '27', '40', '40', '20', '20', '20', '20', '20', '20', '20', '0.5', CURRENT_TIMESTAMP),
/* Green */
('', '10', '2', 'Shirt', '11', '11', '28', '40', '40', '20', '20', '20', '20', '20', '20', '20', '0.5', CURRENT_TIMESTAMP),
/* Red */
('', '10', '2', 'Shirt', '11', '2', '29', '40', '40', '20', '20', '20', '20', '20', '20', '20', '0.5', CURRENT_TIMESTAMP),
/* White */
('', '10', '2', 'Shirt', '11', '10', '30', '40', '40', '20', '20', '20', '20', '20', '20', '20', '0.5', CURRENT_TIMESTAMP);

/* Shoes */
INSERT INTO `fs_clothing_items` (`fs_clothing_id`, `fs_item_id`, `clothing_type_id`, `clothing_title`, `clothing_description_id`, `clothing_color_id`, `clothing_photo`, `clothing_price`, `clothing_sale_price`, `qty_xxs`, `qty_xs`, `qty_s`, `qty_m`, `qty_l`, `qty_xl`, `qty_xxl`, `weight`, `date_added`) VALUES
/* Shoes 01 */
/* Plaid Blue */
('', '11', '6', 'Slippers', '12', '4', '31', '20', '20', '20', '20', '20', '20', '20', '20', '20', '0.5', CURRENT_TIMESTAMP),
/* Plaid Green */
('', '11', '6', 'Slippers', '12', '7', '32', '20', '20', '20', '20', '20', '20', '20', '20', '20', '0.5', CURRENT_TIMESTAMP),
/* Plaid Red */
('', '11', '6', 'Slippers', '12', '5', '33', '20', '20', '20', '20', '20', '20', '20', '20', '20', '0.5', CURRENT_TIMESTAMP),
/* Plaid Yellow */
('', '11', '6', 'Slippers', '12', '6', '34', '20', '20', '20', '20', '20', '20', '20', '20', '20', '0.5', CURRENT_TIMESTAMP);

/* Socks */
INSERT INTO `fs_clothing_items` (`fs_clothing_id`, `fs_item_id`, `clothing_type_id`, `clothing_title`, `clothing_description_id`, `clothing_color_id`, `clothing_photo`, `clothing_price`, `clothing_sale_price`, `qty_xxs`, `qty_xs`, `qty_s`, `qty_m`, `qty_l`, `qty_xl`, `qty_xxl`, `weight`, `date_added`) VALUES
/* Socks 01 */
/* Blue */
('', '12', '5', 'Socks', '13', '1', '35', '8', '8', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Brown */
('', '12', '5', 'Socks', '13', '8', '36', '8', '8', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Blue */
('', '12', '5', 'Socks', '13', '13', '37', '8', '8', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Blue */
('', '12', '5', 'Socks', '13', '2', '38', '8', '8', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Blue */
('', '12', '5', 'Socks', '13', '10', '39', '8', '8', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),

/* Socks 02 */
/* Black */
('', '13', '5', 'Patterned Socks', '14', '9', '40', '12', '12', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Black */
('', '13', '5', 'Patterned Socks', '14', '13', '41', '12', '12', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP);

/* T-Shirts */
INSERT INTO `fs_clothing_items` (`fs_clothing_id`, `fs_item_id`, `clothing_type_id`, `clothing_title`, `clothing_description_id`, `clothing_color_id`, `clothing_photo`, `clothing_price`, `clothing_sale_price`, `qty_xxs`, `qty_xs`, `qty_s`, `qty_m`, `qty_l`, `qty_xl`, `qty_xxl`, `weight`, `date_added`) VALUES
/* T-Shirt 01 */
/* Black */
('', '14', '3', 'T-Shirt', '15', '9', '42', '18', '18', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Blue */
('', '14', '3', 'T-Shirt', '15', '1', '43', '18', '18', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Green */
('', '14', '3', 'T-Shirt', '15', '11', '44', '18', '18', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Red */
('', '14', '3', 'T-Shirt', '15', '2', '45', '18', '18', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* White */
('', '14', '3', 'T-Shirt', '15', '10', '46', '18', '18', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),

/* T-Shirt 02 */
/* Red */
('', '15', '3', 'Polo Shirt', '16', '2', '47', '25', '25', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* White */
('', '15', '3', 'Polo Shirt', '16', '10', '48', '25', '25', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP);

/* Accessories */
INSERT INTO `fs_clothing_items` (`fs_clothing_id`, `fs_item_id`, `clothing_type_id`, `clothing_title`, `clothing_description_id`, `clothing_color_id`, `clothing_photo`, `clothing_price`, `clothing_sale_price`, `qty_xxs`, `qty_xs`, `qty_s`, `qty_m`, `qty_l`, `qty_xl`, `qty_xxl`, `weight`, `date_added`) VALUES
/* Accessories 01 */
/* Black */
('', '16', '7', 'Hat', '17', '9', '49', '15', '15', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Red */
('', '16', '7', 'Hat', '17', '2', '50', '15', '15', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Yellow */
('', '16', '7', 'Hat', '17', '3', '51', '15', '15', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),

/* Accessories 02 */
/* Black */
('', '17', '7', 'Gloves', '18', '9', '52', '10', '10', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Green */
('', '17', '7', 'Gloves', '18', '11', '53', '10', '10', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),

/* Accessories 03 */
/* Black */
('', '18', '7', 'Belt', '19', '9', '54', '15', '15', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP),
/* Brown */
('', '18', '7', 'Belt', '19', '8', '55', '15', '15', '20', '20', '20', '20', '20', '20', '20', '0.2', CURRENT_TIMESTAMP);


DELETE from fs_clothing_items WHERE fs_clothing_id = 'FROM SELECTED PHP ELEMENT (DROPDOWN OR DELETE BUTTON VISIBLE TO ADMINS)';

CREATE TABLE fs_clothing_types (
  fs_clothing_type_id TINYINT NOT NULL AUTO_INCREMENT,
  item_type VARCHAR(9) NOT NULL,
  PRIMARY KEY(fs_clothing_type_id)
)ENGINE = InnoDB;

INSERT INTO fs_clothing_types(item_type) VALUES
  ('coat'),
  ('shirt'),
  ('tshirt'),
  ('pant'),
  ('sock'),
  ('shoe'),
  ('accessory');

CREATE TABLE fs_clothing_descriptions (
  fs_clothing_description_id MEDIUMINT NOT NULL AUTO_INCREMENT,
  fs_clothing_type_id MEDIUMINT NOT NULL,
  description MEDIUMTEXT NOT NULL,
  PRIMARY KEY(fs_clothing_description_id)
)ENGINE = InnoDB;

INSERT INTO fs_clothing_descriptions(fs_clothing_type_id, description) VALUES
  ('FROM PHP FORM'),
  ('FROM PHP FORM');

DELETE from fs_clothing_descriptions WHERE fs_clothing_description_id = 'FROM SELECTED PHP ELEMENT (DROPDOWN OR DELETE BUTTON VISIBLE TO ADMINS)';

CREATE TABLE fs_clothing_sizes (
  fs_clothing_size_id TINYINT NOT NULL AUTO_INCREMENT,
  size VARCHAR(8) NOT NULL,
  PRIMARY KEY(fs_clothing_size_id)
)ENGINE = InnoDB;

INSERT INTO fs_clothing_sizes(size) VALUES
  ('XX-Small'),
  ('X-Small'),
  ('Small'),
  ('Medium'),
  ('Large'),
  ('X-Large'),
  ('XX-Large');

CREATE TABLE fs_clothing_colors (
  fs_clothing_color_id TINYINT NOT NULL AUTO_INCREMENT,
  color VARCHAR(12) NOT NULL,
  PRIMARY KEY(fs_clothing_color_id)
)ENGINE = InnoDB;

INSERT INTO fs_clothing_colors(color) VALUES
  ('blue'),
  ('red'),
  ('yellow'),
  ('plaid_blue'),
  ('plaid_red'),
  ('plaid_yellow'),
  ('plaid_green'),
  ('brown'),
  ('black'),
  ('white');

CREATE TABLE fs_clothing_sales (
  fs_sale_id MEDIUMINT NOT NULL AUTO_INCREMENT,
  fs_clothing_id MEDIUMINT NOT NULL,
  sale_price DOUBLE(5,2) NOT NULL,
  open_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  close_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(fs_sale_id)
)ENGINE = InnoDB;

INSERT INTO fs_clothing_sales(fs_clothing_id, sale_price) VALUES
  ('FROM PHP FORM'),
  ('FROM PHP FORM');

DELETE from fs_clothing_sales WHERE fs_sale_id = 'FROM PHP DROPDOWN SELECTION MADE BY ADMIN';
