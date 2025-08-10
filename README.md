# Azure End-to-End Data Engineering Project

## Overview
This project demonstrates a complete data engineering workflow on Microsoft Azure, leveraging tools such as **Azure Data Factory**, **Azure Databricks**, **Azure Synapse Analytics**, and **Power BI**.  
It simulates a real-world data pipeline, from ingestion to transformation and visualization, using the **Medallion Architecture** (Bronze, Silver, Gold layers) to progressively refine data.  
The example scenario focuses on ingesting and processing GitHub API data, but the structure can be adapted for various real-time and batch data sources.

---

## Architecture
The solution implements a layered data architecture:

1. **Bronze Layer (Raw)** – Stores ingested data in its original format.  
2. **Silver Layer (Transformed)** – Cleanses, standardizes, and enriches the data.  
3. **Gold Layer (Serving)** – Optimized data for analytics and reporting.  

<img width="1000" height="800" alt="image" src="https://github.com/user-attachments/assets/5edb6768-b032-4cda-876c-21b149ce425c" />

---

## Technologies Used
- **Azure Data Factory (ADF)** – Orchestrates data ingestion from APIs and other sources into the Bronze layer, supporting both static and dynamic pipelines.
- **Azure Data Lake Storage Gen2** – Centralized storage for Bronze, Silver, and Gold data.
- **Azure Databricks** – Processes and transforms data in the Silver layer using Apache Spark.
- **Azure Synapse Analytics** – Provides a SQL-based interface for querying Gold layer data and serving it to BI tools.
- **Power BI** – Visualizes processed data from Synapse.
- **HTTP Connection** – Pulls data from the GitHub API.
- **Managed Identities** – Secures access between Azure services without embedding credentials.

---

## Project Workflow

### 1. Data Ingestion – Azure Data Factory
- **Linked Services**  
  - HTTP (GitHub API) – Configured with base URL and authentication settings.  
  - Azure Data Lake Storage Gen2 – Configured for Bronze container access.  
- **Datasets**  
  - HTTP Dataset – Represents API data (e.g., CSV from GitHub).  
  - ADLS Dataset – Stores raw files in Bronze.  
- **Pipelines**  
  - Copy Activity – Moves API data into Bronze.  
  - Dynamic Pipelines – Uses parameters and loops to process multiple files or endpoints.
 
    <img width="2880" height="1800" alt="image" src="https://github.com/user-attachments/assets/51e726da-0da9-453d-9954-c17f2fac85de" />


---

### 2. Data Transformation – Azure Databricks
- **Cluster Setup** – Created with auto-termination to optimize costs.  
- **Data Access Configuration**  
  - Service Principal authentication via Azure AD.  
  - Assign "Storage Blob Data Contributor" role to the service principal.  
- **Processing**  
  - Read Bronze data using PySpark.  
  - Clean, standardize, and enrich datasets.  
  - Store processed data in Silver in **Parquet** format.
 
    <img width="2880" height="1800" alt="image" src="https://github.com/user-attachments/assets/cedbc5a9-eadf-49bb-a35b-7234fc283d0d" />


---

### 3. Data Warehousing – Azure Synapse Analytics
- **Access Configuration** – Synapse Managed Identity granted Blob Data Contributor role on Silver storage.  
- **External Tables/Views** – Created over Silver data using `OPENROWSET`.  
- **Gold Layer Load (Optional)** – Use `CETAS` to persist processed data in Gold storage.

<img width="2880" height="1800" alt="image" src="https://github.com/user-attachments/assets/d69d287b-8a95-4aeb-b3f5-773fdeba894d" />

---

### 4. Data Visualization – Power BI
- **Connection** – Direct connection to Synapse serverless SQL endpoint.  
- **Data Selection** – Import Gold layer views/tables.  
- **Reporting** – Build dashboards and visual insights.

<img width="407" height="205" alt="image" src="https://github.com/user-attachments/assets/c9bb512f-301a-48a4-b4cb-81340b6b1347" />

---

## Key Features
- Multi-layered **Medallion Architecture**.
- Dynamic, parameterized pipelines in ADF.
- PySpark transformations for scalability.
- Secure inter-service communication using **Managed Identities**.
- End-to-end workflow from API ingestion to Power BI reporting.

---

## Languages
- **Jupyter Notebook** – 100%
