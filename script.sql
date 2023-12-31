USE [master]
GO
/****** Object:  Database [Magazin]    Script Date: 19.07.2023 20:28:09 ******/
CREATE DATABASE [Magazin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Magazin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Magazin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Magazin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Magazin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Magazin] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Magazin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Magazin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Magazin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Magazin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Magazin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Magazin] SET ARITHABORT OFF 
GO
ALTER DATABASE [Magazin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Magazin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Magazin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Magazin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Magazin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Magazin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Magazin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Magazin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Magazin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Magazin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Magazin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Magazin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Magazin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Magazin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Magazin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Magazin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Magazin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Magazin] SET RECOVERY FULL 
GO
ALTER DATABASE [Magazin] SET  MULTI_USER 
GO
ALTER DATABASE [Magazin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Magazin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Magazin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Magazin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Magazin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Magazin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Magazin', N'ON'
GO
ALTER DATABASE [Magazin] SET QUERY_STORE = ON
GO
ALTER DATABASE [Magazin] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Magazin]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](50) NULL,
	[id_city] [int] NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_region] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[id_suplier] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_delivery] [date] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markup]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[percent] [float] NULL,
 CONSTRAINT [PK_Markup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Measurement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_adress] [int] NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_category] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[id_measurement] [int] NULL,
	[id_producer] [int] NULL,
	[id_markup] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [date] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suplier]    Script Date: 19.07.2023 20:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_adress] [int] NULL,
 CONSTRAINT [PK_Suplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adress] ON 

INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (1, N'Малая Арнаутская', 2)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (2, N'Большая Арнаутская', 2)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (3, N'Дерибассовская', 2)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (4, N'Хрещатик', 3)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (5, N'Ленина', 1)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (6, N'Фрайштрассе', 9)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (7, N'Берлинерштрассе', 10)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (8, N'Назарбаева', 4)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (9, N'Волстрит', 6)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (10, N'Краковская', 14)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (11, N'МаоЦзэдуновская', 13)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (12, N'Брновская', 15)
INSERT [dbo].[Adress] ([id], [street], [id_city]) VALUES (13, N'Ким Ир Сена', 12)
SET IDENTITY_INSERT [dbo].[Adress] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Хозяйственные товары')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Кондитерские изделия')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Фрукты ')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Овощи ')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Безалкогольные напитки')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Алкогольные напитки ')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Домашняя кухня')
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Строительные материалы')
INSERT [dbo].[Category] ([id], [name]) VALUES (9, N'Косметика')
INSERT [dbo].[Category] ([id], [name]) VALUES (10, N'Парфюмерия')
INSERT [dbo].[Category] ([id], [name]) VALUES (11, N'Одежда')
INSERT [dbo].[Category] ([id], [name]) VALUES (12, N'Обувь')
INSERT [dbo].[Category] ([id], [name]) VALUES (13, N'Автозапчасти')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (1, N'Минск', 4)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (2, N'Одесса', 2)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (3, N'Киев', 3)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (4, N'Нурсултан', 5)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (5, N'Мюнхен', 1)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (6, N'Нью-Йорк', 7)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (7, N'Сакраменто', 8)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (8, N'Ванкувер', 6)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (9, N'Констанц', 1)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (10, N'Нюрнберг', 1)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (11, N'Дрезден', 9)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (12, N'Пхеньян', 13)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (13, N'Ухань', 12)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (14, N'Варшава', 10)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (15, N'Прага', 11)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [name]) VALUES (1, N'Германия')
INSERT [dbo].[Country] ([id], [name]) VALUES (2, N'Украина')
INSERT [dbo].[Country] ([id], [name]) VALUES (3, N'Беларусь')
INSERT [dbo].[Country] ([id], [name]) VALUES (4, N'Молдова')
INSERT [dbo].[Country] ([id], [name]) VALUES (5, N'США')
INSERT [dbo].[Country] ([id], [name]) VALUES (6, N'Канада')
INSERT [dbo].[Country] ([id], [name]) VALUES (7, N'Австрия')
INSERT [dbo].[Country] ([id], [name]) VALUES (8, N'Казахстан')
INSERT [dbo].[Country] ([id], [name]) VALUES (9, N'Польша')
INSERT [dbo].[Country] ([id], [name]) VALUES (10, N'Чехия')
INSERT [dbo].[Country] ([id], [name]) VALUES (11, N'КНДР')
INSERT [dbo].[Country] ([id], [name]) VALUES (12, N'Китай')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([id], [id_product], [id_suplier], [price], [quantity], [date_of_delivery]) VALUES (1, 1, 1, 92, 4, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_suplier], [price], [quantity], [date_of_delivery]) VALUES (2, 2, 1, 48.8, 2, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_suplier], [price], [quantity], [date_of_delivery]) VALUES (16, 3, 2, 122, 4, CAST(N'2023-01-01' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_suplier], [price], [quantity], [date_of_delivery]) VALUES (17, 11, 3, 528, 1, CAST(N'2023-07-01' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_suplier], [price], [quantity], [date_of_delivery]) VALUES (18, 12, 3, 648, 4, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_suplier], [price], [quantity], [date_of_delivery]) VALUES (19, 13, 6, 1360, 20, CAST(N'2023-02-01' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_suplier], [price], [quantity], [date_of_delivery]) VALUES (20, 14, 2, 490, 14, CAST(N'2023-04-18' AS Date))
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Markup] ON 

INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (1, N'Продукты питания', 0.35)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (2, N'Промышленные товары', 0.6)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (3, N'Хозяйственные товары', 0.6)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (4, N'Одежда и обувь', 1.1)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (5, N'Косметика и парфюмерия', 0.7)
SET IDENTITY_INSERT [dbo].[Markup] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurement] ON 

INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (1, N'штуки', NULL)
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (2, N'литр', N'для жидкостей')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (3, N'упаковка', NULL)
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (4, N'кг', N'для товаров на развес')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (5, N'мешок', NULL)
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (6, N'комплект', NULL)
SET IDENTITY_INSERT [dbo].[Measurement] OFF
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (1, N'Bayerischeprom', 6)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (2, N'Украгропром', 1)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (3, N'Завод "Белаз"', 5)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (4, N'ООО "Рога и копыта"', 2)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (5, N'Wolkswagen', 7)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (6, N'Казахстроймаш', 8)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (7, N'American foods', 9)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (8, N'ООО "Инвестгрупп"', 3)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (9, N'Киевхлеббулгорзавод', 4)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (10, N'Завод Ким Чен Ына', 13)
INSERT [dbo].[Producer] ([id], [name], [id_adress]) VALUES (11, N'Huisun', 11)
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (1, N'Яблоки красные', 3, 23, 234, 4, 2, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (2, N'Яблоки зелёные', 3, 24.4, 876, 4, 8, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (3, N'Яблоки сладкие', 3, 30.5, 323, 4, 4, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (4, N'Ананас', 3, 65.3, 323, 1, 4, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (5, N'Шины резиновые', 13, 173.65, 24, 1, 5, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (6, N'Гамбургер', 7, 89.95, 676, 1, 3, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (7, N'Карандаш', 1, 12.3, 8787, 1, 4, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (8, N'Ручка', 1, 11.7, 675, 1, 4, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (9, N'Цемент', 8, 154.2, 954, 3, 6, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (10, N'Вентилятор', 1, 1985.43, 41, 1, 3, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (11, N'Набор инструментов', 8, 528, 4, 5, 11, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (12, N'Песок', 8, 162, 34, 6, 10, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (13, N'Сигареты', 1, 68, 321, 3, 9, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_measurement], [id_producer], [id_markup]) VALUES (14, N'Пиво', 6, 35, 231, 2, 6, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (1, N'Бавария', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (2, N'Одесская область', 2)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (3, N'Киевская область', 2)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (4, N'Минская область', 3)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (5, N'Нурсултанская область', 8)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (6, N'Онтарио', 6)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (7, N'Нью-Йорк', 5)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (8, N'Калифорния', 5)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (9, N'Саксония', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (10, N'Варшавское воеводство', 9)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (11, N'Пражская область', 10)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (12, N'Провинция Ухань', 12)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (13, N'Префектура Пхеньян', 11)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (1, 1, 92, 4, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (2, 2, 48.8, 2, CAST(N'2022-05-23' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (3, 3, 122, 4, CAST(N'2023-01-01' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (4, 4, 130.6, 2, CAST(N'2023-01-03' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (5, 5, 1041.9, 6, CAST(N'2023-05-14' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (6, 6, 359.8, 4, CAST(N'2023-04-23' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (7, 7, 12.3, 1, CAST(N'2023-01-08' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (8, 8, 81.9, 7, CAST(N'2023-02-28' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (9, 9, 308.4, 2, CAST(N'2023-03-06' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (10, 10, 5875.29, 3, CAST(N'2023-06-30' AS Date))
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Suplier] ON 

INSERT [dbo].[Suplier] ([id], [name], [id_adress]) VALUES (1, N'Повна чаша', 1)
INSERT [dbo].[Suplier] ([id], [name], [id_adress]) VALUES (2, N'Евротрейд', 2)
INSERT [dbo].[Suplier] ([id], [name], [id_adress]) VALUES (3, N'Алиэкспресс', 11)
INSERT [dbo].[Suplier] ([id], [name], [id_adress]) VALUES (4, N'Беларусьтрейд', 5)
INSERT [dbo].[Suplier] ([id], [name], [id_adress]) VALUES (5, N'УкрАмерТрейд', 9)
INSERT [dbo].[Suplier] ([id], [name], [id_adress]) VALUES (6, N'Наш импорт', 3)
SET IDENTITY_INSERT [dbo].[Suplier] OFF
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_City] FOREIGN KEY([id_city])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_City]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_Region_City] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_Region_City]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Product_Delivery] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Product_Delivery]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Suplier_Delivery] FOREIGN KEY([id_suplier])
REFERENCES [dbo].[Suplier] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Suplier_Delivery]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Producer] FOREIGN KEY([id_adress])
REFERENCES [dbo].[Adress] ([id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Adress_Producer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Category_Product] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Category_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Markup_Product] FOREIGN KEY([id_markup])
REFERENCES [dbo].[Markup] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Markup_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Measurement_Product] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[Measurement] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Measurement_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Product] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Producer_Product]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Country_Region] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Country_Region]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Product_Sale] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Product_Sale]
GO
ALTER TABLE [dbo].[Suplier]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Suplier] FOREIGN KEY([id_adress])
REFERENCES [dbo].[Adress] ([id])
GO
ALTER TABLE [dbo].[Suplier] CHECK CONSTRAINT [FK_Adress_Suplier]
GO
USE [master]
GO
ALTER DATABASE [Magazin] SET  READ_WRITE 
GO
