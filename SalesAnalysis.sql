create database company;
use company;
select * from sales;

-- Q1: find all orderrs shipped via 'Economy'mode with a totalAmount>25000

select * from sales
where Ship_Mode='Economy' and Total_Amount >25000; 
 
-- Q2: Retrive all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.

select * from sales
where Category='Technology' and Country='Ireland' and
Order_Date > '2020-01-01';

-- Q3 List the top 10 most profitable sales transactions in descending order

select * from sales
order by Unit_Profit desc
limit 10; -- top 10 records 

select * from sales
order by Unit_Profit desc
limit 10,20; -- skip 10 records,showing the next 20 records. 

-- Q4 find all customers whose name starts with 'J' and ends with 'n'
 
 select Order_ID, Customer_Name
 from sales
 where Customer_Name like 'J%n';
 
 -- Q5  Retrive all product names that contain 'Acco' anywhere in the name
 
 select Order_ID,Product_Name 
 from sales
 where Product_Name like '%Acco%';
 
 -- Q6 get the top 5 cities with the highest total sales amount
 
 select City,sum(Total_Amount) as Total_Sales
 from sales 
 group by City
 order by Total_Sales desc
 limit 5;
 
 -- Q7 display the second set of 10 records for Customer_Name and Total_Amount in descresing order
 
 select Customer_Name,Total_Amount 
 from sales 
 order by Total_Amount desc
 limit 10,10; -- skips the first 10 records and give next 10 records
 
 -- Q8  Find the total_revenue,average unit cost,total number of orders
 
 select sum(Total_Amount) as total_revenue,
 avg(Unit_Cost) as `average unit cost`,
 count(Order_Id) as `total number of orders` -- ` ` using this can give the space instead of underscore
 from sales;

 -- Q9 count unique no of regions .
 select count(distinct (region))as `unique regions` from sales;
 
 -- Q10 find the number of orders places by each customer
 
 select Customer_Name, count(Order_ID) as no_of_order
 from sales
 group by Customer_Name
 order by no_of_order desc;
 
 -- Q11 rank 5 products based on total sales using RANK()
 
SELECT Product_Name, 
       SUM(Total_Amount) AS Total_Sales,
       RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Sales_Rank
FROM sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 5;

 