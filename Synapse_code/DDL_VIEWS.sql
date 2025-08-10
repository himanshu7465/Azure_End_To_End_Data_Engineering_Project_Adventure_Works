CREATE SCHEMA gold;

CREATE VIEW gold.calender
AS
SELECT *
  FROM OPENROWSET
   (
    BULK 'https://awstorageus.blob.core.windows.net/silver/AdventureWorks_Calendar/',
    FORMAT = 'PARQUET'
   ) AS QRY1;

CREATE VIEW gold.customers
AS
SELECT *
  FROM OPENROWSET
   (
    BULK 'https://awstorageus.blob.core.windows.net/silver/AdventureWorks_Customers/',
    FORMAT = 'PARQUET'
   ) AS QRY1;

CREATE VIEW gold.product_categories
AS
SELECT *
  FROM OPENROWSET
   (
    BULK 'https://awstorageus.blob.core.windows.net/silver/AdventureWorks_ProductCategories/',
    FORMAT = 'PARQUET'
   ) AS QRY1;

CREATE VIEW gold.product_subcategories
AS
SELECT *
  FROM OPENROWSET
   (
    BULK 'https://awstorageus.blob.core.windows.net/silver/AdventureWorks_ProductSubCategories/',
    FORMAT = 'PARQUET'
   ) AS QRY1;

CREATE VIEW gold.products
AS
SELECT *
  FROM OPENROWSET
   (
    BULK 'https://awstorageus.blob.core.windows.net/silver/AdventureWorks_Products/',
    FORMAT = 'PARQUET'
   ) AS QRY1;

CREATE VIEW gold.product_return
AS
SELECT *
  FROM OPENROWSET
   (
    BULK 'https://awstorageus.blob.core.windows.net/silver/AdventureWorks_Return/',
    FORMAT = 'PARQUET'
   ) AS QRY1;

CREATE VIEW gold.sales
AS
SELECT *
  FROM OPENROWSET
   (
    BULK 'https://awstorageus.blob.core.windows.net/silver/AdventureWorks_Sales/',
    FORMAT = 'PARQUET'
   ) AS QRY1;

CREATE VIEW gold.territory
AS
SELECT *
  FROM OPENROWSET
   (
    BULK 'https://awstorageus.blob.core.windows.net/silver/AdventureWorks_Territory/',
    FORMAT = 'PARQUET'
   ) AS QRY1;
