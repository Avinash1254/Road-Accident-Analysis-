# Road-Accident-Analysis-
📌 Project Overview

This project is a complete end-to-end data analytics workflow, where I collected raw road accident data from an online open-source portal, cleaned and transformed it using Excel, stored the data in a PostgreSQL database, performed industry-level SQL analysis, and finally built an interactive Power BI dashboard for insights and reporting.

This project showcases my skills in:
Data Collection
Data Cleaning & Preprocessing
Database Design & SQL Analytics
Data Visualization (Power BI)
Storytelling & Insight Generation

1️> Data Collection
Downloaded raw Road Accident Dataset from an online public source.
Format: .xlsx (Excel sheet)
File includes columns such as accident date, severity, vehicle type, casualties, road type, lighting condition, etc.

2️> Data Cleaning & Preprocessing (Excel)
Performed the following major cleaning tasks:
> Handling missing values
> Standardizing column names
> Converting date columns to datetime format
> Removing duplicates
> Filtering out invalid or incorrect entries
> Creating new derived fields (e.g., Month, Year)
> Categorizing vehicle groups
> Exporting final cleaned dataset as CSV

3️> Uploading Clean Data to PostgreSQL
Created a PostgreSQL table named road_accident
Loaded the cleaned CSV file using pgAdmin / COPY command
Ensured correct data types (INT, VARCHAR, DATE, etc.)
Key Business Questions (Solved using SQL)

These are the  analytical questions I answered using PostgreSQL.
All SQL queries are stored inside the given sql file.

A. Overall Accident & Casualty Metrics (YTD 2022)
What is the total number of casualties in 2022?
How many total accidents happened in 2022?
What is the breakdown of casualties by severity?
Fatal
Serious
Slight

B. Vehicle-Based Analysis
Which vehicle types contribute the highest number of casualties?
Create logical vehicle categories (Cars, Bike, Bus, Van, Agriculture, Other).
Which vehicle category is most responsible for total casualties?

C. Trend & Time-Based Analysis
What is the month-wise trend of casualties from Jan to Dec 2022?
Which month shows the highest accident severity?

D. Road Impact Analysis
Which road types contribute the most casualties?
Rank road types by casualties in descending order.

E. Location-Based Analysis
Which local authorities recorded the highest casualties?
Top 10 local authorities with maximum incidents.

F. Environmental Condition Analysis
What percent of casualties happened in Urban vs Rural areas?
What percent happened in Daylight vs Darkness?


Power BI Dashboard:--
After running SQL analysis, the cleaned output was imported into Power BI using:
✔ Direct PostgreSQL query connection
OR
✔ CSV export → Power BI import

The dashboard includes:
KPI Cards (Total Casualties, Total Accidents, Fatal/Serious/Slight)
Donut Chart (Urban vs Rural)
Column Chart (Casualties by Vehicle Group)
Line Chart (Monthly Trend)
Bar Chart (Road Type Casualties)
Top 10 Local Authorities (Ranked)
📄 car-sale-report.sql 

car-sale-repo
