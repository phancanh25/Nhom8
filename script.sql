USE [master]
GO
/****** Object:  Database [QLDoAn]    Script Date: 05/13/21 2:55:13 PM ******/
CREATE DATABASE [QLDoAn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDoAn', FILENAME = N'D:\SQL SV\data\QLDoAn.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLDoAn_log', FILENAME = N'D:\SQL SV\data\QLDoAn_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLDoAn] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDoAn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDoAn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDoAn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDoAn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDoAn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDoAn] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDoAn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLDoAn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDoAn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDoAn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDoAn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDoAn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDoAn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDoAn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDoAn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDoAn] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLDoAn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDoAn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDoAn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDoAn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDoAn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDoAn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDoAn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDoAn] SET RECOVERY FULL 
GO
ALTER DATABASE [QLDoAn] SET  MULTI_USER 
GO
ALTER DATABASE [QLDoAn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDoAn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDoAn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDoAn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLDoAn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLDoAn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLDoAn', N'ON'
GO
ALTER DATABASE [QLDoAn] SET QUERY_STORE = OFF
GO
USE [QLDoAn]
GO
/****** Object:  Table [dbo].[AccountGV]    Script Date: 05/13/21 2:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountGV](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[MaRole] [int] NOT NULL,
	[MaGV] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountSV]    Script Date: 05/13/21 2:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountSV](
	[Username] [varchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[MaRole] [int] NOT NULL,
	[MaSV] [varchar](10) NOT NULL,
 CONSTRAINT [PK_AccountSV] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietTieuBan]    Script Date: 05/13/21 2:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietTieuBan](
	[MaTB] [int] NOT NULL,
	[MaGV] [varchar](10) NOT NULL,
	[ChiTiet] [nvarchar](200) NULL,
 CONSTRAINT [PK_ChiTietTieuBan_1] PRIMARY KEY CLUSTERED 
(
	[MaTB] ASC,
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoAn]    Script Date: 05/13/21 2:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoAn](
	[MaDA] [int] IDENTITY(1,1) NOT NULL,
	[TenDA] [nvarchar](200) NULL,
	[ChiTiet] [nvarchar](200) NULL,
	[MaGVHD] [varchar](10) NULL,
	[MaGVPB] [varchar](10) NULL,
	[DiemHD] [float] NULL,
	[DiemPB] [float] NULL,
	[DiemTB] [float] NULL,
	[DiemTong] [float] NULL,
	[MaTB] [int] NULL,
	[Nam] [int] NULL,
 CONSTRAINT [PK_DoAn] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 05/13/21 2:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGV] [varchar](10) NOT NULL,
	[Ho] [nvarchar](50) NULL,
	[Ten] [nvarchar](20) NULL,
	[Phai] [bit] NULL,
	[SDT] [varchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_GiangVien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 05/13/21 2:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[MaRole] [int] NOT NULL,
	[TenRole] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[MaRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 05/13/21 2:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [varchar](10) NOT NULL,
	[Ho] [nvarchar](40) NULL,
	[Ten] [nvarchar](20) NULL,
	[Lop] [varchar](50) NULL,
	[NgaySinh] [date] NULL,
	[Phai] [bit] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Khoa] [int] NULL,
	[DiemTBTL] [float] NULL,
	[MaDA] [int] NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TieuBan]    Script Date: 05/13/21 2:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TieuBan](
	[MaTB] [int] NOT NULL,
	[TenTB] [nvarchar](50) NULL,
	[ChuyenNganh] [nvarchar](50) NULL,
	[Ngay] [date] NULL,
	[Gio] [time](7) NULL,
	[DiaDiem] [nvarchar](200) NULL,
	[Khoa] [int] NULL,
 CONSTRAINT [PK_TieuBan] PRIMARY KEY CLUSTERED 
(
	[MaTB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AccountGV] ([Username], [Password], [MaRole], [MaGV]) VALUES (N'huynhan', N'123456', 2, N'PTITGV03')
INSERT [dbo].[AccountGV] ([Username], [Password], [MaRole], [MaGV]) VALUES (N'huynhtam', N'123456', 2, N'PTITGV05')
INSERT [dbo].[AccountGV] ([Username], [Password], [MaRole], [MaGV]) VALUES (N'huynhthua', N'123456', 1, N'PTITGV01')
INSERT [dbo].[AccountGV] ([Username], [Password], [MaRole], [MaGV]) VALUES (N'huynhtru', N'123456', 2, N'PTITGV02')
INSERT [dbo].[AccountGV] ([Username], [Password], [MaRole], [MaGV]) VALUES (N'lehieu', N'123456', 2, N'PTITGV04')
INSERT [dbo].[AccountGV] ([Username], [Password], [MaRole], [MaGV]) VALUES (N'nguyenhuan', N'123456', 2, N'PTITGV06')
GO
INSERT [dbo].[ChiTietTieuBan] ([MaTB], [MaGV], [ChiTiet]) VALUES (1, N'PTITGV02', NULL)
INSERT [dbo].[ChiTietTieuBan] ([MaTB], [MaGV], [ChiTiet]) VALUES (1, N'PTITGV04', NULL)
INSERT [dbo].[ChiTietTieuBan] ([MaTB], [MaGV], [ChiTiet]) VALUES (1, N'PTITGV05', NULL)
INSERT [dbo].[ChiTietTieuBan] ([MaTB], [MaGV], [ChiTiet]) VALUES (2, N'PTITGV02', NULL)
INSERT [dbo].[ChiTietTieuBan] ([MaTB], [MaGV], [ChiTiet]) VALUES (2, N'PTITGV03', NULL)
INSERT [dbo].[ChiTietTieuBan] ([MaTB], [MaGV], [ChiTiet]) VALUES (2, N'PTITGV04', NULL)
INSERT [dbo].[ChiTietTieuBan] ([MaTB], [MaGV], [ChiTiet]) VALUES (4, N'PTITGV01', NULL)
INSERT [dbo].[ChiTietTieuBan] ([MaTB], [MaGV], [ChiTiet]) VALUES (4, N'PTITGV02', NULL)
INSERT [dbo].[ChiTietTieuBan] ([MaTB], [MaGV], [ChiTiet]) VALUES (4, N'PTITGV03', NULL)
INSERT [dbo].[ChiTietTieuBan] ([MaTB], [MaGV], [ChiTiet]) VALUES (4, N'PTITGV04', NULL)
GO
SET IDENTITY_INSERT [dbo].[DoAn] ON 

INSERT [dbo].[DoAn] ([MaDA], [TenDA], [ChiTiet], [MaGVHD], [MaGVPB], [DiemHD], [DiemPB], [DiemTB], [DiemTong], [MaTB], [Nam]) VALUES (1, N'Làm web', N'Làm web bán hàng', N'PTITGV02', N'PTITGV02', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DoAn] ([MaDA], [TenDA], [ChiTiet], [MaGVHD], [MaGVPB], [DiemHD], [DiemPB], [DiemTB], [DiemTong], [MaTB], [Nam]) VALUES (2, N'Làm game', N'Làm game pikachu', N'PTITGV03', N'PTITGV04', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DoAn] ([MaDA], [TenDA], [ChiTiet], [MaGVHD], [MaGVPB], [DiemHD], [DiemPB], [DiemTB], [DiemTong], [MaTB], [Nam]) VALUES (3, N'Làm game mobile', N'Làm game trên dt', N'PTITGV04', N'PTITGV03', NULL, NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[DoAn] ([MaDA], [TenDA], [ChiTiet], [MaGVHD], [MaGVPB], [DiemHD], [DiemPB], [DiemTB], [DiemTong], [MaTB], [Nam]) VALUES (23, N'do an 1', N'chi tiet 1', N'PTITGV01', NULL, 9, 0, 0, 0, NULL, 2021)
INSERT [dbo].[DoAn] ([MaDA], [TenDA], [ChiTiet], [MaGVHD], [MaGVPB], [DiemHD], [DiemPB], [DiemTB], [DiemTong], [MaTB], [Nam]) VALUES (24, N'do an2', N'chi tiet 2', N'PTITGV03', NULL, 9.5, 0, 0, 0, NULL, 2021)
INSERT [dbo].[DoAn] ([MaDA], [TenDA], [ChiTiet], [MaGVHD], [MaGVPB], [DiemHD], [DiemPB], [DiemTB], [DiemTong], [MaTB], [Nam]) VALUES (25, N'do an 3', N'chi tiet 3', N'PTITGV04', NULL, 9.25, 0, 0, 0, NULL, 2021)
SET IDENTITY_INSERT [dbo].[DoAn] OFF
GO
INSERT [dbo].[GiangVien] ([MaGV], [Ho], [Ten], [Phai], [SDT], [DiaChi]) VALUES (N'PTITGV01', N'Huỳnh Trọng', N'Thưa', 1, N'0337125797', N'hjasdfkjh')
INSERT [dbo].[GiangVien] ([MaGV], [Ho], [Ten], [Phai], [SDT], [DiaChi]) VALUES (N'PTITGV02', N'Huỳnh Trung', N'Trụ', 1, N'0123456789', N'áhdfj')
INSERT [dbo].[GiangVien] ([MaGV], [Ho], [Ten], [Phai], [SDT], [DiaChi]) VALUES (N'PTITGV03', N'Huỳnh Thúy', N'An', 0, N'0123456789', N'dia chi')
INSERT [dbo].[GiangVien] ([MaGV], [Ho], [Ten], [Phai], [SDT], [DiaChi]) VALUES (N'PTITGV04', N'Lê Minh', N'Hiếu', 1, N'0123456789', N'dia chi1')
INSERT [dbo].[GiangVien] ([MaGV], [Ho], [Ten], [Phai], [SDT], [DiaChi]) VALUES (N'PTITGV05', N'Huỳnh Văn ', N'Tâm', 1, N'0123654789', N'dia chi 2')
INSERT [dbo].[GiangVien] ([MaGV], [Ho], [Ten], [Phai], [SDT], [DiaChi]) VALUES (N'PTITGV06', N'Nguyễn Trọng', N'Huân', 1, N'0321456987', N'dia chi 3')
GO
INSERT [dbo].[Role] ([MaRole], [TenRole]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([MaRole], [TenRole]) VALUES (2, N'giangvien')
INSERT [dbo].[Role] ([MaRole], [TenRole]) VALUES (3, N'sinhvien')
GO
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [Lop], [NgaySinh], [Phai], [DiaChi], [Khoa], [DiemTBTL], [MaDA]) VALUES (N'N18DCAT004', N'Võ Thế', N'Anh', N'D18CQAT01-N', CAST(N'2000-01-01' AS Date), 1, N'ÁDFASDF', 2018, 3, 24)
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [Lop], [NgaySinh], [Phai], [DiaChi], [Khoa], [DiemTBTL], [MaDA]) VALUES (N'N18DCAT008', N'Phan Văn ', N'Cảnh', N'N18CQAT02-N', CAST(N'2000-01-25' AS Date), 1, N'97 Man Thiện, Hiệp Phú, Thủ Đức', 2018, 3.5, 23)
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [Lop], [NgaySinh], [Phai], [DiaChi], [Khoa], [DiemTBTL], [MaDA]) VALUES (N'n18dcat015', N'Võ Thành', N'Nam', N'D18CQAT02-N', CAST(N'2021-05-10' AS Date), 0, N'KHông', 2018, 2, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [Lop], [NgaySinh], [Phai], [DiaChi], [Khoa], [DiemTBTL], [MaDA]) VALUES (N'N18DCAT084', N'Nguyễn Nhật', N'Tân', N'D18CQAT02-N', CAST(N'2000-01-01' AS Date), 1, N'ÁDHFA', 2018, 2.9000000953674316, 25)
GO
INSERT [dbo].[TieuBan] ([MaTB], [TenTB], [ChuyenNganh], [Ngay], [Gio], [DiaDiem], [Khoa]) VALUES (1, N'An Toàn 1', N'An toàn thông tin', CAST(N'2020-12-12' AS Date), CAST(N'09:00:00' AS Time), N'Hội trường 2A08', 2021)
INSERT [dbo].[TieuBan] ([MaTB], [TenTB], [ChuyenNganh], [Ngay], [Gio], [DiaDiem], [Khoa]) VALUES (2, N'An Toàn 2', N'An toàn thông tin', CAST(N'2020-12-12' AS Date), CAST(N'08:00:00' AS Time), N'Hội trường 2A08', 2021)
INSERT [dbo].[TieuBan] ([MaTB], [TenTB], [ChuyenNganh], [Ngay], [Gio], [DiaDiem], [Khoa]) VALUES (3, N'Công Nghệ 1', N'Công nghệ thông tin', CAST(N'2020-12-12' AS Date), CAST(N'09:00:00' AS Time), N'Hội trường 2A27', 2021)
INSERT [dbo].[TieuBan] ([MaTB], [TenTB], [ChuyenNganh], [Ngay], [Gio], [DiaDiem], [Khoa]) VALUES (4, N'Công nghệ DPT 2', N'ATTT', CAST(N'2021-05-11' AS Date), CAST(N'10:00:00' AS Time), N'2A16', 2016)
INSERT [dbo].[TieuBan] ([MaTB], [TenTB], [ChuyenNganh], [Ngay], [Gio], [DiaDiem], [Khoa]) VALUES (5, N'Công nghệ DPT 1', N'Công nghệ đa phương tiện', CAST(N'2020-05-28' AS Date), CAST(N'10:00:00' AS Time), N'2A0405', 2018)
GO
/****** Object:  Index [IX_SinhVien_DoAn]    Script Date: 05/13/21 2:55:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_SinhVien_DoAn] ON [dbo].[SinhVien]
(
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountGV]  WITH CHECK ADD  CONSTRAINT [FK_AccountGV_GiangVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[AccountGV] CHECK CONSTRAINT [FK_AccountGV_GiangVien]
GO
ALTER TABLE [dbo].[AccountGV]  WITH CHECK ADD  CONSTRAINT [FK_AccountGV_Role] FOREIGN KEY([MaRole])
REFERENCES [dbo].[Role] ([MaRole])
GO
ALTER TABLE [dbo].[AccountGV] CHECK CONSTRAINT [FK_AccountGV_Role]
GO
ALTER TABLE [dbo].[AccountSV]  WITH CHECK ADD  CONSTRAINT [FK_AccountSV_Role] FOREIGN KEY([MaRole])
REFERENCES [dbo].[Role] ([MaRole])
GO
ALTER TABLE [dbo].[AccountSV] CHECK CONSTRAINT [FK_AccountSV_Role]
GO
ALTER TABLE [dbo].[AccountSV]  WITH CHECK ADD  CONSTRAINT [FK_AccountSV_SinhVien1] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[AccountSV] CHECK CONSTRAINT [FK_AccountSV_SinhVien1]
GO
ALTER TABLE [dbo].[ChiTietTieuBan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietTieuBan_GiangVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[ChiTietTieuBan] CHECK CONSTRAINT [FK_ChiTietTieuBan_GiangVien]
GO
ALTER TABLE [dbo].[ChiTietTieuBan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietTieuBan_TieuBan] FOREIGN KEY([MaTB])
REFERENCES [dbo].[TieuBan] ([MaTB])
GO
ALTER TABLE [dbo].[ChiTietTieuBan] CHECK CONSTRAINT [FK_ChiTietTieuBan_TieuBan]
GO
ALTER TABLE [dbo].[DoAn]  WITH CHECK ADD  CONSTRAINT [FK_DoAn_GiangVien] FOREIGN KEY([MaGVHD])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[DoAn] CHECK CONSTRAINT [FK_DoAn_GiangVien]
GO
ALTER TABLE [dbo].[DoAn]  WITH CHECK ADD  CONSTRAINT [FK_DoAn_GiangVien1] FOREIGN KEY([MaGVPB])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[DoAn] CHECK CONSTRAINT [FK_DoAn_GiangVien1]
GO
ALTER TABLE [dbo].[DoAn]  WITH CHECK ADD  CONSTRAINT [FK_DoAn_TieuBan] FOREIGN KEY([MaTB])
REFERENCES [dbo].[TieuBan] ([MaTB])
GO
ALTER TABLE [dbo].[DoAn] CHECK CONSTRAINT [FK_DoAn_TieuBan]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_DoAn] FOREIGN KEY([MaDA])
REFERENCES [dbo].[DoAn] ([MaDA])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_DoAn]
GO
USE [master]
GO
ALTER DATABASE [QLDoAn] SET  READ_WRITE 
GO
