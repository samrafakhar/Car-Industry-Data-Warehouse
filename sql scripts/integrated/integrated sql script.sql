--Drop database gh
--Create database gh
--use gh

CREATE TABLE [dbo].[Manufacturer] (
    [carmanufacturerID] INT        NOT NULL IDENTITY(1,1),
    [dm_carmanufacturerID] INT        NULL,
    [name]    NCHAR (100) NULL,
	[manufactureDetails] NCHAR (100) NULL,
------[source_manufacturerID]     INT         NULL, --Fatima
    CONSTRAINT [PK_carModel] PRIMARY KEY ([carmanufacturerID])
);

CREATE TABLE [dbo].[Model] (
    [modelCode]      INT         NOT NULL IDENTITY(1,1),
	[dm_modelCode]      INT         NULL,
    [modelName]      NCHAR (100)  NULL,
    [otherDetails]   NCHAR (100) NULL,
    [manufacturerID] INT         NULL,
    CONSTRAINT [PK_Model] PRIMARY KEY ([modelCode] ),
    CONSTRAINT [FK_Model_Manufacturer] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([carmanufacturerID])
);

CREATE TABLE [dbo].[VehicleCategory] (
    [CategoryID]  INT        NOT NULL IDENTITY(1,1),
	[dm_CategoryID]  INT        NULL ,
    [description] NCHAR (100) NULL,
    [modelId]     INT        NULL,
    CONSTRAINT [PK_Vehicle Category] PRIMARY KEY ([CategoryID]),
    CONSTRAINT [FK_Vehicle Category_Model] FOREIGN KEY ([modelId]) REFERENCES [dbo].[Model] ([modelCode])
);

CREATE TABLE [dbo].[Car] (
    [carID]          INT        NOT NULL IDENTITY(1,1),
	[dm_carID]          INT        NULL ,
	[askingPrice] INT NULL,
	[source_carSoldID]             INT NULL,
	[source_carForSaleID] INT NULL,
	[agreedPrice] INT NULL,
    [vehicleCategoryID] INT NULL,
    [lisenceNumber]   INT        NULL,
    [engineSize]      INT        NULL,
    [otherCarDetails] NCHAR (100) NULL,
    [currentMilage]   INT        NULL,
	[modelID]   INT        NULL,
	[manufacturerID]   INT        NULL,
    CONSTRAINT [PK_Car] PRIMARY KEY ([carID]),
	CONSTRAINT [FK_Mechanic Services Fact Tablefgh_Dgvhbefghjects] FOREIGN KEY ([modelID]) REFERENCES [dbo].[Model] ([modelCode]),
	CONSTRAINT [FK_Mechanic Services Fact Table_Megvhbchanghjic] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([carmanufacturerID]),
    CONSTRAINT [FK_Car_sales vehicleCategoryID] FOREIGN KEY ([vehicleCategoryID]) REFERENCES [dbo].[VehicleCategory] ([CategoryID])
);

CREATE TABLE [dbo].[Feature] (
    [featureID]   INT        NOT NULL IDENTITY(1,1),
	[dm_featureID]   INT        NULL ,
    [description] NCHAR (100) NULL,
    CONSTRAINT [PK_Feature] PRIMARY KEY ([featureID])
);

CREATE TABLE [dbo].[Region] (
    [regionID] INT NOT NULL IDENTITY(1,1),
	[dm_regionID] INT NULL  ,
    [zip]      INT NULL,
    [city]   NCHAR(100) NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY ([regionID])
);

CREATE TABLE [dbo].[Mechanic] (
    [mechanicID]      INT         NOT NULL IDENTITY(1,1),
	[dm_mechanicID]      INT         NULL  ,
    [mechanicName]    NCHAR (100)  NULL,
    [mechanicDetails] NCHAR (100) NULL,
    CONSTRAINT [PK_Mechanic] PRIMARY KEY ([mechanicID])
);

CREATE TABLE [dbo].[year] (
    [yearID] INT NOT NULL IDENTITY(1,1),
	[dm_yearID] INT NULL  ,
    CONSTRAINT [PK_year] PRIMARY KEY([yearID])
);

CREATE TABLE [dbo].[month] (
    [monthID] INT NOT NULL IDENTITY(1,1),
	[dm_monthID] INT NULL  ,
    [yearID]    INT NULL,
    CONSTRAINT [PK_month] PRIMARY KEY ([monthID]),
    CONSTRAINT [FK_month_year] FOREIGN KEY ([yearID]) REFERENCES [dbo].[year] ([yearID])
);

CREATE TABLE [dbo].[Time] (
    [timeID] INT NOT NULL IDENTITY(1,1),
	[dm_timeID] INT NULL  ,
    [day]    INT NULL,
    [monthID] INT NULL,
[date] DATE NULL
    CONSTRAINT [PK_Time] PRIMARY KEY ([timeID]),
    CONSTRAINT [FK_Time_week] FOREIGN KEY ([monthID]) REFERENCES [dbo].[month] ([monthID])
);

CREATE TABLE [dbo].[Supplier] (
    [supplierID]          INT         NOT NULL IDENTITY(1,1),
	[dm_supplierID]          INT         NULL  ,
    [name]                NCHAR (100)  NULL,
    [supplierDescription] NCHAR (100) NULL,
    CONSTRAINT [PK_Supplier] PRIMARY KEY ([supplierID])
);

CREATE TABLE [dbo].[Part Levels] (
    [partLevelID]          INT        NOT NULL IDENTITY(1,1),
	[dm_partLevelID]          INT        NULL  ,
    [partLevelDescription] NCHAR (100) NULL,
    CONSTRAINT [PK_Part Levels] PRIMARY KEY ([partLevelID])
);

CREATE TABLE [dbo].[part manufacturer] (
    [partMnufacturerID]    INT        NOT NULL IDENTITY(1,1),
	[dm_partMnufacturerID]    INT        NULL  ,
    [partManufacturerName] NCHAR (100) NULL,
    CONSTRAINT [PK_part manufacturer] PRIMARY KEY ([partMnufacturerID])
);

CREATE TABLE [dbo].[part types] (
    [partTypeID]          INT        NOT NULL IDENTITY(1,1),
	[dm_partTypeID]          INT        NULL  ,
    [partTypeDescription] NCHAR (100) NULL,
    CONSTRAINT [PK_part types] PRIMARY KEY ([partTypeID])
);

CREATE TABLE [dbo].[Defects] (
    [defectID]          INT         NOT NULL IDENTITY(1,1),
	[dm_defectID]          INT         NULL  ,
    [defectDescription] NCHAR (100) NULL,
    [date]              DATE        NULL,
    [otherDetails]      NCHAR (100)  NULL,
CONSTRAINT [PK_Defects] PRIMARY KEY ([defectID] )
);

CREATE TABLE [dbo].[Customer] (
    [customerID]   INT         NOT NULL IDENTITY(1,1),
	[dm_customerID]   INT         NULL  ,
    [customerName] NCHAR (100)  NULL,
    [email]        NCHAR (100)  NULL,
    [contactNo]    NCHAR (100)  NULL,
    [address]      NCHAR (100) NULL,
    [city]         NCHAR (100)  NULL,
    [state]        NCHAR (100)  NULL,
    [country]      NCHAR (100)  NULL,
    [otherDetails] NCHAR (100) NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY ([customerID])
);

------

CREATE TABLE [dbo].[Part] (
    [partID]              INT        NOT NULL IDENTITY(1,1),
	[dm_partID]              INT        NULL  ,
    [name]                NCHAR (100) NULL,
[partDescription] NCHAR (100) NULL,
    [weight]              INT        NULL,
    [condition]           NCHAR (100) NULL,
    [mileage]             INT        NULL,
    [otherDetails]        NCHAR (100) NULL,
    [partManufactureCode] INT        NULL,
    [partTypeCode]        INT        NULL,
    [partLevelCode]       INT        NULL,
[numberInStack]   INT         NULL,
    CONSTRAINT [PK_Part] PRIMARY KEY ([partID]),
    CONSTRAINT [FK_Part_Part Levels] FOREIGN KEY ([partLevelCode]) REFERENCES [dbo].[Part Levels] ([partLevelID]),
    CONSTRAINT [FK_Part_part manufacturer] FOREIGN KEY ([partManufactureCode]) REFERENCES [dbo].[part manufacturer] ([partMnufacturerID]),
    CONSTRAINT [FK_Part_part types] FOREIGN KEY ([partTypeCode]) REFERENCES [dbo].[part types] ([partTypeID])
);


-----------------------------------------------------------------------------------------------------------------------------------
                                      ------------------Fact Table---------------------
-----------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------
------------------DATA MART 1----------------------
-----------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[InventoryFactTable] (
    [carID]           INT,
  [yearID] INT,

    CONSTRAINT [FK_InventoryFactTable_Car1] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([carID]),
CONSTRAINT [FK_InventoryFactTable_Car2] FOREIGN KEY ([yearID]) REFERENCES [dbo].[year] ([yearID])
 
);

CREATE TABLE [dbo].[preference Aggregate Fact Table] (
    [featureID] INT PRIMARY KEY,
    [count] INT NULL,

    CONSTRAINT [FK_preference] FOREIGN KEY ([featureID]) REFERENCES [dbo].[Feature] ([featureID])
);



CREATE TABLE [dbo].[monthly sales aggregate fact table] (
    [quantitySold] INT NULL,
    [totalCost]    INT NULL,

    [carID]        INT,
    [regionID]     INT,
    [monthID]    INT,
PRIMARY KEY([carID],[regionID] , [monthID] ),
    CONSTRAINT [FK_monthly sales aggregate fact table_Car1] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([carID]),
    CONSTRAINT [FK_monthly sales aggregate fact table_month] FOREIGN KEY ([monthID]) REFERENCES [dbo].[month] ([monthID]),
CONSTRAINT [FK_monthly sales aggregate fact table_region] FOREIGN KEY ([regionID]) REFERENCES [dbo].[Region] ([regionID])
);

--for most demanded car
CREATE TABLE [dbo].[car sale aggregate fact table](
[carID] INT,
[numberOfCustomers] INT,
[totalPrice] INT,
CONSTRAINT [FK_car sales agg fact table_Car] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([carID])
)

CREATE TABLE [dbo].[sales fact table] (

    [sellingPrice] INT NULL,

    [regionID]     INT,
    [carID]        INT,
    [timeID]       INT,
    [customerID]   INT,

PRIMARY KEY([regionID], [carID],[timeID] ,[customerID]),
    CONSTRAINT [FK_sales fact table_Car] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([carID]),
    CONSTRAINT [FK_sales fact table_Customer] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_sales fact table_Region] FOREIGN KEY ([regionID]) REFERENCES [dbo].[Region] ([regionID]),
    CONSTRAINT [FK_sales fact table_Time] FOREIGN KEY ([timeID]) REFERENCES [dbo].[Time] ([timeID])
);
-----------------------------------------------------------------------------------------------------------------------------------
------------------DATA MART 2----------------------
-----------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[Parts Order Fact Table] (
    [partID]       INT NULL,
    [carID]        INT NULL,
    [defectID]     INT NULL,
    [customerID]   INT NULL,

    CONSTRAINT [FK_Parts Order Fact Table_Car] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([CarID]),
    CONSTRAINT [FK_Parts Order Fact Table_Customer] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_Parts Order Fact Table_Defects] FOREIGN KEY ([defectID]) REFERENCES [dbo].[Defects] ([defectID]),
    CONSTRAINT [FK_Parts Order Fact Table_Part_Part] FOREIGN KEY ([partID]) REFERENCES [dbo].[Part] ([partID]),
);

CREATE TABLE [dbo].[Parts Order Aggregate Fact Table] (
    [partID]         INT NULL,
[numberOfUnits] INT NULL,
    CONSTRAINT [FK_Parts Order Aggregate Fact Table_Part] FOREIGN KEY ([partID]) REFERENCES [dbo].[Part] ([partID])
);

CREATE TABLE [dbo].[Mechanic Services Fact Table] (
    [mechanicID]   INT NULL,
    [carID]        INT NULL,
    [defectID]     INT NULL,
    [customerID]   INT NULL,
    CONSTRAINT [FK_Mechanic Services Fact Table_Car] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([CarID]),
    CONSTRAINT [FK_Mechanic Services Fact Table_Customer] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_Mechanic Services Fact Table_Defects] FOREIGN KEY ([defectID]) REFERENCES [dbo].[Defects] ([defectID]),
    CONSTRAINT [FK_Mechanic Services Fact Table_Mechanic] FOREIGN KEY ([mechanicID]) REFERENCES [dbo].[Mechanic] ([mechanicID]),
);

CREATE TABLE [dbo].[Mechanic Services Aggregate Fact Table] (
    [mechanicID]     INT NULL,
[numberOfservices] INT  NULL,
    CONSTRAINT [FK_Mechanic Services Aggregate Fact Table_Mechanic] FOREIGN KEY ([mechanicID]) REFERENCES [dbo].[Mechanic] ([mechanicID])
);

CREATE TABLE [dbo].[car manufacturer service Aggregate Fact Table] (
    [manufacturerID] INT NULL,
[service count] INT NULL,
    CONSTRAINT [FK_Mechanic Services Aggregate Fact Table_Mfghjechanic] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([carmanufacturerID])
);


CREATE TABLE [dbo].[car model Aggregate Fact Table] (
    [modelID] INT NULL,
[no or cars] INT NULL,
    CONSTRAINT [FK_Mechanic Services Fact Table_Dgvhbeffghjjjjjects] FOREIGN KEY ([modelID]) REFERENCES [dbo].[Model] ([modelCode])
);

-----------------------------------------------------------------------------------------------------------------------------------
------------------DATA MART 3----------------------
-----------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[Car Part Supplier Fact Table] (
    [supplierID] INT NULL,
    [partID]     INT NULL,

    CONSTRAINT [FK_Car Part Supplier Fact Table_Part] FOREIGN KEY ([partID]) REFERENCES [dbo].[Part] ([partID]),
    CONSTRAINT [FK_Car Part Supplier Fact Table_Supplier] FOREIGN KEY ([supplierID]) REFERENCES [dbo].[Supplier] ([supplierID])
);

create table [dbo].[Car Part Supplier Aggregate Fact Table] (
[supplierID] INT NULL,
[numberOfPartsSupplied] INT NULL,
CONSTRAINT [FK_Car Part Supplier Fact Table_Supplier2] FOREIGN KEY ([supplierID]) REFERENCES [dbo].[Supplier] ([supplierID])
)


SELECT TOP(1)* 
from [dbo].[car sale aggregate fact table]
order by numberOfCustomers desc

SELECT carID, numberOfCustomers
from [dbo].[car sale aggregate fact table]

SELECT TOP(2)* 
from [dbo].[preference Aggregate Fact Table]
order by [count] desc

SELECT TOP(1)*
FROM dbo.[car manufacturer service Aggregate Fact Table]
order by [service count] desc

SELECT TOP(1)* 
FROM dbo.[Mechanic Services Aggregate Fact Table]
order by numberOfservices desc

SELECT TOP(1)*  
FROM dbo.[Parts Order Aggregate Fact Table]
order by [numberOfUnits]desc

SELECT TOP(1) modelID as modelCode, [no or cars] as[no of parts] 
FROM dbo.[car model Aggregate Fact Table]
order by [no or cars] desc

SELECT TOP(1)* 
FROM dbo.[Car Part Supplier Aggregate Fact Table]
order by [numberOfPartsSupplied] desc

SELECT * FROM [dbo].[Car Part Supplier Fact Table]
SELECT * FROM dbo.[Car Part Supplier Aggregate Fact Table]
SELECT * FROM dbo.[Parts Order Fact Table]
SELECT * FROM dbo.[Parts Order Aggregate Fact Table]
SELECT * FROM dbo.[Mechanic Services Fact Table]
SELECT * FROM dbo.[Mechanic Services Aggregate Fact Table]
SELECT * FROM dbo.[car manufacturer service Aggregate Fact Table]
SELECT * FROM dbo.[car model Aggregate Fact Table]
select * from [dbo].[InventoryFactTable]
select * from [dbo].[preference Aggregate Fact Table]
select * from [dbo].[monthly sales aggregate fact table]
select * from [dbo].[car sale aggregate fact table]
select * from [dbo].[sales fact table]
SELECT * FROM dbo.[Part Levels]
SELECT * FROM dbo.[part types]
SELECT * FROM dbo.[part manufacturer]

SELECT partID, dm_partID, name, otherDetails, numberInStack FROM dbo.Part
SELECT supplierID, dm_supplierID, supplierDescription from  dbo.Supplier
SELECT carmanufacturerID, dm_carmanufacturerID, name FROM dbo.Manufacturer
SELECT timeID, dm_timeID, monthID FROM dbo.Time
SELECT modelCode, dm_modelCode, modelName FROM dbo.Model
SELECT carID, dm_carID, askingPrice, agreedPrice, lisenceNumber, otherCarDetails, modelID FROM dbo.Car
SELECT * FROM dbo.Defects
SELECT partID, dm_partID, partDescription, otherDetails FROM  dbo.Part
SELECT customerID, dm_customerID, email, contactNo, address, city, state, country FROM dbo.Customer
SELECT * FROM dbo.Mechanic
select carmanufacturerID, dm_carmanufacturerID, name  from [dbo].[Manufacturer]
select * from [dbo].[VehicleCategory]
select * from [dbo].[Feature]
select * from [dbo].[year]
select regionID, dm_regionID, city from [dbo].[Region]
select * from [dbo].[month]


DELETE FROM dbo.[Part Levels]
DELETE FROM dbo.[part types]
DELETE FROM dbo.[part manufacturer]
DELETE FROM dbo.Part
DELETE FROM dbo.Supplier

DELETE FROM dbo.Manufacturer
DELETE FROM dbo.Time
DELETE FROM dbo.Model
DELETE FROM dbo.Car
DELETE FROM dbo.Defects
DELETE FROM  dbo.Part
DELETE FROM dbo.Customer
DELETE FROM dbo.Mechanic

delete from [dbo].VehicleCategory
delete from [dbo].[Car]
delete from [dbo].[Customer]
delete from [dbo].[Feature]
delete from [dbo].[year]
delete from [dbo].[Region]
delete from [dbo].[month]
delete from [dbo].[Time]

DELETE FROM [dbo].[Car Part Supplier Fact Table]
DELETE FROM dbo.[Car Part Supplier Aggregate Fact Table]
DELETE FROM dbo.[Parts Order Fact Table]
DELETE FROM dbo.[Parts Order Aggregate Fact Table]
DELETE FROM dbo.[Mechanic Services Fact Table]
DELETE FROM dbo.[Mechanic Services Aggregate Fact Table]

DELETE FROM dbo.[car manufacturer service Aggregate Fact Table]
DELETE FROM dbo.[Parts Order Aggregate Fact Table]
DELETE FROM dbo.[car model Aggregate Fact Table]
delete from [dbo].[InventoryFactTable]
delete from [dbo].[preference Aggregate Fact Table]
delete from [dbo].[monthly sales aggregate fact table]
delete from [dbo].[car sale aggregate fact table]
DELETE FROM dbo.[Parts Order Fact Table]
DELETE FROM dbo.[Mechanic Services Fact Table]
delete from [dbo].[sales fact table]