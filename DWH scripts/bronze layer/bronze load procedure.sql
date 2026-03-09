/*
===============================================================================
Stored Procedure:Incremental Load To Bronze Layer (From Database to Bronze)
===============================================================================
Script Purpose:
-- Only inserts rows that don't already exist in bronze
-- using row_id as the unique identifier
===============================================================================
*/
EXEC bronze.load_bronze 

CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
    DECLARE @start_time DATETIME,@end_time DATETIME;
    SET @start_time=GETDATE();

	PRINT '================================================';
	PRINT 'Inserting into Bronze Layer';
	PRINT '================================================';

    INSERT INTO bronze.sales(
        Row_ID,Order_ID,Order_Date,Ship_Date,Ship_Mode,Customer_ID,
        Customer_Name,Segment,Country,City,State,Postal_Code,
        Region,Product_ID,Category,Sub_Category,Product_Name,
        Sales,Quantity,Discount,Profit
    )
    SELECT
        Row_ID,Order_ID,Order_Date,Ship_Date,Ship_Mode,Customer_ID,
        Customer_Name,Segment,Country,City,State,Postal_Code,
        Region,Product_ID,Category,Sub_Category,Product_Name,
        Sales,Quantity,Discount,Profit
    FROM all_data s
    WHERE NOT EXISTS (
    SELECT 1
    FROM bronze.sales b
    WHERE b.Row_ID= s.Row_ID   -- if Row_ID already in bronze > skip it
    );

    SET @end_time=GETDATE()
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
END
