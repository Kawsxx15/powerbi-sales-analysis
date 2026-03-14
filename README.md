# 📊 End-to-End Sales Analysis using SQL Server and Power BI

## 📌 Project Overview

This project demonstrates an end-to-end data analysis workflow using Microsoft SQL Server and Power BI.
The objective of the project was to transform raw sales data into meaningful insights by performing data integration, transformation, and visualization.

Multiple datasets were combined and processed using SQL queries, and the resulting dataset was analyzed and visualized in Power BI dashboards.

## 📂 Dataset Description

The project uses three datasets.

## 1️⃣ Product Data

Contains product related information:

- Product ID
- Product Name
- Category
- Brand
- Description
- Cost Price
- Sale Price
- Image URL

## 2️⃣ Product Sales Data

Contains transaction level data:

- Date
- Product ID
- Customer Type
- Discount Band
- Country
- Units Sold
  
## 3️⃣ Discount Data

Contains discount percentages applied based on:

- Discount Band
- Month

# ⚙️ Data Processing using SQL Server

Data transformation and feature engineering were performed in Microsoft SQL Server.

Key Operations Performed

✔ Joining multiple datasets

✔ Creating calculated columns

✔ Extracting time-based features

✔ Computing revenue and cost metrics

# 🧠 SQL Query Logic

The following operations were performed.

## 1️⃣ Join Product and Sales Tables

Product details were combined with transaction data.

```sql
JOIN dbo.product_sales b 
ON b.Product = a.Product_ID
```

## 2️⃣ Revenue Calculation

Revenue was calculated as:

Revenue = Sale Price × Units Sold

SQL Implementation:

```sql
(Sale_Price * Units_Sold) AS Revenue
```
## 3️⃣ Total Cost Calculation

Total Cost = Cost Price × Units Sold

SQL Implementation:

```sql
(Cost_Price * Units_Sold) AS Total_Cost
```
## 4️⃣ Time Feature Extraction

Month and Year were extracted from the date column.
```sql
DATENAME(MONTH, Date) AS Month,
YEAR(Date) AS Year
```
## 5️⃣ Joining Discount Data

Discount information was joined based on:

Discount Band

Month
```sql
JOIN dbo.discount_data d 
ON a.Discount_Band = d.Discount_Band 
AND a.Month = d.Month
```
## 6️⃣ Discount Revenue Calculation

Final revenue after discount was calculated as:

Discount Revenue = Revenue × (1 - Discount%)

SQL Implementation:
```sql
(1 - discount * 0.1 / 100) * Revenue AS discount_revenue
```
# 📊 Data Analysis in Power BI

The processed dataset was imported into **Power BI** to create interactive dashboards.

Additional calculations were performed using **Power BI custom columns and DAX**.

## Power BI Calculations

### Profit Calculation

Profit was calculated using a custom column:

```DAX
Profit = Discount Revenue - Total Cost
```

# 📈 Dashboard Insights

The Power BI dashboard provides insights such as:

- Total Revenue
- Discount Revenue
- Profit Analysis
- Sales Trends by Month and Year
- Brand Performance
- Category-wise Sales
- Country-wise Sales Distribution

# 🛠️ Tools & Technologies Used

| Tool | Purpose |
|------|--------|
| Microsoft SQL Server | Data Transformation |
| SQL | Data Cleaning & Feature Engineering |
| Power BI | Data Visualization |
| GitHub | Project Version Control |


# 🚀 Key Learnings

Through this project I learned:

- Data transformation using SQL Server
- Performing table joins and calculated columns
- Creating derived metrics like revenue and profit
- Building interactive dashboards in Power BI
- Structuring and publishing a data analytics project on GitHub
