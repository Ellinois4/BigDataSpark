CREATE TABLE dim_country (
  country_id   SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL UNIQUE
);


CREATE TABLE dim_state (
  state_id     SERIAL PRIMARY KEY,
  state_name   TEXT NOT NULL,
  country_id   INT REFERENCES dim_country(country_id)
);


CREATE TABLE dim_city (
  city_id    SERIAL PRIMARY KEY,
  city_name  TEXT NOT NULL,
  state_id   INT REFERENCES dim_state(state_id)
);


CREATE TABLE dim_address (
  address_id     SERIAL PRIMARY KEY,
  address_line   TEXT,
  postal_code    TEXT,
  city_id        INT REFERENCES dim_city(city_id)
);


CREATE TABLE dim_date (
  date_id      SERIAL PRIMARY KEY,
  sale_date    DATE    UNIQUE,
  day_of_week  SMALLINT,
  day          SMALLINT,
  week         SMALLINT,
  month        SMALLINT,
  quarter      SMALLINT,
  year         SMALLINT
);


CREATE TABLE dim_category (
  category_id     SERIAL PRIMARY KEY,
  category_type   TEXT NOT NULL,  
  category_name   TEXT NOT NULL
);


CREATE TABLE dim_brand (
  brand_id    SERIAL PRIMARY KEY,
  brand_name  TEXT NOT NULL UNIQUE
);


CREATE TABLE dim_customer (
  customer_id     INT PRIMARY KEY,
  first_name      TEXT,
  last_name       TEXT,
  age             INT,
  email           TEXT,
  country_id      INT REFERENCES dim_country(country_id),
  address_id      INT REFERENCES dim_address(address_id)
);


CREATE TABLE dim_pet (
  pet_id         SERIAL PRIMARY KEY,
  customer_id    INT REFERENCES dim_customer(customer_id),
  pet_type       TEXT,
  pet_name       TEXT,
  pet_breed      TEXT,
  category_id    INT REFERENCES dim_category(category_id)
);


CREATE TABLE dim_seller (
  seller_id    INT PRIMARY KEY,
  first_name   TEXT,
  last_name    TEXT,
  email        TEXT,
  country_id   INT REFERENCES dim_country(country_id),
  address_id   INT REFERENCES dim_address(address_id)
);


CREATE TABLE dim_product (
  product_id       INT PRIMARY KEY,
  product_name     TEXT,
  brand_id         INT REFERENCES dim_brand(brand_id),
  category_id      INT REFERENCES dim_category(category_id),
  unit_price       NUMERIC(10,2),
  weight           NUMERIC,
  color            TEXT,
  size             TEXT,
  material         TEXT,
  description      TEXT,
  rating           NUMERIC(3,2),
  reviews_count    INT,
  release_date_id  INT REFERENCES dim_date(date_id),
  expiry_date_id   INT REFERENCES dim_date(date_id)
);


CREATE TABLE dim_store (
  store_id     SERIAL PRIMARY KEY,
  store_name   TEXT,
  country_id   INT REFERENCES dim_country(country_id),
  address_id   INT REFERENCES dim_address(address_id),
  phone        TEXT,
  email        TEXT
);


CREATE TABLE dim_supplier (
  supplier_id    SERIAL PRIMARY KEY,
  supplier_name  TEXT,
  contact        TEXT,
  email          TEXT,
  phone          TEXT,
  country_id     INT REFERENCES dim_country(country_id),
  address_id     INT REFERENCES dim_address(address_id)
);


CREATE TABLE fact_sales (
  sale_id           SERIAL PRIMARY KEY,
  date_id           INT  REFERENCES dim_date(date_id),
  customer_id       INT  REFERENCES dim_customer(customer_id),
  seller_id         INT  REFERENCES dim_seller(seller_id),
  product_id        INT  REFERENCES dim_product(product_id),
  store_id          INT  REFERENCES dim_store(store_id),
  supplier_id       INT  REFERENCES dim_supplier(supplier_id),
  sale_quantity     INT,
  sale_total_price  NUMERIC(12,2)
);
