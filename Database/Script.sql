USE [master]
GO
/****** Object:  Database [HostelDB]    Script Date: 06/15/2022 8:55:31 AM ******/
CREATE DATABASE [HostelDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HostelDB', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HostelDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HostelDB_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HostelDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HostelDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HostelDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HostelDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HostelDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HostelDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HostelDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HostelDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HostelDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HostelDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HostelDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HostelDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HostelDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HostelDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HostelDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HostelDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HostelDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HostelDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HostelDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HostelDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HostelDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HostelDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HostelDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HostelDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HostelDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HostelDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HostelDB] SET  MULTI_USER 
GO
ALTER DATABASE [HostelDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HostelDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HostelDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HostelDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HostelDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HostelDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HostelDB', N'ON'
GO
ALTER DATABASE [HostelDB] SET QUERY_STORE = OFF
GO
USE [HostelDB]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 06/15/2022 8:55:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bill_id] [nvarchar](15) NOT NULL,
	[customer_id] [nvarchar](15) NOT NULL,
	[total] [decimal](15, 4) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[created] [date] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 06/15/2022 8:55:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[billd_id] [nvarchar](15) NOT NULL,
	[bill_id] [nvarchar](15) NOT NULL,
	[service_id] [nvarchar](15) NOT NULL,
	[old_qty] [int] NULL,
	[qty] [int] NULL,
	[total] [decimal](15, 4) NULL,
	[description] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 06/15/2022 8:55:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[contract_id] [nvarchar](15) NOT NULL,
	[customer_id] [nvarchar](15) NOT NULL,
	[room_id] [nvarchar](15) NOT NULL,
	[signed_date] [date] NULL,
	[due_date] [date] NULL,
	[status] [nvarchar](10) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 06/15/2022 8:55:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [nvarchar](15) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[gender] [nvarchar](10) NULL,
	[dob] [date] NULL,
	[phone] [char](10) NULL,
	[status] [nvarchar](16) NULL,
	[address] [nvarchar](100) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hostel]    Script Date: 06/15/2022 8:55:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hostel](
	[hostel_id] [nvarchar](15) NOT NULL,
	[hostel_name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NULL,
	[phone] [nchar](10) NULL,
	[user_id] [nvarchar](15) NULL,
 CONSTRAINT [PK_Hostel] PRIMARY KEY CLUSTERED 
(
	[hostel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paypal]    Script Date: 06/15/2022 8:55:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paypal](
	[paypal_id] [nvarchar](50) NOT NULL,
	[total] [decimal](15, 4) NULL,
	[status] [nvarchar](50) NULL,
	[created] [date] NULL,
	[bill_id] [nvarchar](15) NULL,
 CONSTRAINT [PK_Paypal] PRIMARY KEY CLUSTERED 
(
	[paypal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 06/15/2022 8:55:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [nvarchar](15) NOT NULL,
	[hostel_id] [nvarchar](15) NOT NULL,
	[room_number] [int] NULL,
	[price] [decimal](15, 4) NULL,
	[description] [nvarchar](200) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 06/15/2022 8:55:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[service_id] [nvarchar](15) NOT NULL,
	[service_name] [nvarchar](50) NOT NULL,
	[unit_price] [decimal](15, 4) NULL,
	[updated_date] [date] NULL,
	[description] [nvarchar](200) NULL,
	[hostel_id] [nvarchar](15) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceHistory]    Script Date: 06/15/2022 8:55:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceHistory](
	[history_id] [nvarchar](15) NOT NULL,
	[service_name] [nvarchar](50) NULL,
	[unit_price] [decimal](15, 4) NULL,
	[updated_date] [date] NULL,
	[description] [nvarchar](200) NULL,
	[service_id] [nvarchar](15) NULL,
	[hostel_id] [int] NULL,
 CONSTRAINT [PK_ServiceHistory] PRIMARY KEY CLUSTERED 
(
	[history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 06/15/2022 8:55:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [nvarchar](15) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[phone] [char](10) NULL,
	[status] [nvarchar](10) NULL,
	[Role] [nchar](2) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Contract] ([contract_id], [customer_id], [room_id], [signed_date], [due_date], [status], [description]) VALUES (N'1', N'312456854', N'1', CAST(N'2022-12-06' AS Date), CAST(N'2023-12-06' AS Date), N'ACTIVE    ', N'non')
GO
INSERT [dbo].[Contract] ([contract_id], [customer_id], [room_id], [signed_date], [due_date], [status], [description]) VALUES (N'2', N'312469817', N'4', CAST(N'2022-12-06' AS Date), CAST(N'2023-12-06' AS Date), N'ACTIVE    ', N'non')
GO
INSERT [dbo].[Customer] ([customer_id], [password], [fullname], [email], [gender], [dob], [phone], [status], [address]) VALUES (N'312456854', NULL, N'Nguyễn Nhựt Minh', NULL, N'male      ', CAST(N'2001-01-29' AS Date), N'093373331 ', N'ACTIVE', N'số 233, tổ 7, khu 4, xã Trung An, TP.Mỹ Tho')
GO
INSERT [dbo].[Customer] ([customer_id], [password], [fullname], [email], [gender], [dob], [phone], [status], [address]) VALUES (N'312469817', NULL, N'Trần Quang Hùng', NULL, N'male      ', CAST(N'2001-11-29' AS Date), N'0368770727', N'ACTIVE', N'Quận 9, TP.HCm')
GO
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [user_id]) VALUES (N'1', N'Monn', N'23 Lê Văn Việt, Quận 9', N'023311112 ', N'1')
GO
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [user_id]) VALUES (N'2', N'Hoos', N'22 Quận 2', N'046488822 ', N'2')
GO
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [user_id]) VALUES (N'3', N'Mộng Mơ', N'41 Quận 3', N'034747478 ', N'1')
GO
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (N'1', N'1', 1, CAST(2300000.0000 AS Decimal(15, 4)), NULL, N'RENTING')
GO
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (N'2', N'1', 2, CAST(1600000.0000 AS Decimal(15, 4)), NULL, N'EMPTY')
GO
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (N'3', N'2', 1, CAST(2400000.0000 AS Decimal(15, 4)), NULL, N'EMPTY')
GO
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (N'4', N'3', 1, CAST(4220000.0000 AS Decimal(15, 4)), NULL, N'RENTING')
GO
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (N'5', N'3', 2, CAST(4220000.0000 AS Decimal(15, 4)), NULL, N'EMPTY')
GO
INSERT [dbo].[Service] ([service_id], [service_name], [unit_price], [updated_date], [description], [hostel_id]) VALUES (N'1', N'Điện', CAST(1300.0000 AS Decimal(15, 4)), CAST(N'2022-02-16' AS Date), N'kWh', N'1')
GO
INSERT [dbo].[Service] ([service_id], [service_name], [unit_price], [updated_date], [description], [hostel_id]) VALUES (N'2', N'Nước', CAST(3000.0000 AS Decimal(15, 4)), CAST(N'2022-02-16' AS Date), N'm3', N'1              ')
GO
INSERT [dbo].[ServiceHistory] ([history_id], [service_name], [unit_price], [updated_date], [description], [service_id], [hostel_id]) VALUES (N'1', N'Điện', CAST(1300.0000 AS Decimal(15, 4)), CAST(N'2022-02-16' AS Date), N'kWh', N'1', 1)
GO
INSERT [dbo].[ServiceHistory] ([history_id], [service_name], [unit_price], [updated_date], [description], [service_id], [hostel_id]) VALUES (N'2', N'Nước', CAST(2400.0000 AS Decimal(15, 4)), CAST(N'2021-02-02' AS Date), N'm3', N'2', 1)
GO
INSERT [dbo].[User] ([user_id], [password], [email], [fullname], [phone], [status], [Role]) VALUES (N'1', N'hung', N'hungtqse150272@fpt.edu.vn', N'Trần Quang Hùng', N'021412414 ', N'APPROVED  ', N'US')
GO
INSERT [dbo].[User] ([user_id], [password], [email], [fullname], [phone], [status], [Role]) VALUES (N'2', N'hung', N'hung@gmail.com', NULL, NULL, N'REJECTED  ', N'US')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Room]    Script Date: 06/15/2022 8:55:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_Room] ON [dbo].[Room]
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Room_1]    Script Date: 06/15/2022 8:55:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_Room_1] ON [dbo].[Room]
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Service] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Service]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([bill_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Customer]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Room1] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Room1]
GO
ALTER TABLE [dbo].[Paypal]  WITH CHECK ADD  CONSTRAINT [FK_Paypal_Bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([bill_id])
GO
ALTER TABLE [dbo].[Paypal] CHECK CONSTRAINT [FK_Paypal_Bill]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hostel] FOREIGN KEY([hostel_id])
REFERENCES [dbo].[Hostel] ([hostel_id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Hostel]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Hostel] FOREIGN KEY([hostel_id])
REFERENCES [dbo].[Hostel] ([hostel_id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Hostel]
GO
ALTER TABLE [dbo].[ServiceHistory]  WITH CHECK ADD  CONSTRAINT [FK_ServiceHistory_Service1] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[ServiceHistory] CHECK CONSTRAINT [FK_ServiceHistory_Service1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Hostel] FOREIGN KEY([user_id])
REFERENCES [dbo].[Hostel] ([hostel_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Hostel]
GO
USE [master]
GO
ALTER DATABASE [HostelDB] SET  READ_WRITE 
GO
