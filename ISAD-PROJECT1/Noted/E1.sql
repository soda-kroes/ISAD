USE [master]
GO
/****** Object:  Database [E12024]    Script Date: 6/4/2024 10:25:53 PM ******/
CREATE DATABASE [E12024]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E12024', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\E12024.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'E12024_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\E12024_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [E12024] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E12024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E12024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E12024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E12024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E12024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E12024] SET ARITHABORT OFF 
GO
ALTER DATABASE [E12024] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E12024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E12024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E12024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E12024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E12024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E12024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E12024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E12024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E12024] SET  ENABLE_BROKER 
GO
ALTER DATABASE [E12024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E12024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E12024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E12024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E12024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E12024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E12024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E12024] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E12024] SET  MULTI_USER 
GO
ALTER DATABASE [E12024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E12024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E12024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E12024] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [E12024] SET DELAYED_DURABILITY = DISABLED 
GO
USE [E12024]
GO
/****** Object:  Table [dbo].[tbCustomers]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCustomers](
	[cusID] [int] IDENTITY(1,1) NOT NULL,
	[cusName] [nvarchar](50) NULL,
	[cusCon] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbCustomers] PRIMARY KEY CLUSTERED 
(
	[cusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStaff]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStaff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Position] [nvarchar](50) NULL,
	[Salary] [decimal](18, 0) NULL,
	[Stopwork] [bit] NULL,
 CONSTRAINT [PK_tblStaff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSupplier]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSupplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Supplier] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[Contact] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSupplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbCustomers] ON 

INSERT [dbo].[tbCustomers] ([cusID], [cusName], [cusCon]) VALUES (2, N'Vanda', N'Kok')
INSERT [dbo].[tbCustomers] ([cusID], [cusName], [cusCon]) VALUES (3, N'Mr.A', N'019868454')
INSERT [dbo].[tbCustomers] ([cusID], [cusName], [cusCon]) VALUES (4, N'Mr.B', N'010987002')
SET IDENTITY_INSERT [dbo].[tbCustomers] OFF
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (1, N'P001', N'Phone', 20, CAST(599.99 AS Decimal(18, 2)), N'Smartphone with advanced features')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (2, N'L001', N'Laptop', 10, CAST(1299.99 AS Decimal(18, 2)), N'High-performance laptop for professional use')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (3, N'T001', N'Tablet', 15, CAST(399.99 AS Decimal(18, 2)), N'Portable device with a touch screen')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (4, N'C001', N'Camera', 5, CAST(799.99 AS Decimal(18, 2)), N'Digital camera with high-resolution capabilities')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (5, N'TV001', N'Television', 8, CAST(899.99 AS Decimal(18, 2)), N'Large-screen TV with 4K resolution')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (6, N'H001', N'Headphones', 30, CAST(99.99 AS Decimal(18, 2)), N'Wireless headphones with noise cancellation')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (7, N'S001', N'Smartwatch', 12, CAST(199.99 AS Decimal(18, 2)), N'Fitness tracker with smart features')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (8, N'SP001', N'Speakers', 7, CAST(149.99 AS Decimal(18, 2)), N'Bluetooth speakers with rich sound quality')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (9, N'G001', N'Gaming Console', 3, CAST(499.99 AS Decimal(18, 2)), N'Next-generation gaming console for immersive gameplay')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (10, N'D001', N'Drone', 4, CAST(299.99 AS Decimal(18, 2)), N'Remote-controlled aerial device for capturing stunning footage')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (11, N'P002', N'Printer', 6, CAST(199.99 AS Decimal(18, 2)), N'High-quality printer for professional documents')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (12, N'M001', N'Monitor', 9, CAST(299.99 AS Decimal(18, 2)), N'Large display for enhanced viewing experience')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (13, N'KB001', N'Keyboard', 25, CAST(49.99 AS Decimal(18, 2)), N'Ergonomic keyboard for comfortable typing')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (14, N'Mice001', N'Mouse', 18, CAST(19.99 AS Decimal(18, 2)), N'Wireless mouse for precise cursor control')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (15, N'HD001', N'Hard Drive', 14, CAST(129.99 AS Decimal(18, 2)), N'External hard drive for data storage')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (16, N'SSD001', N'SSD', 11, CAST(149.99 AS Decimal(18, 2)), N'Solid-state drive for faster data access')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (17, N'R001', N'Router', 7, CAST(79.99 AS Decimal(18, 2)), N'Wireless router for seamless internet connection')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (18, N'T001', N'Toner', 22, CAST(39.99 AS Decimal(18, 2)), N'Replacement toner cartridge for printers')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (19, N'C002', N'Charger', 16, CAST(29.99 AS Decimal(18, 2)), N'Universal charger for various devices')
INSERT [dbo].[tblProduct] ([Id], [Code], [Name], [Quantity], [Price], [Description]) VALUES (20, N'B001', N'Battery', 20, CAST(9.99 AS Decimal(18, 2)), N'Long-lasting batteries for electronic devices')
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
SET IDENTITY_INSERT [dbo].[tblStaff] ON 

INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (1, N'John Doe', N'Male', CAST(N'1990-05-15' AS Date), N'Manager', CAST(5000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (2, N'Jane Smith', N'Female', CAST(N'1995-08-25' AS Date), N'Supervisor', CAST(4000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (3, N'Michael Johnson', N'Male', CAST(N'1988-11-10' AS Date), N'Team Lead', CAST(4500 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (4, N'Emily Williams', N'Female', CAST(N'1992-03-22' AS Date), N'Developer', CAST(3500 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (5, N'David Brown', N'Male', CAST(N'1994-07-12' AS Date), N'Designer', CAST(3000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (6, N'Sarah Davis', N'Female', CAST(N'1991-02-18' AS Date), N'Tester', CAST(3200 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (7, N'Daniel Wilson', N'Male', CAST(N'1987-09-05' AS Date), N'Analyst', CAST(3800 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (8, N'Jennifer Taylor', N'Female', CAST(N'1993-06-30' AS Date), N'Administrator', CAST(3200 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (9, N'Andrew Martinez', N'Male', CAST(N'1996-04-08' AS Date), N'Support Specialist', CAST(2800 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (10, N'Olivia Anderson', N'Female', CAST(N'1990-12-01' AS Date), N'Coordinator', CAST(3000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (11, N'Christopher Lee', N'Male', CAST(N'1993-09-20' AS Date), N'Developer', CAST(3800 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (12, N'Amanda Wilson', N'Female', CAST(N'1992-06-12' AS Date), N'Designer', CAST(3200 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (13, N'Ryan Thompson', N'Male', CAST(N'1989-03-05' AS Date), N'Tester', CAST(3400 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (14, N'Jessica Reed', N'Female', CAST(N'1994-01-25' AS Date), N'Analyst', CAST(4000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (15, N'Matthew Turner', N'Male', CAST(N'1991-07-08' AS Date), N'Administrator', CAST(3500 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (16, N'Sophia Hill', N'Female', CAST(N'1988-04-15' AS Date), N'Support Specialist', CAST(3000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (17, N'William Adams', N'Male', CAST(N'1995-11-30' AS Date), N'Coordinator', CAST(3200 AS Decimal(18, 0)), 0)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (18, N'Victoria Clark', N'Female', CAST(N'1990-10-22' AS Date), N'Manager', CAST(5000 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (19, N'Nicholas Scott', N'Male', CAST(N'1993-02-18' AS Date), N'Supervisor', CAST(4200 AS Decimal(18, 0)), 1)
INSERT [dbo].[tblStaff] ([Id], [FullName], [Gender], [DateOfBirth], [Position], [Salary], [Stopwork]) VALUES (20, N'Isabella Green', N'Female', CAST(N'1987-12-05' AS Date), N'Team Lead', CAST(4700 AS Decimal(18, 0)), 0)
SET IDENTITY_INSERT [dbo].[tblStaff] OFF
SET IDENTITY_INSERT [dbo].[tblSupplier] ON 

INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (1, N'John Doe', N'123 Main Street, City A', N'010987001')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (2, N'Jane Smith', N'456 Elm Street, City B', N'010987002')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (3, N'Michael Johnson', N'789 Oak Street, City C', N'010987003')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (4, N'Emily Davis', N'321 Pine Street, City D', N'010987004')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (5, N'David Wilson', N'987 Maple Street, City E', N'010987005')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (6, N'Sarah Thompson', N'654 Cedar Street, City F', N'010987006')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (7, N'Robert Brown', N'234 Birch Street, City G', N'010987007')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (8, N'Jennifer Clark', N'876 Walnut Street, City H', N'010987008')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (9, N'William Taylor', N'543 Spruce Street, City I', N'010987009')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (10, N'Jessica Hernandez', N'678 Ash Street, City J', N'010987010')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (11, N'Adam Johnson', N'111 Pine Street, City K', N'010987011')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (12, N'Sophia Lee', N'222 Oak Street, City L', N'010987012')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (13, N'Daniel Wilson', N'333 Maple Street, City M', N'010987013')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (14, N'Olivia Brown', N'444 Cedar Street, City N', N'010987014')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (15, N'Matthew Davis', N'555 Birch Street, City O', N'010987015')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (16, N'Isabella Garcia', N'666 Walnut Street, City P', N'010987016')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (17, N'Ethan Martinez', N'777 Spruce Street, City Q', N'010987017')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (18, N'Ava Thompson', N'888 Ash Street, City R', N'010987018')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (19, N'Alexander Hernandez', N'999 Elm Street, City S', N'010987019')
INSERT [dbo].[tblSupplier] ([Id], [Supplier], [Address], [Contact]) VALUES (20, N'Mia Adams', N'123 Oak Avenue, City T', N'010987020')
SET IDENTITY_INSERT [dbo].[tblSupplier] OFF
/****** Object:  StoredProcedure [dbo].[DelCusE1]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DelCusE1] @id INT AS
BEGIN
	DELETE FROM dbo.tbCustomers
	WHERE cusID=@id
END
GO
/****** Object:  StoredProcedure [dbo].[InsCusE1]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsCusE1] (@cn VARCHAR(MAX), @con VARCHAR(MaX)) AS
BEGIN
	INSERT INTO dbo.tbCustomers(cusName, cusCon)
	VALUES(@cn, @con)
END
GO
/****** Object:  StoredProcedure [dbo].[RCusE1]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RCusE1] AS
SELECT cusID as ID, cusName as Name, cusCon as Contact
FROM dbo.tbCustomers
GO
/****** Object:  StoredProcedure [dbo].[RCusE1Name]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RCusE1Name] @cn VARCHAR(MAX) AS
BEGIN
	SELECT cusID as ID, cusName as Name, cusCon as Contact 
	FROM tbCustomers
	WHERE CusName LIKE '%' + @cn + '%'
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_PRODUCT]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DELETE_PRODUCT]
	-- Add the parameters for the stored procedure here
	@id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE tblProduct WHERE Id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_STAFF]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DELETE_STAFF]
	-- Add the parameters for the stored procedure here
	@StaffId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE [dbo].[tblStaff] WHERE Id = @StaffId
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_SUPPLIER]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DELETE_SUPPLIER]
	-- Add the parameters for the stored procedure here
	@SupplierId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE [dbo].[tblSupplier] WHERE Id = @SupplierId
END

GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_PRODUCT]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERT_PRODUCT]
	-- Add the parameters for the stored procedure here
	@code NVARCHAR(50),
	@name NVARCHAR(50),
	@quantity int,
	@price decimal(18,2),
	@description NVARCHAR(500)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO tblProduct(Code,Name,Quantity,Price,Description) VALUES(@code,@name,@quantity,@price,@description)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_STAFF]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERT_STAFF]
	-- Add the parameters for the stored procedure here
	@FullName NVARCHAR(50),
	@Gender NVARCHAR(10),
	@DateOfBirth Date,
	@Position NVARCHAR(50),
	@Salary NVARCHAR(50),
	@Stopwork bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tblStaff] (FullName,Gender,DateOfBirth,Position,Salary,Stopwork) VALUES(@FullName,@Gender,@DateOfBirth,@Position,@Salary,@Stopwork)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_SUPPLIER]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERT_SUPPLIER]
	-- Add the parameters for the stored procedure here
	@Supplier NVARCHAR(500),
	@Address NVARCHAR(500),
	@Contact NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO tblSupplier(Supplier,Address,Contact) VALUES(@Supplier,@Address,@Contact)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_PRODUCT]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_PRODUCT]
	-- Add the parameters for the stored procedure here
	@id int,
	@code NVARCHAR(50),
	@name NVARCHAR(50),
	@quantity int,
	@price decimal(18,2),
	@description NVARCHAR(500)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE tblProduct SET Code = @code, Name = @name, Quantity=@quantity, Price=@price, Description = @description WHERE Id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_STAFF]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_STAFF]
	@StaffId int,
	@FullName NVARCHAR(50),
	@Gender NVARCHAR(10),
	@DateOfBirth Date,
	@Position NVARCHAR(50),
	@Salary Decimal(18,0),
	@Stopwork bit
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tblStaff] SET FullName = @FullName, Gender = @Gender, DateOfBirth = @DateOfBirth, Position = @Position,Salary = @Salary,Stopwork = @Stopwork WHERE Id = @StaffId
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_SUPPLIER]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_SUPPLIER]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Supplier NVARCHAR(500),
	@Address NVARCHAR(500),
	@Contact NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tblSupplier] SET Supplier = @Supplier, Address = @Address, Contact = @Contact WHERE Id = @Id;
END

GO
/****** Object:  StoredProcedure [dbo].[UpCusE1]    Script Date: 6/4/2024 10:25:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpCusE1] (@id INT, @cn VARCHAR(MAX), @con VARCHAR(MAX)) AS
BEGIN
	UPDATE dbo.tbCustomers
	SET cusName=@cn, cusCon=@con
	WHERE cusID=@id
END
GO
USE [master]
GO
ALTER DATABASE [E12024] SET  READ_WRITE 
GO
