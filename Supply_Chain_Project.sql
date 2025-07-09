select * from supply_chain_data
SELECT TOP 0 * FROM supply_chain_data

-- 1.Which product types generate the highest total revenue? : Skincare
SELECT Product_type, ROUND(SUM(Revenue_generated),2) AS total_revenue FROM supply_chain_data GROUP BY Product_type ORDER BY total_revenue DESC;

--2.What is the average defect rate by transportation mode?
SELECT Transportation_modes, AVG(Defect_rates) AS Avg_Defect_Rate FROM supply_chain_data GROUP BY Transportation_modes ORDER BY Avg_Defect_Rate ASC;

--3. Which suppliers have the highest manufacturing costs on average? : Supplier 4
SELECT Supplier_name, AVG(Manufacturing_costs) AS Avg_Manufacturing_Cost FROM supply_chain_data GROUP BY Supplier_name ORDER BY Avg_Manufacturing_Cost DESC;

--4.What is the average lead time by city (location)?
SELECT Location, ROUND(AVG(CAST(Lead_time AS FLOAT)),2) AS Avg_Lead_Time FROM supply_chain_data GROUP BY Location ORDER BY Avg_Lead_Time ASC;

--5.Which carrier is the most cost-effective? : Carrier B
select Shipping_carriers, round(avg(Shipping_costs),2) as Average_Cost from supply_chain_data group by Shipping_carriers;

--6.How many units are sold by each product type? : Most by Skincare
SELECT Product_type, SUM(Number_of_products_sold) AS Units_Sold FROM supply_chain_data GROUP BY Product_type ORDER BY Units_Sold DESC;

--7.Rank products based on profitability, where profitability is calculated as (Revenue generated - Manufacturing costs - Shipping costs)
select SKU, Product_type, ROUND(("Revenue_generated" - "Manufacturing_costs" - "Shipping_costs"),2) as Profitability, 
dense_rank() over(partition by  Product_type order by "Revenue_generated", "Manufacturing_costs", "Shipping_costs" Desc) 
as Profitability_Rank from supply_chain_data;

--8.Find the total number of products sold in each location to understand regional demand.
select Location, sum(Number_of_products_sold) as Product_sold from supply_chain_data group by Location order by Product_sold desc;



