
/* Step 2.6 Create the INVENTORY table*/
CREATE TABLE inventory(
  item_id int PRIMARY KEY,
  item_name varchar(40) NOT NULL,
  category varchar(30),
  quantity int,
  unit_cost decimal(7,2),
  received_on date  
);

/* Step 2.6 Created a view of the INVENTORY table */
CREATE VIEW inventory_view AS
    SELECT item_id, item_name, category, quantity, unit_cost, received_on
    FROM inventory;

SELECT * FROM inventory_view;

/* Step 2.7 Insert 3 records and view the table */
INSERT INTO inventory_view (item_id, item_name, category, quantity, unit_cost, received_on)
    VALUES("1", "Laser Mouse", "Peripherals", "25", "18.50", "2026-02-10");

INSERT INTO inventory_view (item_id, item_name, category, quantity, unit_cost, received_on)
    VALUES("2", "Mechanical Keyboard", "Peripherals", "12", "64.00", "2026-03-05");

INSERT INTO inventory_view (item_id, item_name, category, quantity, unit_cost, received_on)
    VALUES ("3", "USB Hub", "Accessories", "40", "22.75", "2026-04-18");

SELECT * from inventory_view;

/* Step 2.8 Select, update one record, then select again */
SELECT item_id, item_name, unit_cost FROM inventory WHERE item_id = 2;

UPDATE inventory 
SET unit_cost = 59.99
WHERE item_id = 2;

SELECT * from inventory_view;

/* Fixed a syntax error for the number type of column unit_cost */
ALTER TABLE inventory
MODIFY COLUMN unit_cost decimal(7,2);

UPDATE inventory 
SET unit_cost = 18.50
WHERE item_id = 1;

UPDATE inventory 
SET unit_cost = 22.75
WHERE item_id = 3;

SELECT * FROM inventory_view;

/* Step 2.9 Create a view and select from it */
CREATE VIEW inventory_value AS
    SELECT item_name, quantity, unit_cost, (quantity * unit_cost) AS total_value
    FROM inventory;

SELECT * FROM inventory_value ORDER BY total_value DESC;

/* Step 2.10 Copy the table, then give the copy a primary key */
CREATE TABLE inventory_copy
    Select * FROM inventory;

/* Step 2.10 Created a view */
CREATE VIEW inventory_copy_view AS
    SELECT * FROM inventory_copy;

SELECT * FROM inventory_copy_view;

/* Step 2.10 Altered inventory_copy to put back primary key */
ALTER TABLE inventory_copy ADD PRIMARY KEY (item_id);

/* Step 2.10 Testing prescence of primary key
   Result: Duplicate entry '2' for key 'inventory.PRIMARY' */
INSERT INTO inventory_view (item_id, item_name, category, quantity, unit_cost, received_on)
    VALUES("2", "Mechanical Keyboard", "Peripherals", "12", "64.00", "2026-03-05"); 

/* Step 2.11 Add a new user and view the users */

/* CREATE USER - created another account */
CREATE USER 'stockclerk'@'localhost' IDENTIFIED BY 'Stock#2026';

/* SELECT USER - allows ut to see accounts present on the server */
SELECT user, host FROM mysql.user ORDER BY user;

