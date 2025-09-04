-- Export data from upload001 table to the S3 stage in compressed CSV format
COPY INTO @my_s3_stage/upload/
FROM upload001
FILE_FORMAT = (FORMAT_NAME = csv_format COMPRESSION = GZIP)  -- Use CSV format with GZIP compression
OVERWRITE = TRUE;  -- Overwrite existing files in the target location

-- List files in the S3 stage upload folder to verify export
LIST @my_s3_stage/upload/;
