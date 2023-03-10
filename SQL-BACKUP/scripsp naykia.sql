USE [TN_CSDLPT]
GO
/****** Object:  User [HTKN]    Script Date: 08/04/2022 5:58:36 pm ******/
CREATE USER [HTKN] FOR LOGIN [HTKN] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sv_dungchung]    Script Date: 08/04/2022 5:58:36 pm ******/
CREATE USER [sv_dungchung] FOR LOGIN [sv_dungchung] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [TH002]    Script Date: 08/04/2022 5:58:36 pm ******/
CREATE USER [TH002] FOR LOGIN [vengian_giangvien] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [TH101]    Script Date: 08/04/2022 5:58:36 pm ******/
CREATE USER [TH101] FOR LOGIN [kdthien_coso] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [TH657]    Script Date: 08/04/2022 5:58:36 pm ******/
CREATE USER [TH657] FOR LOGIN [phngoc_truong] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [COSO]    Script Date: 08/04/2022 5:58:36 pm ******/
CREATE ROLE [COSO]
GO
/****** Object:  DatabaseRole [GIANGVIEN]    Script Date: 08/04/2022 5:58:36 pm ******/
CREATE ROLE [GIANGVIEN]
GO
/****** Object:  DatabaseRole [SINHVIEN]    Script Date: 08/04/2022 5:58:36 pm ******/
CREATE ROLE [SINHVIEN]
GO
/****** Object:  DatabaseRole [TRUONG]    Script Date: 08/04/2022 5:58:36 pm ******/
CREATE ROLE [TRUONG]
GO
ALTER ROLE [db_owner] ADD MEMBER [HTKN]
GO
ALTER ROLE [SINHVIEN] ADD MEMBER [sv_dungchung]
GO
ALTER ROLE [GIANGVIEN] ADD MEMBER [TH002]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TH002]
GO
ALTER ROLE [COSO] ADD MEMBER [TH101]
GO
ALTER ROLE [db_owner] ADD MEMBER [TH101]
GO
ALTER ROLE [TRUONG] ADD MEMBER [TH657]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [TH657]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [TH657]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TH657]
GO
ALTER ROLE [db_owner] ADD MEMBER [COSO]
GO
ALTER ROLE [db_datareader] ADD MEMBER [GIANGVIEN]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [TRUONG]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [TRUONG]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TRUONG]
GO
/****** Object:  Table [dbo].[BANGDIEM]    Script Date: 08/04/2022 5:58:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANGDIEM](
	[MASV] [char](8) NOT NULL,
	[MAMH] [char](5) NOT NULL,
	[LAN] [smallint] NOT NULL,
	[NGAYTHI] [datetime] NULL,
	[DIEM] [float] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_BANGDIEM] PRIMARY KEY CLUSTERED 
(
	[MASV] ASC,
	[MAMH] ASC,
	[LAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BODE]    Script Date: 08/04/2022 5:58:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BODE](
	[CAUHOI] [int] NOT NULL,
	[MAMH] [char](5) NULL,
	[TRINHDO] [char](1) NULL,
	[NOIDUNG] [ntext] NULL,
	[A] [ntext] NULL,
	[B] [ntext] NULL,
	[C] [ntext] NULL,
	[D] [ntext] NULL,
	[DAP_AN] [char](1) NULL,
	[MAGV] [char](8) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_BODE] PRIMARY KEY CLUSTERED 
(
	[CAUHOI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COSO]    Script Date: 08/04/2022 5:58:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COSO](
	[MACS] [nchar](3) NOT NULL,
	[TENCS] [nvarchar](50) NOT NULL,
	[DIACHI] [nvarchar](100) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_COSO] PRIMARY KEY CLUSTERED 
(
	[MACS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_BAITHI]    Script Date: 08/04/2022 5:58:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_BAITHI](
	[CAUSO] [smallint] NULL,
	[MASV] [char](8) NOT NULL,
	[MAMH] [char](5) NOT NULL,
	[LAN] [smallint] NOT NULL,
	[CAUHOI] [int] NOT NULL,
	[DACHON] [nchar](1) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_CT_BAITHI] PRIMARY KEY CLUSTERED 
(
	[MASV] ASC,
	[MAMH] ASC,
	[LAN] ASC,
	[CAUHOI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIAOVIEN]    Script Date: 08/04/2022 5:58:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAOVIEN](
	[MAGV] [char](8) NOT NULL,
	[HO] [nvarchar](50) NULL,
	[TEN] [nvarchar](10) NULL,
	[DIACHI] [nvarchar](50) NULL,
	[MAKH] [nchar](8) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_GIAOVIEN] PRIMARY KEY CLUSTERED 
(
	[MAGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIAOVIEN_DANGKY]    Script Date: 08/04/2022 5:58:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAOVIEN_DANGKY](
	[MAGV] [char](8) NULL,
	[MAMH] [char](5) NOT NULL,
	[MALOP] [nchar](15) NOT NULL,
	[TRINHDO] [char](1) NULL,
	[NGAYTHI] [datetime] NULL,
	[LAN] [smallint] NOT NULL,
	[SOCAUTHI] [smallint] NULL,
	[THOIGIAN] [smallint] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_GIAOVIEN_DANGKY] PRIMARY KEY CLUSTERED 
(
	[MAMH] ASC,
	[MALOP] ASC,
	[LAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOA]    Script Date: 08/04/2022 5:58:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOA](
	[MAKH] [nchar](8) NOT NULL,
	[TENKH] [nvarchar](50) NOT NULL,
	[MACS] [nchar](3) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_KHOA] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOP]    Script Date: 08/04/2022 5:58:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOP](
	[MALOP] [nchar](15) NOT NULL,
	[TENLOP] [nvarchar](50) NOT NULL,
	[MAKH] [nchar](8) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_LOP] PRIMARY KEY CLUSTERED 
(
	[MALOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 08/04/2022 5:58:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MAMH] [char](5) NOT NULL,
	[TENMH] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_TENMH] PRIMARY KEY CLUSTERED 
(
	[MAMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 08/04/2022 5:58:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MASV] [char](8) NOT NULL,
	[HO] [nvarchar](50) NULL,
	[TEN] [nvarchar](10) NULL,
	[NGAYSINH] [date] NULL,
	[DIACHI] [nvarchar](100) NULL,
	[MATKHAU] [nchar](25) NOT NULL,
	[MALOP] [nchar](15) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_SINHVIEN] PRIMARY KEY CLUSTERED 
(
	[MASV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BANGDIEM] ([MASV], [MAMH], [LAN], [NGAYTHI], [DIEM], [rowguid]) VALUES (N'001     ', N'MMTCB', 1, CAST(N'2022-09-04T00:00:00.000' AS DateTime), 1, N'595a3372-f3b6-ec11-b1dc-28d244961870')
INSERT [dbo].[BANGDIEM] ([MASV], [MAMH], [LAN], [NGAYTHI], [DIEM], [rowguid]) VALUES (N'002     ', N'MMTCB', 1, CAST(N'2022-09-04T00:00:00.000' AS DateTime), 3, N'c92432b7-27b7-ec11-b1dc-28d244961870')
INSERT [dbo].[BANGDIEM] ([MASV], [MAMH], [LAN], [NGAYTHI], [DIEM], [rowguid]) VALUES (N'003     ', N'MMTCB', 1, CAST(N'2022-09-04T00:00:00.000' AS DateTime), 3, N'3bb5565b-28b7-ec11-b1dc-28d244961870')
INSERT [dbo].[BANGDIEM] ([MASV], [MAMH], [LAN], [NGAYTHI], [DIEM], [rowguid]) VALUES (N'004     ', N'MMTCB', 1, CAST(N'2022-09-04T00:00:00.000' AS DateTime), 2, N'8108452f-2ab7-ec11-b1dc-28d244961870')
GO
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (1, N'MMTCB', N'A', N'mạng máy tính(compute netword) so với hệ thống tập trung multi-user', N'dễ phát triển hệ thống', N'tăng độ tin cậy', N'tiết kiệm chi phí', N'tất cả đều đúng', N'D', N'TH657   ', N'cda9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (3, N'MMTCB', N'A', N'để một máy tính truyền dữ liệu cho một số máy khác trong mạng, ta dùng loại địa chỉ', N'Broadcast', N'Broadband', N'multicast', N'multiple access', N'C', N'TH123   ', N'cea9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (4, N'MMTCB', N'A', N'thứ tự phân loại mạng theo chiều dài đường truyền', N'internet, lan, man, wan', N'internet, wan, man, lan', N'lan, wan, man, internet', N'man, lan, wan, internet', N'B', N'TH123   ', N'cfa9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (5, N'MMTCB', N'A', N'mạng man được sử dụng trong phạm vi:', N'quốc gia', N'lục địa', N'khu phố', N'thành phố', N'D', N'TH123   ', N'd0a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (6, N'MMTCB', N'A', N'thuật ngữ man được viết tắt bởi:', N'middle area network', N'metropolitan area network', N'medium area network', N'multiple access network', N'D', N'TH123   ', N'd1a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (7, N'MMTCB', N'A', N'mạng man không kết nối theo sơ đồ:', N'bus', N'ring', N'star', N'tree', N'D', N'TH123   ', N'd2a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (8, N'MMTCB', N'A', N'kiến trúc mạng (network architechture) là:', N'tập các chức năng trong mạng', N'tập các cấp và các protocol trong mỗi cấp', N'tập các dịch vụ trong mạng', N'tập các protocol trong mạng', N'B', N'TH123   ', N'd3a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (9, N'MMTCB', N'A', N'thuật ngữ nào không cùng nhóm:', N'simplex', N'multiplex', N'half duplex', N'full duplex', N'B', N'TH123   ', N'd4a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (10, N'MMTCB', N'A', N'loại dịch vụ nào có thể nhận dữ liệu không đúng thứ tự khi truyền', N'point to point', N'có kết nối', N'không kết nối', N'broadcast', N'C', N'TH123   ', N'd5a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (11, N'MMTCB', N'A', N'dịch vụ không xác nhận (unconfirmed) chỉ sử dụng 2 phép toán cơ bản:', N'response and confirm', N'confirm and request', N'request and indication', N'indication and response', N'C', N'TH123   ', N'd6a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (12, N'MMTCB', N'A', N'Chọn câu sai trong các nguyên lý phân cấp của mô hình OSI', N'Mỗi cấp thực hiện 1 chức năng rõ ràng', N'Mỗi cấp được chọn sao cho thông tin trao đổi giữa các cấp tối thiểu', N'Mỗi cấp được tạo ra ứng với 1 mức trừu tượng hóa', N'Mỗi cấp phải cung cấp cùng 1 kiểu địa chỉ và dịch vụ', N'D', N'TH123   ', N'd7a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (13, N'MMTCB', N'A', N'Chức năng của cấp vật lý(physical)', N'Qui định truyền 1 hay 2 chiều', N'Quản lý lỗi sai', N'Xác định thời gian truyền 1 bit dữ liệu', N'Quản lý địa chỉ vật lý', N'C', N'TH123   ', N'd8a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (14, N'MMTCB', N'A', N'Chức năng câp liên kết dữ liệu (data link)', N'Quản lý lỗi sai', N'Mã hóa dữ liệu', N'Tìm đường đi cho dữ liệu', N'Chọn kênh truyền', N'A', N'TH123   ', N'd9a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (15, N'MMTCB', N'A', N'Chức năng cấp mạng (network)', N'Quản lý lưu lượng đường truyền', N'Điều khiển hoạt động subnet', N'Nén dữ liệu', N'Chọn điện áp trên kênh truyền', N'B', N'TH123   ', N'daa9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (16, N'MMTCB', N'A', N'Chức năng cấp vận tải (transport) ', N'Quản lý địa chỉ mạng', N'Chuyển đổi các dạng frame khác nhau', N'Thiết lập và hủy bỏ dữ liệu', N'Mã hóa và giải mã dữ liệu', N'C', N'TH123   ', N'dba9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (17, N'MMTCB', N'A', N'Cáp xoắn đôi trong mạng LAN dùng đầu nối', N'AUI', N'BNC', N'RJ11', N'RJ45', N'D', N'TH123   ', N'dca9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (18, N'MMTCB', N'A', N'T-connector dùng trong loại cáp', N'10Base-2', N'10Base-5', N'10Base-T', N'10Base-F', N'A', N'TH123   ', N'dda9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (19, N'MMTCB', N'A', N'chọn câu sai trong các nguyên lý phân cấp của mô hình osi', N'mỗi cấp thực hiện 1 chức năng rõ ràng', N'mỗi cấp được chọn sao cho thông tin trao đổi giữa các cấp tối thiểu', N'mỗi cấp được tạo ra ứng với 1 mức trừu tượng hóa', N'mỗi cấp phải cung cấp cùng một kiểu địa chỉ và dịch vụ', N'D', N'TH123   ', N'dea9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (20, N'AVCB ', N'A', N'The publishers suggested that the envelopes be sent to ...... by courier so that the film can be developed as soon as possible', N'they', N'their', N'theirs', N'them', N'D', N'TH234   ', N'dfa9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (21, N'AVCB ', N'A', N'Board members ..... carefully define their goals and objectives for the agency before the monthly meeting next week.', N'had', N'should', N'used ', N'have', N'B', N'TH234   ', N'e0a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (22, N'AVCB ', N'A', N'For business relations to continue between our two firms, satisfactory agreement must be ...... reached and signer', N'yet', N'both', N'either ', N'as well as', N'C', N'TH234   ', N'e1a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (23, N'AVCB ', N'A', N'The corporation, which underwent a major restructing seven years ago, has been growing steadily ......five years', N'for', N'on', N'from', N'since', N'A', N'TH234   ', N'e2a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (24, N'AVCB ', N'A', N'Making advance arrangements for audiovisual equipment is....... recommended for all seminars.', N'sternly', N'strikingly', N'stringently', N'strongly', N'A', N'TH234   ', N'e3a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (25, N'AVCB ', N'A', N'Two assistants will be required to ...... reporter''s names when they arrive at the press conference', N'remark', N'check', N'notify', N'ensure', N'B', N'TH234   ', N'e4a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (26, N'AVCB ', N'A', N'The present government has an excellent ......to increase exports', N'popularity', N'regularity', N'celebrity', N'opportunity', N'D', N'TH234   ', N'e5a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (27, N'AVCB ', N'A', N'While you are in the building, please wear your identification badge at all times so that you are ....... as a company employee.', N'recognize', N'recognizing', N'recognizable', N'recognizably', N'C', N'TH234   ', N'e6a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (28, N'AVCB ', N'A', N'Our studies show that increases in worker productivity have not been adequately .......rewarded by significant increases in ......', N'compensation', N'commodity', N'compilation', N'complacency', N'B', N'TH234   ', N'e7a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (29, N'AVCB ', N'A', N'Conservatives predict that government finaces will remain...... during the period of the investigation', N'authoritative', N'summarized', N'examined', N'stable', N'D', N'TH234   ', N'e8a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (30, N'AVCB ', N'B', N'Battery-operated reading lamps......very well right now', N'sale', N'sold', N'are selling', N'were sold', N'C', N'TH234   ', N'e9a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (31, N'AVCB ', N'B', N'In order to place a call outside the office, you have to .......nine first. ', N'tip', N'make', N'dial', N'number', N'D', N'TH234   ', N'eaa9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (32, N'AVCB ', N'B', N'We are pleased to inform...... that the missing order has been found.', N'you', N'your', N'yours', N'yourseld', N'A', N'TH234   ', N'eba9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (33, N'AVCB ', N'B', N'Unfortunately, neither Mr.Sachs....... Ms Flynn will be able to attend the awards banquet this evening', N'but', N'and', N' nor', N'either', N'C', N'TH234   ', N'eca9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (34, N'AVCB ', N'B', N'According to the manufacturer, the new generatir is capable of....... the amount of power consumed by our facility by nearly ten percent.', N'reduced', N'reducing', N'reduce', N'reduces', N'B', N'TH234   ', N'eda9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (35, N'AVCB ', N'B', N'After the main course, choose from our wide....... of homemade deserts', N'varied', N'various', N'vary', N'variety', N'D', N'TH234   ', N'eea9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (36, N'AVCB ', N'B', N'One of the most frequent complaints among airline passengers is that there is not ...... legroom', N'enough', N'many', N'very', N'plenty', N'A', N'TH234   ', N'efa9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (37, N'AVCB ', N'B', N'Faculty members are planning to..... a party in honor of Dr.Walker, who will retire at the end of the semester', N'carry', N'do', N'hold', N'take', N'D', N'TH234   ', N'f0a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (38, N'AVCB ', N'B', N'Many employees seem more ....... now about how to use the new telephone system than they did before they attended the workshop', N'confusion', N'confuse', N'confused', N'confusing', N'C', N'TH234   ', N'f1a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (39, N'AVCB ', N'B', N'.........our production figures improve in the near future, we foresee having to hire more people between now and July', N'During', N'Only', N'Unless', N'Because', N'D', N'TH234   ', N'f2a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (40, N'AVCB ', N'C', N'Though their performance was relatively unpolished, the actors held the audience''s ........for the duration of the play.', N'attentive', N'attentively', N'attention', N'attentiveness', N'C', N'TH234   ', N'f3a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (41, N'AVCB ', N'C', N'Dr. Abernathy''s donation to Owstion College broke the record for the largest private gift...... give to the campus', N'always', N'rarely', N'once', N'ever', N'C', N'TH234   ', N'f4a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (42, N'AVCB ', N'C', N'Savat Nation Park is ....... by train,bus, charter plane, and rental car.', N'accessible', N'accessing', N'accessibility', N'accesses', N'A', N'TH234   ', N'f5a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (43, N'AVCB ', N'C', N'In Piazzo''s lastest architectural project, he hopes to......his flare for blending contemporary and traditional ideals.', N'demonstrate', N'appear', N'valve', N'position', N'A', N'TH234   ', N'f6a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (44, N'AVCB ', N'C', N'Replacing the offic equipment that the company purchased only three years ago seems quite.....', N'waste', N'wasteful', N'wasting', N'wasted', N'C', N'TH234   ', N'f7a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (45, N'AVCB ', N'C', N'On........, employees reach their peak performance level when they have been on the job for at least two years.', N'common', N'standard', N'average', N'general', N'D', N'TH234   ', N'f8a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (46, N'AVCB ', N'C', N'We were........unaware of the problems with the air-conidtioning units in the hotel rooms until this week.', N'complete ', N'completely', N'completed', N'completing', N'D', N'TH234   ', N'f9a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (47, N'AVCB ', N'C', N'If you send in an order ....... mail, we recommend that you phone our sales division directly to confirm the order.', N'near', N'by', N'for', N'on', N'A', N'TH234   ', N'faa9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (48, N'AVCB ', N'C', N'A recent global survey suggests.......... demand for aluminum and tin will remain at its current level for the next five to ten years.', N'which', N'it ', N'that', N'both', N'C', N'TH234   ', N'fba9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (49, N'AVCB ', N'C', N'Rates for the use of recreational facilities do not include ta and are subject to change without.........', N'signal', N'cash', N'report', N'notice', N'A', N'TH234   ', N'fca9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (50, N'AVCB ', N'A', N'Aswering telephone calls is the..... of an operator', N'responsible', N'responsibly', N'responsive', N'responsibility', N'D', N'TH234   ', N'fda9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (51, N'AVCB ', N'A', N'A free watch will be provided with every purchase of $20.00 or more a ........ period of time', N'limit', N'limits', N'limited', N'limiting', N'C', N'TH234   ', N'fea9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (52, N'AVCB ', N'A', N'The president of the corporation has .......arrived in Copenhagen and will meet with the Minister of Trade on Monday morning', N'still', N'yet', N'already', N'soon', N'C', N'TH234   ', N'ffa9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (53, N'AVCB ', N'A', N'Because we value your business, we have .......for card members like you to receive one thousand  dollars of complimentary life insurance', N'arrange', N'arranged', N'arranges', N'arranging', N'B', N'TH234   ', N'00aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (54, N'AVCB ', N'A', N'Employees are........that due to the new government regulations. there is to be no smoking in the factory', N'reminded', N'respected', N'remembered', N'reacted', N'A', N'TH234   ', N'01aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (55, N'AVCB ', N'A', N'MS. Galera gave a long...... in honor of the retiring vice-president', N'speak', N'speaker', N'speaking', N'speech', N'D', N'TH234   ', N'02aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (56, N'AVCB ', N'A', N'Any person who is........ in volunteering his or her time for the campaign should send this office a letter of intent', N'interest', N'interested', N'interesting', N'interestingly', N'B', N'TH234   ', N'03aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (57, N'AVCB ', N'A', N'Mr.Gonzales was very concerned.........the upcoming board of directors meeting', N'to', N'about', N'at ', N'upon', N'B', N'TH234   ', N'04aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (58, N'AVCB ', N'A', N'The customers were told that no ........could be made on weekend nights because the restaurant was too busy', N'delays', N'cuisines', N'reservation', N'violations', N'C', N'TH234   ', N'05aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (59, N'AVCB ', N'A', N'The sales representive''s presentation was difficult to understand ........ he spoke very quickly', N'because', N'althought', N'so that', N'than', N'A', N'TH234   ', N'06aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (60, N'AVCB ', N'B', N'It has been predicted that an.......weak dollar will stimulate tourism in the United States', N'increased', N'increasingly', N'increases', N'increase', N'B', N'TH234   ', N'07aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (61, N'AVCB ', N'B', N'The firm is not liable for damage resulting from circumstances.........its control.', N'beyond', N'above', N'inside', N'around', N'A', N'TH234   ', N'08aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (62, N'AVCB ', N'B', N'Because of.......weather conditions, California has an advantage in the production of fruits and vegetables', N'favorite', N'favor', N'favorable', N'favorably', N'C', N'TH234   ', N'09aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (63, N'AVCB ', N'B', N'On international shipments, all duties and taxes are paid by the..........', N'recipient', N'receiving', N'receipt', N'receptive', N'A', N'TH234   ', N'0aaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (64, N'AVCB ', N'B', N'Although the textbook gives a definitive answer,wise managers will look for........ own creative solutions', N'them', N'their', N'theirs', N'they', N'B', N'TH234   ', N'0baadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (65, N'AVCB ', N'B', N'Initial ....... regarding the merger of the companies took place yesterday at the Plaza Conference Center.', N'negotiations', N'dedications', N'propositions', N'announcements', N'A', N'TH234   ', N'0caadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (66, N'AVCB ', N'B', N'Please......... photocopies of all relevant docunments to this office ten days prior to your performance review date', N'emerge', N'substantiate', N'adapt', N'submit', N'D', N'TH234   ', N'0daadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (67, N'AVCB ', N'B', N'The auditor''s results for the five year period under study were .........the accountant''s', N'same', N'same as', N'the same', N'the same as', N'D', N'TH234   ', N'0eaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (68, N'AVCB ', N'B', N'.........has the marketing environment been more complex and subject to change', N'Totally', N'Negatively', N'Decidedly', N'Rarely', N'D', N'TH234   ', N'0faadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (69, N'AVCB ', N'B', N'All full-time staff are eligible to participate in the revised health plan, which becomes effective the first ......... the month.', N'of', N'to', N'from', N'for', N'A', N'TH234   ', N'10aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (70, N'AVCB ', N'C', N'Contracts must be read........ before they are signed.', N'thoroughness', N'more thorough', N'thorough', N'thoroughly', N'D', N'TH234   ', N'11aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (71, N'AVCB ', N'C', N'Passengers should allow for...... travel time to the airport in rush hour traffic', N'addition', N'additive', N'additionally', N'additional', N'D', N'TH234   ', N'12aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (72, N'AVCB ', N'C', N'This fiscal year, the engineering team has worked well together on all phases ofproject.........', N'development', N'developed', N'develops', N'developer', N'A', N'TH234   ', N'13aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (73, N'AVCB ', N'C', N'Mr.Dupont had no ....... how long it would take to drive downtown', N'knowledge', N'thought', N'idea', N'willingness', N'C', N'TH234   ', N'14aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (74, N'AVCB ', N'C', N'Small company stocks usually benefit..........the so called January effect that cause the price of these stocks to rise between November and January', N'unless', N'from', N'to ', N'since', N'B', N'TH234   ', N'15aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (75, N'AVCB ', N'C', N'It has been suggested that employees ........to work in their current positions until the quarterly review is finished.', N'continuity', N'continue', N'continuing', N'continuous', N'B', N'TH234   ', N'16aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (76, N'AVCB ', N'C', N'It is admirable that Ms.Jin wishes to handle all transactions by........, but it might be better if several people shared the responsibility', N'she', N'herself', N'her', N'hers', N'B', N'TH234   ', N'17aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (77, N'AVCB ', N'C', N'This new highway construction project will help the company.........', N'diversity', N'clarify', N'intensify', N'modify', N'A', N'TH234   ', N'18aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (78, N'AVCB ', N'C', N'Ms.Patel has handed in an ........business plan to the director', N'anxious', N'evident', N'eager', N'outstanding', N'D', N'TH234   ', N'19aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (79, N'AVCB ', N'C', N'Recent changes in heating oil costs have affected..........production of turniture', N'local', N'locality', N'locally', N'location', N'A', N'TH234   ', N'1aaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (80, N'MMTCB', N'A', N'Termiator là linh kiện dùng trong loại cáp mạng', N'Cáp quang', N'UTP và STP ', N'Xoắn đôi', N'Đồng trục', N'D', N'TH123   ', N'1baadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (81, N'MMTCB', N'A', N'Mạng không dây dùng loại sóng nào không bị ảnh hưởng bởi khoảng cách địa lý', N'Sóng radio', N'Sống hồng ngoại', N'Sóng viba', N'Song cực ngắn', N'A', N'TH123   ', N'1caadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (82, N'MMTCB', N'A', N'Đường truyền E1 gồm 32 kênh, trong đó sử dụng cho dữ liệu là:', N'32 kênh', N'31 kênh', N'30 kênh', N'24 kênh', N'C', N'TH123   ', N'1daadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (83, N'MMTCB', N'A', N'Mạng máy tính thường sử dụng loại chuyển mach', N'Gói (packet switch)', N'Kênh (Circuit switch)', N'Thông báo(message switch)', N'Tất cả đều đúng', N'A', N'TH123   ', N'1eaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (84, N'MMTCB', N'A', N'Cáp UTP hỗ trợ tôc độ truyền 100MBps là loại', N'Cat 3', N'Cat 4', N'Cat 5', N'Cat 6', N'C', N'TH123   ', N'1faadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (85, N'MMTCB', N'A', N'Thiết bị nào làm việc trong cấp vật lý (physical) ', N'Terminator', N'Hub', N'Repeater', N'Tất cả đều đúng', N'D', N'TH123   ', N'20aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (86, N'MMTCB', N'A', N'Phương pháp dồn kênh phân chia tần số gọi là', N'FDM', N'WDM', N'TDM', N'CSMA', N'A', N'TH123   ', N'21aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (87, N'MMTCB', N'A', N'Dịch vụ nào không sử dụng trong cấp data link', N'Xác nhận, có kết nối', N'Xác nhận, không kết nôi', N'Không xác nhận, có kết nối', N'Không xác nhận, không kết nối', N'C', N'TH123   ', N'22aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (88, N'MMTCB', N'A', N'Nguyên nhân gây sai sót khi gửi/nhận dữ liệu trên mạng', N'Mất đồng bộ trong khi truyền', N'Nhiễu từ môi trường', N'Lỗi phần cứng hoặc phần mềm', N'Tất cả đều đúng ', N'D', N'TH123   ', N'23aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (89, N'MMTCB', N'A', N'Để tránh sai sót khi truyền dữ liệu trong cấp data link', N'Đánh số thứ tự frame', N'Quản lý dữ liệu theo frame', N'Dùng vùng checksum', N'Tất cả đều đúng', N'D', N'TH123   ', N'24aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (90, N'MMTCB', N'A', N'Quản lý lưu lượng đường truyền là chức năng của cấp', N'Presentation', N'Network', N'Data link', N'Physical', N'C', N'TH123   ', N'25aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (91, N'MMTCB', N'A', N'Hoạt động của protocol Stop and Wait', N'Chờ một khoảng thời gian time-out rồi gửi tiếp frame kế', N'Chờ 1 khoảng thời gian time-out rồi gửi lại frame trước', N'Chờ nhận được ACK của frame trước mới gửi tiếp frame kế', N'Không chờ mà gửi liên tiếp các frame kế nhau', N'C', N'TH123   ', N'26aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (92, N'MMTCB', N'A', N'Protocol nào tạo frame bằng phương pháp chèn kí tự', N'ADCCP', N'HDLC', N'SDLC', N'PPP', N'D', N'TH123   ', N'27aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (93, N'MMTCB', N'A', N'Phương pháp nào được dủng trong việc phát hiện lỗi', N'Timer', N'Ack', N'Checksum', N'Tất cả đều đúng', N'C', N'TH123   ', N'28aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (94, N'MMTCB', N'A', N'Kiểm soát lưu lượng (flow control) có nghĩa là', N'Thay đổi thứ tự truyền frame', N'Điều tiết tốc độ truyền frame', N'Thay đổi thời gian chờ time-out', N'Điều chỉnh kích thước frame', N'B', N'TH123   ', N'29aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (95, N'MMTCB', N'A', N'Khả năng nhận biết tình trạng đường truyền ( carrier sence) là', N'Xác định đường truyền tốt hay xấu', N'Có kết nối được hay không', N'Nhận biết có xung đột hay không', N'Đường truyền đang rảnh hay bận', N'C', N'TH123   ', N'2aaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (96, N'MMTCB', N'A', N'Mạng nào không có khả năng nhận biết tình trạng đường truyền (carrier sence)', N'ALOHA', N'CSMA', N'CSMA/CD', N'Tất cả đều đúng ', N'A', N'TH123   ', N'2baadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (97, N'MMTCB', N'A', N'Mạng nào có khả năng nhận biết xung đột (collision)', N'ALOHA', N'CSMA', N'CSMA/CD', N'Tất cả đều đúng', N'D', N'TH123   ', N'2caadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (98, N'MMTCB', N'A', N'Chuẩn mạng nào có khả năng pkhát hiện xung đột (collision) trong khi truyền', N'1-persistent CSMA', N'p-persistent CSMA', N'Non-persistent CSMA', N'CSMA/CD', N'D', N'TH123   ', N'2daadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (99, N'MMTCB', N'A', N'Loại mạng cục bộ nào dùng chuẩn CSMA/CD', N'Token-ring', N'Token-bus', N'Ethernet', N'ArcNet', N'C', N'TH123   ', N'2eaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (100, N'MMTCB', N'A', N'Mạng Ethernet được IEEE đưa vào chuẩn', N'IEEE 802.2', N'IEEE 802.3', N'IEEE 802.4', N'IEEE 802.5', N'B', N'TH123   ', N'2faadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (101, N'MMTCB', N'A', N'Chuẩn nào không dùng trong mạng cục bộ (LAN )', N'IEEE 802.3', N'IEEE 802.4', N'IEEE 802.5', N'IEEE 802.6', N'D', N'TH123   ', N'30aadfec-bba3-ec11-b1da-28d244961870')
GO
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (102, N'MMTCB', N'A', N'Loại mạng nào dùng 1 máy tính làm Monitor để bảo trì mạng', N'Ethernet', N'Token-ring', N'Token-bus', N'Tất cả đều sai', N'B', N'TH123   ', N'31aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (103, N'MMTCB', N'A', N'Loại mạng nào không có độ ưu tiên', N'Ethernet', N'Token-ring', N'Token-bus', N'Tất cả đều sai', N'D', N'TH123   ', N'32aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (104, N'MMTCB', N'A', N'Loại mạng nào dùng 2 loại frame khác nhau trên đường truyền', N'Token-ring', N'Token-bus', N'Ethernet', N'Tất cả đều sai', N'A', N'TH123   ', N'33aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (105, N'MMTCB', N'A', N'Vùng dữ liệu trong mạng Ethernet chứa tối đa', N'185 bytes', N'1500 bytes', N'8182 bytes', N'Không giới hạn', N'B', N'TH123   ', N'34aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (106, N'MMTCB', N'A', N'Chọn câu sai:" Cầu nối (bridge) có thể kết nối các mạng có...."', N'Chiều dài frame khác nhau', N'Cấu trúc frame khác nhau', N'Tốc độ truyền khác nhau', N'Chuẩn khác nhau', N'A', N'TH123   ', N'35aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (107, N'MMTCB', N'A', N'Mạng nào có tốc độ truyền lớn hơn 100Mbps', N'Fast Ethernet', N'Gigabit Ethernet', N'Ethernet', N'Tất cả đều đúng', N'B', N'TH123   ', N'36aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (108, N'MMTCB', N'A', N'Mạng Ethernet sử dụng được loại cáp', N'Cáp quang', N'Xoắn đôi', N'Đồng trục', N'Tất cả đều đúgn', N'D', N'TH123   ', N'37aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (109, N'MMTCB', N'A', N'Khoảng cách đường truyền tối đa mạng FDDI có thể đạt', N'1Km', N'10Km', N'100Km', N'1000Km', N'C', N'TH123   ', N'38aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (110, N'MMTCB', N'A', N'Cấp network truyền nhận theo kiểu end-to-end vì nó quản lý dữ liệu', N'Giữa 2 đầu subnet', N'Giữa 2 máy tính trong mạng', N'Giữa 2 thiết bị trên đường truyền', N'Giữa 2 đầu đường truyền', N'A', N'TH123   ', N'39aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (111, N'MMTCB', N'A', N'Kiểu mạch ảo(virtual circuit) được dùng trong loại dịch vụ mạng', N'Có kết nối', N'Không kết nối', N'Truyền 1 chiều', N'Truyền 2 chiều', N'A', N'TH123   ', N'3aaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (112, N'MMTCB', N'A', N'Kiểu datagram trong cấp network', N'Chỉ tìm đường 1 lần khi tạo kết nối', N'Phải tìm đường riêng cho từng packet', N'THông tin có sẵn trong packet, không cần tìm đường', N'Thông tin có sẵn trong router , không cần tìm đường', N'B', N'TH123   ', N'3baadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (113, N'MMTCB', N'A', N'Kiểm soát tắc nghẽn (congestion) là nhiệm vụ của cấp', N'Physical', N'Transport', N'Data link', N'Network', N'D', N'TH123   ', N'3caadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (114, N'MMTCB', N'A', N'Nguyên nhân dẫn đến tắt nghẻn (congestion) trên mạng', N'Tốc độ xử lý của router chậm', N'Buffers trong router nhỏ', N'Router có nhiều đường vào nhưng ít đường ra', N'Tất cả đều đúng', N'D', N'TH123   ', N'3daadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (115, N'MMTCB', N'A', N'Cấp appliation trong mô hình TCP/IP tương đương với cấp nào trong mô hình OSI', N'Session', N'Application', N'Presentation', N'Tất cả đều đúng', N'D', N'TH123   ', N'3eaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (116, N'MMTCB', N'A', N'Cấp nào trong mô hình mạng OSI tương đương với cấp Internet trong mô hình TCP/IP ', N'Network', N'Transport', N'Physical', N'Data link', N'A', N'TH123   ', N'3faadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (117, N'MMTCB', N'A', N'Chất lượng dịch vụ mạng không được đánh giá trên chỉ tiêu nào?', N'Thời gian thiết lập kết nối ngắn', N'Tỉ lệ sai sót rất nhỏ', N'Tốc độ đường truyền cao', N'Khả năng phục hồi khi có sự cố', N'A', N'TH123   ', N'40aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (118, N'MMTCB', N'A', N'Kỹ thuật Multiplexing được dùng khi', N'Có nhiều kênh truyền hơn đường truyền', N'Có nhiều đường truyền hơn kênh truyền', N'Truyền dữ liệu số trên mạng điện thoại', N'Truyền dữ liệu tương tự trên mạng điện thọai', N'A', N'TH123   ', N'41aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (119, N'MMTCB', N'A', N'Dịch vụ truyền Email sử dụng protocol nào?', N'HTTP', N'NNTP', N'SMTP', N'FTP', N'C', N'TH123   ', N'42aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (120, N'MMTCB', N'A', N'Địa chỉ IP lớp B nằm trong phạm vi nào', N'192.0.0.0 - 223.0.0.0', N'127.0.0.0 - 191.0.0.0', N'128.0.0.0 - 191.0.0.0 ', N'1.0.0.0 - 126.0.0.0', N'C', N'TH123   ', N'43aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (121, N'MMTCB', N'A', N'Subnet Mask nào sau đây chỉ cho tối đa 2 địa chỉ host', N'255.255.255.252', N'255.255.255.254', N'255.255.255.248', N'255.255.255.240', N'A', N'TH123   ', N'44aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (122, N'MMTCB', N'A', N'Thành phần nào không thuộc socket', N'Port', N'Địa chỉ IP', N'Địa chỉ cấp MAC', N'Protocol cấp Transport', N'C', N'TH123   ', N'45aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (123, N'MMTCB', N'A', N'Mục đích của Subnet Mask trong địa chỉ IP là', N'Xác định host của địa chỉ IP', N'Xác định vùng network của địa chỉ IP', N'Lấy các bit trong vùng subnet làm địa chỉ host', N'Lấy các bit trong vùng địa chỉ host làm subnet', N'A', N'TH123   ', N'46aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (124, N'MMTCB', N'A', N'Bước đầu tiên cần thực hiện để truyền dữ liệu theo ALOHA là', N'Chờ 1 thời gian ngẫu nhiên', N'Gửi tín hiệu tạo kết nối', N'Kiểm tra tình trạng đường truyền', N'Lập tức truyền dữ liệu', N'D', N'TH123   ', N'47aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (125, N'MMTCB', N'A', N'Cầu nối trong suốt hoạt động trong cấp nào', N'Data link', N'Physical', N'Network', N'Transport', N'A', N'TH123   ', N'48aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (126, N'MMTCB', N'A', N'Tốc độ của đường truyền T1 là:', N'2048 Mbps', N'1544 Mbps', N'155 Mbps', N'56 Kbps', N'B', N'TH123   ', N'49aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (127, N'MMTCB', N'A', N'Khi một dịch vụ trả lời ACK cho biết dữ liệu đã nhận được, đó là', N'Dịch vụ có xác nhận', N'Dịch vụ không xác nhận', N'Dịch vụ có kết nối', N'Dịch vụ không kết nối', N'A', N'TH123   ', N'4aaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (128, N'MMTCB', N'A', N'Loại frame nào được sử dụng trong mạng Token-ring', N'Monitor', N'Token', N'Data', N'Token và Data', N'D', N'TH123   ', N'4baadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (129, N'MMTCB', N'A', N'Thuật ngữ OSI là viết tắt bởi', N'Organization for Standard Institude', N'Organization for Standard Internet', N'Open Standard Institude', N'Open System Interconnection', N'D', N'TH123   ', N'4caadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (130, N'MMTCB', N'A', N'Trong mạng Token-ting, khi 1 máy nhận được Token', N'Nó phải truyền cho máy kế trong vòng', N'Nó được quyền truyền dữ liệu', N'Nó được quyền giữ lại Token', N'Tất cả đều sai', N'B', N'TH123   ', N'4daadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (131, N'MMTCB', N'A', N'Trong mạng cục bộ, để xác định 1 máy trong mạng ta dùng địa chỉ', N'MAC', N'Socket', N'Domain', N'Port', N'A', N'TH123   ', N'4eaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (132, N'MMTCB', N'A', N'Thứ tự các cấp trong mô hình OSI', N'Application,Session,Transport,Physical', N'Application, Transport, Network, Physical', N'Application, Presentation,Session,Network,Transport,Data link,Physical', N'Application,Presentation,Session,Transport,Network,Data link,Physical', N'D', N'TH123   ', N'4faadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (133, N'MMTCB', N'A', N'Cấp vật lý (physical) không quản lý', N'Mức điện áp', N'Địa chỉ vật lý', N'Mạch giao tiếp vật lý', N'Truyền các bit dữ liêu', N'B', N'TH123   ', N'50aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (134, N'MMTCB', N'A', N'TCP sử dụng loại dịch vụ', N'Có kết nối, độ tin cậy cao', N'Có kết nối, độ tin cậy thấp', N'Không kết nối, độ tin cậy cao', N'Không kết nối, độ tin cậy thấp', N'A', N'TH123   ', N'51aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (135, N'MMTCB', N'A', N'Địa chỉ IP bao gồm', N'Địa chỉ Network và địa chỉ host', N'Địa chỉ physical và địa chỉ logical', N'Địa chỉ cấp MAC và và địa chỉ LLC', N'Địa chỉ hardware và địa chỉ software', N'A', N'TH123   ', N'52aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (136, N'MMTCB', N'A', N'Chức năng cấp mạng (network) là', N'Mã hóa và định dạng dữ liệu', N'Tìm đường và kiểm soát tắc nghẽn', N'Truy cập môi trường mạng', N'Kiểm soát lỗi và kiểm soát lưu lượng', N'B', N'TH123   ', N'53aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (137, N'MMTCB', N'A', N'Mạng CSMA/CD làm gì', N'Truyền Token trên mạng hình sao', N'Truyền Token trên mạng dạng Bus', N'Chia packet ra thành từng frame nhỏ và truỵền đi trên mạng', N'Truy cập đường truyền và truyền lại dữ liệu nếu xảy ra đụng độ', N'D', N'TH123   ', N'54aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (138, N'MMTCB', N'A', N'Tiền thân của mạng Internet là', N'Intranet', N'Ethernet', N'Arpanet', N'Token-bus', N'C', N'TH123   ', N'55aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (139, N'MMTCB', N'A', N'Khi 1 cầu nối ( bridge) nhận được 1 framechưa biết thông tin về địa chỉ máy nhận, nó sẽ', N'Xóa bỏ frame này', N'Gửi trả lại máy gốc', N'Gửi đến mọi ngõ ra còn lại', N'Giảm thời gian sống của frame đi 1 đơn vị và gửi đến mọi ngõ ra còn lại', N'C', N'TH123   ', N'56aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (140, N'MMTCB', N'A', N'Chức năng của cấp Network là', N'Tìm đường', N'Mã hóa dữ liệu', N'Tạo địa chỉ vật lý', N'Kiểm soát lưu lượng', N'A', N'TH123   ', N'57aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (141, N'MMTCB', N'B', N'Sự khác nhau giữa địa chỉ cấp Data link và Network là', N'Địa chỉ cấp Data link có kích thước nhỏ hơn địa chỉ cấp Network', N'Địa chỉ cấp Data link là đia chỉ Physic, địa chỉ cấp Network là địa chỉ Logic', N'Địa chỉ cấp Data Link là địa chỉ Logic, địa chỉ câp Network là địa chỉ Physic', N'Địa chỉ Data link cấu hình theo mạng, địa chỉ cấp Network xác định theo IEEE', N'B', N'TH123   ', N'58aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (142, N'MMTCB', N'B', N'Kỹ thuật nào không sử dụng được trong việc kiểm soát lưu lượng(flow control)', N'Ack', N'Buffer', N'Windowing', N'Multiplexing', N'D', N'TH123   ', N'59aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (143, N'MMTCB', N'B', N'Cấp cao nhất trong mô hình mạng OSI là', N'Transport', N'Physical', N'Network', N'Application', N'D', N'TH123   ', N'5aaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (144, N'MMTCB', N'B', N'Tại sao mạng máy tình dùng mô hình phân cấp', N'Để mọi người sử dụng cùng 1 ứng dụng mạng', N'Để phân biệt giữa chuẩn mạng và ứng dụng mạng', N'Giảm độ phức tạp trong việc thiết kế và cài đặt', N'Các cấp khác không cần sửa đổi khi thay đổi 1 cấp mạng', N'D', N'TH123   ', N'5baadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (145, N'MMTCB', N'B', N'Router làm gì để giảm tăc nghẽn (congestion)', N'Nén dữ liệu', N'Lọc bớt dữ liệu theo địa chỉ vật lý', N'Lọc bớt dữ liệu theo địa chỉ logic', N'Cấm truyền dữ liệu broadcasr', N'D', N'TH123   ', N'5caadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (146, N'MMTCB', N'B', N'Byte đầu của 1 IP có giá trị 222, địa chỉ này thuộc lớp địa chỉ nào', N'Lớp A', N'Lớp B', N'Lớp C', N'Lớp D', N'C', N'TH123   ', N'5daadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (147, N'MMTCB', N'B', N'Chọn câu đúng đối với switch của mạng LAN', N'Là 1 cầu nối tốc độ cao', N'Nhận data từ 1 cổng và xuất ra mọi cổng còn lại', N'Nhận data từ 1 cổng và xuất ra  cổng đích tùy theo địa chỉ cấp IP', N'Nhận data từ 1 cổng và xuất ra 1 cổng đích tùy theo địa chỉ cấp MAC', N'D', N'TH123   ', N'5eaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (148, N'MMTCB', N'B', N'Thuật ngữ nào cho biết loại mạng chỉ truyền được  chiều tại 1 thời điểm', N'Half duplex', N'Full duplex', N'Simplex', N'Monoplex', N'A', N'TH123   ', N'5faadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (149, N'MMTCB', N'B', N'Protocol nghĩa là', N'Tập các chuẩn truyền dữ liệu', N'Tập các cấp mạng trong mô hình OSI', N'Tập các chức năng của từng cấp trong mạng', N'Tập các qui tắc và cấu trúc dữ liệu để truyền thông giữa các cấp mạng', N'D', N'TH123   ', N'60aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (150, N'MMTCB', N'B', N'Truyền dữ liệu theo kiểu có kết nối không cần thực hiện việc', N'Hủy kết nối', N'Tạo kết nối', N'Truyền dữ liệu', N'Tìm đường cho từng gói tin', N'D', N'TH123   ', N'61aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (151, N'MMTCB', N'B', N'Byte đầu của địa chỉ IP lớp E nằm trong phạm vi', N'128 - 191', N'192 - 232 ', N'224 - 239 ', N'240 - 247', N'D', N'TH123   ', N'62aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (152, N'MMTCB', N'B', N'Khi truyền đi chuỗi "VIET NAM" nhưng nhận được chuỗi"MAN TEIV ". Cần phải hiệu chỉnh các protocol trong cấp nào để truyền chính xác', N'Session', N'Transport', N'Application', N'Presentation', N'B', N'TH123   ', N'63aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (153, N'MMTCB', N'B', N'Tên cáp UTP dùng torng mạng Fast Ethernet là', N'100BaseF', N'100Base2', N'100BaseT', N'100Base5', N'C', N'TH123   ', N'64aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (154, N'MMTCB', N'B', N'Tốc độ truyền của mạng Ethernet là', N'1 Mbps', N'10 Mbps', N'100 Mbps', N'1000 Mbps', N'B', N'TH123   ', N'65aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (155, N'MMTCB', N'B', N'Dịch vụ mạng thường được phân chia thành', N'Dịch vụ không kết nối và có kết nối', N'Dich vụ có xác nhận và không xác nhận', N'Dịch vụ có độ tin cậy cao và có độ tin cậy thấp', N'Tất cả đều đúng', N'D', N'TH123   ', N'66aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (156, N'MMTCB', N'B', N'Đơn vị truyền dữ liệu trong cấp Network gọi là', N'Bit', N'Frame', N'Packet', N'Segment', N'C', N'TH123   ', N'67aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (157, N'MMTCB', N'B', N'Protocol nào trong mạng TCP/IP chuyển đổi địa chỉ vật lý thành địa chỉ IP', N'IP', N'ARP', N'ICMP', N'RARP', N'D', N'TH123   ', N'68aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (158, N'MMTCB', N'B', N'Đầu nới AUI dùng cho loại cáp nào?', N'Đồng trục', N'Xoắn đôi', N'Cáp quang', N'Tất cả đều đúng', N'A', N'TH123   ', N'69aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (159, N'MMTCB', N'B', N'Subnet mask chuẩn của địa chỉ IP lớp B là', N'255.0.0.0', N'255.255.0.0', N'255.255.255.0', N'255.255.255.255', N'B', N'TH123   ', N'6aaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (160, N'MMTCB', N'B', N'Lý do nào khiến người ta chọn protocol TCP hơn là UDP', N'Không ACK', N'Dễ sử dụng', N'Độ tin cậy', N'Không kết nối', N'C', N'TH123   ', N'6baadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (161, N'MMTCB', N'B', N'Nhược điểm của dịch vụ có kết nối so với không kết nối', N'Độ tin cậy', N'Thứ tự nhận dữ liệu không đúng', N'Đường truyền không thay đổi', N'Đường truyền thay đổi liên tục', N'C', N'TH123   ', N'6caadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (162, N'MMTCB', N'B', N'Cấp Data link không thực hiện chức năng nào?', N'Kiểm soát lỗi', N'Địa chỉ vật lý', N'Kiểm soát lưu lượng', N'Thiết lập kết nối', N'D', N'TH123   ', N'6daadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (163, N'MMTCB', N'B', N'Cầu nối (bridge)dựa vào thông tin nào để truyền tiếp hoặc hủy bỏ 1 frame', N'Điạ chỉ nguồn', N'Địa chỉ đích', N'Địa chỉ mạng', N'Tất cả đều đúng', N'C', N'TH123   ', N'6eaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (164, N'MMTCB', N'B', N'Chuẩn nào sử dụng trong cấp presentation?', N'UTP và STP', N'SMTP và HTTP', N'ASCII và EBCDIC', N'TCP và UDP', N'C', N'TH123   ', N'6faadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (165, N'MMTCB', N'B', N'Đơn vị truyền dữ liệu giữa các cấp trong mạng theo thứ tự', N'bit,frame,packet,data', N'bit,packet,frame,data', N'data,frame,packet,bit', N'data,bit,packet,frame', N'A', N'TH123   ', N'70aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (166, N'MMTCB', N'B', N'Mạng Ethernet do cơ quan nào phát minh', N'ANSI', N'ISO', N'IEEE', N'XEROX', N'D', N'TH123   ', N'71aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (167, N'MMTCB', N'B', N'Chiều dài loại cáp nào tối đa 100 m? ', N'10Base2', N'10Base5', N'10BaseT', N'10BaseF', N'C', N'TH123   ', N'72aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (168, N'MMTCB', N'B', N'Địa chỉ IP 100.150.200.250 có nghĩa là', N'Địa chỉ network 100, địa chỉ host 150.200.250', N'Địa chỉ network 100.150, địa chỉ host 200.250', N'Địa chỉ network 100.150.200, địa chỉ host 250', N'Tất cả đều sai', N'D', N'TH123   ', N'73aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (169, N'MMTCB', N'B', N'Switching hun khác hub thông thường ở chỗ nó làm', N'Giảm collision trên mạng', N'Tăng collision trên mạng', N'Giảm congestion trên mạng', N'Tăng congestion trên mạng', N'A', N'TH123   ', N'74aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (170, N'MMTCB', N'B', N'Loại cáp nào chỉ truyền dữ liệu 1 chiều', N'Cáp quang', N'Xoắn đôi', N'Đồng trục', N'Tất cả đều đúng', N'A', N'TH123   ', N'75aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (171, N'MMTCB', N'B', N'Thiết bị Modem dùng để', N'Tách và ghép tín hiệu', N'Nén và gải nén tín hiệu', N'Mã hóa và giải mã tín hiệu', N'Điều chế và giải điều chế tín hiệu', N'D', N'TH123   ', N'76aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (172, N'MMTCB', N'B', N'Việc cấp phát kênh truyền áp dụng cho loại mạng', N'Peer to peer', N'Point to point', N'Broadcast', N'Multiple Access', N'C', N'TH123   ', N'77aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (173, N'MMTCB', N'B', N'Mạng nào dùng phương pháp mã hóa Manchester Encoding', N'Ethernet', N'Token-ring', N'Token-bus', N'Tất cả đều đúng ', N'D', N'TH123   ', N'78aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (174, N'MMTCB', N'B', N'Phương pháp tìm đường có tính đến thời gian trễ', N'Tìm đường theo chiều sâu', N'Tìm đường theo chiều rộng', N'Tìm đường theo vector khoảng cách', N'Tìm đường theo trạng thái đường truyền', N'D', N'TH123   ', N'79aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (175, N'MMTCB', N'B', N'Chuẩn mạng nào khi có dữ liệu không truyền ngay mà chờ 1 thời gian ngẫu nhiên?', N'1-presistent CSMA', N'p-presistent CSMA', N'Non-presistent CSMA', N'CSMA/CD', N'C', N'TH123   ', N'7aaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (176, N'MMTCB', N'B', N'Phương pháp chèn bit (bit stuffing) được dùng để', N'Phân biệt đầu và cuối frame', N'Bổ sung cho đủ kích thước frame tối thiểu', N'Phân cách nhiều bit 0 bằng bit 1', N'Biến đổi dạng dữ liệu 8 bit ra 16 bit', N'A', N'TH123   ', N'7baadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (177, N'MMTCB', N'B', N'Để chống nhiễu trên đường truyền tốt nhất, nên dùng loại cáp:', N'Xoắn đôi', N'Đồng trục', N'Cáp quang', N'Mạng không dây', N'C', N'TH123   ', N'7caadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (178, N'MMTCB', N'B', N'Phần mềm gửi/nhận thư điện tử thuộc cấp nào trong mô hình OSI', N'Data link', N'Network', N'Application', N'Presentation', N'C', N'TH123   ', N'7daadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (179, N'MMTCB', N'B', N'Chức năng của thiết bị Hub trong mạng LAN', N'Mã hóa tín hiệu', N'Triệt tiêu tín hiệu', N'Phân chia tín hiệu', N'Điều chế tín hiếu', N'C', N'TH123   ', N'7eaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (180, N'MMTCB', N'B', N'Switch là thiết bị mạng làm việc tương tự như', N'Hub', N'Repeater', N'Router', N'Bridge', N'D', N'TH123   ', N'7faadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (181, N'MMTCB', N'C', N'Thiết bị nào làm việc trong cấp Network', N'Bridge', N'Repeater', N'Router', N'Gateway', N'C', N'TH123   ', N'80aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (182, N'MMTCB', N'C', N'Thiết bị nào cần có bộ nhớ làm buffer', N'Hub', N'Switch', N'Repeater', N'Router', N'D', N'TH123   ', N'81aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (183, N'MMTCB', N'C', N'Luật 5-4-3 cho phép tối đa', N'5 segment trong 1 mạng', N'5 repeater trong 1 mạng', N'5 máy tính trong 1 mạng', N'5 máy tính trong 1 segment', N'A', N'TH123   ', N'82aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (184, N'MMTCB', N'C', N'Thiết bị nào có thể thêm vào mạng LAN mà không sợ vi phạm luật 5-4-3', N'Router', N'Repeater', N'Máy tính', N'Tất cả đều đúng', N'A', N'TH123   ', N'83aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (185, N'MMTCB', N'C', N'Thêm thiết bị nào vào mạng có thể qui phạm luật 5-4-3', N'Router', N'Repeater', N'Bridge', N'Tất cả đều đúng', N'B', N'TH123   ', N'84aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (186, N'MMTCB', N'C', N'Mạng nào cóxảy ra xung đột (collision) trên đường truyền', N'Ethernet', N'Token-ring', N'Token-bus', N'Tất cả đều sai', N'A', N'TH123   ', N'85aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (187, N'MMTCB', N'C', N'Từ "Broad" trong tên cáp 10Broad36 viết tắt bởi', N'Broadcast', N'Broadbase', N'Broadband', N'Broadway', N'C', N'TH123   ', N'86aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (188, N'MMTCB', N'C', N'Protocol nào sử dụng trong cấp Network', N'IP', N'TCP', N'UDP', N'FTP', N'A', N'TH123   ', N'87aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (189, N'MMTCB', N'C', N'Protocol nào torng cấp Transport cung cấp dịch vụ không kết nối', N'IP', N'TCP', N'UDP', N'FTP', N'C', N'TH123   ', N'88aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (190, N'MMTCB', N'C', N'Protocol nào trong cấp Transport dùng kiểu dịch vụ có kết nối?', N'IP', N'TCP', N'UDP', N'FTP', N'B', N'TH123   ', N'89aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (191, N'MMTCB', N'C', N'Địa chỉ IP được chia làm mấy lớp', N'2', N'3', N'4', N'5', N'D', N'TH123   ', N'8aaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (192, N'MMTCB', N'C', N'Chức năng nào không phải của cấp Network', N'Tìm đường', N'Địa chỉ logic', N'Kiểm soát tắc nghẽn', N'Chất lượng dịch vụ', N'B', N'TH123   ', N'8baadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (193, N'MMTCB', N'C', N'Phương pháp chèn kí tự dùng để', N'Phân cách các frame', N'Phân biệt dữ liệu và ký tự điều khiển', N'Nhận diện đầu cuối frame', N'Bổ sung cho đủ kich thước frame tối thiểu', N'B', N'TH123   ', N'8caadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (194, N'MMTCB', N'C', N'Kỹ thuật truyền nào mã hóa trực tiếp dữ liệu ra đường truyền không cần sóng mang', N'Broadcast', N'Digital', N'Baseband', N'Broadband', N'C', N'TH123   ', N'8daadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (195, N'MMTCB', N'C', N'Sóng viba sử dụng băng tần', N'SHF', N'LF và MF', N'UHF và VHF', N'Tất cả đều đúng', N'D', N'TH123   ', N'8eaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (196, N'MMTCB', N'C', N'Sóng viba bị ảnh hưởng bời', N'Trời mưa', N'Sấm chớp', N'Giông bão', N'Ánh sáng mặt trời', N'A', N'TH123   ', N'8faadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (197, N'MMTCB', N'C', N'Đường dây trung kế trong mạng điện thoại sử dụng', N'Tín hiệu số', N'Kỹ thuật dồn kênh', N'Cáp quang, cáp đồng và viba', N'Tất cả đêu đúng', N'D', N'TH123   ', N'90aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (198, N'MMTCB', N'C', N'Cáp quang dùng công nghệ dồn kênh nào', N'TDM', N'FDM', N'WDM', N'CDMA', N'C', N'TH123   ', N'91aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (199, N'MMTCB', N'C', N'Nhược điểm của phương pháp chèn ký tự', N'Giảm tốc độ đường truyền', N'Tăng phí tổn đường truyền', N'Mất đồng bộ frame', N'Không nhận diện được frame', N'B', N'TH123   ', N'92aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (200, N'MMTCB', N'C', N'Mất đồng bộ frame xảy ra đối với phương pháp', N'Chèn bit', N'Đếm ký tự', N'Chèn ký tự', N'Tất cả đều đúng', N'B', N'TH123   ', N'93aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (201, N'MMTCB', N'C', N'Mạng nào dùng công nghệ Token-bus', N'FDDI', N'CDDI', N'Fast Ethernet', N'100VG-AnyLAN', N'D', N'TH123   ', N'94aadfec-bba3-ec11-b1da-28d244961870')
GO
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (202, N'MMTCB', N'C', N'Thiết bị nào tự trao đổi thông tin lẫn nhau để quản lý mạng', N'Hub', N'Bridge', N'Router', N'Repeater', N'C', N'TH123   ', N'95aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (203, N'MMTCB', N'C', N'Tần số sóng điện từ dùng trong mạng vô tuyến sắp theo thứ tự tăng dần', N'Radio,viba,hồng ngoại', N'Radio,hồng ngoại,viba', N'Hồng ngoại,viba,radio', N'Viba,radio,hồng ngoại', N'A', N'TH123   ', N'96aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (204, N'MMTCB', N'C', N'Đường dây hạ kế (local loop) trong mạch điện thoại dùng tín hiệu', N'Digital', N'Analog', N'Manchester', N'T1 hoặc E1', N'B', N'TH123   ', N'97aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (205, N'MMTCB', N'C', N'Để tránh nhận trùng dữ liệu người ta dùng phương pháp', N'Đánh số thứ tự các frame', N'Quy định kích thước frame cố định', N'Chờ nhận ACK mới gửi frame kế tiếp', N'So sánh và loại bỏ các frame giống nhau', N'A', N'TH123   ', N'98aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (206, N'MMTCB', N'C', N'Cơ chế Timer dùng để', N'Đo thời gian chơ frame', N'Tránh tình trạng mất frame', N'Chọn thời điểm truyền frame', N'Kiểm soát thòi gian truyền frame', N'A', N'TH123   ', N'99aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (207, N'MMTCB', N'C', N'Cấp nào trong mô hình OSI quan tâm tới topology mạng', N'Transport', N'Network', N'Data link', N'Physical', N'B', N'TH123   ', N'9aaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (208, N'MMTCB', N'C', N'Loại mạng nào sử dụng trên WAN', N'Ethernet và Token-bus', N'ISDN và Frame relay', N'Token-ring và FDDI', N'SDLC và HDLC', N'A', N'TH123   ', N'9baadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (209, N'MMTCB', N'C', N'Repeater nhiều port là tên gọi của', N'Hub', N'Host', N'Bridge', N'Router', N'A', N'TH123   ', N'9caadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (210, N'MMTCB', N'C', N'Đơn vị đo tốc độ đường truyền', N'bps(bit per second)', N'Bps(Byte per second)', N'mps(meter per second)', N'hertz (ccle per second)', N'A', N'TH123   ', N'9daadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (211, N'MMTCB', N'C', N'Repeater dùng để', N'Lọc bớt dữ liệu trên mạng', N'Tăng tốc độ lưu thông trên mạng', N'Tăng thời gian trễ trên mạng', N'Mở rộng chiều dài đường truyền', N'D', N'TH123   ', N'9eaadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (212, N'MMTCB', N'C', N'Cáp đồng trục (coaxial)', N'Có 4 đôi dây', N'Không cần repeater', N'Truyền tín hiệu ánh sáng', N'Chống nhiễu tốt hơn UTP', N'D', N'TH123   ', N'9faadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (213, N'MMTCB', N'C', N'Câp Data link ', N'Truyền dữ liệu cho các cấp khác trong mạng', N'Cung cấp dịch vụ cho chương trình ứng dụng', N'Nhận tín hiệu yếu,lọc,khuếch đại và phát lại trên mạng', N'Bảo đảm đường truyền dữ liệu tin cậy giữa 2 đầu đường truyền', N'D', N'TH123   ', N'a0aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (214, N'MMTCB', N'C', N'Địa chỉ IP còn gọi là', N'Địa chĩ vật lý', N'Địa chỉ luận lý', N'Địa chỉ thập phân', N'Địa chỉ thập lục phân', N'B', N'TH123   ', N'a1aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (215, N'MMTCB', N'C', N'Cấp Presentation', N'Thiết lập, quản lý và kết thúc các ứng dụng', N'Hướng dẫn cách mô tả hình ảnh, âm thanh, tiếng nói', N'Cung cấp dịch vụ truyền dữ liệu từ nguồn đến đích', N'Hỗ trợ việc truyền thông trong các ứng dụng như web, mail...', N'C', N'TH123   ', N'a2aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (216, N'MMTCB', N'C', N'Tập các luật để định dạng và truyền dữ liệu gọi là', N'Qui luật (rule)', N'Nghi thức (protocol)', N'Tiêu chuẩn (standard)', N'Mô hình (model)', N'B', N'TH123   ', N'a3aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (217, N'MMTCB', N'C', N'Tại sao cần có tiêu chuẩn về mang', N'Định hướng phát triển phần cứng và phần mềm mới', N'LAN,MAN và WAN sử dụng các thiết bị khác nhau', N'Kết nối mạng giữa các quôc gia khác nhau', N'Tương thích về công nghệ để truyền thông được lẫn nhau', N'D', N'TH123   ', N'a4aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (218, N'MMTCB', N'C', N'Dữ liệu truyền trên mạng bằng', N'Mã ASCII', N'Số nhị phân', N'Không và một', N'Xung điện áp', N'D', N'TH123   ', N'a5aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (219, N'MMTCB', N'C', N'Mạng CSMA/CD', N'Kiểm tra để bảo đảm dữ liệu truyền đến đích', N'Kiểm tra đường truyền nếu rảnh mới truyền dữ liệu', N'Chờ 1 thời gian ngẫu nhiên rồi truyền  dữ liệu kế tiếp', N'Tất cả đều đúng', N'B', N'TH123   ', N'a6aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (220, N'MMTCB', N'C', N'Địa chỉ MAC ', N'Gồm có 32 bit', N'Còn gọi là địa chỉ logic', N'Nằm trong cấp Network', N'Dùng để phân biệt các máy trong mạng', N'D', N'TH123   ', N'a7aadfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (221, N'CTDL ', N'B', N'NND1111', N'hhhhh', N'B', N'C', N'D', N'C', N'TH002   ', N'6fd528f9-1baf-ec11-b1db-28d244961870')
GO
INSERT [dbo].[COSO] ([MACS], [TENCS], [DIACHI], [rowguid]) VALUES (N'CS1', N'Cơ sở 1 ', N'11 Nguyễn Đình Chiểu, Phường Đakao, Quận 1, TP. HCM', N'afa9dfec-bba3-ec11-b1da-28d244961870')
GO
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (10, N'001     ', N'MMTCB', 1, 3, N'A', N'585a3372-f3b6-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (1, N'001     ', N'MMTCB', 1, 17, N'A', N'4f5a3372-f3b6-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (5, N'001     ', N'MMTCB', 1, 86, N'D', N'535a3372-f3b6-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (7, N'001     ', N'MMTCB', 1, 87, N'A', N'555a3372-f3b6-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (3, N'001     ', N'MMTCB', 1, 93, N'C', N'515a3372-f3b6-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (9, N'001     ', N'MMTCB', 1, 95, N'A', N'575a3372-f3b6-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (8, N'001     ', N'MMTCB', 1, 104, N'D', N'565a3372-f3b6-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (4, N'001     ', N'MMTCB', 1, 108, N'A', N'525a3372-f3b6-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (6, N'001     ', N'MMTCB', 1, 114, N'B', N'545a3372-f3b6-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (2, N'001     ', N'MMTCB', 1, 115, N'A', N'505a3372-f3b6-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (9, N'002     ', N'MMTCB', 1, 4, N'B', N'c72432b7-27b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (8, N'002     ', N'MMTCB', 1, 11, N'A', N'c62432b7-27b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (4, N'002     ', N'MMTCB', 1, 13, N'D', N'c22432b7-27b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (3, N'002     ', N'MMTCB', 1, 19, N'A', N'c12432b7-27b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (6, N'002     ', N'MMTCB', 1, 84, N'A', N'c42432b7-27b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (10, N'002     ', N'MMTCB', 1, 93, N'A', N'c82432b7-27b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (2, N'002     ', N'MMTCB', 1, 106, N'A', N'c02432b7-27b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (7, N'002     ', N'MMTCB', 1, 110, N'A', N'c52432b7-27b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (1, N'002     ', N'MMTCB', 1, 115, N'A', N'bf2432b7-27b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (5, N'002     ', N'MMTCB', 1, 120, N'A', N'c32432b7-27b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (8, N'003     ', N'MMTCB', 1, 4, N'A', N'38b5565b-28b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (3, N'003     ', N'MMTCB', 1, 100, N'C', N'33b5565b-28b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (7, N'003     ', N'MMTCB', 1, 103, N'D', N'37b5565b-28b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (6, N'003     ', N'MMTCB', 1, 107, N'A', N'36b5565b-28b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (4, N'003     ', N'MMTCB', 1, 116, N'A', N'34b5565b-28b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (1, N'003     ', N'MMTCB', 1, 117, N'B', N'31b5565b-28b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (2, N'003     ', N'MMTCB', 1, 118, N'D', N'32b5565b-28b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (10, N'003     ', N'MMTCB', 1, 120, N'A', N'3ab5565b-28b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (5, N'003     ', N'MMTCB', 1, 126, N'A', N'35b5565b-28b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (9, N'003     ', N'MMTCB', 1, 138, N'C', N'39b5565b-28b7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (7, N'004     ', N'MMTCB', 1, 12, N'A', N'7d08452f-2ab7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (2, N'004     ', N'MMTCB', 1, 14, N'A', N'7808452f-2ab7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (4, N'004     ', N'MMTCB', 1, 16, N'D', N'7a08452f-2ab7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (3, N'004     ', N'MMTCB', 1, 96, N'C', N'7908452f-2ab7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (6, N'004     ', N'MMTCB', 1, 102, N'D', N'7c08452f-2ab7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (9, N'004     ', N'MMTCB', 1, 109, N'A', N'7f08452f-2ab7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (8, N'004     ', N'MMTCB', 1, 116, N'B', N'7e08452f-2ab7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (5, N'004     ', N'MMTCB', 1, 130, N'A', N'7b08452f-2ab7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (1, N'004     ', N'MMTCB', 1, 132, N'A', N'7708452f-2ab7-ec11-b1dc-28d244961870')
INSERT [dbo].[CT_BAITHI] ([CAUSO], [MASV], [MAMH], [LAN], [CAUHOI], [DACHON], [rowguid]) VALUES (10, N'004     ', N'MMTCB', 1, 140, N'A', N'8008452f-2ab7-ec11-b1dc-28d244961870')
GO
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [DIACHI], [MAKH], [rowguid]) VALUES (N'TH002   ', N'Ven', N'Giần', N'97 Hiệp Phú', N'CNTT    ', N'7bc7976f-9ba7-ec11-b1db-28d244961870')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [DIACHI], [MAKH], [rowguid]) VALUES (N'TH101   ', N'KIEU DAC', N'THIEN', N'9,3A, Q.BINH TAN', N'CNTT    ', N'b8a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [DIACHI], [MAKH], [rowguid]) VALUES (N'TH117   ', N'LE PHUONG', N'TRANG', N'97 MANBUI DINH TUY TAN BINH', N'VT      ', N'f9ebf7d4-c3a3-ec11-b1da-28d244961870')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [DIACHI], [MAKH], [rowguid]) VALUES (N'TH123   ', N'PHAN VAN ', N'HAI', N'15/72 LE VAN THO F8 GO VAP', N'CNTT    ', N'b9a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [DIACHI], [MAKH], [rowguid]) VALUES (N'TH197   ', N'Trần', N'Vắng', N'97 man thiện', N'CNTT    ', N'693c0330-eaa6-ec11-b1db-28d244961870')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [DIACHI], [MAKH], [rowguid]) VALUES (N'TH199   ', N'Lê Văn Đốp', N'Ki', N'97 Man Thiện', N'CNTT2   ', N'e125e2fa-9aa7-ec11-b1db-28d244961870')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [DIACHI], [MAKH], [rowguid]) VALUES (N'TH234   ', N'DAO VAN ', N'TUYET', N'14/7 BUI DINH TUY TAN BINH', N'CNTT    ', N'baa9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [DIACHI], [MAKH], [rowguid]) VALUES (N'TH657   ', N'PHAN HONG', N'NGOC', N'', N'VT      ', N'bba9dfec-bba3-ec11-b1da-28d244961870')
GO
INSERT [dbo].[GIAOVIEN_DANGKY] ([MAGV], [MAMH], [MALOP], [TRINHDO], [NGAYTHI], [LAN], [SOCAUTHI], [THOIGIAN], [rowguid]) VALUES (N'TH002   ', N'AVCB ', N'D18CQCN01      ', N'A', CAST(N'2022-04-21T00:00:00.000' AS DateTime), 1, 20, 30, N'58db7769-d3b5-ec11-b1dc-28d244961870')
INSERT [dbo].[GIAOVIEN_DANGKY] ([MAGV], [MAMH], [MALOP], [TRINHDO], [NGAYTHI], [LAN], [SOCAUTHI], [THOIGIAN], [rowguid]) VALUES (N'TH101   ', N'CTDL ', N'PT01           ', N'B', CAST(N'2022-04-08T16:47:03.773' AS DateTime), 1, 10, 15, N'8088d18d-d7b0-ec11-b1dc-28d244961870')
INSERT [dbo].[GIAOVIEN_DANGKY] ([MAGV], [MAMH], [MALOP], [TRINHDO], [NGAYTHI], [LAN], [SOCAUTHI], [THOIGIAN], [rowguid]) VALUES (N'TH002   ', N'CTDL ', N'PT01           ', N'A', CAST(N'2022-04-22T17:00:24.770' AS DateTime), 2, 10, 15, N'00a02a72-d9b0-ec11-b1dc-28d244961870')
INSERT [dbo].[GIAOVIEN_DANGKY] ([MAGV], [MAMH], [MALOP], [TRINHDO], [NGAYTHI], [LAN], [SOCAUTHI], [THOIGIAN], [rowguid]) VALUES (N'TH002   ', N'MMTCB', N'PT01           ', N'A', CAST(N'2022-04-09T00:00:00.000' AS DateTime), 1, 10, 15, N'f8a35f58-8eb4-ec11-b1dc-28d244961870')
GO
INSERT [dbo].[KHOA] ([MAKH], [TENKH], [MACS], [rowguid]) VALUES (N'CNTT    ', N'Công nghệ thông tin', N'CS1', N'b5a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[KHOA] ([MAKH], [TENKH], [MACS], [rowguid]) VALUES (N'CNTT2   ', N'Công nghệ 2', N'CS1', N'51420522-f1a6-ec11-b1db-28d244961870')
INSERT [dbo].[KHOA] ([MAKH], [TENKH], [MACS], [rowguid]) VALUES (N'VT2     ', N'Viễn thông 2', N'CS1', N'2367400f-91a9-ec11-b1db-28d244961870')
GO
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'D18CQCN01      ', N'Ngành CNTT Khóa 2018 -1', N'CNTT    ', N'bca9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'PT01           ', N'PHAN TAN 2022', N'CNTT    ', N'b6d9f65d-a0aa-ec11-b1db-28d244961870')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'PT02           ', N'PHAN TAN 2077', N'CNTT2   ', N'086caf97-a0aa-ec11-b1db-28d244961870')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'TH04           ', N'TIN HOC 2004', N'CNTT    ', N'bda9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'TH05           ', N'TIN HOC 2005', N'CNTT    ', N'bea9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'TH06           ', N'TIN HOC 2006', N'CNTT    ', N'bfa9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'TH07           ', N'TIN HOC 2007', N'CNTT    ', N'c0a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'TH08           ', N'TIN HOC 2008', N'CNTT    ', N'c1a9dfec-bba3-ec11-b1da-28d244961870')
GO
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'AVCB ', N'ANH VĂN CĂN BẢN', N'b1a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'CSDL ', N'CƠ SỞ DỮ LIỆU', N'b2a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'CTDL ', N'CẤU TRÚC DỮ LIỆU', N'b3a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'CTDL1', N'CẤU TRÚC DỮ LIỆU 1', N'f685b087-07a6-ec11-b1db-28d244961870')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'MMTCB', N'MẠNG MÁY TÍNH CĂN BẢN', N'b4a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'PT   ', N'PHÂN TÁN', N'c4966888-48a5-ec11-b1db-28d244961870')
GO
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MATKHAU], [MALOP], [rowguid]) VALUES (N'001     ', N'LÊ VĂN ', N'THÀNH', CAST(N'1985-03-06' AS Date), N'23/5 PHUNG KHAC KHOAN F3 Q3', N'123                      ', N'TH04           ', N'c3a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MATKHAU], [MALOP], [rowguid]) VALUES (N'002     ', N'DAO TRONG', N'KHAI', CAST(N'1979-08-19' AS Date), N'15/72 LE VAN THO F8 GOVAP', N'123                      ', N'TH04           ', N'c4a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MATKHAU], [MALOP], [rowguid]) VALUES (N'003     ', N'CAO TUAN', N'KHA', CAST(N'1985-12-06' AS Date), N'12/5 LE QUANG DINH F5 GO VAP', N'123                      ', N'TH04           ', N'c5a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MATKHAU], [MALOP], [rowguid]) VALUES (N'004     ', N'HA THANH ', N'BINH', CAST(N'1984-03-24' AS Date), N'23/4 HOANG HOA THAM', N'123                      ', N'TH04           ', N'c6a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MATKHAU], [MALOP], [rowguid]) VALUES (N'005     ', N'NGUYEN THÚY ', N'VÂN', CAST(N'1987-11-06' AS Date), N'7 HUYNH THUC KHANG', N'123                      ', N'TH05           ', N'c7a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MATKHAU], [MALOP], [rowguid]) VALUES (N'006     ', N'NGUYEN NGOC ', N'YEN', CAST(N'1980-11-23' AS Date), N'3/5 AN DUONG VUONG', N'123                      ', N'TH05           ', N'c8a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MATKHAU], [MALOP], [rowguid]) VALUES (N'007     ', N'NGUYEN THUY ', N'DUNG', CAST(N'1988-05-23' AS Date), N'8 HUYNH VAN BANH f1 q binh thanh', N'123                      ', N'TH05           ', N'c9a9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MATKHAU], [MALOP], [rowguid]) VALUES (N'008     ', N'TRINH', N'PHONG', CAST(N'1985-12-10' AS Date), N'', N'123                      ', N'TH06           ', N'caa9dfec-bba3-ec11-b1da-28d244961870')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MATKHAU], [MALOP], [rowguid]) VALUES (N'009     ', N'TRAN THANH', N'HUNG', CAST(N'1985-03-28' AS Date), N'Some where', N'1234aaf                  ', N'TH05           ', N'cba9dfec-bba3-ec11-b1da-28d244961870')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UN_TENLOP]    Script Date: 08/04/2022 5:58:37 pm ******/
ALTER TABLE [dbo].[LOP] ADD  CONSTRAINT [UN_TENLOP] UNIQUE NONCLUSTERED 
(
	[TENLOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UN_TENMH]    Script Date: 08/04/2022 5:58:37 pm ******/
ALTER TABLE [dbo].[MONHOC] ADD  CONSTRAINT [UN_TENMH] UNIQUE NONCLUSTERED 
(
	[TENMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BANGDIEM] ADD  CONSTRAINT [MSmerge_df_rowguid_BE08AEF6B904495D83D0EB75044E4717]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[BODE] ADD  CONSTRAINT [MSmerge_df_rowguid_A6A986FD7B26448E9468C9802E4DD5F2]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[COSO] ADD  CONSTRAINT [MSmerge_df_rowguid_EE8072ED3D51494CBE63C927DEB1DAC0]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[CT_BAITHI] ADD  CONSTRAINT [MSmerge_default_constraint_for_rowguidcol_of_983726607]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[GIAOVIEN] ADD  CONSTRAINT [MSmerge_df_rowguid_413A0F7FEC294461BF894E740210E6BD]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] ADD  CONSTRAINT [MSmerge_df_rowguid_CEB7EE9F50F34372B03327A728C6BF17]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[KHOA] ADD  CONSTRAINT [MSmerge_df_rowguid_CA4F7575166645FA86F2F6BD86CC7CBE]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[LOP] ADD  CONSTRAINT [MSmerge_df_rowguid_2D937534EF1141B5A5C27FDEEACAE593]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[MONHOC] ADD  CONSTRAINT [MSmerge_df_rowguid_5154ECE1B8684552A9B3BA180DF07721]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[SINHVIEN] ADD  CONSTRAINT [MSmerge_df_rowguid_407503D02BD843E7BDB3F8821A4A7801]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH NOCHECK ADD  CONSTRAINT [FK_BANGDIEM_MONHOC] FOREIGN KEY([MAMH])
REFERENCES [dbo].[MONHOC] ([MAMH])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [FK_BANGDIEM_MONHOC]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH NOCHECK ADD  CONSTRAINT [FK_BANGDIEM_SINHVIEN1] FOREIGN KEY([MASV])
REFERENCES [dbo].[SINHVIEN] ([MASV])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [FK_BANGDIEM_SINHVIEN1]
GO
ALTER TABLE [dbo].[BODE]  WITH NOCHECK ADD  CONSTRAINT [FK_BODE_GIAOVIEN] FOREIGN KEY([MAGV])
REFERENCES [dbo].[GIAOVIEN] ([MAGV])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BODE] CHECK CONSTRAINT [FK_BODE_GIAOVIEN]
GO
ALTER TABLE [dbo].[BODE]  WITH NOCHECK ADD  CONSTRAINT [FK_BODE_MONHOC] FOREIGN KEY([MAMH])
REFERENCES [dbo].[MONHOC] ([MAMH])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BODE] CHECK CONSTRAINT [FK_BODE_MONHOC]
GO
ALTER TABLE [dbo].[CT_BAITHI]  WITH NOCHECK ADD  CONSTRAINT [FK_CT_BAITHI_BODE] FOREIGN KEY([CAUHOI])
REFERENCES [dbo].[BODE] ([CAUHOI])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CT_BAITHI] CHECK CONSTRAINT [FK_CT_BAITHI_BODE]
GO
ALTER TABLE [dbo].[CT_BAITHI]  WITH NOCHECK ADD  CONSTRAINT [FK_CT_BAITHI_MONHOC1] FOREIGN KEY([MAMH])
REFERENCES [dbo].[MONHOC] ([MAMH])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CT_BAITHI] CHECK CONSTRAINT [FK_CT_BAITHI_MONHOC1]
GO
ALTER TABLE [dbo].[CT_BAITHI]  WITH NOCHECK ADD  CONSTRAINT [FK_CT_BAITHI_SINHVIEN] FOREIGN KEY([MASV])
REFERENCES [dbo].[SINHVIEN] ([MASV])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CT_BAITHI] CHECK CONSTRAINT [FK_CT_BAITHI_SINHVIEN]
GO
ALTER TABLE [dbo].[GIAOVIEN]  WITH NOCHECK ADD  CONSTRAINT [FK_GIAOVIEN_KHOA] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHOA] ([MAKH])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[GIAOVIEN] CHECK CONSTRAINT [FK_GIAOVIEN_KHOA]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH NOCHECK ADD  CONSTRAINT [FK_GIAOVIEN_DANGKY_GIAOVIEN1] FOREIGN KEY([MAGV])
REFERENCES [dbo].[GIAOVIEN] ([MAGV])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [FK_GIAOVIEN_DANGKY_GIAOVIEN1]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH NOCHECK ADD  CONSTRAINT [FK_GIAOVIEN_DANGKY_LOP] FOREIGN KEY([MALOP])
REFERENCES [dbo].[LOP] ([MALOP])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [FK_GIAOVIEN_DANGKY_LOP]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH NOCHECK ADD  CONSTRAINT [FK_GIAOVIEN_DANGKY_MONHOC1] FOREIGN KEY([MAMH])
REFERENCES [dbo].[MONHOC] ([MAMH])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [FK_GIAOVIEN_DANGKY_MONHOC1]
GO
ALTER TABLE [dbo].[KHOA]  WITH NOCHECK ADD  CONSTRAINT [FK_KHOA_COSO] FOREIGN KEY([MACS])
REFERENCES [dbo].[COSO] ([MACS])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KHOA] CHECK CONSTRAINT [FK_KHOA_COSO]
GO
ALTER TABLE [dbo].[LOP]  WITH NOCHECK ADD  CONSTRAINT [FK_LOP_KHOA] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHOA] ([MAKH])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [FK_LOP_KHOA]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH NOCHECK ADD  CONSTRAINT [CK_DIEM] CHECK NOT FOR REPLICATION (([DIEM]>=(0) AND [DIEM]<=(10)))
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [CK_DIEM]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH NOCHECK ADD  CONSTRAINT [CK_LANTHI] CHECK NOT FOR REPLICATION (([LAN]>=(1) AND [LAN]<=(2)))
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [CK_LANTHI]
GO
ALTER TABLE [dbo].[BODE]  WITH NOCHECK ADD  CONSTRAINT [CK_BODE] CHECK NOT FOR REPLICATION (([TRINHDO]='A' OR [TRINHDO]='B' OR [TRINHDO]='C'))
GO
ALTER TABLE [dbo].[BODE] CHECK CONSTRAINT [CK_BODE]
GO
ALTER TABLE [dbo].[BODE]  WITH NOCHECK ADD  CONSTRAINT [CK_DAPAN] CHECK NOT FOR REPLICATION (([DAP_AN]='D' OR ([DAP_AN]='C' OR ([DAP_AN]='B' OR [DAP_AN]='A'))))
GO
ALTER TABLE [dbo].[BODE] CHECK CONSTRAINT [CK_DAPAN]
GO
ALTER TABLE [dbo].[CT_BAITHI]  WITH NOCHECK ADD  CONSTRAINT [CK_CT_BAITHI_DACHON] CHECK NOT FOR REPLICATION (([DACHON]='A' OR [DACHON]='B' OR [DACHON]='C' OR [DACHON]='D'))
GO
ALTER TABLE [dbo].[CT_BAITHI] CHECK CONSTRAINT [CK_CT_BAITHI_DACHON]
GO
ALTER TABLE [dbo].[CT_BAITHI]  WITH NOCHECK ADD  CONSTRAINT [CK_CT_BAITHI_LAN] CHECK NOT FOR REPLICATION (([LAN]=(1) OR [LAN]=(2)))
GO
ALTER TABLE [dbo].[CT_BAITHI] CHECK CONSTRAINT [CK_CT_BAITHI_LAN]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH NOCHECK ADD  CONSTRAINT [CK_LAN] CHECK NOT FOR REPLICATION (([LAN]>=(1) AND [LAN]<=(2)))
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [CK_LAN]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH NOCHECK ADD  CONSTRAINT [CK_SOCAUTHI] CHECK NOT FOR REPLICATION (([SOCAUTHI]>=(10) AND [SOCAUTHI]<=(100)))
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [CK_SOCAUTHI]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH NOCHECK ADD  CONSTRAINT [CK_THOIGIAN] CHECK NOT FOR REPLICATION (([THOIGIAN]>=(15) AND [THOIGIAN]<=(60)))
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [CK_THOIGIAN]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH NOCHECK ADD  CONSTRAINT [CK_TRINHDO] CHECK NOT FOR REPLICATION (([TRINHDO]='C' OR ([TRINHDO]='B' OR [TRINHDO]='A')))
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [CK_TRINHDO]
GO
/****** Object:  StoredProcedure [dbo].[MY_SP_LAY_CAUHOI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MY_SP_LAY_CAUHOI]
@maMonHoc NCHAR(5), @trinhDo NChar(1), @soCauCanLay int
AS
BEGIN
	DECLARE @trinhDo2 Nchar(1) = 'N'
	DECLARE @soCauCungTrinhDo int = -1
	DECLARE @soCauDuoiTrinhDo int = -1
	DECLARE @soCauCanLayTrinhDoDuoi int = -1
	if (@trinhDo = 'A') 
		set @trinhDo2 = 'B'
	else if (@trinhDo = 'B')
		set @trinhDo2 = 'C' 

	set @soCauCungTrinhDo = (select count(*) from BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo))
		--SELECT @soCauCungTrinhDo AS SOCAUCUNGTRINHDO
	
	if(@soCauCungTrinhDo >= @soCauCanLay) -- nếu có đủ câu cùng trình độ lấy luôn đéo nói nhiều
		BEGIN
			SET ROWCOUNT @soCauCanLay
			SELECT * FROM BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo)
			ORDER BY NEWID()
			RETURN 1
		END
	else if(@soCauCungTrinhDo < @soCauCanLay*70/100)
		BEGIN
			RAISERROR(N'không đủ 70 phần trăm câu cùng trình độ', 16,1)
			RETURN -1
		END
	else if((@soCauCungTrinhDo > @soCauCanLay*70/100) and (@soCauCungTrinhDo < @soCauCanLay))
		BEGIN
		print(N'hơn 70 phần trăm nhưng dưới 100 phần trăm số câu')
			SET @soCauCanLayTrinhDoDuoi = @soCauCanLay - @soCauCungTrinhDo

			set @soCauDuoiTrinhDo = (select count(*) from BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo2))
			
			if(@soCauDuoiTrinhDo >= @soCauCanLayTrinhDoDuoi)
				BEGIN
					--SET ROWCOUNT @soCauCanLayTrinhDoDuoi
					--	SELECT * FROM BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo2)
					--	ORDER BY NEWID()
	/*create table #TMPCAUHOITRINHDO1( -- neeus dungf insert into # select thi ph tao bang
			CAUHOI int primary key,
			MAMH char(5),
			TRINHDO char(1),
			NOIDUNG ntext,
			A ntext,
			B ntext,
			C ntext,
			D ntext,
			DAP_AN nchar(1)
	)
	create table #TMPCAUHOITRINHDO2(
			CAUHOI int primary key,
			MAMH char(5),
			TRINHDO char(1),
			NOIDUNG ntext,
			A ntext,
			B ntext,
			C ntext,
			D ntext,
			DAP_AN nchar(1)
	)*/
	-- khi hooij mawcs looix The data type ntext cannot be used as an operand to the UNION, INTERSECT or EXCEPT operators because it is not comparable.
	-- => phai cast noi dung, abcd

			-- trường hợp đã lấy hết trình độ 1 vẫn ph lấy trình độ 2, thì trình độ 1 k random đâu
			--INSERT INTO #TMPCAUHOITRINHDO1 dungf kieeur nay thi bo into trong select
					SELECT CAUHOI, MAMH, TRINHDO, CAST(NOIDUNG as nvarchar(max)) NOIDUNG,CAST(A as nvarchar(max)) A,CAST(B as nvarchar(max)) B,CAST(C as nvarchar(max)) C,
			CAST(D as nvarchar(max)) D, DAP_AN  INTO #TMPCAUHOITRINHDO1 FROM BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo)
					ORDER BY NEWID()

					--SET ROWCOUNT @soCauCanLayTrinhDoDuoi
				--INSERT INTO #TMPCAUHOITRINHDO2
					SELECT TOP (@soCauCanLayTrinhDoDuoi) CAUHOI, MAMH, TRINHDO, CAST(NOIDUNG as nvarchar(max)) NOIDUNG,CAST(A as nvarchar(max)) A,CAST(B as nvarchar(max)) B,CAST(C as nvarchar(max)) C,
			CAST(D as nvarchar(max)) D, DAP_AN INTO #TMPCAUHOITRINHDO2 FROM BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo2)
							ORDER BY NEWID()
					-- dung doan lenh offset 0 rows vi ly do sau:
					-- The ORDER BY clause is invalid in views, inline functions, derived tables, subqueries, and common table expressions, unless TOP, OFFSET or FOR XML is also specified.
					SELECT * FROM (SELECT * FROM #TMPCAUHOITRINHDO1 
						ORDER BY NEWID() OFFSET 0 ROWS ) A 
					UNION ALL 
					SELECT * FROM (SELECT * FROM #TMPCAUHOITRINHDO2 ORDER BY NEWID() OFFSET 0 ROWS) B
					
					RETURN 1
				END
			else
				BEGIN
					RAISERROR(N'Không đủ số lượng câu hỏi trình độ dưới', 16, 2)
					RETURN -1
				END
		END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GHI_VAO_BANGDIEM]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GHI_VAO_BANGDIEM]
	@MASV nchar(8), --
	@MAMH nchar(5), --
	@LAN smallint,	--
	@NGAYTHI datetime,
	@DIEM float
AS
	IF EXISTS(SELECT MASV FROM BANGDIEM WHERE MASV=@MASV AND MAMH=@MAMH AND LAN=@LAN)
		RAISERROR('Sinh viên đã có điểm môn này', 16, 1)
	ELSE
		INSERT INTO BANGDIEM(MASV, MAMH, LAN, NGAYTHI, DIEM) VALUES (@MASV, @MAMH, @LAN, @NGAYTHI, @DIEM)
 
  


GO
/****** Object:  StoredProcedure [dbo].[SP_KT_GIAOVIEN_DANGKY_DATONTAI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_GIAOVIEN_DANGKY_DATONTAI] 
	@MALOP nchar(15),
	@MAMH char(5),
	@LAN smallint,
	@NGAYTHI datetime
AS
	--check xem đợt này thi chưa
	IF (exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN) 
	OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH = @MAMH AND LAN = @LAN)) 
			BEGIN
				RAISERROR ('Đợt thi này đã tồn tại', 16, 1)
				RETURN
			END
	-- chưa tìm ra cách để thay điều kiện bên dưới vì dính lỗi cannot continue, 
	-- nếu sửa đc sẽ sửa đk thành IF @LAN = 2 AND NOT..
	-- 
	-- không hiểu sao nếu trong điều kiện if k có @lần= thì sẽ gặp lỗi Cannot continue the execution because the session is in the kill state.
	-- và để chỉ kiểm tra điều kiện đằng sau (có lần thi 1) có đúng hay k, ta cho trước or là chắc chắn false
	-- nếu chưa thi, thì xem đã thi lần 1 hay là chưa
	ELSE /*IF((@LAN=10) OR NOT(exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1) 
		OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1))) 
		BEGIN
			RAISERROR ('Đợt thi này chưa thi lần 1, không thể đăng kí thi lần 2', 16, 2)
			RETURN
		END*/
		IF(@LAN=2)
			BEGIN
				--PRINT ('lan2')
					IF((exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1) 
				OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1))) 
						BEGIN
							--Print (N'Đợt thi này đã thi lần 1, tiến hành kiểm tra ngày thi đợt 2 > ngày đợt 1 + 7 ngày?')
							--lấy ngày thi đợt 1
							DECLARE @NGAYTHIDOT1 datetime
							SET @NGAYTHIDOT1=
							(SELECT NGAYTHI FROM dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1
									UNION SELECT NGAYTHI FROM LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1)
		
							--PRINT ('Ngày thi đợt 1 :' + FORMAT (@NGAYTHIDOT1, 'dd/MM/yyyy'))

							DECLARE @MESSAGE nvarchar(100)
							SET @MESSAGE = CONCAT(N'Đợt 2 phải thi sau đợt 1: ', FORMAT (@NGAYTHIDOT1, 'dd/MM/yyyy') , N' ít nhất 1 tuần')
							-- kiểm tra ngày thi đợt 2 có > đợt 1 + 7 ngày
							IF(@NGAYTHI < DATEADD(DAY, 7, @NGAYTHIDOT1))-- nếu ngày thi đợt 2 không sau đợt 1 ít nhất 1 tuần
								BEGIN
									RAISERROR ( @MESSAGE , 16, 3)
								RETURN
								END
							--ELSE 
								--PRINT(N'Ngày thi đợt 2 hợp lệ')
							RETURN
						END
					ELSE
						RAISERROR ('Đợt thi này chưa thi lần 1, không thể đăng kí thi lần 2', 16, 2)
			END
	/*ELSE -- đã tồn tại đợt thi 1, lấy đc ngày thi đợt 1
	BEGIN
		DECLARE @NGAYTHIDOT1 datetime
		SET @NGAYTHIDOT1=
		(SELECT NGAYTHI FROM dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1
				UNION SELECT NGAYTHI FROM LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1)
		
		SELECT @NGAYTHIDOT1 as NGAYTHIDOT1
		DECLARE @MESSAGE nvarchar(100)
		SET @MESSAGE = CONCAT(N'Đợt 2 phải thi sau đợt 1: ', FORMAT (@NGAYTHIDOT1, 'dd/MM/yyyy') , N' ít nhất 1 tuần')
		IF(@NGAYTHI < DATEADD(DAY, 7, @NGAYTHIDOT1))-- nếu ngày thi đợt 2 không sau đợt 1 ít nhất 1 tuần
			BEGIN
				RAISERROR ( @MESSAGE , 16, 3)
				RETURN
			END
	--RAISERROR ('Đợt thi này đã thi lần 1', 16, 3)
		
	END*/




	--IF (exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN) 
	--OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH = @MAMH AND LAN = @LAN)) 
	--		RAISERROR ('Đợt thi này đã tồn tại', 16, 1)
	--ELSE
	--IF NOT(exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1) 
	--OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH = @MAMH AND LAN = 1)) 
   --		RAISERROR ('Đợt thi này chưa thi lần 1', 16, 1)
	/*ELSE -- đã thi lần 1, lấy date lần 1 để ktra (nhưng chưa thì gặp lỗi Cannot continue the execution because the session is in the kill state.
	IF (@LAN=2)
		BEGIN
		DECLARE @NGAYTHIDOT1 datetime
		SELECT @NGAYTHIDOT1
			SELECT @NGAYTHIDOT1 = NGAYTHI FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1
			SELECT @NGAYTHIDOT1
			IF(@@ROWCOUNT=0) -- nếu đợt thi 1 k có ở site hiện tại thì sang site kia
				SELECT @NGAYTHIDOT1 = NGAYTHI FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1
			SELECT @NGAYTHIDOT1
			IF(@@ROWCOUNT=0) -- nếu đợt thi 1 vẫn k có ở site kia thì chứng tỏ mã môn mã lớp này chưa thi đợt 1
				RAISERROR ('Đợt thi này chưa đăng ký thi lần 1, không thể tạo lần thi thứ 2', 16, 2)
			SELECT @NGAYTHIDOT1
			IF NOT (@NGAYTHIDOT1=NULL) -- có ngày thi đợt 1, v đã đăng kí đợt 1 chưa đăng ký đợt 2
				SELECT @NGAYTHIDOT1
		END*/



GO
/****** Object:  StoredProcedure [dbo].[SP_KT_GIAOVIEN_DATONTAI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_GIAOVIEN_DATONTAI] 
	@MAGV char(8)
AS
	IF  exists(SELECT MAGV FROM  dbo.GIAOVIEN WHERE MAGV = @MAGV)
   		RAISERROR ('Mã giáo viên đã tồn tại, vui lòng nhập mã khác', 16, 1)

	--IF  exists(SELECT TENMH FROM  dbo.MONHOC WHERE TENMH = @TENMH)
	--	RAISERROR ('Tên môn học đã tồn tại, vui lòng nhập tên khác', 16, 2)



GO
/****** Object:  StoredProcedure [dbo].[SP_KT_KHOA_DATONTAI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_KHOA_DATONTAI] 
	@MAKH char(8),
	@TENKH nvarchar(50),
	@CHEDOCHECK nchar(10)
AS
	--EXEC SP_KT_KHOA_DATONTAI 'VT2', N'Công nghệ thông tin', 'KTRATHEM'
	IF(@CHEDOCHECK='KTRATHEM')
	-- nếu thêm thì mã khoa ph chưa tồn tại ở 2 site, cộng thêm tên khoa cũng k đc trùng
		BEGIN 
			IF (EXISTS(SELECT MAKH FROM KHOA WHERE MAKH=@MAKH) 
				OR EXISTS (SELECT MAKH FROM LINK1.TN_CSDLPT.dbo.KHOA WHERE MAKH=@MAKH))
				RAISERROR('Mã khoa đã tồn tại', 16, 1) 
			IF(EXISTS (SELECT MAKH FROM KHOA WHERE TENKH=@TENKH) 
				OR EXISTS (SELECT MAKH FROM LINK1.TN_CSDLPT.dbo.KHOA WHERE TENKH=@TENKH))
				RAISERROR('Tên khoa đã tồn tại', 16, 2)
		END
	ELSE --@CHEDOCHECK='KTRASUA'
	-- nếu sửa thì nếu mã giống tên giống thì hợp lệ (không sửa chính nó nhưng vẫn lưu)
	-- nếu có mã khoa khác trùng tên khoa thì không hợp lí, ta bắt lỗi này
		BEGIN
			IF(EXISTS (SELECT TENKH FROM KHOA WHERE MAKH<>@MAKH AND TENKH=@TENKH ) 
				OR EXISTS (SELECT TENKH FROM LINK1.TN_CSDLPT.dbo.KHOA WHERE MAKH<>@MAKH AND TENKH=@TENKH))
				RAISERROR('Tên khoa muốn sửa trùng với khoa khác', 16, 2)
		END


GO
/****** Object:  StoredProcedure [dbo].[SP_KT_LOP_DATONTAI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_LOP_DATONTAI] 
	@MALOP nchar(15),
	@TENLOP nvarchar(50),
	@MAKH nchar(8),
	@CHEDOCHECK nchar(10)
AS
	--EXEC SP_KT_LOP_DATONTAI 'TH06', N'TIN HOC 2006','CNTT', 'KTRATHEM'
	IF(@CHEDOCHECK='KTRATHEM')
	-- nếu thêm thì mã lớp ph chưa tồn tại ở 2 site, cộng thêm tên lớp cũng k đc trùng
		BEGIN 
			IF (EXISTS(SELECT MALOP FROM LINK2.TN_CSDLPT.dbo.LOP WHERE MALOP=@MALOP))
				RAISERROR('Mã lớp đã tồn tại', 16, 1) 
			IF(EXISTS (SELECT MALOP FROM LINK2.TN_CSDLPT.dbo.LOP WHERE TENLOP=@TENLOP))
				RAISERROR('Tên lớp đã tồn tại', 16, 2)
		END
	ELSE --@CHEDOCHECK='KTRASUA'
	-- nếu sửa thì nếu mã giống tên giống thì hợp lệ (không sửa chính nó nhưng vẫn lưu)
	-- nếu có mã khác trùng tên thì không hợp lí, ta bắt lỗi này
		BEGIN
			IF(EXISTS (SELECT MALOP FROM LINK2.TN_CSDLPT.dbo.LOP WHERE MALOP<>@MALOP AND TENLOP=@TENLOP))
				RAISERROR('Tên lớp muốn sửa đã tồn tại', 16, 2)
		END


GO
/****** Object:  StoredProcedure [dbo].[SP_KT_MONHOC_DATONTAI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_MONHOC_DATONTAI] 
	@MAMH nchar(5),
	@TENMH nvarchar(50),
	@CHEDOCHECK nchar(10)
AS

	IF(@CHEDOCHECK='KTRATHEM')
	-- nếu thêm thì mã môn ph chưa tồn tại cộng thêm tên khoa cũng k đc trùng
		BEGIN 
			IF  exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @MAMH)
   				RAISERROR ('Mã môn học đã tồn tại, vui lòng nhập mã khác', 16, 1)
			IF  exists(SELECT TENMH FROM  dbo.MONHOC WHERE TENMH = @TENMH)
				RAISERROR ('Tên môn học đã tồn tại, vui lòng nhập tên khác', 16, 2)
		END
	ELSE --@CHEDOCHECK='KTRASUA'
	-- nếu thêm thì nếu mã giống tên giống thì hợp lệ (không sửa chính nó nhưng vẫn lưu)
	-- nếu có mã môn khác trùng tên môn thì không hợp lí, ta bắt lỗi này
		BEGIN
			IF  exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH <> @MAMH AND TENMH=@TENMH)
   				RAISERROR ('Tên môn muốn sửa đã tồn tại, vui lòng nhập tên khác', 16, 2)
		END

GO
/****** Object:  StoredProcedure [dbo].[SP_KT_SINHVIEN_DATHI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_SINHVIEN_DATHI] 
	@MASV char(8),
	@MAMH char(5),
	@LAN smallint
AS
	--check xem sinh viên đã thi môn này chưa
	IF (exists(SELECT MASV FROM  dbo.BANGDIEM WHERE MASV = @MASV AND MAMH=@MAMH AND LAN = @LAN) 
	OR exists(SELECT MASV FROM  LINK1.TN_CSDLPT.dbo.BANGDIEM WHERE MASV = @MASV AND MAMH = @MAMH AND LAN = @LAN))
		RAISERROR('Bạn đã thi môn này rồi', 16, 1)
	



GO
/****** Object:  StoredProcedure [dbo].[SP_KT_SINHVIEN_DATONTAI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_SINHVIEN_DATONTAI] 
	@MASV char(8)
	
AS
	--EXEC [SP_KT_SINHVIEN_DATONTAI] '002'
	
	-- nếu thêm thì mã sinh viên ph chưa tồn tại ở site tra cứu
			IF (EXISTS(SELECT MASV FROM LINK2.TN_CSDLPT.dbo.SINHVIEN WHERE MASV=@MASV))
				RAISERROR('Mã sinh viên đã tồn tại', 16, 1) 




GO
/****** Object:  StoredProcedure [dbo].[SP_KT_SUA_GIAOVIEN_DANGKY]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_SUA_GIAOVIEN_DANGKY] 
	@MALOP nchar(15),
	@MAMH char(5),
	@LAN smallint,
	@NGAYTHI datetime
AS
	--check xem đợt này thi chưa
		IF(@LAN=2)
			BEGIN
				--PRINT ('lan2')
					IF((exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1) 
				OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1))) 
						BEGIN
							--Print (N'Đợt thi này đã thi lần 1, tiến hành kiểm tra ngày thi đợt 2 > ngày đợt 1 + 7 ngày?')
							--lấy ngày thi đợt 1
							DECLARE @NGAYTHIDOT1 datetime
							SET @NGAYTHIDOT1=
							(SELECT NGAYTHI FROM dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1
									UNION SELECT NGAYTHI FROM LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 1)
		
							--PRINT ('Ngày thi đợt 1 :' + FORMAT (@NGAYTHIDOT1, 'dd/MM/yyyy'))

							DECLARE @MESSAGE nvarchar(100)
							SET @MESSAGE = CONCAT(N'Đợt 2 phải thi sau đợt 1: ', FORMAT (@NGAYTHIDOT1, 'dd/MM/yyyy') , N' ít nhất 1 tuần')
							-- kiểm tra ngày thi đợt 2 có > đợt 1 + 7 ngày
							IF(@NGAYTHI < DATEADD(DAY, 7, @NGAYTHIDOT1))-- nếu ngày thi đợt 2 không sau đợt 1 ít nhất 1 tuần
								BEGIN
									RAISERROR ( @MESSAGE , 16, 3)
								RETURN
								END
							--ELSE 
								--PRINT(N'Ngày thi đợt 2 hợp lệ')
							RETURN
						END
					ELSE
						RAISERROR ('Đợt thi này chưa thi lần 1, không thể đăng kí thi lần 2', 16, 2)
			END
	

GO
/****** Object:  StoredProcedure [dbo].[SP_KT_XOA_GIAOVIEN_DANGKY]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KT_XOA_GIAOVIEN_DANGKY] 
	@MALOP nchar(15),
	@MAMH char(5),
	@LAN smallint,
	@NGAYTHI datetime
AS
	--check xem đợt này thi chưa
		IF(@LAN=1)
			BEGIN
				--PRINT ('lan2')
					IF ((exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 2) 
				OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = 2))) 
						RAISERROR ('Đợt thi này đã đăng ký lần 2, không thể xóa lần 1 này	', 16, 2)
			END
	

GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_DS_GIAOVIEN]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LAY_DS_GIAOVIEN]
AS
--DECLARE @TENMH
	SELECT MAGV, HOTEN = CONCAT(TRIM(MAGV), ' - ',  CONCAT(TRIM(HO),' ',TRIM(TEN))) FROM GIAOVIEN



GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_DS_KHOA]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LAY_DS_KHOA] 
AS
--DECLARE @TENMH
	SELECT MAKH, TENKH = CONCAT(TRIM(MAKH), ' - ', TRIM(TENKH)) FROM KHOA



GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_DS_LOP]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LAY_DS_LOP] 
AS
--DECLARE @TENMH
	SELECT MALOP, TENLOP = CONCAT(TRIM(MALOP), ' - ', TRIM(TENLOP)) FROM LOP



GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_DS_MONHOC]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LAY_DS_MONHOC] 
AS
--DECLARE @TENMH
	SELECT MAMH, TENMH = CONCAT(TRIM(MAMH), ' - ', TRIM(TENMH)) FROM MONHOC



GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_STT_CAUHOI_TIEPTHEO]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[SP_LAY_STT_CAUHOI_TIEPTHEO]
AS
 SELECT MAX(CAUHOI)+1 AS NEXTID FROM BODE
 
  


GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_TT_GIANGVIEN_LOGIN]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[SP_LAY_TT_GIANGVIEN_LOGIN]
@TENLOGIN NVARCHAR (50)
AS
DECLARE @TENUSER NVARCHAR(50)
SELECT @TENUSER=NAME FROM sys.sysusers WHERE sid = SUSER_SID(@TENLOGIN)
 
 SELECT USERNAME = @TENUSER, 
  HOTEN = (SELECT HO+ ' '+ TEN FROM dbo.GIAOVIEN  WHERE MAGV = @TENUSER ),
   TENNHOM= NAME
   FROM sys.sysusers 
   WHERE 
   UID = (SELECT GROUPUID FROM SYS.SYSMEMBERS 
							WHERE MEMBERUID = (SELECT UID FROM sys.sysusers WHERE NAME=@TENUSER))

GO
/****** Object:  StoredProcedure [dbo].[SP_LAY_TT_SV]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LAY_TT_SV]
@MASV NCHAR (8),
@MATKHAU NCHAR(25)
AS
 SELECT @MASV AS MASV, 
  HOTEN = HO+ ' '+ TEN, LOP.MALOP, TENLOP  FROM dbo.SINHVIEN, LOP  WHERE MASV = @MASV AND MATKHAU=@MATKHAU AND LOP.MALOP = SINHVIEN.MALOP
GO
/****** Object:  StoredProcedure [dbo].[SP_LAYCAUHOI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[SP_LAYCAUHOI]
@maMonHoc NCHAR(5), @trinhDo NChar(1), @soCau int
AS
BEGIN
	DECLARE @trinhDo2 Nchar(1) = 'N'
	DECLARE @countQuestion int = 0
	DECLARE @countQuestionCungTrinhDo int = 0
	DECLARE @countQuestionTrinhDoDuoi int = 0

	set @countQuestionCungTrinhDo = (select count(*) from BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo))

	if (@trinhDo = 'A') 
		set @trinhDo2 = 'B'
	else if (@trinhDo = 'B')
		set @trinhDo2 = 'C' 
	
		set @countQuestionTrinhDoDuoi = (select count(*) from BODE where (MAMH = @maMonHoc and TRINHDO = @trinhDo2))
		set @countQuestion = @countQuestionCungTrinhDo+@countQuestionTrinhDoDuoi
		
		--set @countQuestion = @countQuestionCungTrinhDo

	if(@countQuestion <@soCau or @countQuestionCungTrinhDo<(@soCau*70/100))
		begin
			Select('Khong du cau hoi de thi') as 'ERROR'
			return -1
		end
	
	-- tạo bảng tạm chưa các câu hỏi tại tất cả các site theo input ban đầu
	create table AtSiteTable(
	CAUHOI int primary key,
	TRINHDO char(1),
	NOIDUNG ntext,
	A ntext,
	B ntext,
	C ntext,
	D ntext,
	DAP_AN nchar(1),
	)

	select * into CungTrinhDoAtSiteTable from BODE  where MAMH = @maMonHoc and TRINHDO = @trinhDo and MAGV in (Select MAGV from GIAOVIEN where MAKH in(select MAKH from KHOA))
	select * into TrinhDoDuoiAtSiteTable from BODE  where MAMH = @maMonHoc and TRINHDO = @trinhDo2 and MAGV in (Select MAGV from GIAOVIEN where MAKH in(select MAKH from KHOA))
	
	Insert into AtSiteTable
			select CAUHOI,TRINHDO,CAST(NOIDUNG as nvarchar(max)),CAST(A as nvarchar(max)),CAST(B as nvarchar(max)),CAST(C as nvarchar(max)),
			CAST(D as nvarchar(max)),DAP_AN from CungTrinhDoAtSiteTable
			UNION
			select CAUHOI,TRINHDO,CAST(NOIDUNG as nvarchar(max)),CAST(A as nvarchar(max)),CAST(B as nvarchar(max)),CAST(C as nvarchar(max)),
			CAST(D as nvarchar(max)),DAP_AN  from TrinhDoDuoiAtSiteTable 
	
	Declare @countCungTrinhDoAtSite int = (select count(*) from CungTrinhDoAtSiteTable)
	Declare @countTrinhDoDuoiAtSite int = (select count(*) from TrinhDoDuoiAtSiteTable)
	if((@countCungTrinhDoAtSite+@countTrinhDoDuoiAtSite) < @soCau OR @countCungTrinhDoAtSite < (@soCau*70/100))
		begin
			print 'here'
			select * into CungTrinhDoOtherSiteTable from BODE  where MAMH = @maMonHoc and TRINHDO = @trinhDo and MAGV in (Select MAGV from GIAOVIEN where MAKH not in(select MAKH from KHOA))
			select * into TrinhDoDuoiOtherSiteTable from BODE  where MAMH = @maMonHoc and TRINHDO = @trinhDo2 and MAGV in (Select MAGV from GIAOVIEN where MAKH not in(select MAKH from KHOA))

			Insert into AtSiteTable
			select CAUHOI,TRINHDO,CAST(NOIDUNG as nvarchar(max)),CAST(A as nvarchar(max)),CAST(B as nvarchar(max)),CAST(C as nvarchar(max)),
			CAST(D as nvarchar(max)),DAP_AN from CungTrinhDoOtherSiteTable
			UNION
			select CAUHOI,TRINHDO,CAST(NOIDUNG as nvarchar(max)),CAST(A as nvarchar(max)),CAST(B as nvarchar(max)),CAST(C as nvarchar(max)),
			CAST(D as nvarchar(max)),DAP_AN  from TrinhDoDuoiOtherSiteTable 
			drop table CungTrinhDoOtherSiteTable
			drop table TrinhDoDuoiOtherSiteTable
		end
	Declare @slCanLayCungTrinhDo int,@slCanLayTrinhDoDuoi int
		set @slCanLayCungTrinhDo = @soCau*70/100
		if ((@slCanLayCungTrinhDo + @countQuestionTrinhDoDuoi)<@soCau)
			set @slCanLayCungTrinhDo = @slCanLayCungTrinhDo + (@soCau - (@slCanLayCungTrinhDo+@countQuestionTrinhDoDuoi))
			set @slCanLayTrinhDoDuoi = @soCau - @slCanLayCungTrinhDo
		
	select top (@slCanLayCungTrinhDo) * into temp1 from AtSiteTable where TRINHDO = @trinhDo
	ORDER BY NEWID()
	
	select top (@slCanLayTrinhDoDuoi) * into temp2 from AtSiteTable where TRINHDO = @trinhDo2
	ORDER BY NEWID()

	select CAUHOI,CAST(NOIDUNG as nvarchar(max)) as [NOIDUNG],CAST(A as nvarchar(max)) as [A],CAST(B as nvarchar(max)) as [B],CAST(C as nvarchar(max)) as [C],
	CAST(D as nvarchar(max)) as [D],DAP_AN  from temp1
	UNION
	select CAUHOI,CAST(NOIDUNG as nvarchar(max)) as [NOIDUNG],CAST(A as nvarchar(max)) as [A],CAST(B as nvarchar(max)) as [B],CAST(C as nvarchar(max)) as [C],
	CAST(D as nvarchar(max)) as [D],DAP_AN  from temp2

	drop table AtSiteTable
	drop table CungTrinhDoAtSiteTable
	drop table TrinhDoDuoiAtSiteTable
	drop table temp1
	drop table temp2
	--
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_REPORT_KETQUATHI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REPORT_KETQUATHI] @MASV char(8),
	@MAMH char(5),
	@LAN smallint
AS
BEGIN
	SELECT * FROM 
	(SELECT CAUHOI, NOIDUNG, DAP_AN, LUACHON = concat(concat('A. ' , A),';',concat('B. ' , B),';',concat('C. ' , C),';',concat('D. ' , D)) FROM BODE) AS BODE
	INNER JOIN CT_BAITHI ON CT_BAITHI.CAUHOI = BODE.CAUHOI WHERE MASV=@MASV AND CT_BAITHI.MAMH=@MAMH AND LAN=@LAN
	ORDER BY CAUSO
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_CAUHOI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SUA_CAUHOI]
	@idCauHoi int,
	@MAMH char(5),
	@TRINHDO char(1),
	@NOIDUNG ntext,
	@A ntext,
	@B ntext,
	@C ntext,
	@D ntext,
	@DAP_AN char(1),
	@MAGV char(8)
AS
	--IF  exists(SELECT CAUHOI FROM  dbo.BODE WHERE CAUHOI = @idCauHoi)
   	--	RAISERROR ('Mã câu hỏi đã tồn tại', 16, 1)
		-- có nên check thêm điều kiện cùng nội dung cùng mã môn mới là trùng câu?
	--ELSE 
	-- khi sửa thì xem có câu hỏi nào khác id trùng nội dung k
	IF  exists(SELECT NOIDUNG FROM  dbo.BODE WHERE 
	cast(NOIDUNG as nvarchar(max)) = cast(@NOIDUNG as nvarchar(max)) AND CAUHOI<>@idCauHoi) 
   		RAISERROR ('Câu hỏi đã tồn tại', 16, 1)
	 
		UPDATE dbo.BODE SET MAMH=@MAMH, TRINHDO=@TRINHDO, NOIDUNG=@NOIDUNG
		, A=@A, B=@B, C=@C, D=@D, DAP_AN=@DAP_AN, MAGV=@MAGV WHERE CAUHOI=@idCauHoi
	SELECT @idCauHoi AFFECTED_ID	-- lấy id vừa suwar 
 
 
  


GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_GIAOVIEN]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_GIAOVIEN]
  @MAGV nchar(5),
  @HO nvarchar(50),
  @TEN nvarchar(10),
  @DIACHI nvarchar(50),
  @MAKH nchar(8)
AS
	--IF  exists(SELECT MAGV FROM  dbo.GIAOVIEN WHERE MAGV = @MAGV)
   	--	RAISERROR ('Mã giáo viên đã tồn tại, vui lòng nhập mã khác', 16, 1)
	--ELSE 
	--vì giáo viên nhân bản, khoa lại không, nên khi sửa giáo viên ở site khác, ở phía code ta k cho chỉnh
	-- sửa mã khoa, bên sp ta không chekc khóa ngoại lúc sửa, lúc sửa xong lại check
	ALTER TABLE dbo.GIAOVIEN  
	NOCHECK CONSTRAINT FK_GIAOVIEN_KHOA; 

		UPDATE dbo.GIAOVIEN SET MAGV=@MAGV, HO=@HO, TEN=@TEN, DIACHI=@DIACHI , MAKH=@MAKH WHERE MAGV=@MAGV
	SELECT @MAGV AFFECTED_ID	-- lấy id vừa sửa 

	ALTER TABLE dbo.GIAOVIEN 
	CHECK CONSTRAINT FK_GIAOVIEN_KHOA; 
	



GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_GIAOVIEN_DANGKY]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_GIAOVIEN_DANGKY]
	@MAGV char(8),
	@MAMH char(5),
	@MALOP nchar(15),
	@TRINHDO char(1),
	@NGAYTHI datetime,
	@LAN smallint,
	@SOCAUTHI smallint,
	@THOIGIAN smallint
AS
--undo xóa
		
	--IF  (exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN) 
	--OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN)) 
   	--	RAISERROR ('Đợt thi này đã tồn tại, không thể phục hồi', 16, 1)
	--ELSE
	--BEGIN
		UPDATE dbo.GIAOVIEN_DANGKY SET MAGV=@MAGV, TRINHDO=@TRINHDO, NGAYTHI=@NGAYTHI, SOCAUTHI=@SOCAUTHI, THOIGIAN=@THOIGIAN 
			WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN
		SELECT @MALOP AFFECTED_ID	-- lấy id vừa sửa
			,@MAMH AFFECTED_MAMH, @MALOP AFFECTED_MALOP, @LAN AFFECTED_LAN
	--END
	
	



GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_GIAOVIEN_IGNORE_FK]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_GIAOVIEN_IGNORE_FK]
  @MAGV nchar(5),
  @HO nvarchar(50),
  @TEN nvarchar(10),
  @DIACHI nvarchar(50),
  @MAKH nchar(8)
AS
	-- phải ignore khóa ngoại vì khoa không nhân bản
	--IF  exists(SELECT MAGV FROM  dbo.GIAOVIEN WHERE MAGV = @MAGV)
   	--	RAISERROR ('Mã giáo viên đã tồn tại, vui lòng nhập mã khác', 16, 1)
	--ELSE 
	ALTER TABLE dbo.GIAOVIEN  
	NOCHECK CONSTRAINT FK_GIAOVIEN_KHOA; 

		UPDATE dbo.GIAOVIEN SET HO=@HO, TEN=@TEN, DIACHI=@DIACHI , MAKH=@MAKH WHERE MAGV=@MAGV
	SELECT @MAGV AFFECTED_ID	-- lấy id vừa sửa 

	ALTER TABLE dbo.GIAOVIEN 
	CHECK CONSTRAINT FK_GIAOVIEN_KHOA; 
	



GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_KHOA]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_KHOA]
  @MAKH char(8),
  @TENKH nvarchar(50)
  --,
  --@MACS nchar(3) không cần mã cơ sở vì bên code cũng k cho sửa mã cơ sở mà
AS
	--IF  exists(SELECT @MAKH FROM  dbo.KHOA WHERE MAKH = @MAKH)
   	--	RAISERROR ('Mã khoa đã tồn tại, không thể phục hồi', 16, 1)
	--ELSE 
		UPDATE dbo.KHOA SET TENKH=@TENKH WHERE MAKH=@MAKH
	SELECT @MAKH AFFECTED_ID	-- lấy id vừa sửa 
	



GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_LOP]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_LOP]
	@MALOP nchar(15),
	@TENLOP nvarchar(50),
	@MAKH nchar(8)
  --,
  --@MACS nchar(3) không cần mã cơ sở vì bên code cũng k cho sửa mã cơ sở mà
AS
	--IF  exists(SELECT @MAKH FROM  dbo.KHOA WHERE MAKH = @MAKH)
   	--	RAISERROR ('Mã khoa đã tồn tại, không thể phục hồi', 16, 1)
	--ELSE 
		UPDATE dbo.LOP SET TENLOP=@TENLOP, MAKH=@MAKH WHERE MALOP=@MALOP
	SELECT @MALOP AFFECTED_ID	-- lấy id vừa sửa
	



GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_MONHOC]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_MONHOC]
  @MAMH nchar(5),
  @TENMH nvarchar(50)
AS
	--IF  exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @MAMH)
   	--	RAISERROR ('Mã môn học đã tồn tại, vui lòng nhập mã khác', 16, 1)
	--ELSE 
		UPDATE dbo.MONHOC  SET TENMH = @TENMH WHERE MAMH=@MAMH
		SELECT @MAMH AFFECTED_ID



GO
/****** Object:  StoredProcedure [dbo].[SP_SUA_SINHVIEN]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SUA_SINHVIEN]
	@MASV char(8),
	@HO nvarchar(50),
	@TEN nvarchar(10),
	@NGAYSINH date,
	@DIACHI nvarchar(100),
	@MATKHAU char(25),
	@MALOP nchar(15)
AS

		UPDATE dbo.SINHVIEN SET HO=@HO, TEN=@TEN, NGAYSINH=@NGAYSINH, DIACHI=@DIACHI, MATKHAU=@MATKHAU, MALOP = @MALOP WHERE MASV = @MASV
		SELECT @MASV AFFECTED_ID	-- lấy id vừa sửa 
	



GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_CAUHOI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_CAUHOI]
	@idCauHoi int,
	@MAMH char(5),
	@TRINHDO char(1),
	@NOIDUNG ntext,
	@A ntext,
	@B ntext,
	@C ntext,
	@D ntext,
	@DAP_AN char(1),
	@MAGV char(8)
AS
	IF  exists(SELECT CAUHOI FROM  dbo.BODE WHERE CAUHOI = @idCauHoi)
   		RAISERROR ('Mã câu hỏi đã tồn tại', 16, 1)
		-- có nên check thêm điều kiện cùng nội dung cùng mã môn mới là trùng câu?
	ELSE IF  exists(SELECT NOIDUNG FROM  dbo.BODE WHERE cast(NOIDUNG as nvarchar(max)) = cast(@NOIDUNG as nvarchar(max))) 
   		RAISERROR ('Câu hỏi đã tồn tại', 16, 2)
	ELSE 
		INSERT INTO dbo.BODE (CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV) 
						VALUES(@idCauHoi, @MAMH, @TRINHDO, @NOIDUNG, @A, @B, @C, @D, @DAP_AN, @MAGV)
	SELECT @idCauHoi AFFECTED_ID	-- lấy id vừa thêm 
 
 
  


GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_GIAOVIEN]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_GIAOVIEN]
  @MAGV nchar(5),
  @HO nvarchar(50),
  @TEN nvarchar(10),
  @DIACHI nvarchar(50),
  @MAKH nchar(8)
AS
	IF  exists(SELECT MAGV FROM  dbo.GIAOVIEN WHERE MAGV = @MAGV)
   		RAISERROR ('Mã giáo viên đã tồn tại, vui lòng nhập mã khác', 16, 1)
	ELSE 
		INSERT INTO dbo.GIAOVIEN (MAGV, HO, TEN, DIACHI, MAKH) VALUES(@MAGV, @HO, @TEN, @DIACHI, @MAKH)
	SELECT @MAGV AFFECTED_ID	-- lấy id vừa thêm 
	



GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_GIAOVIEN_DANGKY]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_GIAOVIEN_DANGKY]
	@MAGV char(8),
	@MAMH char(5),
	@MALOP nchar(15),
	@TRINHDO char(1),
	@NGAYTHI datetime,
	@LAN smallint,
	@SOCAUTHI smallint,
	@THOIGIAN smallint
AS
--undo xóa
		
	IF  (exists(SELECT LAN FROM  dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN) 
	OR exists(SELECT LAN FROM  LINK1.TN_CSDLPT.dbo.GIAOVIEN_DANGKY WHERE MALOP = @MALOP AND MAMH=@MAMH AND LAN = @LAN)) 
   		RAISERROR ('Đợt thi này đã tồn tại, không thể phục hồi', 16, 1)
	ELSE
	BEGIN
		INSERT INTO dbo.GIAOVIEN_DANGKY (MAGV, MAMH, MALOP, TRINHDO, NGAYTHI, LAN, SOCAUTHI, THOIGIAN) VALUES(@MAGV, @MAMH, @MALOP, @TRINHDO, @NGAYTHI, @LAN, @SOCAUTHI, @THOIGIAN)
		SELECT @MALOP AFFECTED_ID	-- lấy id vừa thêm 
			,@MAMH AFFECTED_MAMH, @MALOP AFFECTED_MALOP, @LAN AFFECTED_LAN
	END
	
	



GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_KHOA]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_KHOA]
  @MAKH char(8),
  @TENKH nvarchar(50),
  @MACS nchar(3)
AS
	IF  exists(SELECT MAKH FROM  dbo.KHOA WHERE MAKH = @MAKH)
   		RAISERROR ('Mã khoa đã tồn tại, không thể phục hồi', 16, 1)
	ELSE 
		INSERT INTO dbo.KHOA (MAKH, TENKH, MACS) VALUES(@MAKH, @TENKH, @MACS)
	SELECT @MAKH AFFECTED_ID	-- lấy id vừa thêm 
	



GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_LOP]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_LOP]
	@MALOP nchar(15),
	@TENLOP nvarchar(50),
	@MAKH nchar(8)
AS
	IF  exists(SELECT MALOP FROM  dbo.LOP WHERE MALOP = @MALOP)
   		RAISERROR ('Mã lớp đã tồn tại, không thể phục hồi', 16, 1)
	ELSE 
		INSERT INTO dbo.LOP (MALOP, TENLOP, MAKH) VALUES(@MALOP, @TENLOP, @MAKH)
	SELECT @MALOP AFFECTED_ID	-- lấy id vừa thêm 
	



GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_MONHOC]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_MONHOC]
  @MAMH nchar(5),
  @TENMH nvarchar(50)
AS
	IF  exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @MAMH)
   		RAISERROR ('Mã môn học đã tồn tại, vui lòng nhập mã khác', 16, 1)
	ELSE 
		INSERT INTO dbo.MONHOC (MAMH, TENMH) VALUES(@MAMH, @TENMH)
	SELECT @MAMH AFFECTED_ID	-- lấy id vừa thêm 
	



GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_SINHVIEN]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEM_SINHVIEN]
	@MASV char(8),
	@HO nvarchar(50),
	@TEN nvarchar(10),
	@NGAYSINH date,
	@DIACHI nvarchar(100),
	@MATKHAU nchar(25),
	@MALOP nchar(15)
AS
	IF (EXISTS(SELECT MASV FROM SINHVIEN WHERE MASV=@MASV) 
				OR EXISTS (SELECT MASV FROM LINK1.TN_CSDLPT.dbo.SINHVIEN WHERE MASV=@MASV))
		RAISERROR('Mã sinh viên đã tồn tại, không thể phục hồi',16,1)
	ELSE 
		INSERT INTO dbo.SINHVIEN (MASV, HO, TEN, NGAYSINH, DIACHI, MATKHAU, MALOP) VALUES(@MASV, @HO, @TEN,@NGAYSINH,@DIACHI,@MATKHAU,@MALOP)
		SELECT @MASV AFFECTED_ID	-- lấy id vừa thêm 
	



GO
/****** Object:  StoredProcedure [dbo].[SP_TIM_MONTHI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TIM_MONTHI] 
	@MAMH char(5),
	@NGAYTHI datetime,
	@LAN smallint
AS
	SELECT @MAMH AS MAH, @NGAYTHI AS NGAYTHI, @LAN AS LAN, SOCAUTHI, TRINHDO, THOIGIAN
		FROM GIAOVIEN_DANGKY WHERE MAMH = @MAMH AND DATEDIFF(day, NGAYTHI, @NGAYTHI)=0 AND LAN = @LAN
	 


GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_CAUHOI]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_CAUHOI]
  @idCauHoi int
AS
		DELETE FROM dbo.BODE WHERE CAUHOI=@idCauHoi
	



GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_GIAOVIEN]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_GIAOVIEN]
  @MAGV char(8)
AS
		DELETE FROM dbo.GIAOVIEN WHERE MAGV=@MAGV
	



GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_GIAOVIEN_DANGKY]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_GIAOVIEN_DANGKY]
  @MAMH char(5),
  @MALOP nchar(15),
  @LAN smallint
AS
--undo thêm
		DELETE FROM GIAOVIEN_DANGKY WHERE MAMH = @MAMH AND MALOP = @MALOP AND LAN = @LAN
	
	



GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_KHOA]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_KHOA]
  @MAKH char(8)
AS
	--IF  exists(SELECT @MAKH FROM  dbo.KHOA WHERE MAKH = @MAKH)
   	--	RAISERROR ('Mã khoa đã tồn tại, không thể phục hồi', 16, 1)
	--ELSE 
		DELETE FROM KHOA WHERE MAKH=@MAKH
	
	



GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_LOP]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_LOP]
  @MALOP nchar(15)
AS
--undo thêm
		DELETE FROM LOP WHERE MALOP=@MALOP
	
	



GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_MONHOC]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_MONHOC]
  @MAMH nchar(5)
AS
	--IF  exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @MAMH)
   	--	RAISERROR ('Mã môn học đã tồn tại, vui lòng nhập mã khác', 16, 1)
	--ELSE 
		DELETE FROM dbo.MONHOC WHERE MAMH=@MAMH
	



GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_SINHVIEN]    Script Date: 08/04/2022 5:58:37 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_XOA_SINHVIEN]
  @MASV char(8)
AS
--undo thêm
		DELETE FROM SINHVIEN WHERE MASV=@MASV
	
	



GO
