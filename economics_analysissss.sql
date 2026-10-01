CREATE DATABASE ECOMMERCE_ANALYSIS;
USE ECOMMERCE_ANALYSIS;

CREATE TABLE SALES_DATA (
Order_Id VARCHAR(50),
Order_Date VARCHAR(50),
Customer_Id  VARCHAR(50),
CUSTOMER_Name  VARCHAR(50),
Product_Id  VARCHAR(50),
Product_Name  VARCHAR(50),
Category VARCHAR(50),
Sub_Category  VARCHAR(50),
Quantity int,
Unit_Price DECIMAL(12,2),
Sales decimal(14,2),
Discount_Amount DECIMAL(14,2),
Net_Sales DECIMAL(14,2),
Profit DECIMAL(14,2),
City VARCHAR(100),
State VARCHAR(100),
Region VARCHAR(50),
Payment_Method VARCHAR(50),
Shipping_Mode VARCHAR(50),
Year INT,
Month_Number INT,
Month VARCHAR(20),
Profit_Margin DECIMAL(8,2)
);

show columns from ecommerce_analysis.sales_data;
ALTER TABLE ecommerce_analysis.sales_data
add column Discount decimal(5,2) after sales;

SELECT COUNT(*) AS total_rows
from ecommerce_analysis.sales_data;

select *
from ecommerce_analysis.sales_data
;

SELECT SUM(Net_sales) AS Total_Sales
from ecommerce_analysis.sales_data;

SELECT SUM(Profit) AS Total_Profit
FROM ecommerce_analysis.sales_data;

SELECT COUNT(Order_Id) AS Total_Orders
FROM ecommerce_analysis.sales_data;

SELECT COUNT(DISTINCT Customer_Id) AS Unique_Customers
FROM ecommerce_analysis.sales_data;

SELECT SUM(Net_Sales)/COUNT(Order_Id) AS Average_Order_Value
FROM ecommerce_analysis.sales_data;

SELECT COUNT(Quantity) AS Total_Units_Sold
FROM ecommerce_analysis.sales_data;

SELECT 
Category,
SUM(Net_Sales) AS Total_Sales
from ecommerce_analysis.sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT
Category,
SUM(Profit) AS Total_Profit
from ecommerce_analysis.sales_data
group by Category
order by Total_Profit DESC;

select 
Region,
sum(Net_Sales) AS total_region_sales
from ecommerce_analysis.sales_data
group by Region
order by total_region_sales DESC;

select 
Payment_Method,
sum(Net_Sales) AS total_sales_by_payment
from ecommerce_analysis.sales_data
group by Payment_Method
order by total_sales_by_payment DESC;

select
Payment_Method,
sum(net_sales) AS Payment_method_most_sales
from ecommerce_analysis.sales_data
group by Payment_Method
order by Payment_method_most_sales DESC;

select
Shipping_Mode,
sum(net_sales) AS Shipping_method_most_sales
from ecommerce_analysis.sales_data
group by Shipping_Mode
order by Shipping_method_most_sales DESC;

select
Year,
Month_Number,
Month,
sum(net_sales) AS month_by_month_sales
from ecommerce_analysis.sales_data
group by Year,Month_Number, Month
order by Year, Month_Number ;

select
Product_Name,
sum(net_sales) AS Top_10_Product
from ecommerce_analysis.sales_data
group by Product_Name
order by Top_10_Product DESC
limit 10;

select
Customer_Id,
CUSTOMER_Name,
sum(net_sales) AS Top_10_Customer_highest_sales
from ecommerce_analysis.sales_data
group by Customer_Id, CUSTOMER_Name
order by Top_10_Customer_highest_sales DESC
limit 10;

select
City,
sum(net_sales) AS Top_city_sales
from ecommerce_analysis.sales_data
group by City
order by Top_city_sales DESC;

select 
sum(profit)/sum(net_sales)*100 as profit_margin_percentage
from ecommerce_analysis.sales_data;

select
Sub_Category,
sum(Profit) AS subcategory_profit
from ecommerce_analysis.sales_data
group by Sub_Category
order by subcategory_profit DESC;

select
Category,
sum(Profit) AS Category_profit
from ecommerce_analysis.sales_data
group by Category
order by Category_profit DESC;

select
sum(Discount_Amount) as Total_Discount,
SUM(Net_Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM ecommerce_analysis.sales_data;

select
AVG(Discount) AS Average_Discount
from ecommerce_analysis.sales_data;

SELECT 
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM ecommerce_analysis.sales_data
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;

SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM ecommerce_analysis.sales_data
GROUP BY Category
ORDER BY Total_Profit DESC;
