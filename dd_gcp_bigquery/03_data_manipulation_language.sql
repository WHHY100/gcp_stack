# -------------------------------------------------------------------------
# DATA MANIPULATION LANGUAGE
# -> UPDATE, INSERT, DELETE
# -------------------------------------------------------------------------

CREATE OR REPLACE TABLE DML.products(
  produkt_id int64 not null
  ,produkt_name string
  ,quantity int64
  ,price float64
);

CREATE OR REPLACE TABLE DML.orders(
  order_id int64 not null
  ,produkt_id int64 not null
  ,quantity int64
  ,price float64
);

INSERT INTO DML.products VALUES (1, 'test1', 10, 10.99);
INSERT INTO DML.products VALUES (2, 'test2', 20, 20.99);
INSERT INTO DML.products VALUES (3, 'test3', 30, 30.99);
INSERT INTO DML.products VALUES (4, 'test4', 40, 40.99);
INSERT INTO DML.products VALUES (5, 'test5', 50, 50.99);

INSERT INTO DML.orders VALUES (1, (SELECT produkt_id FROM DML.products WHERE produkt_name = 'test1'), 2, (SELECT price FROM DML.products WHERE produkt_name = 'test1'));
INSERT INTO DML.orders VALUES (2, (SELECT produkt_id FROM DML.products WHERE produkt_name = 'test2'), 2, (SELECT price FROM DML.products WHERE produkt_name = 'test2'));
INSERT INTO DML.orders VALUES (3, (SELECT produkt_id FROM DML.products WHERE produkt_name = 'test3'), 2, (SELECT price FROM DML.products WHERE produkt_name = 'test3'));
INSERT INTO DML.orders VALUES (4, (SELECT produkt_id FROM DML.products WHERE produkt_name = 'test4'), 2, (SELECT price FROM DML.products WHERE produkt_name = 'test4'));
INSERT INTO DML.orders VALUES (5, (SELECT produkt_id FROM DML.products WHERE produkt_name = 'test5'), 2, (SELECT price FROM DML.products WHERE produkt_name = 'test5'));

# -------------------------------------------------------------------------
# DELETE
# -------------------------------------------------------------------------

DELETE FROM DML.orders where order_id = 5;
DELETE FROM DML.orders where produkt_id in (select produkt_id FROM DML.products WHERE price <= 30);

# -------------------------------------------------------------------------
# UPDATE
# -------------------------------------------------------------------------

UPDATE DML.products SET price = 100 WHERE produkt_name = 'test1';
UPDATE DML.products SET quantity = 100 WHERE produkt_name = 'test1';



