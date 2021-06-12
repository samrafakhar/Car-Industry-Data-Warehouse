--Drop database [integrated model]
Create database [integrated model]
use [integrated model]

CREATE TABLE [dbo].[Manufacturer] (
    [carmanufacturerID] INT        NOT NULL identity(1,1),
    [name]    NCHAR (100) NULL,
[manufactureDetails] NCHAR (100) NULL,
------[source_manufacturerID]     INT         NOT NULL, --Fatima
    CONSTRAINT [PK_carModel] PRIMARY KEY ([carmanufacturerID])
);

CREATE TABLE [dbo].[Model] (
    [modelCode]      INT         NOT NULL IDENTITY(1,1),
    [modelName]      NCHAR (100)  NULL,
    [otherDetails]   NCHAR (100) NULL,
    [manufacturerID] INT         NOT NULL,
    CONSTRAINT [PK_Model] PRIMARY KEY ([modelCode] ),
    CONSTRAINT [FK_Model_Manufacturer] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([carmanufacturerID])
);

CREATE TABLE [dbo].[VehicleCategory] (
    [CategoryID]  INT        NOT NULL identity(1,1),
    [description] NCHAR (100) NULL,
    [modelId]     INT        NULL,
    CONSTRAINT [PK_Vehicle Category] PRIMARY KEY ([CategoryID]),
    CONSTRAINT [FK_Vehicle Category_Model] FOREIGN KEY ([modelId]) REFERENCES [dbo].[Model] ([modelCode])
);

CREATE TABLE [dbo].[Car] (
    [carID]          INT        NOT NULL identity(1,1),
    [vehicleCategoryID] INT NULL,
    [lisenceNumber]   INT        NOT NULL,
    [engineSize]      INT        NULL,
    [otherCarDetails] NCHAR (100) NULL,
    [currentMilage]   INT        NULL,
    CONSTRAINT [PK_Car] PRIMARY KEY ([carID]),
    CONSTRAINT [FK_Car_sales vehicleCategoryID] FOREIGN KEY ([vehicleCategoryID]) REFERENCES [dbo].[VehicleCategory] ([CategoryID])
);

CREATE TABLE [dbo].[Feature] (
    [featureID]   INT        NOT NULL identity(1,1),
    [description] NCHAR (100) NULL,
    CONSTRAINT [PK_Feature] PRIMARY KEY ([featureID])
);

CREATE TABLE [dbo].[Region] (
    [regionID] INT NOT NULL identity(1,1),
    [zip]      INT NULL,
    [city]   NCHAR(100) NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY ([regionID])
);

CREATE TABLE [dbo].[Mechanic] (
    [mechanicID]      INT         NOT NULL IDENTITY(1,1),
    [mechanicName]    NCHAR (100)  NULL,
    [mechanicDetails] NCHAR (100) NULL,
    CONSTRAINT [PK_Mechanic] PRIMARY KEY ([mechanicID])
);

CREATE TABLE [dbo].[year] (
    [yearID] INT NOT NULL identity(1,1),
    CONSTRAINT [PK_year] PRIMARY KEY([yearID])
);

CREATE TABLE [dbo].[month] (
    [monthID] INT NOT NULL identity(1,1),
    [yearID]    INT NULL,
    CONSTRAINT [PK_month] PRIMARY KEY ([monthID]),
    CONSTRAINT [FK_month_year] FOREIGN KEY ([yearID]) REFERENCES [dbo].[year] ([yearID])
);

CREATE TABLE [dbo].[Time] (
    [timeID] INT NOT NULL identity(1,1),
    [day]    INT NULL,
    [monthID] INT NULL,
[date] DATE NOT NULL
    CONSTRAINT [PK_Time] PRIMARY KEY ([timeID]),
    CONSTRAINT [FK_Time_week] FOREIGN KEY ([monthID]) REFERENCES [dbo].[month] ([monthID])
);

CREATE TABLE [dbo].[Supplier] (
    [supplierID]          INT         NOT NULL identity(1,1),
    [name]                NCHAR (100)  NULL,
    [supplierDescription] NCHAR (100) NULL,
    CONSTRAINT [PK_Supplier] PRIMARY KEY ([supplierID])
);

CREATE TABLE [dbo].[Part Levels] (
    [partLevelID]          INT        NOT NULL identity(1,1),
    [partLevelDescription] NCHAR (100) NOT NULL,
    CONSTRAINT [PK_Part Levels] PRIMARY KEY ([partLevelID])
);

CREATE TABLE [dbo].[part manufacturer] (
    [partMnufacturerID]    INT        NOT NULL identity(1,1),
    [partManufacturerName] NCHAR (100) NOT NULL,
    CONSTRAINT [PK_part manufacturer] PRIMARY KEY ([partMnufacturerID])
);

CREATE TABLE [dbo].[part types] (
    [partTypeID]          INT        NOT NULL identity(1,1),
    [partTypeDescription] NCHAR (100) NOT NULL,
    CONSTRAINT [PK_part types] PRIMARY KEY ([partTypeID])
);

CREATE TABLE [dbo].[Defects] (
    [defectID]          INT         NOT NULL IDENTITY(1,1),
    [defectDescription] NCHAR (100) NULL,
    [date]              DATE        NULL,
    [otherDetails]      NCHAR (100)  NULL,
CONSTRAINT [PK_Defects] PRIMARY KEY ([defectID] )
);

CREATE TABLE [dbo].[Customer] (
    [customerID]   INT         NOT NULL IDENTITY(1,1),
    [customerName] NCHAR (100)  NULL,
    [email]        NCHAR (100)  NULL,
    [contactNo]    NCHAR (20)  NULL,
    [address]      NCHAR (100) NULL,
    [city]         NCHAR (100)  NULL,
    [state]        NCHAR (100)  NULL,
    [country]      NCHAR (100)  NULL,
    [otherDetails] NCHAR (100) NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY ([customerID])
);

------

CREATE TABLE [dbo].[Part] (
    [partID]              INT        NOT NULL identity(1,1),
    [name]                NCHAR (100) NOT NULL,
[partDescription] NCHAR (100) NULL,
    [weight]              INT        NOT NULL,
    [condition]           NCHAR (100) NOT NULL,
    [mileage]             INT        NOT NULL,
    [otherDetails]        NCHAR (100) NOT NULL,
    [partManufactureCode] INT        NOT NULL,
    [partTypeCode]        INT        NOT NULL,
    [partLevelCode]       INT        NOT NULL,
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
    [askingPrice]     INT NOT NULL,
    [carID]           INT,
    [timeID]          INT,

PRIMARY KEY([carID],[timeID]),
   
    CONSTRAINT [FK_InventoryFactTable_Car1] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([carID]),
    CONSTRAINT [FK_InventoryFactTable_Time1] FOREIGN KEY ([timeID]) REFERENCES [dbo].[Time] ([timeID])
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
    CONSTRAINT [FK_monthly sales aggregate fact table_month] FOREIGN KEY ([monthID]) REFERENCES [dbo].[month] ([monthID])
);

--CREATE TABLE [dbo].[monthly vehicle category aggregate fact table] (
--    [quantitySold] INT NULL,
--    [totalCost]    INT NULL,
   
-- [categoryID]   INT NULL,
-- [monthID] INT NULL,
--    PRIMARY KEY([categoryID],[monthID]),
--    CONSTRAINT [FK_monthly vehicle category aggregate fact table_month] FOREIGN KEY ([monthID]) REFERENCES [dbo].[month] ([monthID]),
--    CONSTRAINT [FK_monthly vehicle category aggregate fact table_Region2] FOREIGN KEY ([regionID]) REFERENCES [dbo].[Region] ([regionID]),
--    CONSTRAINT [FK_monthly vehicle category aggregate fact table_Vehicle Category1] FOREIGN KEY ([categoryID]) REFERENCES [dbo].[Vehicle Category] ([CategoryID])
--);


--for most demanded car
CREATE TABLE [dbo].[car sale aggregate fact table](
[carID] INT,
[numberOfCustomers] INT,
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
[TimeID]   INT NULL,

    CONSTRAINT [FK_Parts Order Fact Table_Car] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([CarID]),
    CONSTRAINT [FK_Parts Order Fact Table_Customer] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_Parts Order Fact Table_Defects] FOREIGN KEY ([defectID]) REFERENCES [dbo].[Defects] ([defectID]),
    CONSTRAINT [FK_Parts Order Fact Table_Part_Part] FOREIGN KEY ([partID]) REFERENCES [dbo].[Part] ([partID]),
CONSTRAINT [FK_Mechanic Services Fact Table_Time] FOREIGN KEY ([TimeID]) REFERENCES [dbo].[Time] ([TimeID])
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
[TimeID] INT NULL,
    CONSTRAINT [FK_Mechanic Services Fact Table_Car] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([CarID]),
    CONSTRAINT [FK_Mechanic Services Fact Table_Customer] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_Mechanic Services Fact Table_Defects] FOREIGN KEY ([defectID]) REFERENCES [dbo].[Defects] ([defectID]),
    CONSTRAINT [FK_Mechanic Services Fact Table_Mechanic] FOREIGN KEY ([mechanicID]) REFERENCES [dbo].[Mechanic] ([mechanicID]),
CONSTRAINT [FK_Mechanic Services Fact Table_gchvvTime2] FOREIGN KEY ([TimeID]) REFERENCES [dbo].[Time] ([TimeID])
);

CREATE TABLE [dbo].[Mechanic Services Aggregate Fact Table] (
    [mechanicID]     INT NULL,
[numberOfservices] INT  NULL,
    CONSTRAINT [FK_Mechanic Services Aggregate Fact Table_Mechanic] FOREIGN KEY ([mechanicID]) REFERENCES [dbo].[Mechanic] ([mechanicID])
);

CREATE TABLE [dbo].[car manufacturer service fact table] (
    [modelID] INT NULL,
[TimeID]   INT NULL,
    [carID]        INT NULL,
[manufacturerID] INT NULL,

    CONSTRAINT [FK_Mechanic Services Fact Table_hjvbjCar] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([CarID]),
    CONSTRAINT [FK_Mechanic Services Fact Table_Dgvhbefects] FOREIGN KEY ([modelID]) REFERENCES [dbo].[Model] ([modelCode]),
    CONSTRAINT [FK_Mechanic Services Fact Table_Megvhbchanic] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([carmanufacturerID]),
CONSTRAINT [FK_Mechanic Services Fact Table_gchhbvvTime2] FOREIGN KEY ([TimeID]) REFERENCES [dbo].[Time] ([TimeID])
);

CREATE TABLE [dbo].[car manufacturer service Aggregate Fact Table] (
    [manufacturerID] INT NULL,
[service count] INT NULL,
    CONSTRAINT [FK_Mechanic Services Aggregate Fact Table_Mfghjechanic] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([carmanufacturerID])
);

CREATE TABLE [dbo].[car model fact table] (
    [modelID] INT NULL,
[TimeID]   INT NULL,
    [carID]        INT NULL,

    CONSTRAINT [FK_Mechanic Services Fact Tabledfghj_hjvbjCar] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([CarID]),
    CONSTRAINT [FK_Mechanic Services Fact Tablefgh_Dgvhbefects] FOREIGN KEY ([modelID]) REFERENCES [dbo].[Model] ([modelCode]),
CONSTRAINT [FK_Mechanic Services Fact Tablefghj_gchhbvvTime2] FOREIGN KEY ([TimeID]) REFERENCES [dbo].[Time] ([TimeID])
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
    [supplierID] INT NOT NULL,
    [partID]     INT NOT NULL,

    CONSTRAINT [FK_Car Part Supplier Fact Table_Part] FOREIGN KEY ([partID]) REFERENCES [dbo].[Part] ([partID]),
    CONSTRAINT [FK_Car Part Supplier Fact Table_Supplier] FOREIGN KEY ([supplierID]) REFERENCES [dbo].[Supplier] ([supplierID])
);

create table [dbo].[Car Part Supplier Aggregate Fact Table] (
[supplierID] INT NOT NULL,
[numberOfPartsSupplied] INT NOT NULL,
CONSTRAINT [FK_Car Part Supplier Fact Table_Supplier2] FOREIGN KEY ([supplierID]) REFERENCES [dbo].[Supplier] ([supplierID])
)

