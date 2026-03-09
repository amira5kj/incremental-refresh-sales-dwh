/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Table
===============================================================================
*/

IF OBJECT_ID('bronze.sales', 'U') IS NOT NULL
    DROP TABLE bronze.sales;
GO

create table bronze.sales (
Order_ID       varchar(100),	
Order_Date     datetime,
Ship_Date      datetime,
Ship_Mode	   varchar(50),
Customer_ID	   varchar(50),
Customer_Name  varchar(250),
Segment	       varchar(50),
Country	       varchar(50),
City	       varchar(50),
State	       varchar(50),
Postal_Code	   varchar(50),
Region	       varchar(50),
Product_ID     varchar(250),
Category	   varchar(50),
Sub_Category   varchar(50),
Product_Name   varchar(250),
Sales          decimal,
Quantity	   int,
Discount	   decimal,
Profit         decimal
);
