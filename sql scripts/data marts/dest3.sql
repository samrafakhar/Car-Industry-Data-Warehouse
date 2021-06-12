--DROP DATABASE dest3
--CREATE  DATABASE dest3
--USE dest3

CREATE TABLE [dbo].[carManufacturer] (
    [carmanufacturerID] INT        NOT NULL identity(1,1),
    [source_carmanufacturerID] INT        NOT NULL,
    [name]    NCHAR (100) NULL,
    CONSTRAINT [PK_carModel] PRIMARY KEY ([carmanufacturerID])
);

CREATE TABLE [dbo].[Supplier] (
    [supplierID]          INT         NOT NULL identity(1,1),
[source_supplierID]          INT         NOT NULL,
    [name]                NCHAR (100)  NULL,
    [supplierDescription] NCHAR (100) NULL,
    CONSTRAINT [PK_Supplier] PRIMARY KEY ([supplierID])
);

CREATE TABLE [dbo].[Part Levels] (
    [partLevelID]          INT        NOT NULL identity(1,1),
[source_partLevelID]          INT        NOT NULL ,
    [partLevelDescription] NCHAR (100) NOT NULL,
    CONSTRAINT [PK_Part Levels] PRIMARY KEY ([partLevelID])
);

CREATE TABLE [dbo].[part manufacturer] (
    [partMnufacturerID]    INT        NOT NULL identity(1,1),
[source_partMnufacturerID]    INT        NOT NULL ,
    [partManufacturerName] NCHAR (100) NOT NULL,
    CONSTRAINT [PK_part manufacturer] PRIMARY KEY ([partMnufacturerID])
);

CREATE TABLE [dbo].[part types] (
    [partTypeID]          INT        NOT NULL identity(1,1),
[source_partTypeID]          INT        NOT NULL ,
    [partTypeDescription] NCHAR (100) NOT NULL,
    CONSTRAINT [PK_part types] PRIMARY KEY ([partTypeID])
);

CREATE TABLE [dbo].[Car] (
    [carID]          INT        NOT NULL identity(1,1),
[source_carID]          INT        NOT NULL ,
    [carmanufacturerID] INT         NULL,
    [modelID]       NCHAR (100)  NULL,
    CONSTRAINT [PK_Car] PRIMARY KEY ([carID]),
    CONSTRAINT [FK_Car_part manufacturer] FOREIGN KEY ([carmanufacturerID]) REFERENCES [dbo].[carManufacturer] ([carmanufacturerID])
);

CREATE TABLE [dbo].[Part] (
    [partID]              INT        NOT NULL identity(1,1),
    [source_partID]              INT        NOT NULL ,
    [name]                NCHAR (100) NOT NULL,
    [weight]              INT        NOT NULL,
    [condition]           NCHAR (100) NOT NULL,
    [mileage]             INT        NOT NULL,
    [otherDetails]        NCHAR (100) NOT NULL,
    [partManufactureCode] INT        NOT NULL,
    [partTypeCode]        INT        NOT NULL,
    [partLevelCode]       INT        NOT NULL,
    CONSTRAINT [PK_Part] PRIMARY KEY ([partID]),
    CONSTRAINT [FK_Part_Part Levels] FOREIGN KEY ([partLevelCode]) REFERENCES [dbo].[Part Levels] ([partLevelID]),
    CONSTRAINT [FK_Part_part manufacturer] FOREIGN KEY ([partManufactureCode]) REFERENCES [dbo].[part manufacturer] ([partMnufacturerID]),
    CONSTRAINT [FK_Part_part types] FOREIGN KEY ([partTypeCode]) REFERENCES [dbo].[part types] ([partTypeID])
);

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

SELECT * FROM [dbo].[Car Part Supplier Fact Table]
SELECT * FROM dbo.[Car Part Supplier Aggregate Fact Table]
SELECT * FROM dbo.carManufacturer
SELECT * FROM dbo.[Part Levels]
SELECT * FROM dbo.[part types]
SELECT * FROM dbo.[part manufacturer]
SELECT * FROM dbo.Part
SELECT * FROM dbo.Supplier

DELETE FROM [dbo].[Car Part Supplier Fact Table]
DELETE FROM dbo.carManufacturer
DELETE FROM dbo.[Car Part Supplier Aggregate Fact Table]
DELETE FROM dbo.[Part Levels]
DELETE FROM dbo.[part types]
DELETE FROM dbo.[part manufacturer]
DELETE FROM dbo.Part
DELETE FROM dbo.Supplier
