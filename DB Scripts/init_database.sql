USE master;
GO
-- Drop and recreate the 'sales' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'sales')
BEGIN
    ALTER DATABASE sales SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE sales;
END;
GO

CREATE DATABASE sales;
GO

USE sales;
GO
