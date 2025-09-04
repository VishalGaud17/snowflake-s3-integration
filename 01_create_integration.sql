-- Use the ACCOUNTADMIN role to ensure you have required privileges
USE ROLE ACCOUNTADMIN;

-- Use the compute warehouse for executing queries
USE WAREHOUSE compute_wh;

-- Select the database and schema for creating objects
USE DATABASE mydb;
USE SCHEMA myschema;

-- =========================================================
-- Step 1: Create a Storage Integration for AWS S3
-- This integration allows Snowflake to access your S3 bucket
-- using the AWS IAM Role provided below
-- =========================================================
CREATE OR REPLACE STORAGE INTEGRATION S3_int
TYPE = EXTERNAL_STAGE               -- Integration type for external storage
STORAGE_PROVIDER = S3              -- Storage provider is AWS S3
ENABLED = TRUE                     -- Enable the integration
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::293595299677:role/Stg_S3'  -- IAM Role ARN in AWS
STORAGE_ALLOWED_LOCATIONS = ('s3://explore555/');  -- Limit access to this bucket only

-- Check integration details such as IAM user ARN and External ID
DESC INTEGRATION S3_int;

-- =========================================================
-- Step 2: Create an External Stage
-- This stage connects Snowflake to your S3 bucket using the integration
-- =========================================================
CREATE OR REPLACE STAGE my_s3_stage
URL = 's3://explore555/'           -- The S3 bucket URL
STORAGE_INTEGRATION = S3_int;      -- Use the storage integration created above

-- =========================================================
-- Step 3: Create a File Format for CSV
-- This defines how the CSV file will be read during data load
-- =========================================================
CREATE OR REPLACE FILE FORMAT csv_format
TYPE = 'CSV'                       -- File type is CSV
FIELD_DELIMITER = ','              -- Columns are separated by comma
RECORD_DELIMITER = '\n'            -- Each row ends with a newline
SKIP_HEADER = 1;                   -- Skip the first header row
