# Modern Analytics Plataform | Adventure Works
This repository contains the solution developed by **Murilo Ferreira Vitor** to obtain the **Analytics Engineering Certification by Indicium**.

## Context
This project was developed to demonstrate skills as an **Analytics Engineer**, transforming a database from an **OLTP** environment into **OLAP** for consumption in a **Data Warehouse** and a **BI tool**. The database used is **Adventure Works**, a sample database from Microsoft for **OLTP**. Adventure Works database simulates a fictional multinational manufacturing company called **Adventure Works Cycles**.

### Objective
The goal of this project was to build a **modern analytics platform** for **Adventure Works (AW)**, focusing on the following key aspects:

- Develop a cutting-edge **Modern Analytics Stack (MAS)**.
- Apply **dimensional modeling**, converting an **OLTP** environment into an **OLAP** structure within the Data Warehouse.
- Showcase expertise in **SQL**, **dbt**, and **Self-Service BI tools** to generate reports and insights.
- Ensure **data accuracy and reliability** by implementing both built-in and business-driven validation tests, as well as addressing strategic questions posed by the AW stakeholders.

### About the Company
Adventure Works is a fast-growing manufacturing company with a portfolio of **500+ products**, **20,000 customers**, and **31,000 registered orders**.

To become a **data-driven** organization, the first step of the project was to prioritize the Sales department by integrating key data from SAP (ERP), Salesforce (CRM), and Google Analytics (Web Analytics).

The CEO emphasized the importance of **data accuracy**, requesting validation tests to align reported figures with audited financial records, ensuring trust in the analytics platform. The system must verify that the **2011 gross sales total of $12,646,112.16**.

## **Project Structure**  

### **1. Data Modeling**  
Dimensional modeling implemented in the **Snowflake Data Warehouse**.  

- **Fact Table**:  
  - Sales Order (granularity at the product level associated with the corresponding sales order)  

- **Dimensions**:  
  - Calendar  
  - Credit Card  
  - Customer  
  - Location  
  - Product  
  - Reason  

### **2. Data Ingestion and Transformation**  
Leveraging **dbt Cloud** to:  
  - Build and document data models.  
  - Implement data quality tests.  
  - Ensure compliance with business rules.  

### **3. Data Visualization and Analysis**  
Development of a **Power BI DataViz Dashboard** featuring:  
  - Sales metrics.  
  - Trend analysis.  
  - Key strategic insights.  

## **Technologies Used**  
- **dbt**: Data modeling, transformation, testing, and documentation.  
- **SQL**: Querying and data validation.  
- **Snowflake**: Data warehouse for storage.  
- **Power BI**: DataViz tool for interactive reporting.  
- **GitHub**: Version control and documentation.  

## **How to Access**  
- [Conceptual Model](#) <!-- Insert link -->  
- [dbt Project Documentation](https://muriloferreiravitor.github.io/adventure_works/)  
- [Power BI Dashboard](#) <!-- Insert link -->  
- [Presentation Video](#) <!-- Insert link -->  

## **Contact**  
For any questions or suggestions, feel free to connect via [LinkedIn](https://linkedin.com/in/muriloferreiravitor).
