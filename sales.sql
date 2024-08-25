--a) Total Sales and Profit for Each Product:
SELECT 
    Product_ID, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM 
    Orders
GROUP BY 
    Product_ID
ORDER BY 
    Total_Sales DESC;

--b)Top Product Categories by Revenue or Profit:
SELECT 
    Product_Category, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM 
    Orders
GROUP BY 
    Product_Category
ORDER BY 
    Total_Sales DESC;

--c)Average Order Value by Customer Segment:
SELECT 
    Segment, 
    AVG(Sales) AS Average_Order_Value
FROM 
    Orders
GROUP BY 
    Segment;

--d)Top Customers by Total Sales:
SELECT 
    Customer_ID, 
    SUM(Sales) AS Total_Sales, 
    COUNT(Order_ID) AS Total_Orders
FROM 
    Orders
GROUP BY 
    Customer_ID
ORDER BY 
    Total_Sales DESC
LIMIT 10;

--e)Average Discount Given to Customers:
SELECT 
    Customer_ID, 
    AVG(Discount) AS Average_Discount
FROM 
    Orders
GROUP BY 
    Customer_ID
ORDER BY 
    Average_Discount DESC;

--f)Average Time Between Order Date and Ship Date:
SELECT 
    AVG(DATEDIFF(Ship_Date, Order_Date)) AS Average_Shipping_Time
FROM 
    Orders;

--g)Most Common Shipping Modes and Their Impact:
SELECT 
    Ship_Mode, 
    COUNT(Order_ID) AS Total_Orders, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM 
    Orders
GROUP BY 
    Ship_Mode
ORDER BY 
    Total_Orders DESC;

--h)Sales and Profit by Region (Postal Code):
SELECT 
    Postal_Code, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM 
    Orders
GROUP BY 
    Postal_Code
ORDER BY 
    Total_Sales DESC;

--i)Highest Sales/Profit Regions:
SELECT 
    Postal_Code, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM 
    Orders
GROUP BY 
    Postal_Code
ORDER BY 
    Total_Profit DESC
LIMIT 10;

--j)Monthly Sales and Profit Trends:
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Order_Month, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM 
    Orders
GROUP BY 
    Order_Month
ORDER BY 
    Order_Month;

--k) Seasonal Trends in Sales or Profit:
SELECT 
    QUARTER(Order_Date) AS Quarter, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM 
    Orders
GROUP BY 
    Quarter
ORDER BY 
    Quarter;

--
l)Sensitivity to Discounts by Product:
SELECT 
    Product_ID, 
    AVG(Discount) AS Average_Discount, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM 
    Orders
GROUP BY 
    Product_ID
ORDER BY 
    Average_Discount DESC;
