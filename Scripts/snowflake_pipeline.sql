-- Use Role and Context
use role accountadmin;
use warehouse compute_wh;
use database mydb;
use schema myschema;

-- Create Base Table
create or replace table try002
(
    id int identity(1,1) primary key,
    name string,
    age int,
    dept string,
    salary number
);

-- Load Data from S3
create or replace storage integration S3_int
type = external_stage
storage_provider = S3
enabled = TRUE
storage_AWS_ROLE_ARN = '<YOUR_AWS_ROLE_ARN>'
storage_allowed_locations = ('s3://<YOUR_BUCKET_NAME>/');

create or replace stage my_s3_stage
url = 's3://explore555/'
storage_integration = S3_int;

create or replace file format csv_format
type = 'CSV'
field_delimiter = ','
record_delimiter = '\n'
skip_header = 1;

copy into try002
from @my_s3_stage
file_format = (format_name = csv_format);

-- Transform Data
create or replace table upload001
(
    id int identity(1,1) primary key,
    name string,
    age int,
    dept string,
    salary number,
    year_sal number
);

insert into upload001(name, age, dept, salary, year_sal)
select name, age, dept, salary, salary*12
from try002;

-- Export Back to S3
copy into @my_s3_stage/upload/
from upload001
file_format = (format_name = csv_format compression = GZIP)
overwrite = TRUE;
