
CREATE TABLE p_brands (
                Column_brand_id VARCHAR NOT NULL,
                brad_name VARCHAR NOT NULL,
                CONSTRAINT p_brands_pk PRIMARY KEY (Column_brand_id)
)

CREATE TABLE p_categories (
                categories_id VARCHAR NOT NULL,
                categoria_name VARCHAR NOT NULL,
                CONSTRAINT p_categories_pk PRIMARY KEY (categories_id)
)

CREATE TABLE p_products (
                products_id VARCHAR NOT NULL,
                product_name VARCHAR NOT NULL,
                Column_brand_id VARCHAR NOT NULL,
                categories_id VARCHAR NOT NULL,
                model_year VARCHAR NOT NULL,
                list_prince VARCHAR NOT NULL,
                CONSTRAINT p_products_pk PRIMARY KEY (products_id)
)

CREATE TABLE d_stores (
                store_id VARCHAR NOT NULL,
                store_name VARCHAR NOT NULL,
                phone VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                street VARCHAR NOT NULL,
                city VARCHAR NOT NULL,
                state VARCHAR NOT NULL,
                zip_code VARCHAR NOT NULL,
                CONSTRAINT d_stores_pk PRIMARY KEY (store_id)
)

CREATE TABLE p_stocks (
                store_id VARCHAR NOT NULL,
                products_id VARCHAR NOT NULL,
                quantity VARCHAR NOT NULL,
                CONSTRAINT p_stocks_pk PRIMARY KEY (store_id)
)

CREATE TABLE d_staffs (
                staff_id VARCHAR NOT NULL,
                fist_name VARCHAR NOT NULL,
                last_name VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                phone VARCHAR NOT NULL,
                active VARCHAR NOT NULL,
                store_id VARCHAR NOT NULL,
                manager_id VARCHAR NOT NULL,
                CONSTRAINT d_staffs_pk PRIMARY KEY (staff_id)
)

CREATE TABLE d_customers (
                customers_id VARCHAR NOT NULL,
                firest_name VARCHAR(20) NOT NULL,
                iast_name VARCHAR(20) NOT NULL,
                phone VARCHAR(11) NOT NULL,
                email VARCHAR(40) NOT NULL,
                streel VARCHAR(55) NOT NULL,
                city VARCHAR(44) NOT NULL,
                state VARCHAR NOT NULL,
                zip_code VARCHAR NOT NULL,
                CONSTRAINT Customers_id_pk PRIMARY KEY (customers_id)
)

CREATE TABLE f_orders (
                order_id VARCHAR(20) NOT NULL,
                customers_id VARCHAR NOT NULL,
                order_status VARCHAR NOT NULL,
                order_date VARCHAR NOT NULL,
                request_date VARCHAR NOT NULL,
                shipping_date VARCHAR NOT NULL,
                store_id VARCHAR NOT NULL,
                staff_id VARCHAR NOT NULL,
                CONSTRAINT f_orders_pk PRIMARY KEY (order_id)
)

CREATE TABLE d_order_items (
                item_id VARCHAR NOT NULL,
                f_orders_order_id VARCHAR(20) NOT NULL,
                products_id VARCHAR NOT NULL,
                quantity VARCHAR NOT NULL,
                list_price VARCHAR NOT NULL,
                discount VARCHAR NOT NULL,
                CONSTRAINT d_order_items_pk PRIMARY KEY (item_id, f_orders_order_id)
)

ALTER TABLE p_products ADD CONSTRAINT p_brands_p_products_fk
FOREIGN KEY (Column_*brand_id)
REFERENCES p_brands (Column_*brand_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE p_products ADD CONSTRAINT p_categories_p_products_fk
FOREIGN KEY (categories_id)
REFERENCES p_categories (categories_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE p_stocks ADD CONSTRAINT p_products_p_stocks_fk
FOREIGN KEY (products_id)
REFERENCES p_products (products_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE d_order_items ADD CONSTRAINT p_products_d_order_items_fk
FOREIGN KEY (products_id)
REFERENCES p_products (products_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE f_orders ADD CONSTRAINT d_stores_f_orders_fk
FOREIGN KEY (store_id)
REFERENCES d_stores (store_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE p_stocks ADD CONSTRAINT d_stores_p_stocks_fk
FOREIGN KEY (store_id)
REFERENCES d_stores (store_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE f_orders ADD CONSTRAINT d_staffs_f_orders_fk
FOREIGN KEY (staff_id)
REFERENCES d_staffs (staff_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE f_orders ADD CONSTRAINT d_customers_f_orders_fk
FOREIGN KEY (customers_id)
REFERENCES d_customers (customers_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE d_order_items ADD CONSTRAINT f_orders_d_order_items_fk
FOREIGN KEY (f_orders_order_id)
REFERENCES f_orders (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION