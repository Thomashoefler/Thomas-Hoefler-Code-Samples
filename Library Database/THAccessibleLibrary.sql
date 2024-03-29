USE [master]
GO
/****** Object:  Database [AccessibleLibrary]    Script Date: 4/3/2022 8:19:43 PM ******/
CREATE DATABASE [AccessibleLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AccessableLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AccessableLibrary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AccessableLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AccessableLibrary_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AccessibleLibrary] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AccessibleLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AccessibleLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AccessibleLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AccessibleLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AccessibleLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AccessibleLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [AccessibleLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [AccessibleLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AccessibleLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AccessibleLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AccessibleLibrary] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AccessibleLibrary] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AccessibleLibrary] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AccessibleLibrary', N'ON'
GO
ALTER DATABASE [AccessibleLibrary] SET QUERY_STORE = OFF
GO
USE [AccessibleLibrary]
GO
/****** Object:  Schema [AcsLib]    Script Date: 4/3/2022 8:19:43 PM ******/
CREATE SCHEMA [AcsLib]
GO
/****** Object:  Table [AcsLib].[Books]    Script Date: 4/3/2022 8:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AcsLib].[Books](
	[BookId] [int] NOT NULL,
	[BusId] [int] NOT NULL,
	[Author] [varchar](200) NULL,
	[PublishDate] [date] NULL,
	[Genre] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AcsLib].[Buses]    Script Date: 4/3/2022 8:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AcsLib].[Buses](
	[BusId] [int] NOT NULL,
	[FacilityId] [int] NOT NULL,
	[inservice] [varchar](3) NULL,
	[make] [varchar](50) NULL,
	[model] [varchar](50) NULL,
	[year] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[BusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AcsLib].[Customers]    Script Date: 4/3/2022 8:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AcsLib].[Customers](
	[CustomerId] [int] NOT NULL,
	[RouteId] [int] NOT NULL,
	[CustomerFirstName] [varchar](200) NULL,
	[CustomerMiddleName] [varchar](200) NULL,
	[CustomerLastName] [varchar](200) NULL,
	[CustomerAge] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AcsLib].[Employee]    Script Date: 4/3/2022 8:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AcsLib].[Employee](
	[EmployeeId] [int] NOT NULL,
	[FacilityId] [int] NOT NULL,
	[EmployeeFirstName] [varchar](100) NULL,
	[EmployeeMiddleName] [varchar](100) NULL,
	[EmployeeLastName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AcsLib].[Facility]    Script Date: 4/3/2022 8:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AcsLib].[Facility](
	[FacilityId] [int] NOT NULL,
	[FacilityAddress] [varchar](250) NULL,
	[FacilityCity] [varchar](250) NULL,
	[FacilityState] [varchar](50) NULL,
	[FacilityZipCode] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FacilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AcsLib].[RouteAssignment]    Script Date: 4/3/2022 8:19:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AcsLib].[RouteAssignment](
	[RouteId] [int] NOT NULL,
	[BusId] [int] NOT NULL,
	[EmployeeId] [int] NULL,
	[Routedate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[RouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (1, 1, N'Mab Petrollo', CAST(N'2021-08-05' AS Date), N'Crime|Mystery')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (2, 2, N'Domini Monard', CAST(N'2021-07-10' AS Date), N'Drama|Romance|War')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (3, 3, N'Loren Alldre', CAST(N'2022-02-28' AS Date), N'Drama|Mystery|Thriller')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (4, 4, N'Estel Arnatt', CAST(N'2021-05-06' AS Date), N'Crime|Mystery')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (5, 5, N'Waldemar Dowle', CAST(N'2021-08-23' AS Date), N'Comedy')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (6, 6, N'Gale Hubner', CAST(N'2021-04-21' AS Date), N'Drama')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (7, 7, N'Nettle Lovstrom', CAST(N'2021-09-16' AS Date), N'Comedy|Thriller')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (8, 8, N'Leshia Kubec', CAST(N'2022-01-15' AS Date), N'Drama|War')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (9, 9, N'Alyss Biasioni', CAST(N'2022-01-05' AS Date), N'Crime|Drama|Film-Noir')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (10, 10, N'Reinaldo Tweed', CAST(N'2022-02-19' AS Date), N'Comedy|Musical')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (11, 2, N'Domini Monard', CAST(N'2021-07-10' AS Date), N'Drama|Romance|War')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (12, 2, N'Domini Monard', CAST(N'2021-07-10' AS Date), N'Drama|Romance|War')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (13, 2, N'Domini Monard', CAST(N'2021-07-10' AS Date), N'Drama|Romance|War')
INSERT [AcsLib].[Books] ([BookId], [BusId], [Author], [PublishDate], [Genre]) VALUES (14, 2, N'Domini Monard', CAST(N'2021-07-10' AS Date), N'Drama|Romance|War')
GO
INSERT [AcsLib].[Buses] ([BusId], [FacilityId], [inservice], [make], [model], [year]) VALUES (1, 1, N'Yes', N'Lincoln', N'Continental', N'1998')
INSERT [AcsLib].[Buses] ([BusId], [FacilityId], [inservice], [make], [model], [year]) VALUES (2, 2, N'Yes', N'Nissan', N'Frontier', N'2011')
INSERT [AcsLib].[Buses] ([BusId], [FacilityId], [inservice], [make], [model], [year]) VALUES (3, 2, N'No', N'Audi', N'Coupe GT', N'1987')
INSERT [AcsLib].[Buses] ([BusId], [FacilityId], [inservice], [make], [model], [year]) VALUES (4, 2, N'Yes', N'Dodge', N'Ram 2500', N'2006')
INSERT [AcsLib].[Buses] ([BusId], [FacilityId], [inservice], [make], [model], [year]) VALUES (5, 5, N'Yes', N'Dodge', N'Neon', N'1998')
INSERT [AcsLib].[Buses] ([BusId], [FacilityId], [inservice], [make], [model], [year]) VALUES (6, 6, N'Yes', N'Ford', N'Taurus X', N'2009')
INSERT [AcsLib].[Buses] ([BusId], [FacilityId], [inservice], [make], [model], [year]) VALUES (7, 7, N'Yes', N'Subaru', N'Impreza', N'1995')
INSERT [AcsLib].[Buses] ([BusId], [FacilityId], [inservice], [make], [model], [year]) VALUES (8, 8, N'No', N'Dodge', N'Ram 3500', N'1998')
INSERT [AcsLib].[Buses] ([BusId], [FacilityId], [inservice], [make], [model], [year]) VALUES (9, 8, N'Yes', N'Nissan', N'Pathfinder', N'2008')
INSERT [AcsLib].[Buses] ([BusId], [FacilityId], [inservice], [make], [model], [year]) VALUES (10, 10, N'Yes', N'Porsche', N'944', N'1988')
GO
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (1, 1, N'Elaina', N'Berny', N'Catterill', 21)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (2, 2, N'Buckie', N'Nate', N'Kinnoch', 32)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (3, 3, N'Toiboid', N'Emylee', N'Wardingly', 43)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (4, 4, N'Spence', N'Noll', N'Floch', 24)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (5, 5, N'Reilly', N'Corry', N'Fyldes', 65)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (6, 6, N'Freeland', N'Devina', N'Chable', 16)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (7, 7, N'Tristan', N'Cristina', N'Norcutt', 77)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (8, 8, N'Sanders', N'Kiri', N'Aleksich', 28)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (9, 9, N'Rowney', N'Germain', N'Matterson', 69)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (10, 10, N'Dunn', N'Nickie', N'Dring', 30)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (11, 2, N'Buckie', N'Nate', N'Kinnoch', 32)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (12, 2, N'Buckie', N'Nate', N'Kinnoch', 32)
INSERT [AcsLib].[Customers] ([CustomerId], [RouteId], [CustomerFirstName], [CustomerMiddleName], [CustomerLastName], [CustomerAge]) VALUES (13, 2, N'Buckie', N'Nate', N'Kinnoch', 32)
GO
INSERT [AcsLib].[Employee] ([EmployeeId], [FacilityId], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]) VALUES (1, 1, N'Guy', N' Tabitha', N'Serrell')
INSERT [AcsLib].[Employee] ([EmployeeId], [FacilityId], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]) VALUES (2, 2, N'Martguerita', N'Kyle', N'Mulhall')
INSERT [AcsLib].[Employee] ([EmployeeId], [FacilityId], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]) VALUES (3, 3, N'Odo', N'Constantine', N'Cadigan')
INSERT [AcsLib].[Employee] ([EmployeeId], [FacilityId], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]) VALUES (4, 4, N'Ham', N'Cheryl', N'Luton')
INSERT [AcsLib].[Employee] ([EmployeeId], [FacilityId], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]) VALUES (5, 5, N'Adiana', N'Greer', N'Maccari')
INSERT [AcsLib].[Employee] ([EmployeeId], [FacilityId], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]) VALUES (6, 7, N'Kimbra', N'Garner', N'Goodrick')
INSERT [AcsLib].[Employee] ([EmployeeId], [FacilityId], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]) VALUES (7, 7, N'Caz', N'Tamqrah', N'Yedy')
INSERT [AcsLib].[Employee] ([EmployeeId], [FacilityId], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]) VALUES (8, 8, N'Nicole', N'Barthel', N'Whittlesee')
INSERT [AcsLib].[Employee] ([EmployeeId], [FacilityId], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]) VALUES (9, 9, N'Kayla', N'Giraud', N'Riep')
INSERT [AcsLib].[Employee] ([EmployeeId], [FacilityId], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]) VALUES (10, 2, N'Lucina', N'Tony', N'Grindell')
GO
INSERT [AcsLib].[Facility] ([FacilityId], [FacilityAddress], [FacilityCity], [FacilityState], [FacilityZipCode]) VALUES (1, N'4837 Northport Crossing', N'Bom Despacho', N'Arizona', N'35600-000')
INSERT [AcsLib].[Facility] ([FacilityId], [FacilityAddress], [FacilityCity], [FacilityState], [FacilityZipCode]) VALUES (2, N'728 Arapahoe Drive', N'Huainan', N'New Mexico', N'4896')
INSERT [AcsLib].[Facility] ([FacilityId], [FacilityAddress], [FacilityCity], [FacilityState], [FacilityZipCode]) VALUES (3, N'818 Grover Trail', N'Grimstad', N'Aust-Agder', N'4892')
INSERT [AcsLib].[Facility] ([FacilityId], [FacilityAddress], [FacilityCity], [FacilityState], [FacilityZipCode]) VALUES (4, N'5 Homewood Alley', N'Arue', N'Colorado', N'80123')
INSERT [AcsLib].[Facility] ([FacilityId], [FacilityAddress], [FacilityCity], [FacilityState], [FacilityZipCode]) VALUES (5, N'45156 Algoma Court', N'Manoel Urbano', N'Florida', N'69950-000')
INSERT [AcsLib].[Facility] ([FacilityId], [FacilityAddress], [FacilityCity], [FacilityState], [FacilityZipCode]) VALUES (6, N'74 Graceland Point', N'Ojiya', N'Texas', N'959-2612')
INSERT [AcsLib].[Facility] ([FacilityId], [FacilityAddress], [FacilityCity], [FacilityState], [FacilityZipCode]) VALUES (7, N'0929 Fremont Plaza', N'Rochester', N'New York', N'14604')
INSERT [AcsLib].[Facility] ([FacilityId], [FacilityAddress], [FacilityCity], [FacilityState], [FacilityZipCode]) VALUES (8, N'04936 Express Center', N'Youyang', N'Washington', N'09843')
INSERT [AcsLib].[Facility] ([FacilityId], [FacilityAddress], [FacilityCity], [FacilityState], [FacilityZipCode]) VALUES (9, N'458 Mesta Junction', N'Kaedi', N'Alabama', N'43234')
INSERT [AcsLib].[Facility] ([FacilityId], [FacilityAddress], [FacilityCity], [FacilityState], [FacilityZipCode]) VALUES (10, N'830 Holmberg Court', N'Jurh', N'California', N'09345')
GO
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (1, 1, 1, CAST(N'2021-04-03' AS Date))
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (2, 2, 2, CAST(N'2022-01-10' AS Date))
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (3, 3, 5, CAST(N'2021-12-18' AS Date))
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (4, 4, 5, CAST(N'2021-05-07' AS Date))
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (5, 5, 6, CAST(N'2021-06-13' AS Date))
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (6, 6, 6, CAST(N'2021-09-29' AS Date))
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (7, 7, 7, CAST(N'2021-07-06' AS Date))
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (8, 8, 8, CAST(N'2022-01-30' AS Date))
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (9, 9, 9, CAST(N'2022-03-02' AS Date))
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (10, 10, 10, CAST(N'2021-07-02' AS Date))
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (11, 2, 3, CAST(N'2022-01-11' AS Date))
INSERT [AcsLib].[RouteAssignment] ([RouteId], [BusId], [EmployeeId], [Routedate]) VALUES (12, 2, 4, CAST(N'2022-01-12' AS Date))
GO
ALTER TABLE [AcsLib].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Buses_Books] FOREIGN KEY([BusId])
REFERENCES [AcsLib].[Buses] ([BusId])
GO
ALTER TABLE [AcsLib].[Books] CHECK CONSTRAINT [FK_Buses_Books]
GO
ALTER TABLE [AcsLib].[Buses]  WITH CHECK ADD  CONSTRAINT [FK_Facility_Buses] FOREIGN KEY([FacilityId])
REFERENCES [AcsLib].[Facility] ([FacilityId])
GO
ALTER TABLE [AcsLib].[Buses] CHECK CONSTRAINT [FK_Facility_Buses]
GO
ALTER TABLE [AcsLib].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_RouteAssignment_Customers] FOREIGN KEY([RouteId])
REFERENCES [AcsLib].[RouteAssignment] ([RouteId])
GO
ALTER TABLE [AcsLib].[Customers] CHECK CONSTRAINT [FK_RouteAssignment_Customers]
GO
ALTER TABLE [AcsLib].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Facility_Employee] FOREIGN KEY([FacilityId])
REFERENCES [AcsLib].[Facility] ([FacilityId])
GO
ALTER TABLE [AcsLib].[Employee] CHECK CONSTRAINT [FK_Facility_Employee]
GO
ALTER TABLE [AcsLib].[RouteAssignment]  WITH CHECK ADD  CONSTRAINT [FK_Buses_RouteAssignment] FOREIGN KEY([BusId])
REFERENCES [AcsLib].[Buses] ([BusId])
GO
ALTER TABLE [AcsLib].[RouteAssignment] CHECK CONSTRAINT [FK_Buses_RouteAssignment]
GO
ALTER TABLE [AcsLib].[RouteAssignment]  WITH CHECK ADD  CONSTRAINT [FK_Employee_RouteAssignment] FOREIGN KEY([EmployeeId])
REFERENCES [AcsLib].[Employee] ([EmployeeId])
GO
ALTER TABLE [AcsLib].[RouteAssignment] CHECK CONSTRAINT [FK_Employee_RouteAssignment]
GO
USE [master]
GO
ALTER DATABASE [AccessibleLibrary] SET  READ_WRITE 
GO
