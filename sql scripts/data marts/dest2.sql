--DROP DATABASE dest2
--CREATE  DATABASE dest2
--USE dest2

CREATE TABLE [dbo].[Manufacturer] (
    [manufacturerID]     INT         NOT NULL IDENTITY(1,1),
	[source_manufacturerID]     INT         NOT NULL,
    [manufacturerName]   NCHAR (100)  NULL,
    [manufactureDetails] NCHAR (100) NULL,
    CONSTRAINT [PK_Manufacturer] PRIMARY KEY  ([manufacturerID] )
);

CREATE TABLE [dbo].[Time](
	[TimeID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[source_TimeID] INT NOT NULL ,
	[date] DATE NOT NULL
)

CREATE TABLE [dbo].[Model] (
    [modelCode]      INT         NOT NULL IDENTITY(1,1),
	[source_modelCode]      INT         NOT NULL ,
    [modelName]      NCHAR (100)  NULL,
    [otherDetails]   NCHAR (100) NULL,
    [manufacturerID] INT         NOT NULL,
    CONSTRAINT [PK_Model] PRIMARY KEY ([modelCode] ),
    CONSTRAINT [FK_Model_Manufacturer] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([manufacturerID])
);

CREATE TABLE [dbo].[Car] (
    [CarID]           INT        NOT NULL IDENTITY(1,1),
    [lisenceNumber]   INT        NOT NULL,
    [engineSize]      INT        NULL,
    [otherCarDetails] NCHAR (100) NULL,
    [currentMilage]   INT        NULL,
    [modelCode]       INT        NULL,
    CONSTRAINT [PK_Car] PRIMARY KEY ([CarID]),
    CONSTRAINT [FK_Car_Model] FOREIGN KEY ([modelCode]) REFERENCES [dbo].[Model] ([modelCode])
);

CREATE TABLE [dbo].[Defects] (
    [defectID]          INT         NOT NULL IDENTITY(1,1),
	[source_defectID]          INT         NOT NULL,
    [defectDescription] NCHAR (100) NULL,
    [date]              DATE        NULL,
    [otherDetails]      NCHAR (100)  NULL,
	CONSTRAINT [PK_Defects] PRIMARY KEY ([defectID] )
);

CREATE TABLE [dbo].[Part] (
    [partID]          INT         NOT NULL IDENTITY(1,1),
	[source_partID]          INT         NOT NULL ,
    [partName]        NCHAR (100)  NULL,
    [partDescription] NCHAR (100) NULL,
    [numberInStack]   INT         NULL,
    [otherDetails]    NCHAR (100) NULL,
    CONSTRAINT [PK_Part] PRIMARY KEY ([partID])
);

CREATE TABLE [dbo].[Customer] (
    [customerID]   INT         NOT NULL IDENTITY(1,1),
	[source_customerID]   INT         NOT NULL ,
    [customerName] NCHAR (100)  NULL,
    [gender]       NCHAR (100)  NULL,
    [email]        NCHAR (100)  NULL,
    [contactNo]    NCHAR (20)  NULL,
    [address]      NCHAR (100) NULL,
    [city]         NCHAR (100)  NULL,
    [state]        NCHAR (100)  NULL,
    [country]      NCHAR (100)  NULL,
    [otherDetails] NCHAR (100) NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY ([customerID])
);

CREATE TABLE [dbo].[Mechanic] (
    [mechanicID]      INT         NOT NULL IDENTITY(1,1),
	[source_mechanicID]      INT         NOT NULL,
    [mechanicName]    NCHAR (100)  NULL,
    [mechanicDetails] NCHAR (100) NULL,
    CONSTRAINT [PK_Mechanic] PRIMARY KEY ([mechanicID])
);

CREATE TABLE [dbo].[Parts Order Fact Table] (
    [partID]       INT NULL,
    [carID]        INT NULL,
    [defectID]     INT NULL,
    [customerID]   INT NULL,
	[TimeID]	   INT NULL,

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

CREATE TABLE [dbo].[car manufacturer service Aggregate Fact Table] (
    [manufacturerID]		INT NULL,
	[service count] INT NULL,
    CONSTRAINT [FK_Mechanic Services Aggregate Fact Table_Mfghjechanic] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([manufacturerID])
);

CREATE TABLE [dbo].[car model Aggregate Fact Table] (
    [modelID]		INT NULL,
	[no of parts] INT NULL,
    CONSTRAINT [FK_Mechanic Services Fact Table_Dgvhbeffghjjjjjects] FOREIGN KEY ([modelID]) REFERENCES [dbo].[Model] ([modelCode])
);

SELECT * FROM dbo.Manufacturer
SELECT * FROM dbo.Time
SELECT * FROM dbo.Model
SELECT * FROM dbo.Car
SELECT * FROM dbo.Defects
SELECT * FROM  dbo.Part
SELECT * FROM dbo.Customer
SELECT * FROM dbo.Mechanic
SELECT * FROM dbo.[Parts Order Fact Table]
SELECT * FROM dbo.[Parts Order Aggregate Fact Table]
SELECT * FROM dbo.[Mechanic Services Fact Table]
SELECT * FROM dbo.[Mechanic Services Aggregate Fact Table]
SELECT * FROM dbo.[car manufacturer service Aggregate Fact Table]

SELECT * FROM dbo.[car model Aggregate Fact Table]

DELETE FROM dbo.Manufacturer
DELETE FROM dbo.Time
DELETE FROM dbo.Model
DELETE FROM dbo.Car
DELETE FROM dbo.Defects
DELETE FROM  dbo.Part
DELETE FROM dbo.Customer
DELETE FROM dbo.Mechanic
DELETE FROM dbo.[Parts Order Fact Table]
DELETE FROM dbo.[Parts Order Aggregate Fact Table]
DELETE FROM dbo.[Mechanic Services Fact Table]
DELETE FROM dbo.[Mechanic Services Aggregate Fact Table]
DELETE FROM dbo.[car manufacturer service Aggregate Fact Table]
DELETE FROM dbo.[car model Aggregate Fact Table]
