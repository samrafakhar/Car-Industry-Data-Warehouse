USE [master]
GO
/****** Object:  Database [dm1]    Script Date: 15/11/2019 19:33:07 ******/
CREATE DATABASE [dm1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dm1', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dm1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dm1_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dm1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dm1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dm1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dm1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dm1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dm1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dm1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dm1] SET ARITHABORT OFF 
GO
ALTER DATABASE [dm1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dm1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dm1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dm1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dm1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dm1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dm1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dm1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dm1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dm1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dm1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dm1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dm1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dm1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dm1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dm1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dm1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dm1] SET RECOVERY FULL 
GO
ALTER DATABASE [dm1] SET  MULTI_USER 
GO
ALTER DATABASE [dm1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dm1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dm1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dm1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dm1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dm1', N'ON'
GO
ALTER DATABASE [dm1] SET QUERY_STORE = OFF
GO
USE [dm1]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 15/11/2019 19:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[addressLine1] [nchar](50) NULL,
	[addressLine2] [nchar](50) NULL,
	[addressLine3] [nchar](50) NULL,
	[addressLine4] [nchar](50) NULL,
	[town_city] [nchar](50) NULL,
	[state_county_province] [nchar](50) NULL,
	[country] [nchar](50) NULL,
	[otherDetails] [nchar](50) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car for Sale]    Script Date: 15/11/2019 19:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car for Sale](
	[CarforSaleID] [int] NOT NULL,
	[ManufacturerShortName] [nchar](50) NOT NULL,
	[modelID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[askingPrice] [int] NOT NULL,
	[currentMilage] [int] NOT NULL,
	[dateAquired] [date] NOT NULL,
	[registrationYear] [int] NOT NULL,
	[OtherDetails] [nchar](50) NULL,
 CONSTRAINT [PK_Vehicle Categorynkb] PRIMARY KEY CLUSTERED 
(
	[CarforSaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car Sold]    Script Date: 15/11/2019 19:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car Sold](
	[CarSoldID] [int] NOT NULL,
	[CarforSaleID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[agreedPrice] [int] NOT NULL,
	[dateSold] [date] NOT NULL,
	[OtherDetails] [nchar](50) NULL,
 CONSTRAINT [PK_Vehicle Categorfsy] PRIMARY KEY CLUSTERED 
(
	[CarSoldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 15/11/2019 19:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] NOT NULL,
	[cellPhone] [nchar](50) NOT NULL,
	[emailAddress] [nchar](10) NOT NULL,
	[otherDetails] [nchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 15/11/2019 19:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[featureID] [int] NOT NULL,
	[description] [nchar](50) NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[featureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[features on call for sale]    Script Date: 15/11/2019 19:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[features on call for sale](
	[CarforSaleID] [int] NOT NULL,
	[featureID] [int] NOT NULL,
 CONSTRAINT [PK_Vehicle Categfefory] PRIMARY KEY CLUSTERED 
(
	[CarforSaleID] ASC,
	[featureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 15/11/2019 19:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerShortName] [nchar](50) NOT NULL,
	[fullName] [nchar](50) NULL,
	[otherDetails] [nchar](50) NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerShortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model]    Script Date: 15/11/2019 19:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[modelID] [int] NOT NULL,
	[manufacturerID] [int] NULL,
	[modelName] [nchar](50) NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[modelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preference]    Script Date: 15/11/2019 19:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preference](
	[preferenceID] [int] NOT NULL,
	[featureID] [int] NULL,
	[customerID] [int] NOT NULL,
	[preferenceDetails] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Preference] PRIMARY KEY CLUSTERED 
(
	[preferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle Category]    Script Date: 15/11/2019 19:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle Category](
	[CategoryID] [int] NOT NULL,
	[description] [nchar](10) NULL,
 CONSTRAINT [PK_Vehicle Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address]
GO
ALTER TABLE [dbo].[Car for Sale]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle Category_Modfgfel] FOREIGN KEY([modelID])
REFERENCES [dbo].[Model] ([modelID])
GO
ALTER TABLE [dbo].[Car for Sale] CHECK CONSTRAINT [FK_Vehicle Category_Modfgfel]
GO
ALTER TABLE [dbo].[Car for Sale]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle CFSCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Vehicle Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Car for Sale] CHECK CONSTRAINT [FK_Vehicle CFSCategory]
GO
ALTER TABLE [dbo].[Car for Sale]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle CFSManufacturer] FOREIGN KEY([ManufacturerShortName])
REFERENCES [dbo].[Manufacturer] ([ManufacturerShortName])
GO
ALTER TABLE [dbo].[Car for Sale] CHECK CONSTRAINT [FK_Vehicle CFSManufacturer]
GO
ALTER TABLE [dbo].[Car Sold]  WITH CHECK ADD  CONSTRAINT [FK_lol] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Car Sold] CHECK CONSTRAINT [FK_lol]
GO
ALTER TABLE [dbo].[Car Sold]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle Category_Modelgvh] FOREIGN KEY([CarforSaleID])
REFERENCES [dbo].[Car for Sale] ([CarforSaleID])
GO
ALTER TABLE [dbo].[Car Sold] CHECK CONSTRAINT [FK_Vehicle Category_Modelgvh]
GO
ALTER TABLE [dbo].[features on call for sale]  WITH CHECK ADD  CONSTRAINT [FK_Preferensffce_Feature] FOREIGN KEY([featureID])
REFERENCES [dbo].[Feature] ([featureID])
GO
ALTER TABLE [dbo].[features on call for sale] CHECK CONSTRAINT [FK_Preferensffce_Feature]
GO
ALTER TABLE [dbo].[features on call for sale]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle Category_Modfdgel] FOREIGN KEY([CarforSaleID])
REFERENCES [dbo].[Car for Sale] ([CarforSaleID])
GO
ALTER TABLE [dbo].[features on call for sale] CHECK CONSTRAINT [FK_Vehicle Category_Modfdgel]
GO
ALTER TABLE [dbo].[Preference]  WITH CHECK ADD  CONSTRAINT [FK_Preference] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Preference] CHECK CONSTRAINT [FK_Preference]
GO
ALTER TABLE [dbo].[Preference]  WITH CHECK ADD  CONSTRAINT [FK_Preference_Feature] FOREIGN KEY([featureID])
REFERENCES [dbo].[Feature] ([featureID])
GO
ALTER TABLE [dbo].[Preference] CHECK CONSTRAINT [FK_Preference_Feature]
GO
USE [master]
GO
ALTER DATABASE [dm1] SET  READ_WRITE 
GO
