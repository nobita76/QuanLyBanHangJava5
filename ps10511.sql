USE [master]
go
/****** Object:  Database [Java5_ASMFinal_PS10511_BanHang]    Script Date: 3/5/2020 8:19:08 AM ******/
CREATE DATABASE [Java5_ASMFinal_PS10511_BanHang]
 go
use Java5_ASMFinal_PS10511_BanHang
go
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

INSERT INTO DanhMuc(tenDM) VALUES('summer'),('short'),('jeans'),('ABC')
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/30/2020 8:31:28 AM ******/
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
	[type] [varchar] (10) NOT NULL,
	
	[MaDM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO


INSERT INTO SanPham(tensp, dongia, soluong, hinh, type, madm) VALUES('Thành', '500', '5' 'thanh.jpg', 'hot', '1'),('Thành 2', '200', '1', 'thanh2.png', 'sale', '2')

/****** Object:  Table [dbo].[DonHang]    Script Date: 6/30/2020 8:31:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDatHang] [date] NULL,
	[username] [nvarchar] (50) NULL,
	[address] [nvarchar] (1000) NOT NULL
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 6/30/2020 8:31:28 AM ******/
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
	[username] [nvarchar] (50) NULL,
	[address] [nvarchar] (1000) NOT NULL
	
 CONSTRAINT [pk_CTDH] PRIMARY KEY CLUSTERED 
(
	[stt] ASC,
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO


INSERT INTO USERS(username, password, vaitro) VALUES('admin', 'admin', 1),('ps10511,'ps10511',0)
