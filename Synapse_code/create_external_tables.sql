--CREATE MASTER KEY ENCRYPTION BY PASSWORD ='########' --

CREATE DATABASE SCOPED CREDENTIAL cred_himanshu
WITH
IDENTITY = 'Managed Identity'


CREATE EXTERNAL DATA SOURCE source_silver
WITH(
    LOCATION = 'https://awstorageus.blob.core.windows.net/silver',
    CREDENTIAL = cred_himanshu
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH(
    LOCATION = 'https://awstorageus.blob.core.windows.net/gold',
    CREDENTIAL = cred_himanshu
)

CREATE EXTERNAL FILE FORMAT format_parquet
WITH(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.GzipCodec'
)

CREATE EXTERNAL TABLE gold.extsales
WITH (
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS
SELECT * FROM gold.sales;

select count(*) from gold.extsales;








