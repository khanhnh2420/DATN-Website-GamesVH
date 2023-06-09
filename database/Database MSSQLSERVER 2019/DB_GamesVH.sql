IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DB_GamesVH')
BEGIN
   CREATE DATABASE DB_GamesVH;
END;
go
USE [DB_GamesVH]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Poster] [nvarchar](50) NULL,
	[Thumbnail] [nvarchar](255) NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[Supplier] [nvarchar](255) NOT NULL,
	[Qty] [int] NOT NULL,
	[Details] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](60) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogTittle] [nvarchar](255) NOT NULL,
	[BlogBody] [nvarchar](max) NULL,
	[Username] [nvarchar](50) NOT NULL,
	[HinhAnh] [varchar](50) NULL,
	[ThoiGianBlog] [date] NULL,
 CONSTRAINT [PK_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdBlog] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[NoiDungCmt] [nvarchar](255) NULL,
	[ThoiGianCmt] [datetime] NULL,
 CONSTRAINT [PK_Commentss] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon_owners]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon_owners](
	[Id] [bigint] NOT NULL,
	[Customer_id] [nvarchar](50) NULL,
	[Coupon_code] [varchar](10) NOT NULL,
	[isUsed] [bit] NOT NULL,
 CONSTRAINT [PK_Coupon_owners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[Code] [varchar](10) NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Amount] [int] NOT NULL,
	[Value] [float] NOT NULL,
	[Exp_date] [nchar](10) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Coupons] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[AccessoryId] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Status] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Poster] [nvarchar](50) NOT NULL,
	[Thumbnail] [nvarchar](255) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[Source] [varchar](255) NOT NULL,
	[Link] [varchar](500) NOT NULL,
	[Details] [nvarchar](500) NOT NULL,
	[CategoryId] [char](4) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/9/2023 2:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'cust', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Người dùng', N'cust@gmail.com', N'12 Nguyễn Du, Quận 1, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'dangkimchi', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Đặng Kim Chi', N'dangkimchi@gmail.com', N'45 Nguyễn Thị Minh Khai, Quận 1, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'dire', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Quản Lý', N'dire@gmail.com', N'12 Nguyễn Du, Quận 1, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'hoangtunglam', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Hoàng Tùng Lâm', N'hoangtunglam@gmail.com', N'12 Nguyễn Du, Quận 1, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'lethithuy', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Lê Thị Thúy', N'lethithuy@gmail.com', N'12 Nguyễn Du, Quận 1, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'lethuhien', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Lê Thùy Hiền', N'lethuhien@gmail.com', N'22 Bà Huyện Thanh Quan, Quận 1, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'nguyenvana', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Nguyễn Văn A', N'nguyenvana@gmail.com', N'12 Nguyễn Du, Quận 1, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'nguyenvanbao', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Nguyễn Văn Bảo', N'nguyenvanbao@gmail.com', N'102 Lý Tự Trọng, Quận 1, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'nguyenhongnhan', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Nguyễn Hồng Nhân', N'nguyenhongnhan@gmail.com', N'12 Nguyễn Du, Quận 1, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'phamthuc', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Phạm Thục', N'phamthuc@gmail.com', N'78 Cách Mạng Tháng 8, Quận 3, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'staf', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Nhân Viên', N'staf@gmail.com', N'12 Nguyễn Du, Quận 1, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'tranthanhthao', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Trần Thanh Thảo', N'tranthanhthao@gmail.com', N'78 Cách Mạng Tháng 8, Quận 3, TP. HCM', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Address], [Photo]) VALUES (N'tranvanb', N'$2a$10$REel/nhIn4pF8JssL84rcu1m82mRO71eIwPcGA7GX17OAHuRfdsRq', N'Trần Văn B', N'tranvanb@gmail.com', N'99 Lê Lợi, Quận 5, TP. HCM', N'user.png')
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (1, N'nguyenvana', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2, N'tranvanb', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (3, N'phamthuc', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (4, N'lethuhien', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (5, N'dangkimchi', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (6, N'nguyenhongnhan', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7, N'lethithuy', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (8, N'tranthanhthao', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (9, N'nguyenvanbao', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (10, N'hoangtunglam', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (11, N'dire', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (12, N'cust', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (13, N'staf', N'STAF')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [BlogTittle], [BlogBody], [Username], [HinhAnh], [ThoiGianBlog]) VALUES (4, N'FIFA 22 Bản update mới ', N'Trên phiên bản PS5 mà người viết trải nghiệm, FIFA 22 bất ngờ khởi đầu với một đoạn phim ngắn (intro cinematic) kèm theo hướng dẫn cho người chơi tự điều khiển rất thú vị.  

Bạn sẽ bắt gặp nhiều huyền thoại như David Beckham hay Thierry Henry trong đoạn phim này. Ngoài thông điệp thể hiện ngôi sao Mbappe cùng câu lạc bộ PSG sẽ là những gương mặt đại diện mới, EA cũng gửi gắm ý đồ hướng người chơi tham gia vào các chế độ khác nhiều hơn qua việc khởi tạo một cầu thủ “Avatar cá nhân” ngay trước khi bắt đầu game.

Thật vậy, bạn sẽ dễ dàng nạp Avatar này vào các chế độ quen thuộc như Volta, Pro Clubs hay Career Player vốn đã được làm mới hệ thống thăng cấp và điểm kinh nghiệm cho nhân vật gần giống như là một tựa game nhập vai thuần túy. 

', N'lethithuy', N'FF22.png', CAST(N'2022-01-27' AS Date))
INSERT [dbo].[Blogs] ([Id], [BlogTittle], [BlogBody], [Username], [HinhAnh], [ThoiGianBlog]) VALUES (7, N'Minecraft Nâng cấp bản đồ', N'ản dựng Preview của Minecraft trước đó có sẵn cho người dùng Xbox Insiders đã vô tình tích hợp cả mã nguyên mẫu có hỗ trợ raytracing trên bảng điều khiển Xbox. Mã nguyên mẫu ban đầu này đã bị xóa khỏi phiên bản Preview và không có dấu hiệu cho kế hoạch hỗ trợ raytracing cho máy chơi game Xbox trong tương lai gần.”, theo bài viết trên Twitter của Minecraft.

Vào đầu tuần này, một biên tập viên của The Verge đã đăng tải một bài viết nói rằng phiên bản Preview mới nhất của Minecraft đã bổ sung các tùy chọn raytracing.', N'lethithuy', N'MC.jpg', CAST(N'2023-01-27' AS Date))
INSERT [dbo].[Blogs] ([Id], [BlogTittle], [BlogBody], [Username], [HinhAnh], [ThoiGianBlog]) VALUES (8, N'Genshin Impact: Xuất hiện HERO mới', N'Dù là một tựa game vô cùng nổi tiếng với quy mô toàn thế giới nhưng phong cách quảng cáo của miHoYo dành cho tựa game này là không hề giống ai cả
Đối với nhiều game thủ thì nguyên do khiến cho họ biết đến Genshin Impact là do danh tiếng quá lớn và sức ảnh hưởng của tựa game này đến cộng đồng game thủ toàn thế giới. Tuy nhiên liệu bạn có biết được rằng cũng có nhiều game thủ đến với trò chơi này thông qua những quảng cáo "chẳng giống ai" được chính miHoYo đăng tải lên Youtube hay không?', N'lethithuy', N'GI.jpg', CAST(N'2022-01-27' AS Date))
INSERT [dbo].[Blogs] ([Id], [BlogTittle], [BlogBody], [Username], [HinhAnh], [ThoiGianBlog]) VALUES (9, N'Dota 2 Nâng cấp giao diện', N'Bản cập nhật hôm nay thổi một làn gió mùa mới cho Dota Plus và nhân cơ hội hé lộ nhiều hơn nữa. Tìm hiểu chi tiết về phong độ bản thân trong tất cả trận đấu thuộc mùa giải trước cùng Báo cáo trận đấu, khám phá hàng loạt chế độ chơi khác nhau với Tiêu điểm cuối tuần, và khoe vật phẩm Immortal theo cách riêng với nhiều hiệu ứng phép được mở khóa. Kho báu mới, những tính năng mới lẫn cải tiến, và hơn thế — tất cả quy tụ trong bản cập nhật lối chơi 7.31d, chào mừng sự góp mặt của Marci trong Captains Mode', N'lethithuy', N'DOTA.jpg', CAST(N'2023-01-27' AS Date))
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'CT  ', N'Chiến Thuật')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'FPS ', N'FPS')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'HD  ', N'Hành Động')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'KD  ', N'Kinh Dị')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'LT  ', N'Lập Trình')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'MMO ', N'MMO')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'MOBA', N'Moba')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'MP  ', N'Mô Phỏng')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'NV  ', N'Nhập Vai')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'PL  ', N'Phiêu Lưu')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'TT  ', N'Thể Thao')
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [IdBlog], [Username], [NoiDungCmt], [ThoiGianCmt]) VALUES (1, 4, N'phamthuc', N'Game tốt ', CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([Id], [IdBlog], [Username], [NoiDungCmt], [ThoiGianCmt]) VALUES (2, 4, N'nguyenvanbao', N'Giật lagggg game tệ', CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([Id], [IdBlog], [Username], [NoiDungCmt], [ThoiGianCmt]) VALUES (3, 4, N'dangkimchi', N'bản cập nhật tốt ', CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([Id], [IdBlog], [Username], [NoiDungCmt], [ThoiGianCmt]) VALUES (4, 4, N'hoangtunglam', N'Sân cỏ xấu quá , lỗi chuyển động không mượt', CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([Id], [IdBlog], [Username], [NoiDungCmt], [ThoiGianCmt]) VALUES (7, 4, N'hoangtunglam', N'Năm nay không biết nó fix cái dynamic potential nửa vời của career mode và phòng thủ siêu ngu chưa', CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([Id], [IdBlog], [Username], [NoiDungCmt], [ThoiGianCmt]) VALUES (9, 4, N'nguyenhongnhan', N'Mình thì chẳng cần gì mới nhiều cả, chỉ cần trong cái manager career nó fix lại cái dynamic potential, để tránh việc mấy cầu thủ trẻ đôn lên đội 1 cuối mùa này thì mùa sau chưa gì đã rớt 5-7 điểm POT vô lí.', CAST(N'2023-02-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (1, 11, 1, 200000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (2, 11, 2, 250000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (3, 11, 3, 180000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (4, 12, 4, 300000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (5, 12, 5, 350000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (6, 13, 6, 120000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (7, 13, 7, 150000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (8, 14, 8, 450000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (9, 15, 9, 280000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (10, 16, 10, 220000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (11, 1, 1, 200000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (12, 2, 2, 250000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (13, 3, 3, 180000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (14, 4, 4, 300000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (15, 5, 5, 350000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (16, 6, 6, 120000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (17, 7, 7, 150000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (18, 8, 8, 450000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (19, 9, 9, 280000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (20, 10, 10, 220000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (21, 17, 8, 450000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (22, 18, 9, 280000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (23, 19, 10, 220000, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [AccessoryId]) VALUES (24, 20, 10, 220000, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (1, N'nguyenvana', CAST(N'2022-02-01' AS Date), N'12 Nguyễn Du, Quận 1, TP. HCM', N'nguyenvana@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (2, N'tranvanb', CAST(N'2022-02-03' AS Date), N'99 Lê Lợi, Quận 5, TP. HCM', N'tranvanb@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (3, N'phamthuc', CAST(N'2022-02-04' AS Date), N'78 Cách Mạng Tháng 8, Quận 3, TP. HCM', N'phamthuc@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (4, N'lethuhien', CAST(N'2022-02-05' AS Date), N'22 Bà Huyện Thanh Quan, Quận 1, TP. HCM', N'lethuhien@gmail.com', N'0123456789', N'Chờ xử lý')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (5, N'dangkimchi', CAST(N'2022-02-06' AS Date), N'45 Nguyễn Thị Minh Khai, Quận 1, TP. HCM', N'dangkimchi@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (6, N'nguyenvanbao', CAST(N'2022-02-08' AS Date), N'31 Lê Duẩn, Quận 1, TP. HCM', N'nguyenvanbao@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (7, N'nguyenvana', CAST(N'2022-02-10' AS Date), N'72 Trần Hưng Đạo, Quận 1, TP. HCM', N'nguyenvana@gmail.com', N'0123456789', N'Chờ xử lý')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (8, N'nguyenvana', CAST(N'2022-02-12' AS Date), N'14 Tôn Thất Đạm, Quận 1, TP. HCM', N'nguyenvana@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (9, N'nguyenvanbao', CAST(N'2022-02-13' AS Date), N'102 Lý Tự Trọng, Quận 1, TP. HCM', N'nguyenvanbao@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (10, N'lethuhien', CAST(N'2022-02-15' AS Date), N'63 Phan Đình Phùng, Quận Phú Nhuận, TP. HCM', N'lethuhien@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (11, N'phamthuc', CAST(N'2022-02-17' AS Date), N'8 Nguyễn Trãi, Quận 5, TP. HCM', N'phamthuc@gmail.com', N'0123456789', N'Chờ xử lý')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (12, N'lethuhien', CAST(N'2022-02-18' AS Date), N'59 Cao Thắng, Quận 10, TP. HCM', N'lethuhien@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (13, N'tranvanb', CAST(N'2022-02-19' AS Date), N'22 Nguyễn Công Trứ, Quận 1, TP. HCM', N'tranvanb@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (14, N'phamthuc', CAST(N'2022-02-21' AS Date), N'17 Trần Nhật Duật, Quận 1, TP. HCM', N'phamthuc@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (15, N'phamthuc', CAST(N'2022-02-23' AS Date), N'3 Điện Biên Phủ, Quận 1, TP. HCM', N'phamthuc@gmail.com', N'0123456789', N'Chờ xử lý')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (16, N'dangkimchi', CAST(N'2022-02-25' AS Date), N'61 Nguyễn Cư Trinh, Quận 1, TP. HCM', N'dangkimchi@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (17, N'nguyenvana', CAST(N'2022-02-27' AS Date), N'22 Tôn Thất Tùng, Quận 1, TP. HCM', N'nguyenvana@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (18, N'dangkimchi', CAST(N'2022-02-28' AS Date), N'99 Trần Quang Khải, Quận 1, TP. HCM', N'dangkimchi@gmail.com', N'0123456789', N'Chờ xử lý')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (19, N'lethuhien', CAST(N'2022-03-01' AS Date), N'48 Nguyễn Thị Minh Khai, Quận 1, TP. HCM', N'lethuhien@gmail.com', N'0123456789', N'Đã hoàn thành')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Email], [Phone], [Status]) VALUES (20, N'lethuhien', CAST(N'2022-03-02' AS Date), N'92 Đinh Tiên Hoàng, Quận 1, TP. HCM', N'lethuhien@gmail.com', N'0123456789', N'Đã hoàn thành')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (1, N'Assassin Creed Valhalla', N'Valhalla.jpg', N'Valhalla-thumb.jpg-*-Valhalla-thumb2.jpg-*-Valhalla-thumb3.jpg', 200000, CAST(N'2021-01-10' AS Date), 1, N'Ubisoft', N'https://uploadhaven.com/download/21e3c5f14bc4f127992c6cc914ba6756', N'Assassin Creed Valhalla là phiên bản mới nhất của dòng game hành động nhập vai lịch sử nổi tiếng Assassin Creed. Trong game, người chơi sẽ hóa thân thành Eivor, một vị vua hoặc nữ hoàng của người Viking, và tham gia vào cuộc chiến giữa người Viking và quân đội của người Anh vào thế kỷ thứ 9.', N'HD  ')
INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (2, N'Grand Theft Auto V', N'GTA.jpg', N'GTA-thumb.jpg-*-GTA-thumb2.jpg-*-GTA-thumb3.jpg', 114000, CAST(N'2021-02-15' AS Date), 1, N'Rockstar Games', N'http://phanmemnet.com/download-gta-5-viet-hoa-full-link-google-drive-grand-theft-auto-v1-50/', N'Grand Theft Auto V là phiên bản thứ 5 trong loạt game Grand Theft Auto. Trong game, người chơi sẽ được đưa đến thành phố hư cấu Los Santos và có thể tham gia vào các nhiệm vụ để kiếm tiền và trở thành tay mafia lừng danh.', N'HD  ')
INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (3, N'Resident Evil Village', N'REV.jpg', N'REV-thumb.jpg-*-REV-thumb2.jpg-*-REV-thumb3.png', 150000, CAST(N'2021-04-23' AS Date), 1, N'Capcom', N'https://khiphach.info/tai-resident-evil-village-full/', N'Resident Evil Village là phiên bản mới nhất trong loạt game kinh dị Resident Evil. Trong game, người chơi sẽ hóa thân thành Ethan Winters, nhân vật chính của phần 7, và tham gia vào cuộc chiến với những sinh vật kinh dị để cứu người vợ của mình.', N'KD  ')
INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (4, N'FIFA 22', N'FF22.png', N'FF22-thumb.png-*-FF22-thumb2.png-*-FF22-thumb3.png', 432000, CAST(N'2021-09-27' AS Date), 1, N'Electronic Arts', N'https://dtvc.edu.vn/cach-choi-fifa-22-mien-phi-phien-ban-moi-nhat-tren-steam-how-to-play-fifa-22-for-free-on-pc/', N'FIFA 22 là phiên bản mới nhất của loạt game bóng đá FIFA. Trong game, người chơi sẽ được trải nghiệm các giải đấu bóng đá hàng đầu thế giới và cạnh tranh với các đội bóng khác để giành chiến thắng.', N'TT  ')
INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (5, N'The Witcher 3: Wild Hunt', N'WC3.jpg', N'WC3-thumb.jpeg-*-WC3-thumb2.jpg-*-WC3-thumb3.jpg', 70000, CAST(N'2021-03-01' AS Date), 1, N'Steam', N'https://uploadhaven.com/download/f26c63c29101c0571e8b945dd01babdc', N'The Witcher 3: Wild Hunt là một trò chơi nhập vai thế giới mở dựa trên câu chuyện, được thiết lập trong một vũ trụ huyền bí đầy hấp dẫn về lựa chọn có ý nghĩa và hậu quả tác động. Trong The Witcher, bạn vào vai Geralt of Rivia, một thợ săn quái vật chuyên nghiệp được giao nhiệm vụ tìm kiếm một đứa trẻ của tiên tri trong một thế giới mở rộng lớn với những thành phố thương gia, các hòn đảo cướp biển, những đường đèo núi nguy hiểm và những hang động bị lãng quên để khám phá.', N'NV  ')
INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (6, N'Minecraft', N'MC.jpg', N'MC-thumb.jpg-*-MC-thumb2.jpg-*-MC-thumb3.jpg', 299000, CAST(N'2022-02-15' AS Date), 1, N'Mojang', N'https://minefc.com/tai-game/', N'Game sinh tồn thế giới mở.', N'MP  ')
INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (7, N'Genshin Impact', N'GI.jpg', N'GI-thumb.jpg-*-GI-thumb2.jpg-*-GI-thumb3.jpg', 200000, CAST(N'2022-02-12' AS Date), 1, N'Mihoyo', N'https://genshin.hoyoverse.com/pc-launcher/?utm_source=SEA_google_NZMY_SEM_brand_1022&mhy_trace_channel=ga_channel&new=1&gclid=CjwKCAjw5pShBhB_EiwAvmnNV6GJFce63Vpo1M5LlCEgCJqASjGBBLeVsTKAdQG3NUDasg-bd3KKhhoC3FYQAvD_BwE#/', N'Game nhập vai phiêu lưu thế giới mở đầy hấp dẫn.', N'PL  ')
INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (8, N'Among Us', N'AU.jpg', N'AU-thumb.jpg-*-AU-thumb2.jpg-*-AU-thumb3.jpg', 59900, CAST(N'2022-02-08' AS Date), 1, N'InnerSloth', N'https://www.memuplay.com/vi/how-to-play-Among-Us-on-pc.html', N'Game trinh thám nhiệm vụ thực hiện trong tàu vũ trụ.', N'CT  ')
INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (9, N'League of Legends', N'LOL.jpg', N'LOL-thumb.jpg-*-LOL-thumb2.png-*-LOL-thumb3.webp', 50000, CAST(N'2022-02-06' AS Date), 1, N'Riot Games', N'https://lienminh.vnggames.com/dang-ky/redownload/', N'Game chiến đấu 5v5 eSports phong cách MOBA.', N'MOBA')
INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (10, N'Diablo III', N'DIABLO.jpg', N'DB-thumb.jpg-*-DB-thumb2.jpg-*-Db-thumb3.jpg', 199000, CAST(N'2022-02-03' AS Date), 1, N'Blizzard Entertainment', N'https://technetvietnam.net/download-diablo-3/', N'Game nhập vai hành động phiêu lưu.', N'NV  ')
INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (11, N'Counter Strike: Global Offensive', N'CSGO.jpg', N'CSGO-thumb.png-*-CSGO-thumb2.webp-*-CSGO-thumb3.webp', 300000, CAST(N'2022-01-29' AS Date), 1, N'Valve Corporation', N'https://hadoantv.com/counter-strike-global-offensive-online/', N'Game bắn súng trực tuyến FPS.', N'FPS ')
INSERT [dbo].[Products] ([Id], [Name], [Poster], [Thumbnail], [Price], [CreateDate], [Available], [Source], [Link], [Details], [CategoryId]) VALUES (12, N'Dota 2', N'DOTA.jpg', N'DOTA-thumb.jpg-*-DOTA-thumb2.jpg-*-DOTA-thumb3.jpg', 150000, CAST(N'2022-01-27' AS Date), 1, N'Valve Corporation', N'https://dota-2.en.softonic.com/download', N'Game chiến đấu eSports phong cách MOBA.', N'MOBA')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Người Dùng')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Quản Lý')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Nhân Viên')
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Poster]  DEFAULT (N'Poster.jpg') FOR [Poster]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Thumbnail]  DEFAULT (N'Thumbnail.jpg') FOR [Thumbnail]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Blog] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Accounts_Blog]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Account_Comments] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Account_Comments]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Blogss] FOREIGN KEY([IdBlog])
REFERENCES [dbo].[Blogs] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comment_Blogss]
GO
ALTER TABLE [dbo].[Coupon_owners]  WITH CHECK ADD FOREIGN KEY([Coupon_code])
REFERENCES [dbo].[Coupons] ([Code])
GO
ALTER TABLE [dbo].[Coupon_owners]  WITH CHECK ADD FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([AccessoryId])
REFERENCES [dbo].[Accessories] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh Poster' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Poster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh Thumbnail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Thumbnail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
