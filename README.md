Zepto Product Data Analysis (SQL + Power BI)

An end-to-end data analysis project on Zepto (quick-commerce) product listings. I cleaned the raw data in MySQL, answered business questions with SQL queries, and built a Power BI report from the cleaned data.

Dataset
Source: [add dataset name / link here]
Size: 3,732 product records across 14 categories
Columns: Category, name, mrp, discountPercent, availableQuantity, discountedSellingPrice, weightInGms, outOfStock, quantity
Prices in the raw file are stored in paise (for example, 2500 = ₹25).



Tools Used
MySQL (MySQL Workbench)
Power BI
SQL: SELECT, WHERE, GROUP BY, ORDER BY, DISTINCT, LIMIT, SUM, AVG, ROUND, UPDATE, DELETE


Data Exploration and Cleaning
Checked the total row count and previewed sample records.
Checked every column for NULL values (none found).
Found and removed a row where mrp or discountedSellingPrice was 0, leaving 3,731 valid records.
Converted mrp and discountedSellingPrice from paise to rupees.


Business Questions Answered
1.Which are the top 10 best-value products by discount percentage?
2.What is the estimated revenue for each category? (discountedSellingPrice × availableQuantity)
3.Which products have an MRP above ₹500 and a discount below 10%?
4.Which 5 categories offer the highest average discount?
5.What is the total inventory weight per category?


Key Findings
Fruits & Vegetables has the highest average discount (about 15.5%), followed by Meats, Fish & Eggs (about 11%).
453 products (about 12%) are out of stock.
82 products have an MRP above ₹500 with a discount below 10%.
Power BI Report

Zepto_mrp_with_name_power_bi.pbix is a Power BI report built on a 10-product sample extract (ZEPTO_Project_Power_bi.csv), showing MRP by product.

Repository Structure
├── zepto.sql                          # Exploration, cleaning and analysis queries
├── zepto_v2.csv                       # Raw dataset (prices in paise)
├── ZEPTO_Project_Power_bi.csv         # Sample extract used in Power BI
└── Zepto_mrp_with_name_power_bi.pbix  # Power BI report


How to Run
Create a database named zepto in MySQL and import zepto_v2.csv into a table called zepto_v2.
Run zepto.sql from top to bottom.
Open the .pbix file in Power BI Desktop to view the report.
Author

Prem Parmar 
