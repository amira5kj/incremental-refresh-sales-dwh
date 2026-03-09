/*
===============================================================================
DDL For Silver Layer 
===============================================================================
Script Purpose:
-- Normalize and creates the tables of the silver layer
===============================================================================
*/

CREATE TABLE silver.dim_customers (
    Customer_ID    VARCHAR(50)  PRIMARY KEY,
    customer_name  VARCHAR(100),
    segment        VARCHAR(50),
    country        VARCHAR(50),
    state          VARCHAR(50),
    region         VARCHAR(50),
    city           VARCHAR(50),
    postal_code    VARCHAR(50)
);


CREATE TABLE silver.dim_products (
    product_ID     VARCHAR(100) PRIMARY KEY,
    product_name   VARCHAR(255),
    category       VARCHAR(50),
    sub_category   VARCHAR(50)
);

CREATE TABLE silver.fact_sales (
    order_ID         VARCHAR(50)   PRIMARY KEY,
    customer_number  VARCHAR(50),
    product_ID       VARCHAR(100),
    order_date       DATETIME,
    ship_date        DATETIME,
    ship_mode        VARCHAR(50),
    sales            DECIMAL(10,2),
    quantity         INT,
    discount         DECIMAL(10,2),
    profit           DECIMAL(10,2),

    CONSTRAINT FK_customer       FOREIGN KEY (customer_number) REFERENCES silver.dim_customers(Customer_ID),
    CONSTRAINT FK_product        FOREIGN KEY (product_ID)      REFERENCES silver.dim_products(product_ID)
);
