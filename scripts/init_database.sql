/*
------------------------------------------
Create Database and Schemas
------------------------------------------
Script Overview
This script automates the initialization of the 'DataWarehouse' database. It ensures a clean 
environment by checking for an existing instance, dropping it if found, and recreating it 
with a standard Medallion Architecture (three-tier schema).

Key Actions:
Database Recreation: Drops and recreates the DataWarehouse database.
Schema Setup: Initializes the bronze, silver, and gold schemas.

WARNING: DATA DESTRUCTION
Executing this script will permanently delete the existing 'DataWarehouse' database and all
contained data. Ensure you have verified backups before proceeding.
*/


USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehoue')
BEGIN
      ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
      DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'Datawarehouse' database
CREATE DATABASE DataWarehouse;
GO


USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
