USE [master]
GO
/****** Object:  Database [dm2]    Script Date: 15/11/2019 19:33:44 ******/
CREATE DATABASE [dm2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dm2', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dm2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dm2_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dm2_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dm2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dm2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dm2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dm2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dm2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dm2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dm2] SET ARITHABORT OFF 
GO
ALTER DATABASE [dm2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dm2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dm2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dm2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dm2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dm2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dm2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dm2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dm2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dm2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dm2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dm2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dm2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dm2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dm2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dm2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dm2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dm2] SET RECOVERY FULL 
GO
ALTER DATABASE [dm2] SET  MULTI_USER 
GO
ALTER DATABASE [dm2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dm2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dm2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dm2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dm2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dm2', N'ON'
GO
ALTER DATABASE [dm2] SET QUERY_STORE = OFF
GO
USE [dm2]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 15/11/2019 19:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] NOT NULL,
	[ContactID] [int] NOT NULL,
	[lisenceNumber] [int] NOT NULL,
	[bookingDate] [date] NOT NULL,
	[mechanicDetails] [nchar](100) NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 15/11/2019 19:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[lisenceNumber] [int] NOT NULL,
	[modelCode] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[currentMilage] [int] NOT NULL,
	[engineSize] [int] NOT NULL,
	[otherCarDetails] [nchar](100) NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[lisenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 15/11/2019 19:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactID] [int] NOT NULL,
	[firstName] [nchar](100) NULL,
	[middleName] [nchar](100) NULL,
	[lastName] [nchar](100) NULL,
	[gender] [nchar](100) NULL,
	[email] [nchar](100) NULL,
	[phoneNum] [nchar](100) NULL,
	[addressLine1] [nchar](100) NULL,
	[addressLine2] [nchar](100) NULL,
	[addressLine3] [nchar](100) NULL,
	[addressLine4] [nchar](100) NULL,
	[town_city] [nchar](100) NULL,
	[state_county_province] [nchar](100) NULL,
	[country] [nchar](100) NULL,
	[otherDetails] [nchar](100) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Defects]    Script Date: 15/11/2019 19:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Defects](
	[defectID] [int] NOT NULL,
	[lisenceNumber] [int] NOT NULL,
	[defectDescription] [nchar](100) NULL,
	[date] [date] NULL,
	[otherDetails] [nchar](100) NULL,
 CONSTRAINT [PK_Defects] PRIMARY KEY CLUSTERED 
(
	[defectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 15/11/2019 19:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[manufacturerID] [int] NOT NULL,
	[manufacturerName] [nchar](100) NULL,
	[manufactureDetails] [nchar](100) NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[manufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mechanic]    Script Date: 15/11/2019 19:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mechanic](
	[mechanicID] [int] NOT NULL,
	[mechanicName] [nchar](100) NULL,
	[mechanicDetails] [nchar](100) NULL,
 CONSTRAINT [PK_Mechanic] PRIMARY KEY CLUSTERED 
(
	[mechanicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mechanic Services]    Script Date: 15/11/2019 19:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mechanic Services](
	[BookingID] [int] NOT NULL,
	[mechanicID] [int] NOT NULL,
 CONSTRAINT [PK_Mechanic Services] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[mechanicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model]    Script Date: 15/11/2019 19:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[modelCode] [int] NOT NULL,
	[manufacturerID] [int] NOT NULL,
	[modelName] [nchar](100) NULL,
	[otherDetails] [nchar](100) NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[modelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Part]    Script Date: 15/11/2019 19:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Part](
	[partID] [int] NOT NULL,
	[partName] [nchar](100) NULL,
	[partDescription] [nchar](100) NULL,
	[numberInStack] [int] NULL,
	[otherDetails] [nchar](100) NULL,
 CONSTRAINT [PK_Part] PRIMARY KEY CLUSTERED 
(
	[partID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parts order list]    Script Date: 15/11/2019 19:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parts order list](
	[BookingID] [int] NOT NULL,
	[partID] [int] NOT NULL,
 CONSTRAINT [PK_Mechanic Servicgftres] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[partID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Car_contact] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contacts] ([ContactID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Car_contact]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Car_lisence] FOREIGN KEY([lisenceNumber])
REFERENCES [dbo].[Car] ([lisenceNumber])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Car_lisence]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Model] FOREIGN KEY([modelCode])
REFERENCES [dbo].[Model] ([modelCode])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Model]
GO
ALTER TABLE [dbo].[Defects]  WITH CHECK ADD  CONSTRAINT [FK_Car_car] FOREIGN KEY([lisenceNumber])
REFERENCES [dbo].[Car] ([lisenceNumber])
GO
ALTER TABLE [dbo].[Defects] CHECK CONSTRAINT [FK_Car_car]
GO
ALTER TABLE [dbo].[Mechanic Services]  WITH CHECK ADD  CONSTRAINT [FK_Mechanic Servic] FOREIGN KEY([mechanicID])
REFERENCES [dbo].[Mechanic] ([mechanicID])
GO
ALTER TABLE [dbo].[Mechanic Services] CHECK CONSTRAINT [FK_Mechanic Servic]
GO
ALTER TABLE [dbo].[Mechanic Services]  WITH CHECK ADD  CONSTRAINT [FK_Mechanic Service] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[Mechanic Services] CHECK CONSTRAINT [FK_Mechanic Service]
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_Manufacturer] FOREIGN KEY([manufacturerID])
REFERENCES [dbo].[Manufacturer] ([manufacturerID])
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_Model_Manufacturer]
GO
ALTER TABLE [dbo].[parts order list]  WITH CHECK ADD  CONSTRAINT [FK_Mechanic Servhfgjfjic] FOREIGN KEY([partID])
REFERENCES [dbo].[Part] ([partID])
GO
ALTER TABLE [dbo].[parts order list] CHECK CONSTRAINT [FK_Mechanic Servhfgjfjic]
GO
ALTER TABLE [dbo].[parts order list]  WITH CHECK ADD  CONSTRAINT [FK_Mechanic Servicfhjhe] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[parts order list] CHECK CONSTRAINT [FK_Mechanic Servicfhjhe]
GO
USE [master]
GO
ALTER DATABASE [dm2] SET  READ_WRITE 
GO
