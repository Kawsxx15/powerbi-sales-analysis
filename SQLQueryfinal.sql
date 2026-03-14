WITH cte AS (
SELECT 
    a.Product,
    a.Category,
    a.Brand,
    a.Description,
    a.Cost_Price,
    a.Image_url,
    a.Sale_Price,
    b.Date,
    b.Customer_Type,
    b.Discount_Band,
    b.Country,
    b.Units_Sold,
    (Sale_Price * Units_Sold) AS Revenue,
    (Cost_Price * Units_Sold) AS Total_Cost,
    DATENAME(MONTH, Date) AS Month,
    YEAR(Date) AS Year
FROM dbo.Product_data a
JOIN dbo.product_sales b 
ON b.Product = a.Product_ID
)

SELECT 
*,
(1 - discount * 0.1 / 100) * Revenue AS discount_revenue
FROM cte a
JOIN dbo.discount_data d 
ON a.Discount_Band = d.Discount_Band 
AND a.Month = d.Month;