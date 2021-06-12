create database CarIndustryDataWarehouse
use CarIndustryDataWarehouse

CREATE TABLE [dbo].[Manufacturer] (
    [manufacturerID]     INT         NOT NULL,
    [manufacturerName]   NCHAR (50)  NULL,
    [manufactureDetails] NCHAR (100) NULL,
    CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED ([manufacturerID] ASC)
);

CREATE TABLE [dbo].[Model] (
    [modelCode]      INT         NOT NULL,
    [modelName]      NCHAR (50)  NULL,
    [otherDetails]   NCHAR (100) NULL,
    [manufacturerID] INT         NOT NULL,
    CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED ([modelCode] ASC),
    CONSTRAINT [FK_Model_Manufacturer] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([manufacturerID])
);

CREATE TABLE [dbo].[Car] (
    [CarID]           INT        NOT NULL,
    [lisenceNumber]   INT        NOT NULL,
    [engineSize]      INT        NOT NULL,
    [otherCarDetails] NCHAR (50) NULL,
    [currentMilage]   INT        NOT NULL,
    [modelCode]       INT        NOT NULL,
    CONSTRAINT [PK_Car] PRIMARY KEY ([CarID]),
    CONSTRAINT [FK_Car_Model] FOREIGN KEY ([modelCode]) REFERENCES [dbo].[Model] ([modelCode])
);

CREATE TABLE [dbo].[Defects] (
    [defectID]          INT         NOT NULL,
    [defectDescription] NCHAR (100) NULL,
    [date]              DATE        NULL,
    [otherDetails]      NCHAR (50)  NULL,
	CONSTRAINT [PK_Defects] PRIMARY KEY ([defectID] )
);

CREATE TABLE [dbo].[Part] (
    [partID]          INT         NOT NULL,
    [partName]        NCHAR (50)  NULL,
    [partDescription] NCHAR (100) NULL,
    [numberInStack]   INT         NULL,
    [otherDetails]    NCHAR (100) NULL,
    CONSTRAINT [PK_Part] PRIMARY KEY ([partID])
);

CREATE TABLE [dbo].[Customer] (
    [customerID]   INT         NOT NULL,
    [customerName] NCHAR (50)  NULL,
    [gender]       NCHAR (10)  NULL,
    [email]        NCHAR (50)  NULL,
    [contactNo]    NCHAR (20)  NULL,
    [address]      NCHAR (100) NULL,
    [city]         NCHAR (50)  NULL,
    [state]        NCHAR (10)  NULL,
    [country]      NCHAR (50)  NULL,
    [otherDetails] NCHAR (100) NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY ([customerID])
);

CREATE TABLE [dbo].[Mechanic] (
    [mechanicID]      INT         NOT NULL,
    [mechanicName]    NCHAR (50)  NULL,
    [mechanicDetails] NCHAR (100) NULL,
    CONSTRAINT [PK_Mechanic] PRIMARY KEY ([mechanicID])
);

CREATE TABLE [dbo].[Parts Order Fact Table] (
    [partID]       INT NULL,
    [carID]        INT NULL,
    [defectID]     INT NULL,
    [customerID]   INT NULL,
    [unitPrice]    INT NULL,
    [salePrice]    INT NULL,
    [profitMargin] INT NULL,
    [prcentProfit] INT NULL,
    CONSTRAINT [FK_Parts Order Fact Table_Car] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([CarID]),
    CONSTRAINT [FK_Parts Order Fact Table_Customer] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_Parts Order Fact Table_Defects] FOREIGN KEY ([defectID]) REFERENCES [dbo].[Defects] ([defectID]),
    CONSTRAINT [FK_Parts Order Fact Table_Part_Part] FOREIGN KEY ([partID]) REFERENCES [dbo].[Part] ([partID])
);

CREATE TABLE [dbo].[Parts Order Aggregate Fact Table] (
    [partID]         INT NULL,
    [manufacturerID] INT NULL,
    [defectID]       INT NULL,
    [customerID]     INT NULL,
    [grossSales]     INT NULL,
    [totalCost]      INT NULL,
    [totalProfit]    INT NULL,
    CONSTRAINT [FK_Parts Order Aggregate Fact Table_Customer] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_Parts Order Aggregate Fact Table_Defects] FOREIGN KEY ([defectID]) REFERENCES [dbo].[Defects] ([defectID]),
    CONSTRAINT [FK_Parts Order Aggregate Fact Table_Manufacturer] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([manufacturerID]),
    CONSTRAINT [FK_Parts Order Aggregate Fact Table_Part] FOREIGN KEY ([partID]) REFERENCES [dbo].[Part] ([partID])
);

CREATE TABLE [dbo].[Mechanic Services Fact Table] (
    [mechanicID]   INT NULL,
    [carID]        INT NULL,
    [defectID]     INT NULL,
    [customerID]   INT NULL,
    [serviceCost]  INT NULL,
    [profitMargin] INT NULL,
    CONSTRAINT [FK_Mechanic Services Fact Table_Car] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([CarID]),
    CONSTRAINT [FK_Mechanic Services Fact Table_Customer] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_Mechanic Services Fact Table_Defects] FOREIGN KEY ([defectID]) REFERENCES [dbo].[Defects] ([defectID]),
    CONSTRAINT [FK_Mechanic Services Fact Table_Mechanic] FOREIGN KEY ([mechanicID]) REFERENCES [dbo].[Mechanic] ([mechanicID])
);

CREATE TABLE [dbo].[Mechanic Services Aggregate Fact Table] (
    [mechanicID]     INT NULL,
    [manufacturerID] INT NULL,
    [defectID]       INT NULL,
    [customerID]     INT NULL,
    [totalCost]      INT NULL,
    [totalPrice]     INT NULL,
    [grossProfit]    INT NULL,
    CONSTRAINT [FK_Mechanic Services Aggregate Fact Table_Customer] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_Mechanic Services Aggregate Fact Table_Defects] FOREIGN KEY ([defectID]) REFERENCES [dbo].[Defects] ([defectID]),
    CONSTRAINT [FK_Mechanic Services Aggregate Fact Table_Manufacturer] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([manufacturerID]),
    CONSTRAINT [FK_Mechanic Services Aggregate Fact Table_Mechanic] FOREIGN KEY ([mechanicID]) REFERENCES [dbo].[Mechanic] ([mechanicID])
);

