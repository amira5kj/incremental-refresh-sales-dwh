/*
===============================================================================
Stored Procedure: Load Bronze Layer (From Database to Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from  From the Database. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE OR ALTER bronze.load_bronze AS 
BEGIN
        DECLARE @start_time DATETIME,@end_time DATETIME;
        SET @start_time=GETDATE();

		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';
		PRINT '>> Truncating Table: bronze.sales';
		TRUNCATE TABLE bronze.sales;
		PRINT '>> Inserting Data Into: bronze.sales';

        INSERT INTO bronze.sales(
            Order_ID,Order_Date,Ship_Date,Ship_Mode,Customer_ID,
            Customer_Name,Segment,Country,City,State,Postal_Code,
            Region,Product_ID,Category,Sub_Category,Product_Name,
            Sales,Quantity,Discount,Profit
        )
        SELECT
            Order_ID,Order_Date,Ship_Date,Ship_Mode,Customer_ID,
            Customer_Name,Segment,Country,City,State,Postal_Code,
            Region,Product_ID,Category,Sub_Category,Product_Name,
            Sales,Quantity,Discount,Profit
        FROM all_data

        SET @end_time=GETDATE()
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
END
