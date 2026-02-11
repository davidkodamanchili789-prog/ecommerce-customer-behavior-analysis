CREATE DATABASE IF NOT EXISTS ecommerce_project;
USE ecommerce_project;

DROP TABLE IF EXISTS ecommerce_staging;

CREATE TABLE ecommerce_staging (
    Order_ID VARCHAR(255),
    Customer_ID VARCHAR(255),
    Order_Date VARCHAR(255),
    Age VARCHAR(255),
    Gender VARCHAR(255),
    City VARCHAR(255),
    Product_Category VARCHAR(255),
    Unit_Price VARCHAR(255),
    Quantity VARCHAR(255),
    Discount_Amount VARCHAR(255),
    Total_Amount VARCHAR(255),
    Payment_Method VARCHAR(255),
    Device_Type VARCHAR(255),
    Session_Duration_Minutes VARCHAR(255),
    Pages_Viewed VARCHAR(255),
    Is_Returning_Customer VARCHAR(255),
    Delivery_Time_Days VARCHAR(255),
    Customer_Rating VARCHAR(255)
);
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/ecommerce_customer_behavior_dataset_v2.csv'
INTO TABLE ecommerce_staging
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

USE ecommerce_project;

-- Create the final clean table with optimized data types
CREATE TABLE ecommerce_final AS
SELECT 
    Order_ID,
    Customer_ID,
    STR_TO_DATE(Order_Date, '%Y-%m-%d') AS Order_Date,
    CAST(Age AS UNSIGNED) AS Age,
    Gender,
    City,
    Product_Category,
    CAST(Total_Amount AS DECIMAL(10,2)) AS Total_Amount,
    CAST(Session_Duration_Minutes AS UNSIGNED) AS Session_Duration,
    CAST(Pages_Viewed AS UNSIGNED) AS Pages_Viewed,
    CASE WHEN Is_Returning_Customer = 'True' THEN 1 ELSE 0 END AS Is_Returning,
    CAST(Customer_Rating AS UNSIGNED) AS Rating
FROM ecommerce_staging;

SELECT 
    CASE WHEN Pages_Viewed > 12 THEN 'High Intent (Deep Browse)' 
         ELSE 'Standard Intent' END AS User_Segment,
    COUNT(*) AS Total_Purchases,
    ROUND(AVG(Total_Amount), 2) AS Avg_Order_Value
FROM ecommerce_final
GROUP BY User_Segment;

SELECT 
    p1.Product_Category AS Purchased_Category, 
    p2.Product_Category AS Recommended_Category, 
    COUNT(*) AS Correlation_Strength
FROM ecommerce_final p1
JOIN ecommerce_final p2 ON p1.Customer_ID = p2.Customer_ID 
    AND p1.Product_Category <> p2.Product_Category
GROUP BY 1, 2
ORDER BY Correlation_Strength DESC
LIMIT 5;

SELECT 
    ROUND(AVG(Total_Amount), 2) AS Overall_AOV,
    ROUND(MAX(Total_Amount), 2) AS Highest_Transaction,
    COUNT(DISTINCT Customer_ID) AS Total_Unique_Customers
FROM ecommerce_final;

SELECT 
    CASE WHEN Session_Duration > 15 THEN 'Long Session' ELSE 'Short Session' END AS Session_Type,
    ROUND(AVG(Pages_Viewed), 1) AS Avg_Pages,
    ROUND(AVG(Total_Amount), 2) AS Avg_Revenue
FROM ecommerce_final
GROUP BY Session_Type;

