# Data Ingestion and Reporting Workshop

This workshop is designed to guide participants through a common data ingestion and reporting scenario. 
As we work through this activity, we will explore alternative technologies, architectures and approaches that could be utilized to address different environments and requirements. 
These include unstructured data, big data, high velocity data and deployment scenarios. 

## Objectives

Explore and gain hands on experience with the Azure Data stack of technologies.
Develop a working end to end ingestion, analytics and reporting solution. 
Discuss options, architectures and alternative technologies to fit specific requirements


## Target audience

- Data Engineer
- Data Administrators
- Data scientist
- Data Analysts
- BI Developers

## Abstract

### Workshop
The data we will be using is part of the World Development Indicators (WDI) dataset developed by the World Bank. Health data has been extracted from the larger set of datapoints and has been provided in CSV file format in 2 files. One file contains WDI country data and the other file contains yearly indicator records for each country.
We will firstly upload these files into Azure Blob Storage using Azure Storage Explorer. Then we will deploy and secure an Azure SQL Database and create the database artifacts required to store and retrieve the data. Next, we create an Azure Data Factory pipeline that will load our WDI data into the Azure SQL Database artifacts we created earlier. The next step is to connect to this repository using Azure Databricks where we will manipulate a dataset and use it to train a predictive model to provide data insights, we will write these results back to the SQL database. The final step will be to surface these insights and the WDI health data utilizing Power BI in the form of an interactive report.

### Hands-on lab
Our instructors will walk through each exercise and then provide assistance to participants to complete their own implementation.
Please feel free to ask questions of any of us at any time and ask for help when required. 
We want to promote an interactive environment and foster 2-way discussions on how and when our technologies and services can be utilized to enable your outcomes, so please feel open to engage and share your ideas.  




## Azure services and related products

- Azure Blob Storage
- Azure SQL DB
- Azure Data Factory
- Azure Databricks
- PowerBI
