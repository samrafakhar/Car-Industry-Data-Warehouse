--DROP DATABASE dest1
--CREATE  DATABASE dest1
--USE dest1

CREATE TABLE [dbo].[Manufacturer] (
    [manufacturerID] INT        NOT NULL identity(1,1),
    [source_manufacturer] NCHAR(100)       NOT NULL,
    [fullName]       NCHAR (100) NULL,
    CONSTRAINT [PK_Manufacturer] PRIMARY KEY ([manufacturerID])
);

CREATE TABLE [dbo].[Model] (
    [modelID]        INT        NOT NULL identity(1,1),
    [source_modelID]        INT        NOT NULL,
    [modelName]      NCHAR (100) NULL,
    CONSTRAINT [PK_Model] PRIMARY KEY ([modelID]),
   
);

CREATE TABLE [dbo].[Vehicle Category] (
    [CategoryID]  INT        NOT NULL identity(1,1),
[source_CategoryID]  INT        NOT NULL ,
    [description] NCHAR (100) NULL,
    [modelId]     INT        NULL,
    CONSTRAINT [PK_Vehicle Category] PRIMARY KEY ([CategoryID]),
    CONSTRAINT [FK_Vehicle Category_Model] FOREIGN KEY ([modelId]) REFERENCES [dbo].[Model] ([modelID])
);

CREATE TABLE [dbo].[Car] (
    [carID]             INT NOT NULL identity(1,1),
[source_carSoldID]             INT NULL,
[source_carForSaleID] INT NULL,
    [vehicleCategoryID] INT NULL,
    [registationYear]   INT NULL,
[currentMileage]  INT NULL,
[askingPrice] INT NULL,
[agreedPrice] INT NULL,
    CONSTRAINT [PK_Car] PRIMARY KEY ([carID]),
    CONSTRAINT [FK_Car_Vehicle Category] FOREIGN KEY ([vehicleCategoryID]) REFERENCES [dbo].[Vehicle Category] ([CategoryID])
);

CREATE TABLE [dbo].[Customer] (
    [customerID]   INT        NOT NULL identity(1,1),
[source_customerID]   INT        NOT NULL,
    [name]         NCHAR (100) NULL,
    [cellPhone]    NCHAR (100) NULL,
    [emailAddress] NCHAR (100) NULL,
    [Address]      NCHAR (100) NULL,
[city]         NCHAR (100)  NULL,
    [state]        NCHAR (100)  NULL,
    [country]      NCHAR (100)  NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY ([customerID])
);

CREATE TABLE [dbo].[Feature] (
    [featureID]   INT        NOT NULL identity(1,1),
[source_featureID]   INT        NOT NULL ,
    [description] NCHAR (100) NULL,
    CONSTRAINT [PK_Feature] PRIMARY KEY ([featureID])
);

--/////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE [dbo].[Region] (
    [regionID] INT NOT NULL identity(1,1),
[source_regionID] INT NOT NULL ,
    [zip]      INT NULL,
    [city]   NCHAR(100) NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY ([regionID]),
);

--/////////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE [dbo].[year] (
    [yearID] INT NOT NULL identity(1,1),
    [source_yearID] INT NOT NULL ,
    CONSTRAINT [PK_year] PRIMARY KEY([yearID])
);

CREATE TABLE [dbo].[month] (
    [monthID] INT NOT NULL identity(1,1),
    [source_monthID] INT NOT NULL,
    [yearID]    INT NULL,
    CONSTRAINT [PK_month] PRIMARY KEY ([monthID]),
    CONSTRAINT [FK_month_year] FOREIGN KEY ([yearID]) REFERENCES [dbo].[year] ([yearID])
);

CREATE TABLE [dbo].[Time] (
    [timeID] INT NOT NULL identity(1,1),
    [source_timeID] INT NOT NULL,
    [day]    INT NULL,
    [monthID] INT NULL,
    CONSTRAINT [PK_Time] PRIMARY KEY ([timeID]),
    CONSTRAINT [FK_Time_week] FOREIGN KEY ([monthID]) REFERENCES [dbo].[month] ([monthID])
);


---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
------------ FACT TABLES -----------


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

delete from [dbo].[Manufacturer]
delete from [dbo].[Model]
delete from [dbo].[Vehicle Category]
delete from [dbo].[Car]
delete from [dbo].[Customer]
delete from [dbo].[Feature]
delete from [dbo].[Time]
delete from [dbo].[month]
delete from [dbo].[year]
delete from [dbo].[Region]
delete from [dbo].[InventoryFactTable]
delete from [dbo].[preference Aggregate Fact Table]
delete from [dbo].[monthly sales aggregate fact table]
delete from [dbo].[car sale aggregate fact table]
delete from [dbo].[sales fact table]


select * from [dbo].[Manufacturer]
select * from [dbo].[Model]
select * from [dbo].[Vehicle Category]
select * from [dbo].[Car]
select * from [dbo].[Customer]
select * from [dbo].[Feature]
select * from [dbo].[year]
select * from [dbo].[Region]
select * from [dbo].[month]
select * from [dbo].[Time]
select * from [dbo].[InventoryFactTable]
select * from [dbo].[preference Aggregate Fact Table]
select * from [dbo].[monthly sales aggregate fact table]
select * from [dbo].[car sale aggregate fact table]
select * from [dbo].[sales fact table]