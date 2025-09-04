# Snowflake S3 Integration Project

This project demonstrates how to integrate **Snowflake** with **AWS S3** for seamless data loading and unloading.

---

## ✅ Features
- Create **Snowflake storage integration** for S3.
- Load CSV files from S3 into Snowflake tables.
- Perform data transformation in Snowflake.
- Export transformed data back to S3.

---

## 🛠️ Technologies Used
- **Snowflake** (Data Warehouse)
- **AWS S3** (Cloud Storage)
- **SQL**

---

## 📌 Steps Overview
1. **Setup Environment**
   - Set role, warehouse, database, and schema in Snowflake.

2. **Create Storage Integration**
   - Define storage integration for S3 with `STORAGE_AWS_ROLE_ARN` and allowed locations.

3. **Create Stage**
   - Create a Snowflake stage linked to your S3 bucket.

4. **Create File Format**
   - Define CSV file properties for loading data.

5. **Load Data from S3**
   - Use `COPY INTO` to load CSV files from S3 into a Snowflake table.

6. **Transform Data**
   - Perform calculations and create new tables with derived columns.

7. **Unload Data to S3**
   - Export processed data back to S3 in compressed format.

---

## ▶️ How It Works
- **AWS IAM Role**: Grant Snowflake `sts:AssumeRole` permissions for S3 access.
- **Snowflake Stage**: Acts as a pointer to your S3 bucket.
- **File Format**: Tells Snowflake how to read the files.
- **Copy Command**: Moves data between S3 and Snowflake.

---

## 📜 License
This project is licensed under the **MIT License**.
