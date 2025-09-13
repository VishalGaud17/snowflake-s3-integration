# Snowflake + S3 Data Pipeline

This project demonstrates how to build a **data pipeline between AWS S3 and Snowflake**.  
It covers the entire flow from **ingesting raw CSV data in S3 → loading it into Snowflake → transforming it → exporting the processed data back to S3**.

---

## Features
- Creating tables in Snowflake
- Setting up a storage integration with AWS S3
- Using stages and file formats to load CSV data
- Performing transformations (e.g., calculating yearly salary)
- Exporting processed data back to S3 in compressed (GZIP) format

---

## Steps

1. **Create a Snowflake Storage Integration** with your AWS IAM Role.  
   This allows Snowflake to securely access your S3 bucket.

2. **Create a Stage** in Snowflake pointing to your S3 bucket.  
   Stages act as a reference to where your data files are stored.

3. **Define a CSV File Format** to tell Snowflake how to parse the incoming files.

4. **Load Data into Snowflake**:  
   Copy data from S3 into the base table `try002`.

5. **Transform Data**:  
   Create a new table `upload001` where additional transformations (like yearly salary) are applied.

6. **Export Data to S3**:  
   Use Snowflake `COPY INTO` command to unload the transformed data into S3 in **GZIP-compressed CSV format**.

---

## Project Structure
  snowflake-s3-pipeline/
  ├── scripts/
   └── snowflake_pipeline.sql # SQL script with full pipeline setup
  └── README.md # Documentation

---

## Notes
- Replace `<YOUR_AWS_ROLE>` and `<YOUR_S3_BUCKET>` with your actual values in the SQL script.
- **Do not upload sensitive credentials or IAM keys** to GitHub.
- Storage Integrations in Snowflake handle credentials securely—only the IAM Role ARN needs to be referenced.

---
