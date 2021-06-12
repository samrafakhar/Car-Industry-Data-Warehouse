create database carSales
use carSales


CREATE TABLE [dbo].[Manufacturer] (
    [manufacturerID] INT        NOT NULL,
    [shortName]      NCHAR (50) NOT NULL,
    [fullName]       NCHAR (50) NULL,
    [location]       NCHAR (50) NULL,
    CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED ([manufacturerID] ASC)
);

CREATE TABLE [dbo].[Model] (
    [modelID]        INT        NOT NULL,
    [manufacturerID] INT        NULL,
    [modelName]      NCHAR (50) NULL,
    CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED ([modelID] ASC),
    CONSTRAINT [FK_Model_Manufacturer] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([manufacturerID])
);

CREATE TABLE [dbo].[Vehicle Category] (
    [CategoryID]  INT        NOT NULL,
    [description] NCHAR (10) NULL,
    [modelId]     INT        NULL,
    CONSTRAINT [PK_Vehicle Category] PRIMARY KEY CLUSTERED ([CategoryID] ASC),
    CONSTRAINT [FK_Vehicle Category_Model] FOREIGN KEY ([modelId]) REFERENCES [dbo].[Model] ([modelID])
);

CREATE TABLE [dbo].[Car] (
    [carID]             INT NOT NULL,
    [vehicleCategoryID] INT NOT NULL,
    [manufacturerID]    INT NULL,
    [modelID]           INT NULL,
    [registationYear]   INT NULL,
    CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED ([carID] ASC),
    CONSTRAINT [FK_Car_Manufacturer] FOREIGN KEY ([manufacturerID]) REFERENCES [dbo].[Manufacturer] ([manufacturerID]),
    CONSTRAINT [FK_Car_Model] FOREIGN KEY ([modelID]) REFERENCES [dbo].[Model] ([modelID]),
    CONSTRAINT [FK_Car_Vehicle Category] FOREIGN KEY ([vehicleCategoryID]) REFERENCES [dbo].[Vehicle Category] ([CategoryID])
);

CREATE TABLE [dbo].[Customer] (
    [customerID]   INT        NOT NULL,
    [name]         NCHAR (50) NOT NULL,
    [customerType] NCHAR (50) NOT NULL,
    [cellPhone]    NCHAR (50) NOT NULL,
    [emailAddress] NCHAR (10) NOT NULL,
    [Address]      NCHAR (50) NOT NULL,
    [Gender]       NCHAR (10) NOT NULL,
	[city]         NCHAR (50)  NULL,
    [state]        NCHAR (10)  NULL,
    [country]      NCHAR (50)  NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([customerID] ASC)
);

CREATE TABLE [dbo].[Feature] (
    [featureID]   INT        NOT NULL,
    [description] NCHAR (50) NULL,
    [cost]        INT        NULL,
    CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED ([featureID] ASC)
);

CREATE TABLE [dbo].[Bridge table Car Feature] (
    [carID]     INT NOT NULL,
    [featureID] INT NOT NULL,
    CONSTRAINT [PK_Bridge table Car Feature] PRIMARY KEY CLUSTERED ([carID], [featureID]),
    CONSTRAINT [FK_Bridge table Car Feature_Feature] FOREIGN KEY ([featureID]) REFERENCES [dbo].[Feature] ([featureID])
);;

CREATE TABLE [dbo].[Country] (
    [countryID] INT NOT NULL,
    [name]      INT NULL,
    CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([countryID] ASC)
);

CREATE TABLE [dbo].[State] (
    [stateID]   INT NOT NULL,
    [name]      INT NOT NULL,
    [countryID] INT NOT NULL,
    CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED ([stateID] ASC),
    CONSTRAINT [FK_State_Country] FOREIGN KEY ([countryID]) REFERENCES [dbo].[Country] ([countryID])
);

CREATE TABLE [dbo].[District] (
    [districtID] INT NOT NULL,
    [name]       INT NULL,
    [stateID]    INT NULL,
    CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED ([districtID] ASC),
    CONSTRAINT [FK_District_State] FOREIGN KEY ([stateID]) REFERENCES [dbo].[State] ([stateID])
);

CREATE TABLE [dbo].[City] (
    [cityID]     INT NOT NULL,
    [name]       INT NULL,
    [districtID] INT NULL,
    CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED ([cityID] ASC),
    CONSTRAINT [FK_City_District] FOREIGN KEY ([districtID]) REFERENCES [dbo].[District] ([districtID])
);


CREATE TABLE [dbo].[Region] (
    [regionID] INT NOT NULL,
    [zip]      INT NULL,
    [cityID]   INT NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED ([regionID] ASC),
    CONSTRAINT [FK_Region_City] FOREIGN KEY ([cityID]) REFERENCES [dbo].[City] ([cityID])
);


CREATE TABLE [dbo].[Preference] (
    [preferenceID] INT         NOT NULL,
    [Description]  NCHAR (100) NOT NULL,
    [featureID1]   INT         NULL,
    [featureID2]   INT         NULL,
    [featureID3]   INT         NULL,
    CONSTRAINT [PK_Preference] PRIMARY KEY CLUSTERED ([preferenceID] ASC),
    CONSTRAINT [FK_Preference_Feature] FOREIGN KEY ([featureID1]) REFERENCES [dbo].[Feature] ([featureID])
);


CREATE TABLE [dbo].[year] (
    [yearID] INT NOT NULL,
    CONSTRAINT [PK_year] PRIMARY KEY CLUSTERED ([yearID] ASC)
);

CREATE TABLE [dbo].[quarter] (
    [quarterID] INT NOT NULL,
    [yearID]    INT NULL,
    CONSTRAINT [PK_quarter] PRIMARY KEY CLUSTERED ([quarterID] ASC),
    CONSTRAINT [FK_quarter_year] FOREIGN KEY ([yearID]) REFERENCES [dbo].[year] ([yearID])
);

CREATE TABLE [dbo].[month] (
    [monthID]   INT NOT NULL,
    [quarterID] INT NULL,
    CONSTRAINT [PK_month] PRIMARY KEY CLUSTERED ([monthID] ASC),
    CONSTRAINT [FK_month_quarter] FOREIGN KEY ([quarterID]) REFERENCES [dbo].[quarter] ([quarterID])
);

CREATE TABLE [dbo].[week] (
    [weekID]  INT NOT NULL,
    [monthID] INT NULL,
    CONSTRAINT [PK_week] PRIMARY KEY CLUSTERED ([weekID] ASC),
    CONSTRAINT [FK_week_month] FOREIGN KEY ([monthID]) REFERENCES [dbo].[month] ([monthID])
);

CREATE TABLE [dbo].[Time] (
    [timeID] INT NOT NULL,
    [day]    INT NULL,
    [weekID] INT NULL,
    CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED ([timeID] ASC),
    CONSTRAINT [FK_Time_week] FOREIGN KEY ([weekID]) REFERENCES [dbo].[week] ([weekID])
);


---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
											------------ FACT TABLES -----------


CREATE TABLE [dbo].[InventoryFactTable] (
    [askingPrice]     INT NOT NULL,
    [currentMileage]  INT NULL,
    [profitMrgin]     INT NULL,
    [productQuantity] INT NULL,
    [carID]           INT NULL,
    [timeID]          INT NULL,
    [regionID]        INT NULL,
    CONSTRAINT [FK_InventoryFactTable_Car1] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([carID]),
    CONSTRAINT [FK_InventoryFactTable_Region] FOREIGN KEY ([regionID]) REFERENCES [dbo].[Region] ([regionID]),
    CONSTRAINT [FK_InventoryFactTable_Time1] FOREIGN KEY ([timeID]) REFERENCES [dbo].[Time] ([timeID])
);


CREATE TABLE [dbo].[preference Aggregate Fact Table] (
    [totalCost]    INT NULL,
    [perferenceID] INT NULL,
    [carID]        INT NULL,
    [yearID]       INT NULL,
    [customerID]   INT NULL,
    [stateID]      INT NULL,
    CONSTRAINT [FK_preference Aggregate Fact Table_Car1] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([carID]),
    CONSTRAINT [FK_preference Aggregate Fact Table_Customer1] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_preference Aggregate Fact Table_customerPreference1] FOREIGN KEY ([perferenceID]) REFERENCES [dbo].[Preference] ([preferenceID]),
    CONSTRAINT [FK_preference Aggregate Fact Table_State] FOREIGN KEY ([stateID]) REFERENCES [dbo].[State] ([stateID]),
    CONSTRAINT [FK_preference Aggregate Fact Table_year] FOREIGN KEY ([yearID]) REFERENCES [dbo].[year] ([yearID])
);



CREATE TABLE [dbo].[quarterly sales aggregate fact table] (
    [quantitySold] INT NULL,
    [totalCost]    INT NULL,
    [sellingPrice] INT NULL,
    [profitMargin] INT NULL,
    [carID]        INT NULL,
    [regionID]     INT NULL,
    [quarterID]    INT NULL,
    [customerID]   INT NULL,
    CONSTRAINT [FK_quarterly sales aggregate fact table_Car1] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([carID]),
    CONSTRAINT [FK_quarterly sales aggregate fact table_Customer] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_quarterly sales aggregate fact table_quarter] FOREIGN KEY ([quarterID]) REFERENCES [dbo].[quarter] ([quarterID]),
    CONSTRAINT [FK_quarterly sales aggregate fact table_Region] FOREIGN KEY ([regionID]) REFERENCES [dbo].[Region] ([regionID])
);

CREATE TABLE [dbo].[quarterly vehicle category aggregate fact table] (
    [quantitySold] INT NULL,
    [totalCost]    INT NULL,
    [sellingPrice] INT NULL,
    [profitMargin] INT NULL,
    [categoryID]   INT NULL,
    [quarterID]    INT NULL,
    [regionID]     INT NULL,
    [customerID]   INT NULL,
    CONSTRAINT [FK_quarterly vehicle category aggregate fact table_Customer] FOREIGN KEY ([categoryID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_quarterly vehicle category aggregate fact table_quarter] FOREIGN KEY ([quarterID]) REFERENCES [dbo].[quarter] ([quarterID]),
    CONSTRAINT [FK_quarterly vehicle category aggregate fact table_Region2] FOREIGN KEY ([regionID]) REFERENCES [dbo].[Region] ([regionID]),
    CONSTRAINT [FK_quarterly vehicle category aggregate fact table_Vehicle Category1] FOREIGN KEY ([categoryID]) REFERENCES [dbo].[Vehicle Category] ([CategoryID])
);



CREATE TABLE [dbo].[sales fact table] (
    [quantitySold] INT NULL,
    [totalCost]    INT NULL,
    [sellingPrice] INT NULL,
    [profitMargin] INT NULL,
    [regionID]     INT NULL,
    [carID]        INT NULL,
    [timeID]       INT NULL,
    [customerID]   INT NULL,
    CONSTRAINT [FK_sales fact table_Car] FOREIGN KEY ([carID]) REFERENCES [dbo].[Car] ([carID]),
    CONSTRAINT [FK_sales fact table_Customer] FOREIGN KEY ([customerID]) REFERENCES [dbo].[Customer] ([customerID]),
    CONSTRAINT [FK_sales fact table_Region] FOREIGN KEY ([regionID]) REFERENCES [dbo].[Region] ([regionID]),
    CONSTRAINT [FK_sales fact table_Time] FOREIGN KEY ([timeID]) REFERENCES [dbo].[Time] ([timeID])
);

