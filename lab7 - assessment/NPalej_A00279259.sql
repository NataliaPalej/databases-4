/********************************************************
* This script creates the database named DB4_Music_2024 
*********************************************************/

DROP DATABASE IF EXISTS DB4_Music_2024;
CREATE DATABASE DB4_Music_2024;
USE DB4_Music_2024;

-- create the tables for the database
CREATE TABLE categories (
  category_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  category_name      VARCHAR(255)   NOT NULL      UNIQUE
);



CREATE TABLE products (
  product_id         INT            PRIMARY KEY   AUTO_INCREMENT,
  category_id        INT            NOT NULL,
  product_code       VARCHAR(10)    NOT NULL      UNIQUE,
  product_name       VARCHAR(255)   NOT NULL,
  description        TEXT           NOT NULL,
  list_price         DECIMAL(10,2)  NOT NULL,
  discount_percent   DECIMAL(10,2)  NOT NULL      DEFAULT 0.00,
  date_added         DATETIME       DEFAULT NULL,
  CONSTRAINT products_fk_categories
    FOREIGN KEY (category_id)
    REFERENCES categories (category_id)
);



CREATE TABLE customers (
  customer_id           INT            PRIMARY KEY   AUTO_INCREMENT,
  email_address         VARCHAR(255)   NOT NULL      UNIQUE,
  first_name            VARCHAR(60)    NOT NULL,
  last_name             VARCHAR(60)    NOT NULL
  );



CREATE TABLE orders (
  order_id           INT            PRIMARY KEY  AUTO_INCREMENT,
  customer_id        INT            NOT NULL,
  order_date         DATETIME       NOT NULL,
  ship_amount        DECIMAL(10,2)  NOT NULL,
  tax_amount         DECIMAL(10,2)  NOT NULL,
  ship_date          DATETIME                    DEFAULT NULL,
  card_type          VARCHAR(50)    NOT NULL,
  card_number        CHAR(16)       NOT NULL,
  card_expires       CHAR(7)        NOT NULL,
    CONSTRAINT orders_fk_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id)
);



CREATE TABLE order_items (
  item_id            INT            PRIMARY KEY  AUTO_INCREMENT,
  order_id           INT            NOT NULL,
  product_id         INT            NOT NULL,
  item_price         DECIMAL(10,2)  NOT NULL,
  discount_amount    DECIMAL(10,2)  NOT NULL,
  quantity           INT            NOT NULL,
  CONSTRAINT items_fk_orders
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id), 
  CONSTRAINT items_fk_products
    FOREIGN KEY (product_id)
    REFERENCES products (product_id)
);

-- Insert data into the tables
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Guitars'),
(2, 'Basses'),
(3, 'Drums'), 
(4, 'Keyboards');
select * from categories;

INSERT INTO products (product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added) VALUES
(1, 1, 'strat', 'Fender Stratocaster', 'The Fender Stratocaster is the electric guitar design that changed the world. New features include a tinted neck, parchment pickguard and control knobs, and a ''70s-style logo. Includes select alder body, 21-fret maple neck with your choice of a rosewood or maple fretboard, 3 single-coil pickups, vintage-style tremolo, and die-cast tuning keys. This guitar features a thicker bridge block for increased sustain and a more stable point of contact with the strings. At this low price, why play anything but the real thing?\r\n\r\nFeatures:\r\n\r\n* New features:\r\n* Thicker bridge block\r\n* 3-ply parchment pick guard\r\n* Tinted neck', '699.00', '30.00', '2011-10-30 09:32:40'),
(2, 1, 'les_paul', 'Gibson Les Paul', 'This Les Paul guitar offers a carved top and humbucking pickups. It has a simple yet elegant design. Cutting-yet-rich tone?the hallmark of the Les Paul?pours out of the 490R and 498T Alnico II magnet humbucker pickups, which are mounted on a carved maple top with a mahogany back. The faded finish models are equipped with BurstBucker Pro pickups and a mahogany top. This guitar includes a Gibson hardshell case (Faded and satin finish models come with a gig bag) and a limited lifetime warranty.\r\n\r\nFeatures:\r\n\r\n* Carved maple top and mahogany back (Mahogany top on faded finish models)\r\n* Mahogany neck, ''59 Rounded Les Paul\r\n* Rosewood fingerboard (Ebony on Alpine white)\r\n* Tune-O-Matic bridge with stopbar\r\n* Chrome or gold hardware\r\n* 490R and 498T Alnico 2 magnet humbucker pickups (BurstBucker Pro on faded finish models)\r\n* 2 volume and 2 tone knobs, 3-way switch', '1199.00', '30.00', '2011-12-05 16:33:13'),
(3, 1, 'sg', 'Gibson SG', 'This Gibson SG electric guitar takes the best of the ''62 original and adds the longer and sturdier neck joint of the late ''60s models. All the classic features you''d expect from a historic guitar. Hot humbuckers go from rich, sweet lightning to warm, tingling waves of sustain. A silky-fast rosewood fretboard plays like a dream. The original-style beveled mahogany body looks like a million bucks. Plus, Tune-O-Matic bridge and chrome hardware. Limited lifetime warranty. Includes hardshell case.\r\n\r\nFeatures:\r\n\r\n* Double-cutaway beveled mahogany body\r\n* Set mahogany neck with rounded ''50s profile\r\n* Bound rosewood fingerboard with trapezoid inlays\r\n* Tune-O-Matic bridge with stopbar tailpiece\r\n* Chrome hardware\r\n* 490R humbucker in the neck position\r\n* 498T humbucker in the bridge position\r\n* 2 volume knobs, 2 tone knobs, 3-way switch\r\n* 24-3/4" scale', '2517.00', '52.00', '2012-02-04 11:04:31'),
(4, 1, 'fg700s', 'Yamaha FG700S', 'The Yamaha FG700S solid top acoustic guitar has the ultimate combo for projection and pure tone. The expertly braced spruce top speaks clearly atop the rosewood body. It has a rosewood fingerboard, rosewood bridge, die-cast tuners, body and neck binding, and a tortoise pickguard.\r\n\r\nFeatures:\r\n\r\n* Solid Sitka spruce top\r\n* Rosewood back and sides\r\n* Rosewood fingerboard\r\n* Rosewood bridge\r\n* White/black body and neck binding\r\n* Die-cast tuners\r\n* Tortoise pickguard\r\n* Limited lifetime warranty', '489.99', '38.00', '2012-06-01 11:12:59'),
(5, 1, 'washburn', 'Washburn D10S', 'The Washburn D10S acoustic guitar is superbly crafted with a solid spruce top and mahogany back and sides for exceptional tone. A mahogany neck and rosewood fingerboard make fretwork a breeze, while chrome Grover-style machines keep you perfectly tuned. The Washburn D10S comes with a limited lifetime warranty.\r\n\r\nFeatures:\r\n\r\n    * Spruce top\r\n    * Mahogany back, sides\r\n    * Mahogany neck Rosewood fingerboard\r\n    * Chrome Grover-style machines', '299.00', '0.00', '2012-07-30 13:58:35'),
(6, 1, 'rodriguez', 'Rodriguez Caballero 11', 'Featuring a carefully chosen, solid Canadian cedar top and laminated bubinga back and sides, the Caballero 11 classical guitar is a beauty to behold and play. The headstock and fretboard are of Indian rosewood. Nickel-plated tuners and Silver-plated frets are installed to last a lifetime. The body binding and wood rosette are exquisite.\r\n\r\nThe Rodriguez Guitar is hand crafted and glued to create precise balances. From the invisible careful sanding, even inside the body, that ensures the finished instrument''s purity of tone, to the beautifully unique rosette inlays around the soundhole and on the back of the neck, each guitar is a credit to its luthier and worthy of being handed down from one generation to another.\r\n\r\nThe tone, resonance and beauty of fine guitars are all dependent upon the wood from which they are made. The wood used in the construction of Rodriguez guitars is carefully chosen and aged to guarantee the highest quality. No wood is purchased before the tree has been cut down, and at least 2 years must elapse before the tree is turned into lumber. The wood has to be well cut from the log. The grain must be close and absolutely vertical. The shop is totally free from humidity.', '415.00', '39.00', '2012-07-30 14:12:41'),
(7, 2, 'precision', 'Fender Precision', 'The Fender Precision bass guitar delivers the sound, look, and feel today''s bass players demand. This bass features that classic P-Bass old-school design. Each Precision bass boasts contemporary features and refinements that make it an excellent value. Featuring an alder body and a split single-coil pickup, this classic electric bass guitar lives up to its Fender legacy.\r\n\r\nFeatures:\r\n\r\n* Body: Alder\r\n* Neck: Maple, modern C shape, tinted satin urethane finish\r\n* Fingerboard: Rosewood or maple (depending on color)\r\n* 9-1/2" Radius (241 mm)\r\n* Frets: 20 Medium-jumbo frets\r\n* Pickups: 1 Standard Precision Bass split single-coil pickup (Mid)\r\n* Controls: Volume, Tone\r\n* Bridge: Standard vintage style with single groove saddles\r\n* Machine heads: Standard\r\n* Hardware: Chrome\r\n* Pickguard: 3-Ply Parchment\r\n* Scale Length: 34" (864 mm)\r\n* Width at Nut: 1-5/8" (41.3 mm)\r\n* Unique features: Knurled chrome P Bass knobs, Fender transition logo', '799.99', '30.00', '2012-06-01 11:29:35'),
(8, 2, 'hofner', 'Hofner Icon', 'With authentic details inspired by the original, the Hofner Icon makes the legendary violin bass available to the rest of us. Don''t get the idea that this a just a "nowhere man" look-alike. This quality instrument features a real spruce top and beautiful flamed maple back and sides. The semi-hollow body and set neck will give you the warm, round tone you expect from the violin bass.\r\n\r\nFeatures:\r\n\r\n* Authentic details inspired by the original\r\n* Spruce top\r\n* Flamed maple back and sides\r\n* Set neck\r\n* Rosewood fretboard\r\n* 30" scale\r\n* 22 frets\r\n* Dot inlay', '499.99', '25.00', '2012-07-30 14:18:33'),
(9, 3, 'ludwig', 'Ludwig 5-piece Drum Set with Cymbals', 'This product includes a Ludwig 5-piece drum set and a Zildjian starter cymbal pack.\r\n\r\nWith the Ludwig drum set, you get famous Ludwig quality. This set features a bass drum, two toms, a floor tom, and a snare?each with a wrapped finish. Drum hardware includes LA214FP bass pedal, snare stand, cymbal stand, hi-hat stand, and a throne.\r\n\r\nWith the Zildjian cymbal pack, you get a 14" crash, 18" crash/ride, and a pair of 13" hi-hats. Sound grooves and round hammer strikes in a simple circular pattern on the top surface of these cymbals magnify the basic sound of the distinctive alloy.\r\n\r\nFeatures:\r\n\r\n* Famous Ludwig quality\r\n* Wrapped finishes\r\n* 22" x 16" kick drum\r\n* 12" x 10" and 13" x 11" toms\r\n* 16" x 16" floor tom\r\n* 14" x 6-1/2" snare drum kick pedal\r\n* Snare stand\r\n* Straight cymbal stand hi-hat stand\r\n* FREE throne', '699.99', '30.00', '2012-07-30 12:46:40'),
(10, 3, 'tama', 'Tama 5-Piece Drum Set with Cymbals', 'The Tama 5-piece Drum Set is the most affordable Tama drum kit ever to incorporate so many high-end features.\r\n\r\nWith over 40 years of experience, Tama knows what drummers really want. Which is why, no matter how long you''ve been playing the drums, no matter what budget you have to work with, Tama has the set you need, want, and can afford. Every aspect of the modern drum kit was exhaustively examined and reexamined and then improved before it was accepted as part of the Tama design. Which is why, if you start playing Tama now as a beginner, you''ll still enjoy playing it when you''ve achieved pro-status. That''s how good these groundbreaking new drums are.\r\n\r\nOnly Tama comes with a complete set of genuine Meinl HCS cymbals. These high-quality brass cymbals are made in Germany and are sonically matched so they sound great together. They are even lathed for a more refined tonal character. The set includes 14" hi-hats, 16" crash cymbal, and a 20" ride cymbal.\r\n\r\nFeatures:\r\n\r\n* 100% poplar 6-ply/7.5mm shells\r\n* Precise bearing edges\r\n* 100% glued finishes\r\n* Original small lugs\r\n* Drum heads\r\n* Accu-tune bass drum hoops\r\n* Spur brackets\r\n* Tom holder\r\n* Tom brackets', '799.99', '15.00', '2012-07-30 13:14:15');
select * from products;

INSERT INTO customers (customer_id, email_address, first_name, last_name) VALUES
(1, 'allan.sherwood@yahoo.com',  'Allan', 'Sherwood' ),
(2, 'barryz@gmail.com', 'Barry', 'Zimmer'),
(3, 'christineb@solarone.com', 'Christine', 'Brown'),
(4, 'david.goldstein@hotmail.com', 'David', 'Goldstein'),
(5, 'erinv@gmail.com', 'Erin', 'Valentino'),
(6, 'frankwilson@sbcglobal.net',  'Frank Lee', 'Wilson'),
(7, 'gary_hernandez@yahoo.com',  'Gary', 'Hernandez'),
(8, 'heatheresway@mac.com',  'Heather', 'Esway');
select * from customers;

INSERT INTO orders (order_id, customer_id, order_date, ship_amount, tax_amount, ship_date, card_type, card_number, card_expires) VALUES
(1, 1, '2024-03-28 09:40:28', '5.00', '32.32', '2012-03-30 15:32:51','Visa', '4111111111111111', '04/2024'),
(2, 2, '2024-03-28 11:23:20', '5.00', '0.00', '2012-03-29 12:52:14','Visa', '4012888888881881', '08/2016'),
(3, 1, '2024-03-29 09:44:58', '10.00', '89.92', '2012-03-31 9:11:41','Visa', '4111111111111111', '04/2014'),
(4, 3, '2024-03-30 15:22:31', '5.00', '0.00', '2012-04-03 16:32:21','American Express', '378282246310005', '04/2026'),
(5, 4, '2024-03-31 05:43:11', '5.00', '0.00', '2012-04-02 14:21:12','Visa', '4111111111111111', '04/2026'),
(6, 5, '2024-03-31 18:37:22', '5.00', '0.00', NULL, 'Discover', '6011111111111117', '04/2025'),
(7, 6, '2024-04-01 23:11:12', '15.00', '0.00', '2012-04-03 10:21:35', 'MasterCard', '5555555555554444', '04/2026'),
(8, 7, '2024-04-02 11:26:38', '5.00', '0.00', NULL,'Visa', '4012888888881881', '04/2026'),
(9, 4, '2024-04-03 12:22:31', '5.00', '0.00', NULL,'Visa', '4111111111111111', '04/2026');
select * from orders;

INSERT INTO order_items (item_id, order_id, product_id, item_price, discount_amount, quantity) VALUES
(1, 1, 2, '1199.00', '359.70', 1),
(2, 2, 4, '489.99', '186.20', 1),
(3, 3, 3, '2517.00', '1308.84', 1),
(4, 3, 6, '415.00', '161.85', 1),
(5, 4, 2, '1199.00', '359.70', 2),
(6, 5, 5, '299.00', '0.00', 1),
(7, 6, 5, '299.00', '0.00', 1),
(8, 7, 1, '699.00', '209.70', 1),
(9, 7, 7, '799.99', '240.00', 1),
(10, 7, 9, '699.99', '210.00', 1),
(11, 8, 10, '799.99', '120.00', 1),
(12, 9, 1, '699.00', '209.70', 1);
select * from order_items;


# Write single SQL queries (unless additional are specified) to answer the follow questions:
-- 1. Count the number of different category_ids on the product table.	[5 marks]
select count(distinct category_id) as "CategoryCount" from products;

-- 2. List the full names of the customers who’s last_name is at least 6 letters long.	[5 marks]
select first_name, last_name from customers where length(last_name) >= 6;

-- 3. List the names of the databases on the DB Server.	[5 marks]
show databases;

-- 4. List the total list price for all the products, along with the average price and average discount percent, 
     -- highest and lowest prices. Use the alias 'Total List Price', 'Average List Price', 'Average Discount Percent', ‘H’, ‘L’	[5 marks]
select * from products; 
select sum(list_price) as "Total List Price", avg(list_price) as "Average List Price", avg(discount_percent) 
as "Average Discount Percent", max(list_price) as "H", min(list_price) as "L" from products;
     
-- 5. List the product_code and product_name for products with Cymbals as part of the description.	[5 marks]
select product_code, product_name from products where description like "%Cymbals%";

-- 6. List the first_name, last_name and email_address for all customers where the letter “a” 
   -- is the 3rd letter of their first_name.	[5 marks]
select first_name, last_name, email_address from customers where first_name like "__a%";

-- 7. Write a SELECT statement that returns the all the product_code, product_name and list_price where 
--   the price is greater than 500 and less than 2000. Sort the results in ascending order by list_price.[5 marks]
 select product_code, product_name, list_price from products where list_price between 500 and 2000 
 group by product_code order by list_price asc;
  
-- 8. Write a query to return the category_name, product_name and list_price of all products. Sort the result 	
  -- set by category_name in descending order, and then by product_name in ascending order.	[5 marks]
  select c.category_name, p.product_name, p.list_price from products p join categories c 
  order by c.category_name desc, p.product_name asc;


-- 9. Create a View called vwPriceAndDiscount to show the product_name, list_price, discount_percent, discount_amount  
   -- and discounted price for each product.
# Use the View to display the results in descending order by product name, and give the fields more 
# readable names in the output.	[10 marks]
drop view if exists vwPriceAndDiscount;
create view vwPriceAndDiscount as select product_name as "Product", list_price as "Price", discount_percent as "Discount", 
round((list_price*discount_percent)/100, 2) as "Discount Amount", list_price-round((list_price*discount_percent)/100, 2) 
as "Discounted Price" from products; 

select * from vwPriceAndDiscount order by Product desc;

-- 10.	Write a query to show product name, the total list_price and the total discount amount for each product ordered.
-- The results should show a summary of results in descending order by product name and also have user friendly field names.[5 marks]
select product_name as "Product", sum(list_price) as "TotalPrice", sum(round((list_price*discount_percent)/100, 2)) 
as "TotalDiscount" from products group by product_name order by product_name desc;

-- 11.	Write a query to show all customers email_address and also	the number of orders they have, if any.	[5 marks]
select c.email_address, count(o.order_id) as "TotalOrders" from customers c left join orders o 
on c.customer_id=o.customer_id group by c.customer_id;

-- 12.	Add a new category called ‘Kazoos’ and then describe the table structure.	[5 marks]
select * from categories;
insert into categories (category_name) values ("Kazoos");
describe categories;


-- 13.	Update the new category_name to ‘Misc’ and display the results.	[5 marks]
select * from categories;
update categories set category_name="Misc" where category_name like "Kazoos";

-- 14. Write a Stored Procedure to update the discount_percent to 99 for a specified product_id, which will be passed in as a parameter,
   --  and display the results of the updated table. 
   # Note: The skeleton code is included in Appendix A. Upload the code and show the SP being called to display the results [15 marks]
   drop procedure if exists sp_UpdateDiscountPercent;
   delimiter //
   create procedure sp_UpdateDiscountPercent(
   productID int
   )
   begin
   start transaction;
   update products set discount_percent="99" where product_id=ProductID;
   commit;
   end //
   
   delimiter ;
   select * from products where product_id=2;
   call sp_UpdateDiscountPercent(2);
   select * from products where product_id=2;


-- 15.	Write a Function to return the discounted price of any item using the product_id as an input parameter. 
-- The price should be returned as a decimal. Upload the code for the Function, the function call and results
drop function if exists fnGetDiscountedPrice;

delimiter //
create function fnGetDiscountedPrice(
productID int
)
returns decimal (9, 2)
begin
declare DiscountedPrice decimal(9,2);
select (list_price*discount_percent)/100 into DiscountedPrice from products where product_id=ProductID;
return DiscountedPrice;
end //
delimiter ;

select fnGetDiscountedPrice(1);
