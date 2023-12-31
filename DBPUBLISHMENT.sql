USE [master]
GO
/****** Object:  Database [Publishment]    Script Date: 13.08.2023 19:11:40 ******/
CREATE DATABASE [Publishment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Publishment', FILENAME = N'E:\Program Files (x86)\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Publishment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Publishment_log', FILENAME = N'E:\Program Files (x86)\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Publishment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Publishment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Publishment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Publishment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Publishment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Publishment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Publishment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Publishment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Publishment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Publishment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Publishment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Publishment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Publishment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Publishment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Publishment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Publishment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Publishment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Publishment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Publishment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Publishment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Publishment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Publishment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Publishment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Publishment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Publishment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Publishment] SET RECOVERY FULL 
GO
ALTER DATABASE [Publishment] SET  MULTI_USER 
GO
ALTER DATABASE [Publishment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Publishment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Publishment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Publishment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Publishment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Publishment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Publishment', N'ON'
GO
ALTER DATABASE [Publishment] SET QUERY_STORE = ON
GO
ALTER DATABASE [Publishment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Publishment]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 13.08.2023 19:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nchar](20) NULL,
	[lastname] [nchar](20) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 13.08.2023 19:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](20) NULL,
	[id_theme] [int] NULL,
	[id_author] [int] NULL,
	[price] [int] NULL,
	[date_of_publish] [date] NULL,
	[pages] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 13.08.2023 19:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](10) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 13.08.2023 19:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_book] [int] NULL,
	[date_of_sale] [date] NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[id_shop] [int] NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shops]    Script Date: 13.08.2023 19:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](20) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Shops] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Themes]    Script Date: 13.08.2023 19:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Themes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](20) NULL,
 CONSTRAINT [PK_Themes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Publishment] SET  READ_WRITE 
GO
