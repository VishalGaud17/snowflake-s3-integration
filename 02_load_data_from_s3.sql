-- Create a table to store employee data
CREATE OR REPLACE TABLE try002 (
    id INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-increment primary key
    name STRING,                       -- Employee name
    age INT,                           -- Employee age
    dept STRING,                       -- Department name
    salary NUMBER                      -- Monthly salary
);

-- Load data from S3 stage into the table using the defined file format
COPY INTO try002
FROM @my_s3_stage
FILE_FORMAT = (FORMAT_NAME = csv_format);

-- Verify the loaded data
SELECT * FROM try002;
