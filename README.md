# E-COMMERCE-SALES-CUSTOMER-ANALYSIS

# E-Commerce Sales & Customer Analytics

## 📌 Executive Summary

This project focuses on analyzing e-commerce sales, customer behavior, and product performance using SQL, Excel, Python (Pandas), and Power BI. The objective is to transform raw business data into meaningful insights by performing data cleaning, exploratory data analysis, and business analysis. Key metrics such as total revenue, profit, monthly sales, customer spending, and product performance are analyzed. An interactive Power BI dashboard is developed to visualize business performance and support data-driven decision-making.

---

## 📊 Business Problem & Objectives

**The Problem:**

E-commerce businesses generate large amounts of sales and customer data. However, understanding sales trends, identifying profitable products, and analyzing customer purchasing behavior can be challenging without proper data analysis.

**Key Objectives:**

- Analyze overall sales, revenue, and profit performance.
- Identify top-performing products and categories.
- Understand customer purchasing behavior and spending patterns.
- Analyze monthly revenue and sales growth.
- Calculate important business KPIs such as Average Order Value (AOV).
- Build an interactive dashboard to support business decisions.

---

## 🛠️ Tech Stack & Tools

| Technology | Purpose |
|---|---|
| SQL (MySQL) | Data querying and business analysis |
| Excel | Data cleaning, formulas, and Pivot Tables |
| Python | Data analysis and preprocessing |
| Pandas | Data manipulation and cleaning |
| NumPy | Numerical operations |
| Power BI | Interactive dashboards and visualization |
| Jupyter Notebook | Python development environment |

---

## 🗃️ Data Source & Structure

**Source:** E-commerce sales dataset used for practice and business analysis.

**Dataset Overview:**

The project uses three datasets:

**1. Orders Dataset**
- `order_id`: Unique order identifier.
- `customer_id`: Customer identifier.
- `product_id`: Product identifier.
- `order_date`: Date of purchase.
- `quantity`: Number of products ordered.
- `sales_amount`: Total sales amount.
- `profit`: Profit generated.
- `order_status`: Current order status.

**2. Customers Dataset**
- `customer_id`: Unique customer identifier.
- `customer_name`: Customer name.
- `city`: Customer location.
- `state`: Customer state.

**3. Products Dataset**
- `product_id`: Unique product identifier.
- `product_name`: Product name.
- `category`: Product category.
- `subcategory`: Product subcategory.
- `unit_price`: Product price.

---

## 🔄 Data Workflow & Methodology

**1. Data Cleaning & Preprocessing – Excel**
- Removed duplicate records.
- Handled missing and blank values.
- Corrected date and numerical formats.
- Used TRIM to remove unwanted spaces.
- Standardized text values.
- Used Excel formulas and Pivot Tables.

**2. Data Analysis – SQL**
- Used SELECT, WHERE, ORDER BY, GROUP BY, and HAVING.
- Applied aggregate functions such as SUM, AVG, and COUNT.
- Performed INNER JOIN and LEFT JOIN.
- Used subqueries and Common Table Expressions (CTEs).
- Applied window functions for monthly sales analysis.
- Analyzed revenue, profit, and customer spending.

**3. Data Analysis – Python (Pandas)**
- Imported datasets using Pandas.
- Explored data using head(), info(), and describe().
- Handled missing values and duplicates.
- Converted columns into appropriate data types.
- Performed filtering, sorting, grouping, and merging.
- Calculated sales and revenue metrics.

**4. Data Visualization – Power BI**
- Created KPI cards for important business metrics.
- Developed monthly revenue trend charts.
- Visualized revenue by category and city.
- Identified top-performing products.
- Added interactive slicers and filters.

---

## 💡 Key Insights Deep Dive

The analysis focuses on identifying the following business insights:

- **💡 Sales Performance:** Identify total revenue, profit, and overall order performance.
- **📈 Product Performance:** Discover the top-selling and most profitable products and categories.
- **📊 Customer Analysis:** Identify high-value customers and understand purchasing patterns.
- **📅 Monthly Trends:** Analyze monthly revenue and sales growth.
- **🌍 Location Analysis:** Compare sales performance across different cities.

*Note: Actual numerical findings should be added after completing the analysis.*

---

## 🚀 Strategic Recommendations

Based on the analysis, businesses can:

- Focus on high-performing products and profitable categories.
- Improve marketing strategies to attract and retain customers.
- Identify low-performing products and investigate their sales performance.
- Use monthly revenue trends for better sales and inventory planning.
- Target high-value customers with personalized offers.
- Monitor KPIs regularly to improve business performance.

**Limitations & Assumptions:**

- Analysis depends on the accuracy and completeness of the available dataset.
- Missing or inconsistent records may affect results.
- Findings represent the available dataset and may not reflect the entire business.

---

## 📁 Repository Structure

```text
E-Commerce-Sales-Customer-Analytics/
│
├── Dataset/
│   ├── orders.csv
│   ├── customers.csv
│   └── products.csv
│
├── SQL/
│   └── analysis_queries.sql
│
├── Excel/
│   └── sales_analysis.xlsx
│
├── Python/
│   └── data_analysis.ipynb
│
├── PowerBI/
│   └── ecommerce_dashboard.pbix
│
└── README.md
```

---

## ⚙️ Getting Started & Installation

### Prerequisites

Ensure that you have installed:

- Python 3
- MySQL Workbench
- Microsoft Excel
- Power BI Desktop
- Jupyter Notebook

### Setup Instructions

**1. Clone the repository:**

```bash
git clone <your-github-repository-url>
cd E-Commerce-Sales-Customer-Analytics
```

**2. Install Python libraries:**

```bash
pip install pandas numpy matplotlib seaborn openpyxl jupyter
```

**3. Run SQL Queries:**

- Open MySQL Workbench.
- Import the datasets into MySQL.
- Execute the SQL analysis queries.

**4. Run Python Analysis:**

```bash
jupyter notebook
```

Open the Python notebook and execute the cells.

**5. Open Power BI Dashboard:**

- Open Power BI Desktop.
- Load the cleaned datasets.
- Refresh the data connections.
- Explore the interactive dashboard.

---

## 🎯 Project Outcomes

- Practical experience in SQL-based data analysis.
- Improved data cleaning and preprocessing skills.
- Hands-on experience with Excel and Pandas.
- Understanding of business KPIs and sales performance.
- Experience in developing interactive Power BI dashboards.
- Ability to convert raw data into meaningful business insights.

---

## 👩‍💻 Author

**Rutuja Sukale**

Aspiring Data Analyst

**Skills:** SQL | Excel | Python | Pandas | NumPy | Power BI
