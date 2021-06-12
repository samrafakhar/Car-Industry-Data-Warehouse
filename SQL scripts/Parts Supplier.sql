create database partsSupplier
use partsSupplier

CREATE TABLE [dbo].[carModel] (
    [modelID] INT        NOT NULL,
    [name]    NCHAR (50) NULL,
    CONSTRAINT [PK_carModel] PRIMARY KEY ([modelID])
);

CREATE TABLE [dbo].[Supplier] (
    [supplierID]          INT         NOT NULL,
    [name]                NCHAR (50)  NULL,
    [supplierDescription] NCHAR (100) NULL,
    CONSTRAINT [PK_Supplier] PRIMARY KEY ([supplierID])
);

CREATE TABLE [dbo].[Part Levels] (
    [partLevelID]          INT        NOT NULL,
    [partLevelDescription] NCHAR (50) NOT NULL,
    CONSTRAINT [PK_Part Levels] PRIMARY KEY ([partLevelID])
);

CREATE TABLE [dbo].[part manufacturer] (
    [partMnufacturerID]    INT        NOT NULL,
    [partManufacturerName] NCHAR (50) NOT NULL,
    CONSTRAINT [PK_part manufacturer] PRIMARY KEY ([partMnufacturerID])
);

CREATE TABLE [dbo].[part types] (
    [partTypeID]          INT        NOT NULL,
    [partTypeDescription] NCHAR (50) NOT NULL,
    CONSTRAINT [PK_part types] PRIMARY KEY ([partTypeID])
);

CREATE TABLE [dbo].[Car] (
    [carID]          INT        NOT NULL,
    [manufacturerID] INT        NOT NULL,
    [name]           NCHAR (50) NOT NULL,
    [modelID]        INT        NOT NULL,
    CONSTRAINT [PK_Car] PRIMARY KEY ([carID]),
    CONSTRAINT [FK_Car_carModel] FOREIGN KEY ([modelID]) REFERENCES [dbo].[carModel] ([modelID]),
    CONSTRAINT [FK_Car_part manufacturer] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[part manufacturer] ([partMnufacturerID])
);

CREATE TABLE [dbo].[Part] (
    [partID]              INT        NOT NULL,
    [name]                NCHAR (50) NOT NULL,
    [weight]              INT        NOT NULL,
    [condition]           NCHAR (50) NOT NULL,
    [mileage]             INT        NOT NULL,
    [otherDetails]        NCHAR (50) NOT NULL,
    [partManufactureCode] INT        NOT NULL,
    [partTypeCode]        INT        NOT NULL,
    [partLevelCode]       INT        NOT NULL,
    CONSTRAINT [PK_Part] PRIMARY KEY ([partID]),
    CONSTRAINT [FK_Part_Part Levels] FOREIGN KEY ([partLevelCode]) REFERENCES [dbo].[Part Levels] ([partLevelID]),
    CONSTRAINT [FK_Part_part manufacturer] FOREIGN KEY ([partManufactureCode]) REFERENCES [dbo].[part manufacturer] ([partMnufacturerID]),
    CONSTRAINT [FK_Part_part types] FOREIGN KEY ([partTypeCode]) REFERENCES [dbo].[part types] ([partTypeID])
);

CREATE TABLE [dbo].[Car Model Parts Supplier Aggregate Fact Table] (
    [modelID]    INT NOT NULL,
    [partID]     INT NOT NULL,
    [supplierID] INT NOT NULL,
    [profit]     INT NOT NULL,
    [salePrice]  INT NOT NULL,
    [netSale]    INT NOT NULL,
    [margin]     INT NOT NULL,
    CONSTRAINT [FK_Car Model Parts Supplier Aggregate Fact Table_carModel] FOREIGN KEY ([modelID]) REFERENCES [dbo].[carModel] ([modelID]),
    CONSTRAINT [FK_Car Model Parts Supplier Aggregate Fact Table_Part] FOREIGN KEY ([partID]) REFERENCES [dbo].[Part] ([partID]),
    CONSTRAINT [FK_Car Model Parts Supplier Aggregate Fact Table_Supplier] FOREIGN KEY ([supplierID]) REFERENCES [dbo].[Supplier] ([supplierID])
);

CREATE TABLE [dbo].[Car Part Supplier Fact Table] (
    [carID]      INT NOT NULL,
    [supplierID] INT NOT NULL,
    [partID]     INT NOT NULL,
    [costPrice]  INT NOT NULL,
    [salePrice]  INT NOT NULL,
    [Margin]     INT NOT NULL,
    [Profit]     INT NOT NULL,
    CONSTRAINT [FK_Car Part Supplier Fact Table_Car] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([carID]),
    CONSTRAINT [FK_Car Part Supplier Fact Table_Part] FOREIGN KEY ([partID]) REFERENCES [dbo].[Part] ([partID]),
    CONSTRAINT [FK_Car Part Supplier Fact Table_Supplier] FOREIGN KEY ([supplierID]) REFERENCES [dbo].[Supplier] ([supplierID])
);

CREATE TABLE [dbo].[Part Level Manufacture Aggregate Fact Table] (
    [partManufactureID] INT NOT NULL,
    [partTypeID]        INT NOT NULL,
    [partLevelID]       INT NOT NULL,
    [supplierID]        INT NOT NULL,
    [carID]             INT NOT NULL,
    [salePrice]         INT NOT NULL,
    [netSale]           INT NOT NULL,
    [margin]            INT NOT NULL,
    [Profit]            INT NOT NULL,
    CONSTRAINT [FK_Part Level Manufacture Aggregate Fact Table_Car] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([carID]),
    CONSTRAINT [FK_Part Level Manufacture Aggregate Fact Table_Part Levels] FOREIGN KEY ([partLevelID]) REFERENCES [dbo].[Part Levels] ([partLevelID]),
    CONSTRAINT [FK_Part Level Manufacture Aggregate Fact Table_part manufacturer] FOREIGN KEY ([partManufactureID]) REFERENCES [dbo].[part manufacturer] ([partMnufacturerID]),
    CONSTRAINT [FK_Part Level Manufacture Aggregate Fact Table_part types] FOREIGN KEY ([partTypeID]) REFERENCES [dbo].[part types] ([partTypeID]),
    CONSTRAINT [FK_Part Level Manufacture Aggregate Fact Table_Supplier] FOREIGN KEY ([supplierID]) REFERENCES [dbo].[Supplier] ([supplierID])
);



