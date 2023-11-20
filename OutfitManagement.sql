USE [master]
GO
-- Xóa cơ sở dữ liệu OutfitManagement nếu nó đã tồn tại
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'OutfitManagement')
BEGIN
    ALTER DATABASE [OutfitManagement] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE [OutfitManagement]
END
GO

-- Tạo cơ sở dữ liệu OutfitManagement
CREATE DATABASE [OutfitManagement]
GO

-- Sử dụng cơ sở dữ liệu OutfitManagement
USE [OutfitManagement]
GO

-- Xóa dữ liệu trong bảng Users
DELETE FROM [dbo].[tblUsers]
GO

-- Tạo bảng Users
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
	CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
	(
		[userID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
GO

-- Chèn dữ liệu vào bảng Users
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'HaPTM', N'Jane Tran', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE172939', N'Phung Tran Mai Ha', N'1', N'AD', 1)
GO

DROP TABLE OrderDetails
-- Tạo bảng OrderDetails
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sku] [varchar](10) NOT NULL,
	[order_id] [int] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [float] NOT NULL,
	CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	),
	CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([order_id])
	REFERENCES [dbo].[Orders] ([id])
	ON DELETE CASCADE,
	CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([sku])
	REFERENCES [dbo].[Product] ([sku])
)
GO

-- Chỉnh sửa ràng buộc kiểm tra
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO

-- Chèn dữ liệu vào bảng OrderDetails
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [sku], [order_id], [price], [quantity], [total]) VALUES (1, N'F01', 1, 3500, 1, 3500)
INSERT [dbo].[OrderDetails] ([id], [sku], [order_id], [price], [quantity], [total]) VALUES (2, N'F05', 1, 3000, 3, 9000)
INSERT [dbo].[OrderDetails] ([id], [sku], [order_id], [price], [quantity], [total]) VALUES (3, N'F02', 2, 100000, 1, 100000)

SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO

DROP TABLE Orders
-- Tạo bảng Orders
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateBuy] [datetime] NOT NULL,
	[total] [float] NULL,
	[userID] [nvarchar](50) NULL,
	[phone] [varchar](20) NULL,
	[address] [nvarchar](400) NULL,
	CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	),
	CONSTRAINT [FK_Orders_tblUsers] FOREIGN KEY([userID])
	REFERENCES [dbo].[tblUsers] ([userID])
)
GO

-- Chỉnh sửa ràng buộc kiểm tra
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_tblUsers]
GO

-- Chèn dữ liệu vào bảng Orders
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [dateBuy], [total], [userID], [phone], [address]) VALUES (1, CAST(N'2023-07-07' AS datetime), 125000, N'admin', N'0934968395', N'HCM.C, Vietnam')
INSERT [dbo].[Orders] ([id], [dateBuy], [total], [userID], [phone], [address]) VALUES (2, CAST(N'2023-07-07' AS datetime), 100000, N'HaPTM', N'0934968698', N'HCM.C, Vietnam')

SET IDENTITY_INSERT [dbo].[Orders] OFF
GO


drop table Product

CREATE TABLE [dbo].[Product](
	[sku] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](250) NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[image] [nvarchar](200) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[sku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


INSERT [dbo].[Product] ([sku], [name], [description], [quantity], [price],[image]) VALUES (N'F01', N'Boot', N'Leather Boot',50 , 3500,N'https://www.dior.com/couture/ecommerce/media/catalog/product/d/x/1666881913_KCI841VEA_S900_E03_GH.jpg')
INSERT [dbo].[Product] ([sku], [name], [description], [quantity], [price],[image]) VALUES (N'F02', N'Dress 1', N'Tale of Tales',3 , 100000,N'https://i.pinimg.com/originals/1c/5b/16/1c5b16f3c1635c4d8ab092af63e3dd4b.jpg')
INSERT [dbo].[Product] ([sku], [name], [description], [quantity], [price],[image]) VALUES (N'F03', N'Dress 2', N'Junon Gown',3 , 100000,N'https://static.dw.com/image/37491307_703.jpg')
INSERT [dbo].[Product] ([sku], [name], [description], [quantity], [price],[image]) VALUES (N'F04', N'Suit', N'Wool Mohair',10 , 20000,N'https://static.fendi.com/dam/is/image/fendi/FD0941AL5JF0QA1_01?wid=1000&hei=1000&hash=5f13852e7d3daca9b1f93c71645068f8-182daf5f767')
INSERT [dbo].[Product] ([sku], [name], [description], [quantity], [price],[image]) VALUES (N'F05', N'Ring', N'Serpenti with a blue sapphire and pavé diamonds ',50 , 3000,N'https://fecarotta-com.cdn-immedia.net/wp-content/uploads/2020/03/BVLGARI-ANELLO-SERPENTI-.png')
INSERT [dbo].[Product] ([sku], [name], [description], [quantity], [price],[image]) VALUES (N'F06', N'Blazer', N'Wool Peak-Lapel',15 , 5000,N'https://www.michelefranzesemoda.com/img.michelefranzesemoda.com/A23---tom+ford---QVER4911SQ407.JPG ')
INSERT [dbo].[Product] ([sku], [name], [description], [quantity], [price],[image]) VALUES (N'F07', N'Bra', N'90s Bra',100 , 1000,N'https://m.media-amazon.com/images/I/61rMsQLr-2L._AC_UY1100_.jpg')
INSERT [dbo].[Product] ([sku], [name], [description], [quantity], [price],[image]) VALUES (N'F08', N'Necklace', N'FIOREVER',50 , 5000,N'https://media2.bulgari.com/image/upload/f_auto,q_auto/v1661955967/grid/fiorever/Fiorever_1_hzv1qb.jpg')
INSERT [dbo].[Product] ([sku], [name], [description], [quantity], [price],[image]) VALUES (N'F09', N'Bracelet', N'FIOREVER',50 , 2000,N'https://a.1stdibscdn.com/bvlgari-white-gold-diamond-fiorever-bracelet-354603-for-sale/j_5903/j_156777621651956281423/j_15677762_1651956281669_bg_processed.jpg?width=768')
INSERT [dbo].[Product] ([sku], [name], [description], [quantity], [price],[image]) VALUES (N'F10', N'Earring', N'FIOREVER',50 , 2000,N'https://www.arabiaweddings.com/sites/default/files/uploads/2019/11/12/bvlgari_-_or858687_001_ful.jpg')


