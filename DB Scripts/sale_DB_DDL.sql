CREATE TABLE all_data (
Row_ID         INT IDENTITY(1,1) PRIMARY KEY,  -- auto increment, starts at 1
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
GO

SELECT * FROM all_data

