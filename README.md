# 📊 Olist E-Commerce Marketplace Performance Analysis

### Business Intelligence Portfolio Project



> **Turning e-commerce data into actionable business intelligence through SQL, Power BI, Excel, and data storytelling. **

![Status](https://img.shields.io/badge/Project-In%20Progress-blue)
![SQL](https://img.shields.io/badge/SQL-Beginner-)
![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)
![Business Intelligence](https://img.shields.io/badge/Focus-Business%20Intelligence-purple)

---

# Executive Summary

This project analyzes the performance of the Olist Brazilian e-commerce marketplace from 2016–2018.

The analysis connects sales performance, customer behavior, delivery performance, and seller performance to understand what was happening across the marketplace and identify areas requiring further attention.

## 1. Project Overview

This project analyzes the performance of the Olist Brazilian e-commerce marketplace using data from 2016–2018.

The objective was to understand **commercial performance, customer behavior, and marketplace operations**, then translate the analysis into business findings and practical recommendations.

Rather than focusing only on dashboard development, the project followed a business intelligence process:

**Business Question → Data → Analysis → Finding → Business Implication → Recommendation**

---

## 2. Business Problem

Olist operates a multi-sided marketplace where performance depends on the interaction between **customers, products, sellers, orders, payments, and delivery**.

The analysis focused on understanding:

* What is driving revenue performance?
* How are customers behaving?
* How much does repeat purchasing contribute to revenue?
* How does delivery performance move alongside customer behavior?
* Which categories, and sellers state, require attention?

---

## 3. Business Objectives

### Commercial Performance

* How are revenue and order volume changing over time?
* Is revenue performance being driven by order volume or order value?
* Which product categories and customer markets contribute most to revenue?

### Customer Behavior

* How many customers are returning?
* How much revenue comes from repeat customers?
* How does repeat customer behavior change over time?

### Delivery & Seller Performance

* How is delivery performance changing?
* Which seller states or regions require attention?
* Do changes in delivery performance occur alongside changes in repeat customer behavior?

### Category Opportunities

* Which categories have high activity but weaker repeat behavior?
* Where are potential seller and regional performance opportunities?

---

## 4. Data & Data Model

The analysis used **8 Olist tables connected through 7 relationships**, including:

* Orders
* Customers
* Order Items
* Products
* Sellers
* Payments
* Product Translation

A dedicated Calendar table was created for time-based analysis.

The model was structured to connect sales, customers, products, sellers, and delivery information so that business metrics could be analyzed consistently across different dimensions and time periods.

---

## 5. Data Preparation & Validation

Data preparation was performed using **Excel and SQL**.

Key activities included:

* Inspecting and cleaning the data
* Checking missing and inconsistent values
* Reviewing table relationships
* Validating business metrics using SQL
* Preparing the data model for Power BI analysis

SQL was used not only to query the data, but also to ask business questions, check whether the metrics and business findings were consistent before presenting them in the dashboard.

---

## 6. Key Business KPIs

The analysis focused on KPIs that support the business questions:

* Total Revenue
* Total Orders
* Quantity Sold
* Average Order Value
* Total Customers
* Repeat Customer Rate
* Non-Repeat Customer Rate
* Late Orders
* On-Time Delivery Rate

---

# 7. Dashboard Structure

## Page 1: Sales Overview

Focus: **Commercial Performance**

Answers:

**What is happening with revenue, orders, customers, products, and markets?**

## Page 2: Customer Behavior

Focus: **Customer Purchasing & Repeat Behavior**

Answers:

**Who is returning, how much do repeat customers contribute, and how does customer behavior change over time?**

## Page 3: Delivery & Seller Performance

Focus: **Marketplace Operations**

Answers:

**How are delivery and seller performance changing, and where are operational opportunities?**

---

# 8. Key Findings

### Finding 1:  Revenue performance was driven by both volume and order value

Revenue movements did not always match changes in order volume proportionally.

This shows that order volume alone is not enough to explain revenue performance. Revenue should therefore be evaluated alongside orders, quantity sold, and Average Order Value.

**Business implication:** Management should monitor both **volume and value** when assessing sales performance.

---

### Finding 2: Incomplete periods were excluded from trend analysis

September 2016–December 2018 and September–October 2018 were excluded from the relevant analysis because of insufficient data coverage.

This prevents incomplete periods from creating misleading comparisons and helps keep the reported trends consistent.

**Business implication:** Data completeness should be considered before making time-based business conclusions.

---

### Finding 3: Repeat customers contributed 5.8% of revenue

Repeat customers contributed **5.8% of total revenue** and accounted for **6,342 orders** under the project's repeat customer definition.

This indicates that repeat purchasing represented a measurable part of marketplace activity while also highlighting an opportunity to better understand customer retention.

**Business implication:** Understanding what encourages customers to purchase again could help identify opportunities to strengthen repeat purchasing.

---

### Finding 4: Delivery performance and repeat customer behavior declined together in March 2018

In **March 2018**, both repeat customer rate and on-time delivery experienced a noticeable decline.

In **November 2017**, repeat customer rate remained relatively stable while on-time delivery experienced a significant decline.

This shows that customer behavior and delivery performance did not always move together, although some periods showed similar movements.

**Business implication:** Delivery performance is worth monitoring alongside customer behavior, but the analysis does not establish that delivery performance caused changes in repeat purchasing.

---

### Finding 5: Health & Beauty showed high activity but lower repeat behavior

In August 2018, Health & Beauty recorded high order activity and revenue while showing lower repeat customer behavior.

This makes the category a useful area for further investigation into why strong purchasing activity was not accompanied by stronger repeat purchasing.

**Business implication:** High sales activity does not necessarily translate into strong customer retention.

---

# 9. Business Implications

### Commercial

Revenue performance should be assessed using both volume and value metrics, rather than orders alone.

### Customer

Repeat purchasing represents an opportunity to understand and improve customer retention.

### Operations

Delivery performance should be monitored alongside customer behavior to identify periods requiring further investigation.

### Categories

Strong category sales do not automatically indicate strong repeat purchasing.

---

# 10. Recommendations

### 1. Investigate repeat customer behavior

Analyze customer, product, and purchasing patterns to understand what is associated with repeat purchases.

### 2. Monitor revenue drivers together

Track Revenue, Orders, Quantity Sold, and Average Order Value together to understand changes in commercial performance.

### 3. Review delivery performance by seller state

Identify seller states with weaker delivery performance and investigate the operational factors behind the results.

### 4. Investigate high-activity, low-repeat categories

Use categories such as Health & Beauty as starting points for understanding the gap between strong purchasing activity and repeat purchasing.

---

# 11. Analytical Approach

The project followed a practical BI workflow:

1. Define the business problem and questions
2. Identify the data required to answer them
3. Prepare and validate the data
4. Analyze and validate metrics using SQL
5. Build the data model and DAX measures
6. Develop the dashboard around the business questions
7. Interpret findings and translate them into recommendations

---

# 12. Tools & Technical Implementation

### Excel

* Data preparation
* Data inspection
* Initial validation

### SQL

* Business question analysis
* Metric validation
* Data investigation

### Power BI

* Data modeling
* Data cleaning
* Business analysis
* Interactive dashboard development

### DAX

* KPI measures
* Time-based analysis
* Dynamic calculations

---

# 13. Limitations

* The dataset represents historical Olist activity from 2016–2018.
* Some periods were excluded because of insufficient data coverage.
* The analysis identifies patterns and relationships but does not prove cause and effect.
* Further customer level and seller level analysis would be required before implementing operational changes.

---

# 14. Project Outcome & Skills Demonstrated

This project demonstrates my ability to:

* Translate business problems into analytical questions
* Select KPIs that answer specific business questions
* Prepare and validate business data
* Use SQL to investigate and validate findings
* Build a relational data model
* Develop DAX measures for business analysis
* Design dashboards around business decisions rather than visuals alone
* Interpret findings and connect them to business implications
* Turn analysis into practical recommendations

---

# 15. Final Takeaway

The Olist analysis shows that marketplace performance cannot be understood through sales alone.

Revenue, customer behavior, and operational performance provide different views of the same marketplace and need to be considered together.

This project demonstrates my approach as a junior BI analyst:
Start with the business question, use data to investigate it, validate the result, communicate what the data shows, and identify practical areas for action.

Planned dashboard features include:

- Executive KPI Cards
- Sales Trend Analysis
- Customer Insights
-Sellers and Product Performance
- Delivery Performance
- Interactive Filters

---

# Project Structure

```
📂 Olist-Business-Intelligence-Project
│
├── 📁 Data
├── 📁 SQL
│   ├── Business Questions.sql
│   └── Analytical Queries.sql
│
├── 📁 Power BI
│   └── Dashboard.pbix
│
├── 📁 Dashboard Images
│
├── 📁 Documentation
│
└── README.md
```

---

# Technology Stack

| Tool | Purpose |
|-------|----------|
| Excel | Data Exploration | Validating Relationships
| SQL Server | SQL Analysis| Data Exploration 
| Power BI | Dashboard Development| Data Cleaning| Data Modelling| DAX Development|Dashboard Tranformation | KPI Calculations 
| GitHub | Project Documentation 

---

# Skills Demonstrated

- Business Intelligence
- Data Cleaning
- Data Modeling
- SQL Development
- Dashboard Design
- KPI Development
- DAX
- Business Storytelling
- Analytical Thinking
- Problem Solving

---

# Current Progress

✅ Business Understanding

✅ Data Preparation

✅ SQL Business Queries

✅ Data Modeling

✅ DAX Measures

✅ Dashboard Documentation

✅ Business Recommendations

---

# About Me

Hi, I'm **Promise Dayi Theophilus**.

I'm a **Business Intelligence Analyst** passionate about transforming data into actionable business insights.

I enjoy solving business problems with SQL, Power BI, Excel, and DAX while continuously strengthening my analytical thinking through real-world projects.

I believe Business Intelligence isn't just about building beautiful reports it's about helping organizations make smarter decisions with data.

---

## Connect With Me

**LinkedIn:** *www.linkedin.com/in/promise-theophilus-739976195*


---

⭐ If you found this project valuable, consider starring the repository.
