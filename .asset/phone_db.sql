CREATE DATABASE phone_db;

CREATE TABLE phone_sales (
    id SERIAL PRIMARY KEY,
    phone_brand VARCHAR(255),
    phone_model VARCHAR(255),
    purchase_date DATE,
    sold_date DATE,
    cost_price NUMERIC(10, 2),
    sold_price NUMERIC(10, 2),
    profit NUMERIC(10, 2) GENERATED ALWAYS AS (sold_price - cost_price) STORED
);
