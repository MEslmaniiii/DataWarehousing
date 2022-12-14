USE [master]
GO
/****** Object:  Database [RetailBankDWH]    Script Date: 10/19/2022 10:13:47 PM ******/
CREATE DATABASE [RetailBankDWH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RetailBankDWH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RetailBankDWH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RetailBankDWH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RetailBankDWH_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RetailBankDWH] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RetailBankDWH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RetailBankDWH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RetailBankDWH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RetailBankDWH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RetailBankDWH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RetailBankDWH] SET ARITHABORT OFF 
GO
ALTER DATABASE [RetailBankDWH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RetailBankDWH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RetailBankDWH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RetailBankDWH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RetailBankDWH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RetailBankDWH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RetailBankDWH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RetailBankDWH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RetailBankDWH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RetailBankDWH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RetailBankDWH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RetailBankDWH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RetailBankDWH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RetailBankDWH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RetailBankDWH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RetailBankDWH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RetailBankDWH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RetailBankDWH] SET RECOVERY FULL 
GO
ALTER DATABASE [RetailBankDWH] SET  MULTI_USER 
GO
ALTER DATABASE [RetailBankDWH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RetailBankDWH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RetailBankDWH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RetailBankDWH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RetailBankDWH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RetailBankDWH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RetailBankDWH', N'ON'
GO
ALTER DATABASE [RetailBankDWH] SET QUERY_STORE = OFF
GO
USE [RetailBankDWH]
GO
/****** Object:  Table [dbo].[Dim_CRM_CallCenter]    Script Date: 10/19/2022 10:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_CRM_CallCenter](
	[CallID] [int] IDENTITY(1,1) NOT NULL,
	[DateRecieved] [date] NULL,
	[PhoneFinal] [nvarchar](15) NULL,
	[OutCome] [varchar](20) NULL,
	[ServeeR] [varchar](20) NULL,
 CONSTRAINT [PK_Dim_CRM_CallCenter] PRIMARY KEY CLUSTERED 
(
	[CallID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_CRM_Events]    Script Date: 10/19/2022 10:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_CRM_Events](
	[EVENTID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyResponse] [nvarchar](500) NULL,
	[Consumer_Complaint] [nvarchar](600) NULL,
	[DateRecieved] [date] NULL,
	[DateSent] [date] NULL,
 CONSTRAINT [PK_Dim_CRM_Events] PRIMARY KEY CLUSTERED 
(
	[EVENTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 10/19/2022 10:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[DateKey] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [tinyint] NOT NULL,
	[DaySuffix] [char](2) NOT NULL,
	[Weekday] [tinyint] NOT NULL,
	[WeekDayName] [varchar](10) NOT NULL,
	[WeekDayName_Short] [char](3) NOT NULL,
	[WeekDayName_FirstLetter] [char](1) NOT NULL,
	[DOWInMonth] [tinyint] NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekOfMonth] [tinyint] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[Month] [tinyint] NOT NULL,
	[MonthName] [varchar](10) NOT NULL,
	[MonthName_Short] [char](3) NOT NULL,
	[MonthName_FirstLetter] [char](1) NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) NOT NULL,
	[Year] [int] NOT NULL,
	[MMYYYY] [char](6) NOT NULL,
	[MonthYear] [char](7) NOT NULL,
	[IsWeekend] [bit] NOT NULL,
	[IsHoliday] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimAccount]    Script Date: 10/19/2022 10:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAccount](
	[AccountSK] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [varchar](50) NOT NULL,
	[district_id] [varchar](50) NULL,
	[frequency] [varchar](50) NULL,
	[parseddate] [varchar](50) NULL,
	[year] [varchar](50) NULL,
	[month] [varchar](50) NULL,
	[day] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimClient]    Script Date: 10/19/2022 10:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimClient](
	[ClinetSK] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [varchar](50) NULL,
	[sex] [varchar](50) NULL,
	[age] [varchar](50) NULL,
	[social] [varchar](50) NULL,
	[first] [varchar](50) NULL,
	[last] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[address_1] [varchar](50) NULL,
	[address_2] [varchar](50) NULL,
	[DistrictSK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClinetSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCRM_Reveiw]    Script Date: 10/19/2022 10:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCRM_Reveiw](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[Stars] [int] NULL,
	[Review] [nvarchar](max) NULL,
	[Review_DatE] [date] NULL,
 CONSTRAINT [PK_DimCRM_Reveiw] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDistrict]    Script Date: 10/19/2022 10:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDistrict](
	[DistrictSK] [int] IDENTITY(1,1) NOT NULL,
	[district_id] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state_name] [varchar](50) NULL,
	[state_abbrev] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[division] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DistrictSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactCRM]    Script Date: 10/19/2022 10:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactCRM](
	[CRMID] [int] IDENTITY(1,1) NOT NULL,
	[issue] [varchar](100) NULL,
	[Product] [varchar](50) NULL,
	[Sub_Product] [varchar](50) NULL,
	[SubmittedVia] [varchar](20) NULL,
	[TimelyResponse] [varchar](10) NULL,
	[EventId] [int] NULL,
	[ReviewId] [int] NULL,
	[CallID] [int] NULL,
	[CustomerId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTransaction]    Script Date: 10/19/2022 10:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTransaction](
	[DateKey] [int] NOT NULL,
	[ClinetSK] [int] NOT NULL,
	[AccountSK] [int] NOT NULL,
	[trans_id] [varchar](100) NOT NULL,
	[amount] [decimal](10, 2) NULL,
	[FromBank] [varchar](50) NULL,
	[ToBank] [varchar](50) NULL,
	[Operation] [varchar](50) NULL,
	[TransactionTime] [time](7) NULL,
 CONSTRAINT [PK_FactTransaction] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC,
	[ClinetSK] ASC,
	[AccountSK] ASC,
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimClient]  WITH CHECK ADD  CONSTRAINT [FK_DimClient_DimDistrict] FOREIGN KEY([DistrictSK])
REFERENCES [dbo].[DimDistrict] ([DistrictSK])
GO
ALTER TABLE [dbo].[DimClient] CHECK CONSTRAINT [FK_DimClient_DimDistrict]
GO
ALTER TABLE [dbo].[FactCRM]  WITH CHECK ADD  CONSTRAINT [FK_FactCRM_Dim_CRM_CallCenter] FOREIGN KEY([CallID])
REFERENCES [dbo].[Dim_CRM_CallCenter] ([CallID])
GO
ALTER TABLE [dbo].[FactCRM] CHECK CONSTRAINT [FK_FactCRM_Dim_CRM_CallCenter]
GO
ALTER TABLE [dbo].[FactCRM]  WITH CHECK ADD  CONSTRAINT [FK_FactCRM_Dim_CRM_Events] FOREIGN KEY([EventId])
REFERENCES [dbo].[Dim_CRM_Events] ([EVENTID])
GO
ALTER TABLE [dbo].[FactCRM] CHECK CONSTRAINT [FK_FactCRM_Dim_CRM_Events]
GO
ALTER TABLE [dbo].[FactTransaction]  WITH CHECK ADD  CONSTRAINT [FK_FactTransaction_Dim_Date] FOREIGN KEY([DateKey])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[FactTransaction] CHECK CONSTRAINT [FK_FactTransaction_Dim_Date]
GO
ALTER TABLE [dbo].[FactTransaction]  WITH CHECK ADD  CONSTRAINT [FK_FactTransaction_DimAccount] FOREIGN KEY([AccountSK])
REFERENCES [dbo].[DimAccount] ([AccountSK])
GO
ALTER TABLE [dbo].[FactTransaction] CHECK CONSTRAINT [FK_FactTransaction_DimAccount]
GO
ALTER TABLE [dbo].[FactTransaction]  WITH CHECK ADD  CONSTRAINT [FK_FactTransaction_DimClient] FOREIGN KEY([ClinetSK])
REFERENCES [dbo].[DimClient] ([ClinetSK])
GO
ALTER TABLE [dbo].[FactTransaction] CHECK CONSTRAINT [FK_FactTransaction_DimClient]
GO
USE [master]
GO
ALTER DATABASE [RetailBankDWH] SET  READ_WRITE 
GO
