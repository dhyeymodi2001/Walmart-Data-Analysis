# Walmart Data Analysis

![Project Pipeline](https://github.com/dhyeymodi2001/Walmart-Data-Analysis/blob/main/Walmart%20Workflow.png)

## Project Overview
This project is an end-to-end data analysis of Walmart sales data. It involves data extraction, cleaning, storage, visualization, and business problem-solving using multiple tools such as Kaggle, Python, MySQL, and Power BI.

## Workflow
1. **Data Acquisition:**
- **Source**: Kaggle Walmart Sales Dataset
- **Method**: Used Kaggle API to import data directly into VS Code
- **Command**:
  ```bash
  kaggle datasets download -d <dataset-path>
  ```

2. **Setting Up Environment:**
- **Tools Used**: VS Code, Python, Jupyter Notebook, MySQL, Power BI
- **Virtual Environment**:
  ```bash
  python -m venv walmart_env
  source walmart_env/bin/activate  # macOS/Linux
  walmart_env\Scripts\activate  # Windows
  ```
- **Install Dependencies**:
  ```bash
  pip install pandas numpy sqlalchemy pymysql seaborn matplotlib
  ```

3. **Data Cleaning & Preprocessing:**
- **Removed duplicates**
- **Handled missing values**
- **Formatted price column**: Removed dollar signs and converted to float
- **Converted data types**


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

## Project Structure
```plaintext
|-- data/                     # Raw and processed data
|-- sql_queries/              # SQL scripts
|-- notebooks/                # Jupyter notebooks
|-- README.md                 # Project documentation
|-- requirements.txt          # Python dependencies
|-- main.py                   # Main data processing script
```

## Key Insights
- Identified the highest revenue-generating product categories
- Found peak sales periods and top-performing branches
- Discovered customer purchasing trends

## Future Enhancements
- Automate the data pipeline
- Add real-time data updates
- Expand analysis with additional datasets

## Getting Started
1. Clone the repository:
   ```bash
   git clone <repo-url>
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up MySQL and import data
4. Run Jupyter Notebook for analysis


## Tools & Technologies Used
- **Data Acquisition:** Kaggle API
- **Development Environment:** VS Code
- **Programming Language:** Python
- **Data Processing:** Jupyter Notebook, Pandas
- **Database Management:** MySQL
- **Data Visualization:** Matplotlib, Seaborn, Power BI

## Conclusion
This project demonstrates an end-to-end data analysis pipeline, starting from acquiring raw data to transforming it into meaningful business insights using Python, MySQL, and Power BI.

![Project Dashboard](https://github.com/dhyeymodi2001/Walmart-Data-Analysis/blob/main/screenshots/Dashboard.png)


