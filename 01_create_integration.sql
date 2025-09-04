-- Set role, warehouse, database, and schema
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE compute_wh;
USE DATABASE mydb;
USE SCHEMA myschema;

-- Create storage integration for S3
CREATE OR REPLACE STORAGE INTEGRATION S3_int
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::293595299677:role/Stg_S3'
STORAGE_ALLOWED_LOCATIONS = ('s3://explore555/');

-- Check integration details
DESC INTEGRATION S3_int;

-- Create stage linked to S3 bucket
CREATE OR REPLACE STAGE my_s3_stage
URL = 's3://explore555/'
STORAGE_INTEGRATION = S3_int;

-- Create CSV file format
CREATE OR REPLACE FILE FORMAT csv_format
TYPE = 'CSV'
FIELD_DELIMITER = ','
RECORD_DELIMITER = '\n'
SKIP_HEADER = 1;
