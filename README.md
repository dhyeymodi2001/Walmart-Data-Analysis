# Walmart Data Analysis

## Project Overview
This project is an end-to-end data analysis of Walmart sales data. It involves data extraction, cleaning, storage, visualization, and business problem-solving using multiple tools such as Kaggle, Python, MySQL, and Power BI.

## Workflow
1. **Data Acquisition:**
   - Searched for Walmart data on Kaggle.
   - Used Kaggle API to import the dataset directly into VS Code.

2. **Setting Up Environment:**
   - Created a virtual environment in VS Code.
   - Installed necessary Python libraries.
   - Opened Jupyter Notebook for data cleaning and analysis.

3. **Data Cleaning & Preprocessing:**
   - Checked for and dropped duplicate values.
   - Identified and handled missing/null values.
   - Removed the dollar sign ($) from price columns and converted them to numerical values.
   - Ensured data consistency and correctness.

4. **Storing Cleaned Data in MySQL:**
   - Used `pymysql` and `SQLAlchemy` to export the cleaned data directly from VS Code to MySQL.
   ```python
   import pymysql
   from sqlalchemy import create_engine
   ```

5. **Data Visualization in Python:**
   - Created various graphs using:
     ```python
     import matplotlib.pyplot as plt
     import seaborn as sns
     ```
   - Used Seaborn and Matplotlib to generate insights through visual analysis.

6. **Business Problem Solving in MySQL:**
   - Queried the stored data in MySQL to derive insights.
   - Solved multiple business problems related to sales trends, revenue, and customer behavior.

7. **Dashboard Creation in Power BI:**
   - Exported MySQL data to Power BI.
   - Designed an interactive dashboard to visualize key metrics and insights.

## Tools & Technologies Used
- **Data Acquisition:** Kaggle API
- **Development Environment:** VS Code
- **Programming Language:** Python
- **Data Processing:** Jupyter Notebook, Pandas
- **Database Management:** MySQL
- **Data Visualization:** Matplotlib, Seaborn, Power BI

## Conclusion
This project demonstrates an end-to-end data analysis pipeline, starting from acquiring raw data to transforming it into meaningful business insights using Python, MySQL, and Power BI.

