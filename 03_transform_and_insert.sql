-- Create a new table with an extra column for yearly salary
CREATE OR REPLACE TABLE upload001 (
    id INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-increment primary key
    name STRING,                        -- Employee name
    age INT,                            -- Employee age
    dept STRING,                        -- Department name
    salary NUMBER,                      -- Monthly salary
    year_sal NUMBER                     -- Yearly salary
);

-- Insert data from try002 and calculate yearly salary
INSERT INTO upload001 (name, age, dept, salary, year_sal)
SELECT name, age, dept, salary, salary * 12
FROM try002;

-- Verify the data in the new table
SELECT * FROM upload001;
