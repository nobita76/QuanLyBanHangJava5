USE [master]
GO
/****** Object:  Database [Java5_ASMFinal_PS10511_BanHang]    Script Date: 10/22/2020 10:52:29 AM ******/
CREATE DATABASE [Java5_ASMFinal_PS10511_BanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Java5_ASMFinal_PS10511_BanHang', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Java5_ASMFinal_PS10511_BanHang.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Java5_ASMFinal_PS10511_BanHang_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Java5_ASMFinal_PS10511_BanHang_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Java5_ASMFinal_PS10511_BanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET  MULTI_USER 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Java5_ASMFinal_PS10511_BanHang]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 10/22/2020 10:52:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[stt] [int] IDENTITY(1,1) NOT NULL,
	[MaDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[DonGia] [int] NULL,
	[SoLuong] [int] NULL,
	[trangthai] [int] NOT NULL,
	[NgayDatHang] [date] NULL,
	[username] [nvarchar](50) NULL,
	[address] [nvarchar](1000) NOT NULL,
 CONSTRAINT [pk_CTDH] PRIMARY KEY CLUSTERED 
(
	[stt] ASC,
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 10/22/2020 10:52:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 10/22/2020 10:52:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDatHang] [date] NULL,
	[username] [nvarchar](50) NULL,
	[address] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/22/2020 10:52:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[DonGia] [int] NULL,
	[SoLuong] [int] NULL,
	[Hinh] [varchar](50) NULL,
	[type] [varchar](10) NOT NULL,
	[MaDM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/22/2020 10:52:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[vaitro] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([stt], [MaDH], [MaSP], [DonGia], [SoLuong], [trangthai], [NgayDatHang], [username], [address]) VALUES (2, 1, 2, 5, 5, 1, CAST(0x90400B00 AS Date), N'admin', N'hi')
INSERT [dbo].[ChiTietDonHang] ([stt], [MaDH], [MaSP], [DonGia], [SoLuong], [trangthai], [NgayDatHang], [username], [address]) VALUES (3, 2, 1, 500, 1, 1, CAST(0xB4410B00 AS Date), N'admin', N'Thành 1244')
INSERT [dbo].[ChiTietDonHang] ([stt], [MaDH], [MaSP], [DonGia], [SoLuong], [trangthai], [NgayDatHang], [username], [address]) VALUES (4, 2, 2, 200, 1, 1, CAST(0xB4410B00 AS Date), N'admin', N'Thành 1244')
INSERT [dbo].[ChiTietDonHang] ([stt], [MaDH], [MaSP], [DonGia], [SoLuong], [trangthai], [NgayDatHang], [username], [address]) VALUES (5, 2, 5, 5000, 1, 1, CAST(0xB4410B00 AS Date), N'admin', N'Thành 1244')
INSERT [dbo].[ChiTietDonHang] ([stt], [MaDH], [MaSP], [DonGia], [SoLuong], [trangthai], [NgayDatHang], [username], [address]) VALUES (6, 3, 1, 500, 1, 0, CAST(0xB4410B00 AS Date), N'ps10511', N'Địa chỉ tôi nó sẽ nằm ở đây nè')
INSERT [dbo].[ChiTietDonHang] ([stt], [MaDH], [MaSP], [DonGia], [SoLuong], [trangthai], [NgayDatHang], [username], [address]) VALUES (7, 3, 5, 5000, 1, 0, CAST(0xB4410B00 AS Date), N'ps10511', N'Địa chỉ tôi nó sẽ nằm ở đây nè')
INSERT [dbo].[ChiTietDonHang] ([stt], [MaDH], [MaSP], [DonGia], [SoLuong], [trangthai], [NgayDatHang], [username], [address]) VALUES (9, 4, 6, 5, 1, 0, CAST(0xB5410B00 AS Date), N'admin', N'test')
INSERT [dbo].[ChiTietDonHang] ([stt], [MaDH], [MaSP], [DonGia], [SoLuong], [trangthai], [NgayDatHang], [username], [address]) VALUES (10, 5, 6, 5, 1, 0, CAST(0xB6410B00 AS Date), N'admin', N'Updating...')
INSERT [dbo].[ChiTietDonHang] ([stt], [MaDH], [MaSP], [DonGia], [SoLuong], [trangthai], [NgayDatHang], [username], [address]) VALUES (11, 6, 5, 5000, 1, 1, CAST(0xB7410B00 AS Date), N'nguyenngu', N'48DươngThịMười%2CQuận12')
INSERT [dbo].[ChiTietDonHang] ([stt], [MaDH], [MaSP], [DonGia], [SoLuong], [trangthai], [NgayDatHang], [username], [address]) VALUES (12, 6, 7, 50, 1, 1, CAST(0xB7410B00 AS Date), N'nguyenngu', N'48DươngThịMười%2CQuận12')
INSERT [dbo].[ChiTietDonHang] ([stt], [MaDH], [MaSP], [DonGia], [SoLuong], [trangthai], [NgayDatHang], [username], [address]) VALUES (13, 6, 8, 25, 1, 1, CAST(0xB7410B00 AS Date), N'nguyenngu', N'48DươngThịMười%2CQuận12')
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (1, N'summer')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (2, N'short')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (4, N'ABCDE')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (5, N'GHK')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [username], [address]) VALUES (1, CAST(0x90400B00 AS Date), N'admin', N'Updating')
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [username], [address]) VALUES (2, CAST(0xB4410B00 AS Date), N'admin', N'test')
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [username], [address]) VALUES (3, CAST(0xB4410B00 AS Date), N'ps10511', N'Địa chỉ tôi nó sẽ nằm ở đây nè')
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [username], [address]) VALUES (4, CAST(0xB5410B00 AS Date), N'admin', N'test')
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [username], [address]) VALUES (5, CAST(0xB6410B00 AS Date), N'admin', N'Updating...')
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [username], [address]) VALUES (6, CAST(0xB7410B00 AS Date), N'nguyenngu', N'48 Dương Thị Mười, Quận 12')
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [SoLuong], [Hinh], [type], [MaDM]) VALUES (1, N'Thành', 500, 0, N'product_1.jpg', N'hot', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [SoLuong], [Hinh], [type], [MaDM]) VALUES (2, N'Th?nh 2', 200, 3, N'product_2.jpg', N'sale', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [SoLuong], [Hinh], [type], [MaDM]) VALUES (5, N'Koko', 5000, 493, N'product_5.jpg', N'sale', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [SoLuong], [Hinh], [type], [MaDM]) VALUES (6, N'Bag 1', 5, 497, N'product_17.jpg', N'sale', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [SoLuong], [Hinh], [type], [MaDM]) VALUES (7, N'VIP 1', 50, 4, N'product_8.jpg', N'new', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [SoLuong], [Hinh], [type], [MaDM]) VALUES (8, N'VIP 2', 25, 4, N'product_13.jpg', N'new', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [SoLuong], [Hinh], [type], [MaDM]) VALUES (9, N'VIP 3', 20, 5, N'product_11.jpg', N'hot', 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
INSERT [dbo].[Users] ([Username], [Password], [vaitro]) VALUES (N'admin', N'admin', 1)
INSERT [dbo].[Users] ([Username], [Password], [vaitro]) VALUES (N'admin2', N'thanhdeptrai', 1)
INSERT [dbo].[Users] ([Username], [Password], [vaitro]) VALUES (N'admin3', N'admin3', 0)
INSERT [dbo].[Users] ([Username], [Password], [vaitro]) VALUES (N'admin4', N'admin4', 1)
INSERT [dbo].[Users] ([Username], [Password], [vaitro]) VALUES (N'admin5', N'admin5', 0)
INSERT [dbo].[Users] ([Username], [Password], [vaitro]) VALUES (N'nguyenngu', N'nguyenngu', 0)
INSERT [dbo].[Users] ([Username], [Password], [vaitro]) VALUES (N'ps10511', N'ps10511', 0)
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
USE [master]
GO
ALTER DATABASE [Java5_ASMFinal_PS10511_BanHang] SET  READ_WRITE 
GO
