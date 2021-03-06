USE [master]
GO
/****** Object:  Database [StoreManager]    Script Date: 12/13/2012 21:53:27 ******/
CREATE DATABASE [StoreManager] ON  PRIMARY 
( NAME = N'StoreManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\StoreManager.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StoreManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\StoreManager_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StoreManager] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreManager] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [StoreManager] SET ANSI_NULLS OFF
GO
ALTER DATABASE [StoreManager] SET ANSI_PADDING OFF
GO
ALTER DATABASE [StoreManager] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [StoreManager] SET ARITHABORT OFF
GO
ALTER DATABASE [StoreManager] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [StoreManager] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [StoreManager] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [StoreManager] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [StoreManager] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [StoreManager] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [StoreManager] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [StoreManager] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [StoreManager] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [StoreManager] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [StoreManager] SET  DISABLE_BROKER
GO
ALTER DATABASE [StoreManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [StoreManager] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [StoreManager] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [StoreManager] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [StoreManager] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [StoreManager] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [StoreManager] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [StoreManager] SET  READ_WRITE
GO
ALTER DATABASE [StoreManager] SET RECOVERY SIMPLE
GO
ALTER DATABASE [StoreManager] SET  MULTI_USER
GO
ALTER DATABASE [StoreManager] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [StoreManager] SET DB_CHAINING OFF
GO
USE [StoreManager]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12/13/2012 21:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/13/2012 21:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/13/2012 21:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/13/2012 21:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Stock] [int] NOT NULL,
	[Price] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 12/13/2012 21:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SaleTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleItems]    Script Date: 12/13/2012 21:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[SaleID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_SaleItems] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 12/13/2012 21:53:27 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  ForeignKey [FK_Products_Suppliers]    Script Date: 12/13/2012 21:53:27 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
/****** Object:  ForeignKey [FK_Sales_Users]    Script Date: 12/13/2012 21:53:27 ******/
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Users]
GO
/****** Object:  ForeignKey [FK_SaleItems_Products]    Script Date: 12/13/2012 21:53:27 ******/
ALTER TABLE [dbo].[SaleItems]  WITH CHECK ADD  CONSTRAINT [FK_SaleItems_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[SaleItems] CHECK CONSTRAINT [FK_SaleItems_Products]
GO
/****** Object:  ForeignKey [FK_SaleItems_Sales]    Script Date: 12/13/2012 21:53:27 ******/
ALTER TABLE [dbo].[SaleItems]  WITH CHECK ADD  CONSTRAINT [FK_SaleItems_Sales] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sales] ([SaleID])
GO
ALTER TABLE [dbo].[SaleItems] CHECK CONSTRAINT [FK_SaleItems_Sales]
GO
