Create Database LapTopOn;
USE [LaptopOn]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/10/2024 4:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[product_category_id] [int] NOT NULL,
	[describe] [nvarchar](400) NULL,
	[img] [varchar](100) NULL,
	[prices] [decimal](18, 0) NULL,
	[nsx] [int] NULL,
	[sale] [decimal](18, 0) NULL,
 CONSTRAINT [PK__Product__3213E83FE82348C7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_category]    Script Date: 3/10/2024 4:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_category](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shopping_cart]    Script Date: 3/10/2024 4:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopping_cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[total_prices] [decimal](18, 0) NOT NULL,
	[date] [date] NOT NULL,
	[user_id] [int] NULL,
	[staus_order] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[phone] [nvarchar](50) NULL,
 CONSTRAINT [PK__Shopping__3213E83FCCD1E66E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shopping_cart_item]    Script Date: 3/10/2024 4:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopping_cart_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[price] [decimal](18, 0) NULL,
	[shopping_cart_id] [int] NULL,
 CONSTRAINT [PK__Shopping__3213E83F29BB0697] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/10/2024 4:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](100) NOT NULL,
	[last_name] [nvarchar](100) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[role] [int] NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[img] [varchar](100) NULL,
 CONSTRAINT [PK__Users__3213E83F7BB8E845] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (1, N'Dell Xps 16 9640', 1, N'Laptop mang trên mình CPU thế hệ mới nhất Intel® Core™ Ultra, kết hợp cùng kích thước lớn 16.3 inch, khả năng tản nhiệt hiệu quả. Máy sẽ dành cho khách hàng chuyên nghiệp', N'img/dell-xps-16-9640-2024-1706929809.jpg', CAST(26000000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (2, N'Dell Alienware M18 R2', 1, N'Core™ i7-14650HX, RAM 16GB, SSD 1TB, RTX 4060, QHD 165Hz', N'img/dell-alienware-m18-r2-2024-1705562639.jpg', CAST(20000000 AS Decimal(18, 0)), 2022, CAST(16000000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (3, N'Dell Alienware M16 R2', 1, N'Core™ Ultra 7-155H, RAM 16GB, SSD 1TB, RTX 4060, QHD 240Hz', N'img/dell-alienware-m16-r2-2024-1705561967.jpg', CAST(48990000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (4, N'Dell Gaming G15 5535', 1, N'Ryzen 5 7640HS, RAM 16GB, SSD 1TB, RTX 3050, FHD 120Hz', N'img/dell-gaming-g15-5535-2023-1703473386.jpg', CAST(20890000 AS Decimal(18, 0)), 2021, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (5, N'Dell Vostro 15 3530', 1, N'Core™ i7-1355U, RAM 8GB, SSD 512GB, FHD', N'img/dell-vostro-15-3530-2023-1702287240.jpg', CAST(20490000 AS Decimal(18, 0)), 2022, CAST(16860000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (6, N'Dell Precision 14 5480', 1, N'Core™ i7-13700H, RAM 16GB, SSD 512GB, RTX A1000, FHD+', N'img/dell-precision-5680-gen-13th-1692262813.jpg', CAST(43990000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (7, N'Dell Alienware M18 R1 AMD', 1, N'Ryzen 9-7845HX, RAM 16GB, SSD 512GB, RTX 4070, FHD 480hz', N'img/Dell Alienware M18 R1 AMD.jpg', CAST(53990000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (8, N'Dell Precision 5680', 1, N'Core™ i7-13700H, RAM 32GB, SSD 512GB, RTX A1000, FHD', N'img/dell-precision-5680-gen-13th-1692262813.jpg', CAST(41990000 AS Decimal(18, 0)), 2021, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (10, N'Dell Gaming G16 7630', 1, N'Core™ i7-13650HX, RAM 16GB, SSD 1TB, RTX 4060, QHD 165Hz', N'img/dell-gaming-g16-7630-1679560798.jpg', CAST(33690000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (11, N'Dell Gaming G16 7620', 1, N'Core™ i7-12700H, RAM 16GB, SSD 512GB, RTX™ 3060, QHD+', N'img/dell-gaming-g16-7620-1676600915.jpg', CAST(25590000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (13, N'Dell Gaming G15 5520', 1, N'Core™ i7-12700H, RAM 16GB, SSD 512GB, RTX 3060, FHD 165Hz', N'img/dell-gaming-g15-5520-gen-12th-1652432746.jpg', CAST(24390000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (14, N'Dell Gaming G15 5511', 1, N'
Core™ i5-11400H, RAM 8GB, SSD 512GB, RTX 3050 , FHD 120Hz', N'img/dell-gaming-g15-5511-1641196802.jpg', CAST(22000000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (15, N'Dell Gaming G15 5515', 1, N'Ryzen 5-5600H, RAM 8GB, SSD 256GB, RTX 3050, FHD 120Hz', N'img/dell-gaming-g15-5515-1634108883.jpg', CAST(25300000 AS Decimal(18, 0)), 2024, CAST(20000000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (17, N'Dell Latitude 13 5340', 1, N'Core i5-1345U, RAM 16GB, SSD 256GB, FHD', N'img/dell-latitude-13-5340-2023-1702116835.jpg', CAST(16490000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (18, N'Dell Precision 5570', 1, N'Core™ i7-12800H, RAM 16GB, SSD 256GB, RTX A1000, FHD', N'img/dell-precision-5570-gen-12th-1655347307.jpg', CAST(36990000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (19, N'Dell Alienware X14 R1', 1, N'Core™ i7-12700H, RAM 16GB, SSD 512GB, RTX 3050Ti, FHD 144Hz', N'img/dell-alienware-x14-r1-gen-12th-1652432118.jpg', CAST(29990000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (20, N'Dell Inspiron 7435 2', 1, N'Ryzen™ 5 7530U, RAM 8GB, SSD 512GB, FHD', N'img/dell-inspiron-7435-2-in-1-amd-1684119040.jpg', CAST(13600000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (21, N'Dell Latitude 14 7440', 1, N'Core i5-1345U, RAM 16GB, SSD 256GB, FHD', N'img/dell-latitude-14-7440-2023-1702110230.jpg', CAST(21490000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (22, N'Hp Spectre X360 14', 2, N'Core™ Ultra 7-155H, RAM 16GB, SSD 2TB, 2.8K OLED', N'img/hp-spectre-x360-14-2024-nightfall-black-1705650060.jpg', CAST(22000000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (23, N'Hp Spectre X360 16', 2, N'Core™ Ultra 7-155H, RAM 16GB, SSD 512GB, RTX 4050, WQXGA', N'img/hp-spectre-x360-16-2024-nightfall-black-1705646366.jpg', CAST(25600000 AS Decimal(18, 0)), 2021, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (24, N'Hp Elitebook 845 G8 ', 2, N'AMD Ryzen 5 5650U, RAM 16GB, SSD 256GB, FHD', N'img/hp-elitebook-845-g8-2021-1703845179.jpg', CAST(14490000 AS Decimal(18, 0)), 2022, CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (25, N'HP Pavilion X360 14', 2, N'Core™ i5-1235U, RAM 8GB, SSD 512GB, FHD', N'img/hp-pavilion-14-x360-2-in-1-2022-1701423247.jpg', CAST(12990000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (26, N'HP Laptop 14s DR5000TU', 2, N'Core™ i5-1240P, RAM 16GB, SSD 512GB, FHD', N'img/hp-laptop-14s-dr5000tu-2022-1701247116.jpg', CAST(14290000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (27, N'HP ZBook Power 15 G8', 2, N'Core™ i9-11900H, RAM 32GB, SSD 512GB, T1200, FHD', N'img/hp-zbook-power-15-g8-mobile-workstation-new-1698287317.jpg', CAST(28990000 AS Decimal(18, 0)), 2022, CAST(24000000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (28, N'HP ZBook Fury 15 G8', 2, N'Core i7-11850H, RAM 32GB, SSD 512GB, RTX A2000, FHD', N'img/hp-zbook-fury-15-g8-model-2021-mobile-workstation-1698222265.jpg', CAST(32990000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (29, N'HP laptop 17-CP0700DX', 2, N'Ryzen 5-5500U, RAM 8GB, SSD 512GB, FHD', N'img/hp-laptop-17-cp0700dx-2021-1693540333.jpg', CAST(12390000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (30, N'HP Laptop 17-BY4061NR', 2, N'Core i5-1135G7, RAM 8GB , SSD 512GB FHD', N'img/hp-laptop-17-by4061nr-2021-1693539776.jpg', CAST(19900000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (31, N'HP Laptop 17-BY4062CL', 2, N'Core i5-1135G7, RAM 8GB, SSD 256GB, HD', N'img/hp-laptop-17-by4062cl-2021-1693537904.jpg', CAST(10690000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (32, N'HP Laptop 17-CN0273ST', 2, N'Core i3-1125G4, RAM 8GB, SSD 512GB, FHD', N'img/hp-laptop-17-cn0273st-2021-1695202791.jpg', CAST(9900000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (33, N'HP ZBook Firefly 16 G9', 2, N'Core i7-1265U, RAM 32GB, SSD 1TB, T550, WUXGA', N'img/hp-zbook-firefly-16-g9-1692841272.jpg', CAST(31000000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (34, N'HP ZBook Power G9', 2, N'Core i7-12700H, RAM 32GB, SSD 1TB, RTX A1000, FHD', N'img/hp-zbook-power-g9-1692803247.jpg', CAST(34900000 AS Decimal(18, 0)), 2021, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (35, N'HP Pavilion 14-DV2097NR', 2, N'Core i5-1235U, RAM 16GB, SSD 256GB, FHD', N'img/hp-pavilion-14-dv2097nr-2022-1692764359.jpg', CAST(14700000 AS Decimal(18, 0)), 2024, CAST(12990000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (36, N'Hp Omen 16', 2, N'Core™ i7-13620H, RAM 16GB, SSD 1TB, RTX 4050, FHD 144Hz', N'img/hp-omen-16-2023-1688719040.jpg', CAST(29990000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (37, N'HP Pavilion Laptop 14', 2, N'Core ™ i7 - 1165G7, RAM 16GB, SSD 512GB, FHD', N'img/hp-pavilion-laptop-14-dv0071cl-1660979218.jpg', CAST(19490000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (38, N'HP Omen 17', 2, N'Core i7-13700HX, RAM 32GB, SSD 1TB, RTX 4070, QHD 144Hz', N'img/hp-omen-17-2023-1679625061.jpg', CAST(41990000 AS Decimal(18, 0)), 2021, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (39, N'HP Victus 15', 2, N'Core™ i5-12450H, RAM 8GB, SSD 512GB, GTX 1650, FHD 144Hz', N'img/hp-victus-15-fa0031dx-gen-12th-1657104034.jpg', CAST(29000000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (40, N'hathongminh', 5, N'cung duoc', N'img/1072-0-1689836924.jpg', CAST(200000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (41, N'Acer Nitro 16 Phoenix AMD', 3, N'Ryzen™5 - 7535HS, RAM 16GB, SSD 512GB, RTX 4050, WUXGA', N'img/acer-nitro-16-phoenix-amd-2023-1699004932.jpg', CAST(23499000 AS Decimal(18, 0)), 2023, CAST(20000000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (42, N'Acer Aspire 5 A517', 3, N'Core i7-1165G7, RAM 8GB, SSD 512GB, FHD', N'img/acer-aspire-5-a517-2021-1693878849.jpg', CAST(13490000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (43, N'Acer Spin 3 SP313', 3, N'Core i5-1135G7, RAM 8GB, SSD 512GB, WUXGA', N'img/acer-spin-3-sp313-2021-1693879444.jpg', CAST(12490000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (44, N'Acer Predator Helios 16 Neo', 3, N'Core™ i5-13500HX, RAM 16GB, SSD 512GB, RTX 4050, FHD 165Hz', N'img/acer-predator-helios-16-neo-2023-1694504627.jpg', CAST(21690000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (45, N'Acer Swift 3 SF314', 3, N'Core i5-1240P, RAM 16GB, SSD 512GB, FHD', N'img/acer-swift-3-sf314-512-52mz-1678846936.jpg', CAST(12490000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (46, N'Acer Predator Helios 300', 3, N'Core™ i7-12700H, RAM 16GB, SSD 512GB, RTX 3060, FHD', N'img/acer-predator-helios-300-ph315-55-1678677849.jpg', CAST(25990000 AS Decimal(18, 0)), 2024, CAST(23990000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (47, N'Acer Aspire 5 A515', 3, N'Core™ i3-1115G, RAM 4GB, SSD 128GB, FHD', N'img/acer-aspire-5-a515-2021-1694159519.jpg', CAST(7500000 AS Decimal(18, 0)), 2021, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (48, N'Acer Nitro 5 Tiger', 3, N'Core™ i5-12500H, RAM 16GB, SSD 512GB, RTX 3050, FHD 144Hz', N'img/acer-nitro-5-tiger-2022-1699426065.jpg', CAST(17190000 AS Decimal(18, 0)), 2022, CAST(15000000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (49, N'Acer Nitro 5 Tiger', 3, N'Core i5-1240P, RAM 16GB, SSD 512GB, FHD', N'img/acer-nitro-5-2022-chinh-hang-1671876057.jpg', CAST(29000000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (50, N'Acer Nitro 5 AN515', 3, N'Core i5-1135G7, RAM 8GB, SSD 256GB, HD', N'img/acer-nitro-5-2021-1633749241.jpg', CAST(32990000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (51, N'Acer Nitro 16 Phoenix', 3, N'Core™ i5-13500H, Ram 16GB, SSD 512GB, RTX 4050, 165Hz', N'img/acer-nitro-16-phoenix-2023-1685434389.jpg', CAST(25990000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (52, N'Acer Nitro 17 Phoenix', 3, N'
Core™ i5 13500H, RAM 16GB, SSD 512GB, RTX 4050, 165Hz', N'img/acer-nitro-17-phoenix-2023-1685672123.jpg', CAST(32990000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (53, N'Macbook Air 13', 4, N'M2, RAM 16GB, SSD 2TB, 10GPU', N'img/macbook-air-13-2022-m2-ram-16gb-ssd-2tb-10gpu-new-1698834746.jpg', CAST(54490000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (54, N'Macbook Air 13 inch', 4, N'M1 / 8GB / 512GB', N'img/macbook-air-13-inch-2020-m1-8gb-512gb-like-new-1698632802.jpg', CAST(18200000 AS Decimal(18, 0)), 2020, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (55, N'Macbook Air 2023 15', 4, N'M2 RAM 16GB SSD 1TB LLA', N'img/1072-0-1689836924.jpg', CAST(44990000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (56, N'iMac 2021 24 inch', 4, N'(M1-8-Core GPU)/16GB/1TB', N'img/929-0-1685933884.jpg', CAST(55990000 AS Decimal(18, 0)), 2021, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (57, N'Macbook Air 13 2022', 4, N'M2, RAM 16GB, SSD 256GB', N'img/972-1-1677207718.jpg', CAST(31990000 AS Decimal(18, 0)), 2022, CAST(26990000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (58, N'Macbook Pro 16', 4, N'M1 Max 10 Core - GPU 32 Core', N'img/macbook-pro-16-m1-max-10-core-gpu-32-core-64gb8tb-new-1641356201.jpg', CAST(52000000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (59, N'Mac Mini 2020', 4, N'M1, 16GB ,512GB', N'img/mac-mini-2020-m1-16gb-256gb-new-1619672384.jpeg', CAST(23990000 AS Decimal(18, 0)), 2020, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (60, N'MHLV3 – iMac Pro 2023', 4, N'32GB / 1TB / Vega 56', N'img/mhlv3-imac-pro-2020-27-inch-5k-xeon-w-32gb-1tb-vega-56-new-1609753828.jpg', CAST(60000000 AS Decimal(18, 0)), 2023, CAST(54000000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (61, N'iMac 2020', 4, N'Core i5, RAM 16GB, SSD 256GB', N'img/imac-2020-27-inch-retina-5k-mxwu2-new-1601003076.jpg', CAST(24500000 AS Decimal(18, 0)), 2020, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (62, N'Macbook Pro 13', 4, N'Core i5 2.0 / 16GB / 512GB', N'img/919-0-1600859730.jpg', CAST(32990000 AS Decimal(18, 0)), 2021, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (63, N'Macbook Air 13 inch', 4, N'Core i5 / 8GB / 256GB', N'img/919-0-1600859730.jpg', CAST(15990000 AS Decimal(18, 0)), 2021, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (64, N'Macbook Pro 16', 4, N'M1 Pro 10 Core - GPU 16 Core', N'img/macbook-pro-16-m1-pro-10-core-gpu-16-core-16gb512gb-new-1635753487.jpg', CAST(26900000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (65, N'Macbook Air 13 inch', 4, N'Core i3 / 8GB / 256GB', N'img/919-0-1602125187.jpg', CAST(21000000 AS Decimal(18, 0)), 2020, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (66, N'Macbook Pro 14', 4, N'M1 Pro 8 (14 Core/16GB/512GB)', N'img/macbook-pro-16-m1-pro-10-core-gpu-16-core-16gb512gb-new-1635753487.jpg', CAST(42990000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (67, N'Macbook Pro 14 2023', 4, N'M3 (8- CPU, 10- GPU) 8GB 512GB', N'img/macbook-pro-14-2023-m3-8-cpu-10-gpu-8gb-512gb-new-1699871153.jpg', CAST(38000000 AS Decimal(18, 0)), 2023, CAST(32000000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (68, N'MacBook Pro 14 2023', 4, N'M2 Pro (16 Core/16GB/512GB)', N'img/1032-1-1683277451.jpg', CAST(46890000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (69, N'Macbook Pro 13', 4, N'M2 / 8GB / 256GB', N'img/macbook-pro-13-2022-m2-8gb-256gb-new-1656994695.jpg', CAST(29490000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (70, N'Macbook Pro 16 ', 4, N'Core i7 2.6 / 16GB / 512GB', N'img/macbook-pro-16-inch-2019-mvvj2-mvvl2-core-i7-26-16gb-512gb-like-new-1601092287.jpg', CAST(34230000 AS Decimal(18, 0)), 2019, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (71, N'MacBook Pro 16 2023 ', 4, N'M2 Pro (19 Core/16GB/512GB)', N'img/macbook-pro-14-2023-m3-8-cpu-10-gpu-8gb-512gb-new-1699871153.jpg', CAST(78000000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (72, N'Macbook Pro 14 ', 4, N'M1 Pro 10 (16 Core/16GB/1TB)', N'img/macbook-pro-14-2023-m3-8-cpu-10-gpu-8gb-512gb-new-1699871153.jpg', CAST(45490000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (73, N'Surface Laptop Go 3', 5, N'Core I5, 16GB, 256GB', N'img/surface-laptop-go-3-core-i5-16gb-256gb-newseal-1700549046.jpg', CAST(25490000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (74, N'Surface Go 4', 5, N'Intel N200, RAM 8GB, UFS 256', N'img/surface-go-4-intel-n200-ram-8gb-ufs-256-new-1698458862.jpg', CAST(20990000 AS Decimal(18, 0)), 2022, CAST(16990000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (75, N'Surface Studio 2 Plus', 5, N'Core i7-11370H, 32GB RAM, 1TB SSD, RTX 3060', N'img/surface-studio-2-plus-1698337318.jpg', CAST(120990000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (76, N'Surface Laptop Studio 2', 5, N'Core i7, 64GB, 2TB, RTX 4050', N'img/surface-laptop-studio-2-core-i7-64gb-2tb-rtx-4050ti-new-1698332295.jpg', CAST(107990000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (77, N'Surface Pro X SQ2 ', 5, N' RAM 16GB, SSD 256GB Refurbished', N'img/surface-pro-x-sq2-ram-16gb-ssd-256gb-refurbished-1687595503.jpg', CAST(14690000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (78, N'Surface Go 3 ', 5, N'Pentium Wifi, RAM 4GB SSD 64GB - New', N'img/surface-go-3-pentium-6500y-wifi-4gb-ram-64gb-emmc-new-1633579186.jpg', CAST(10490000 AS Decimal(18, 0)), 2021, CAST(9490000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (79, N'Surface Laptop 3 [15]', 5, N'Ryzen 5 8GB 256GB', N'img/surface-laptop-3-15-amd-ryzen-5-8gb-256gb-99-1626872013.jpeg', CAST(11999000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (80, N'Used - Surface Book 2', 5, N'
Core i7-8650U / Ram 16GB / SSD 256GB / 4K', N'img/used-surface-book-2-15-inch-1622796687.jpg', CAST(20990000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (81, N'Surface Book 3', 5, N'Core i5 / 8GB / 256GB', N'img/surface-book-3-core-i5-8gb-256gb-13-inch-99-1611372801.jpg', CAST(14690000 AS Decimal(18, 0)), 2024, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (82, N'Surface Book 3', 5, N'Core i5 / 8GB / 256GB 13 - inch', N'img/surface-book-3-core-i5-8gb-256gb-13-inch-newseal-1601021898.jpg', CAST(27990000 AS Decimal(18, 0)), 2023, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (83, N'Surface Book 3', 5, N'Core i7 / 16GB / 256GB / 15 - inch Newseal', N'img/surface-book-3-core-i7-16gb-256gb-15-inch-newseal-1601019742.jpg', CAST(29990000 AS Decimal(18, 0)), 2021, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (84, N'Surface Go 2', 5, N'Core M3 / 8GB / 128GB LTE Newseal', N'img/surface-go-2-core-m3-8gb-128gb-lte-newseal-1610869934.jpg', CAST(14490000 AS Decimal(18, 0)), 2021, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (85, N'Surface Studio 2', 5, N'	Intel® Core™ i7-7820HQ, 	Windows 10 Pro', N'img/surface-studio-2-chinh-hang-gia-tot-nhat-1572948512.jpg', CAST(124500000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (86, N'Surface Pro X SQ1', 5, N'RAM 8GB, SSD 256GB - Newseal', N'img/surface-pro-x-sq1-8gb-256gb-new-1673334354.jpg', CAST(13990000 AS Decimal(18, 0)), 2023, CAST(10990000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (87, N'Surface Pro 9', 5, N'SQ3, RAM 8GB, SSD 128GB, 5G LTE', N'img/surface-go-3-pentium-6500y-wifi-4gb-ram-64gb-emmc-new-1633579186.jpg', CAST(28490000 AS Decimal(18, 0)), 2022, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (88, N'Charger Lenovo', 6, N'45W | 65W Chữ nhật Type C', N'img/7799_f0bc9b10aa3052fd0ce8f8a448c9a57d.jpg', CAST(380000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (89, N'Charger Lenovo', 6, N'45W | 65W | 90W Chữ Nhật / Slim chân USB', N'img/7798_e05264a77abb2a99a3383b573a468799.jpg', CAST(210000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (90, N'Charger Lenovo', 6, N'45W | 65W Chữ nhật Type C', N'img/7799_f0bc9b10aa3052fd0ce8f8a448c9a57d.jpg', CAST(380000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (91, N'Charger Dell 90w Ovan', 6, N'90w Ovan Kim To (7.4x5.0mm)', N'img/7782_6_lenovo_thinkpad_w540.jpg', CAST(300000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (92, N'Charger  Dell ', 6, N'130W | 180W | 240W Slim Kim To (7.4x5.0mm)', N'img/7794_f42871076b82398c623a5256e25be02a.jpg', CAST(330000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (93, N'Charger Dell 65w', 6, N'65W Ovan Type C', N'img/8363_sac_laptop_dell_oval_20v_65w_type_c_g10455_1685285329914.png', CAST(400000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (94, N'Charger Acer | Liteon ', 6, N'Liteon 65W Chữ Nhật Chân Nhỏ', N'img/8364_48c9c569a5713c3c34b0a8953f6c2395_720x720q80.jpg', CAST(420000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (95, N'Charger Lenovo 170w', 6, N'170w | 230w Ovan Chân USB', N'img/8209_images.jpg', CAST(650000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (96, N'Charger HP', 6, N'(7.4x5.0mm) 40W | 45W | 65W', N'img/7797_sac_lenovo_45w_dau_usb_c_zin_20v_2_1.jpg', CAST(150000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (97, N'Charger Asus 100W', 6, N'120W | 150W | 180W Chữ Nhật Kim To (6.0x3.7mm)', N'img/8319_sac_laptop_asus_19v_6_32a_120w_chan_kim_3.jpg', CAST(550000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (98, N'Charger Macbook 29w', 6, N'29w Type C', N'img/8207_8_3_600x600.jpg', CAST(700000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (99, N'Charger Dell 45w ', 6, N'45w Ovan Type C', N'img/8206_s___c_adapter_dell_45w_type_c.jpg', CAST(300000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (100, N'Charger Acer', 6, N'135w | 180W Chữ Nhật Chân Thường (5.5x1.7mm)', N'img/7807_6240_photo_2021_02_03_15_09_38.jpg', CAST(550000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (101, N'Charger Asus 120W', 6, N'120W | 150W | 180W Chữ nhật Chân thường (5.5x2.5mm)', N'img/7806_673b2431c02a3b7c72e9a0feb86e8882_tn.jpg', CAST(550000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (102, N'Charger Asus 65w', 6, N'65w Vuông Kim Nhỡ (4.5x3mm)', N'img/8209_images.jpg', CAST(250000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (103, N'Charger Asus 90W', 6, N'90W Vuông Chân Thường Kim Trong (5.5x2.5mm)', N'img/8206_s___c_adapter_dell_45w_type_c.jpg', CAST(200000 AS Decimal(18, 0)), NULL, NULL)
GO
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (104, N'Charger Asus 45W', 6, N'45W | 65W Vuông Type C', N'img/7803_adapter_asus_type_c_65w_longbinh_com_vn1.jpg', CAST(450000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (105, N'Charger Lenovo 120W', 6, N'120W | 135W | 170W Chữ Nhật Chân USB', N'img/7800_timthumb.jpg', CAST(400000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (106, N'Charger Asus 33W', 6, N'33W | 45W | 65W Vuông Chân Nhỡ (4.0mm * 1.35mm)', N'img/7792_s___c_asus_45w_vu__ng_ch__n_nh_____3x1_1mm_.jpg', CAST(250000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (107, N'Charger Asus 45W', 6, N'45W | 65W Vuông Chân Nhỏ (3x1.1mm)', N'img/7791_de8ebedb103d2f96ece8b2d11f4c36f0.jpg', CAST(250000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (108, N'Charger Asus 45W', 6, N'45W | 65W Vuông Chân Thường (5.5x2.5mm)', N'img/7790_s___c_asus_45w_vu__ng_ch__n_th_____ng__5_5x2_5mm_.jpg', CAST(250000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (109, N'Card wifi', 7, N'Card wifi chuẩn N cắm cổng PCIe PC', N'img/pro_poster_4364.jpg', CAST(169000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (110, N'Wifi USB', 7, N'USB LB-Link BL-WN151-150Mbps Nano Wireless N USB Adapter Mới', N'img/6421_e6c26875a1fc8efa1d341150af127c7d.jpg', CAST(79000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (111, N'Conversion Dell DA20U', 7, N'Bộ Chuyển Đổi Dell DA20U USB-C to USB + HDMI', N'img/8567_untitled_3.jpg', CAST(290000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (112, N'Expansion device ', 7, N'Thiết bị mở rộng USB Type-C to HDMI 4K kèm HUB 4 cổng USB 3.0 Ugreen 20197', N'img/8511_ugreen_20197_hub_usb_c_a_4_puertos_usb_3_0_hdmi_4k30hz_usb_3_0_a_5gbps_642058.jpg', CAST(579000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (113, N'USB Type-C splitter', 7, N'Bộ chia USB Type-C ra 4 cổng USB 3.0 có hỗ trợ nguồn Ugreen 70336', N'img/8334_47643_c__p_chuy___n_ugreen_70336_usb_c__type_c__sang_4_c___ng_usb3_0_h1.jpg', CAST(320000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (114, N'Card Wwan 4G', 7, N'Card Wwan 4G Kết Nối 4G/3G Cho Laptop - HP LT4120 Model T77W595 / LT4211 Model T77H468', N'img/6913_5fc2ff73c42156084f6c32a1_contest.jpg', CAST(400000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (115, N'DVI cable', 7, N'Dây cáp DVI 1.5m Mới', N'img/6394_27082_c__p_dvi_1_5m__24_1_.png', CAST(69000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (116, N'VGA cable', 7, N'Dây cáp VGA 1.5m Mới', N'img/6393_2e6ee98a4e3eac1d7368e9c746e7a37e.jpg', CAST(70000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (117, N'Docking Dell TB16', 7, N'TB16 kèm sạc 130W', N'img/5390_tb16_3.jpg', CAST(1999000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (118, N'Apple USB-C cable', 7, N'Cáp Apple USB-C Charge Cable 2m MLL82-Chính hãng', N'img/5380_apple_usb_c_charge_cable_2m_mll82_5.jpg', CAST(594000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (119, N'Mouse S88', 8, N'có dây S88 Office M1 Mới', N'img/4566_artboard_3.png', CAST(55000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (120, N'Mouse Xiaomi Mi', 8, N'Không Dây Xiaomi Mi Dual Mode Wireless White/Black', N'img/8674_xiaomi_mi_dual_mode_wireless_white.jpg', CAST(299000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (121, N'Keyboard and mouse Logitech', 8, N'[New 100%] Bộ Phím Chuột Không Dây Logitech MK220', N'img/8487_bo_phim_chuot_logitech_mk220_wireless_0001_1.jpg', CAST(1230000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (122, N'Keyboard and mouse Logitech', 8, N'Logitech MK240 là bộ phím không dây đến từ thương hiệu nổi tiếng Logitech bao gồm bàn phím và chuột', N'img/8486_logitech_mk240.jpg', CAST(1323233 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (123, N'Mouse Gaming MSI', 8, N'Chuột có dây Gaming MSI M92', N'img/7289_66.jpg', CAST(1220000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (124, N'Mouse HP H250', 8, N'Chuột không dây HP H250
', N'img/7284_111.jpg', CAST(259000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (125, N'Keyboard Logitech G Pro X', 8, N'Bàn phím máy tính Logitech G Pro X (Bàn phím cơ)', N'img/8333_b__n_ph__m_logitech_g_pro_x.jpg', CAST(2000000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (127, N'Logitech G213', 8, N'Bàn phím Gaming Logitech G213 Prodigy - Có dây', N'img/4441_artboard_2.png', CAST(2300000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (128, N'Gaming Logitech G512', 8, N'Bàn phím Gaming Logitech G512 Romer-G Linear - Có dây', N'img/4444_artboard_2.png', CAST(2199000 AS Decimal(18, 0)), NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [product_category_id], [describe], [img], [prices], [nsx], [sale]) VALUES (129, N'logitec', 3, N'Chuột ngon rẻ chất lượng', N'img/4566_artboard_3.png', CAST(500000 AS Decimal(18, 0)), 0, CAST(300000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Product_category] ([id], [name]) VALUES (1, N'Laptop Dell')
INSERT [dbo].[Product_category] ([id], [name]) VALUES (2, N'Laptop HP')
INSERT [dbo].[Product_category] ([id], [name]) VALUES (3, N'Laptop Acer')
INSERT [dbo].[Product_category] ([id], [name]) VALUES (4, N'MacBook')
INSERT [dbo].[Product_category] ([id], [name]) VALUES (5, N'Microsoft Sureface')
INSERT [dbo].[Product_category] ([id], [name]) VALUES (6, N'Charger Laptop')
INSERT [dbo].[Product_category] ([id], [name]) VALUES (7, N'Conversion')
INSERT [dbo].[Product_category] ([id], [name]) VALUES (8, N'Keyboard and mouse')
GO
SET IDENTITY_INSERT [dbo].[Shopping_cart] ON 

INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (1, CAST(106530000 AS Decimal(18, 0)), CAST(N'2023-01-05' AS Date), 1, N'Hoàn thành', N'Hà Nội', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (2, CAST(140720000 AS Decimal(18, 0)), CAST(N'2023-01-05' AS Date), 7, N'Hủy', N'Hải dương', N'012344566')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (3, CAST(63780000 AS Decimal(18, 0)), CAST(N'2023-01-05' AS Date), NULL, N'Hoàn thành', N'Hồ chí minh', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (4, CAST(63780000 AS Decimal(18, 0)), CAST(N'2023-02-05' AS Date), NULL, N'Hoàn thành', N'Hồ chí minh', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (5, CAST(64160000 AS Decimal(18, 0)), CAST(N'2023-02-05' AS Date), NULL, N'Hoàn thành', N'Hà Nội', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (6, CAST(196540000 AS Decimal(18, 0)), CAST(N'2023-02-05' AS Date), NULL, N'Hoàn thành', N'bình phước', N'31212313221')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (7, CAST(321040000 AS Decimal(18, 0)), CAST(N'2023-02-05' AS Date), NULL, N'Hoàn thành', N'Hà Nội', N'0345882332')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (8, CAST(233230000 AS Decimal(18, 0)), CAST(N'2023-04-05' AS Date), NULL, N'Hủy', N'Hà Nội', N'0123456789')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (9, CAST(233230000 AS Decimal(18, 0)), CAST(N'2023-04-05' AS Date), NULL, N'Hoàn thành', N'Hà Nội', N'0123456789')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (10, CAST(233230000 AS Decimal(18, 0)), CAST(N'2023-04-05' AS Date), NULL, N'Hoàn thành', N'Hà Nội', N'0123456789')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (11, CAST(233230000 AS Decimal(18, 0)), CAST(N'2023-04-05' AS Date), 1, N'Hoàn thành', N'Hải dương', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (12, CAST(233230000 AS Decimal(18, 0)), CAST(N'2023-05-05' AS Date), NULL, N'Hoàn thành', N'Hồ chí minh', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (13, CAST(233230000 AS Decimal(18, 0)), CAST(N'2023-05-05' AS Date), 1, N'Hoàn thành', N'Hà Nội', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (14, CAST(233230000 AS Decimal(18, 0)), CAST(N'2023-05-05' AS Date), 1, N'Hoàn thành', N'Hà Nội', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (15, CAST(233230000 AS Decimal(18, 0)), CAST(N'2023-05-05' AS Date), NULL, N'Hoàn thành', N'bình định', N'231231231312')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (16, CAST(62870000 AS Decimal(18, 0)), CAST(N'2023-06-05' AS Date), 1, N'Hoàn thành', N'bình định', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (17, CAST(106860000 AS Decimal(18, 0)), CAST(N'2023-06-05' AS Date), NULL, N'Hoàn thành', N'thái nguyên', N'0120391230')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (18, CAST(106860000 AS Decimal(18, 0)), CAST(N'2023-06-05' AS Date), 1, N'Hoàn thành', N'thái nguyên', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (19, CAST(350690000 AS Decimal(18, 0)), CAST(N'2023-06-05' AS Date), 1, N'Hoàn thành', N'ninh bình', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (20, CAST(135050000 AS Decimal(18, 0)), CAST(N'2023-06-05' AS Date), 1, N'Hoàn thành', N'Hà Nội', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (21, CAST(140000000 AS Decimal(18, 0)), CAST(N'2023-07-06' AS Date), NULL, N'Hoàn thành', N'Hải dương', N'01231412323')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (22, CAST(191380000 AS Decimal(18, 0)), CAST(N'2023-07-06' AS Date), 3, N'Hoàn thành', N'Hà Nội', N'0964892487')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (23, CAST(191380000 AS Decimal(18, 0)), CAST(N'2023-07-06' AS Date), NULL, N'Hoàn thành', N'Hà nội', N'093223112')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (24, CAST(161760000 AS Decimal(18, 0)), CAST(N'2023-07-06' AS Date), NULL, N'Hoàn thành', N'Hà Nội', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (25, CAST(161760000 AS Decimal(18, 0)), CAST(N'2023-08-06' AS Date), 8, N'Hoàn thành', N'Hà Nội', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (26, CAST(43050000 AS Decimal(18, 0)), CAST(N'2023-08-06' AS Date), 1, N'Hoàn thành', N'Hồ Chí Minh', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (27, CAST(48780000 AS Decimal(18, 0)), CAST(N'2023-08-06' AS Date), NULL, N'Hoàn thành', N'Hải dương', N'0120391230')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (28, CAST(115440000 AS Decimal(18, 0)), CAST(N'2023-08-06' AS Date), NULL, N'Hoàn thành', N'Hà Nội', N'0982745114')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (29, CAST(87980000 AS Decimal(18, 0)), CAST(N'2023-09-09' AS Date), 1, N'Hủy', N'Hà nội', N'0982745114')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (30, CAST(64950000 AS Decimal(18, 0)), CAST(N'2023-09-09' AS Date), NULL, N'Hoàn thành', N'Hà Nội', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (31, CAST(1366024466 AS Decimal(18, 0)), CAST(N'2023-09-09' AS Date), NULL, N'Hủy', N'Cao Bằng', N'012321323')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (32, CAST(1366024466 AS Decimal(18, 0)), CAST(N'2021-09-10' AS Date), NULL, N'Hủy', N'Cao Bằng', N'01123213123')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (33, CAST(1366024466 AS Decimal(18, 0)), CAST(N'2021-10-10' AS Date), NULL, N'Hoàn thành', N'Cao Bằng', N'01123213123')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (34, CAST(1366024466 AS Decimal(18, 0)), CAST(N'2021-11-10' AS Date), NULL, N'Hoàn thành', N'Cao Bằng', N'01123213123')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (35, CAST(1366024466 AS Decimal(18, 0)), CAST(N'2021-01-10' AS Date), NULL, N'Hoàn thành', N'Cao Bằng', N'01123213123')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (36, CAST(1366024466 AS Decimal(18, 0)), CAST(N'2023-02-10' AS Date), NULL, N'Hoàn thành', N'Cao Bằng', N'01123213123')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (37, CAST(179960000 AS Decimal(18, 0)), CAST(N'2023-09-10' AS Date), NULL, N'Hoàn thành', N'hải phòng', N'01123213123')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (38, CAST(257753233 AS Decimal(18, 0)), CAST(N'2023-11-10' AS Date), 4, N'Hoàn thành', N'Phú quốc', N'0964892487')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (39, CAST(353753233 AS Decimal(18, 0)), CAST(N'2023-12-10' AS Date), NULL, N'Hoàn thành', N'Thái bình', N'0969792742')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (40, CAST(437943233 AS Decimal(18, 0)), CAST(N'2024-03-10' AS Date), 6, N'Hoàn thành', N'Hải dương', N'0123456789')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (41, CAST(54000000 AS Decimal(18, 0)), CAST(N'2024-03-10' AS Date), 9, N'Hoàn thành', N'Phú Xuyên Hà nội', N'0365956093')
INSERT [dbo].[Shopping_cart] ([id], [total_prices], [date], [user_id], [staus_order], [address], [phone]) VALUES (42, CAST(72200000 AS Decimal(18, 0)), CAST(N'2024-03-10' AS Date), NULL, N'Đang liên hệ', N'bình định', N'0969792742')
SET IDENTITY_INSERT [dbo].[Shopping_cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Shopping_cart_item] ON 

INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (2, 1, 53, CAST(54490000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (3, 1, 42, CAST(13490000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (4, 1, 44, CAST(21690000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (5, 1, 5, CAST(16860000 AS Decimal(18, 0)), 2)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (6, 3, 4, CAST(20890000 AS Decimal(18, 0)), 2)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (7, 1, 2, CAST(16000000 AS Decimal(18, 0)), 2)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (8, 1, 54, CAST(18200000 AS Decimal(18, 0)), 2)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (9, 1, 57, CAST(26990000 AS Decimal(18, 0)), 2)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (10, 2, 4, CAST(20890000 AS Decimal(18, 0)), 3)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (11, 1, 22, CAST(22000000 AS Decimal(18, 0)), 3)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (12, 2, 4, CAST(20890000 AS Decimal(18, 0)), 4)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (13, 1, 22, CAST(22000000 AS Decimal(18, 0)), 4)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (14, 2, 4, CAST(20890000 AS Decimal(18, 0)), 5)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (15, 1, 22, CAST(22000000 AS Decimal(18, 0)), 5)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (16, 1, 88, CAST(380000 AS Decimal(18, 0)), 5)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (17, 2, 4, CAST(20890000 AS Decimal(18, 0)), 6)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (18, 7, 22, CAST(22000000 AS Decimal(18, 0)), 6)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (19, 2, 88, CAST(380000 AS Decimal(18, 0)), 6)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (20, 2, 4, CAST(20890000 AS Decimal(18, 0)), 7)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (21, 7, 22, CAST(22000000 AS Decimal(18, 0)), 7)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (22, 2, 88, CAST(380000 AS Decimal(18, 0)), 7)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (23, 1, 85, CAST(124500000 AS Decimal(18, 0)), 7)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (24, 2, 6, CAST(43990000 AS Decimal(18, 0)), 8)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (25, 2, 4, CAST(20890000 AS Decimal(18, 0)), 8)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (26, 2, 1, CAST(27000000 AS Decimal(18, 0)), 8)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (27, 1, 86, CAST(10990000 AS Decimal(18, 0)), 8)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (28, 1, 74, CAST(16990000 AS Decimal(18, 0)), 8)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (29, 1, 21, CAST(21490000 AS Decimal(18, 0)), 8)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (30, 2, 6, CAST(43990000 AS Decimal(18, 0)), 9)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (31, 2, 4, CAST(20890000 AS Decimal(18, 0)), 9)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (32, 2, 1, CAST(27000000 AS Decimal(18, 0)), 9)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (33, 1, 86, CAST(10990000 AS Decimal(18, 0)), 9)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (34, 1, 74, CAST(16990000 AS Decimal(18, 0)), 9)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (35, 1, 21, CAST(21490000 AS Decimal(18, 0)), 9)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (36, 2, 6, CAST(43990000 AS Decimal(18, 0)), 10)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (37, 2, 4, CAST(20890000 AS Decimal(18, 0)), 10)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (38, 2, 1, CAST(27000000 AS Decimal(18, 0)), 10)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (39, 1, 86, CAST(10990000 AS Decimal(18, 0)), 10)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (40, 1, 74, CAST(16990000 AS Decimal(18, 0)), 10)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (41, 1, 21, CAST(21490000 AS Decimal(18, 0)), 10)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (42, 2, 6, CAST(43990000 AS Decimal(18, 0)), 11)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (43, 2, 4, CAST(20890000 AS Decimal(18, 0)), 11)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (44, 2, 1, CAST(27000000 AS Decimal(18, 0)), 11)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (45, 1, 86, CAST(10990000 AS Decimal(18, 0)), 11)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (46, 1, 74, CAST(16990000 AS Decimal(18, 0)), 11)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (47, 1, 21, CAST(21490000 AS Decimal(18, 0)), 11)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (48, 2, 6, CAST(43990000 AS Decimal(18, 0)), 12)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (49, 2, 4, CAST(20890000 AS Decimal(18, 0)), 12)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (50, 2, 1, CAST(27000000 AS Decimal(18, 0)), 12)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (51, 1, 86, CAST(10990000 AS Decimal(18, 0)), 12)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (52, 1, 74, CAST(16990000 AS Decimal(18, 0)), 12)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (53, 1, 21, CAST(21490000 AS Decimal(18, 0)), 12)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (54, 2, 6, CAST(43990000 AS Decimal(18, 0)), 13)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (55, 2, 4, CAST(20890000 AS Decimal(18, 0)), 13)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (56, 2, 1, CAST(27000000 AS Decimal(18, 0)), 13)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (57, 1, 86, CAST(10990000 AS Decimal(18, 0)), 13)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (58, 1, 74, CAST(16990000 AS Decimal(18, 0)), 13)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (59, 1, 21, CAST(21490000 AS Decimal(18, 0)), 13)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (60, 2, 6, CAST(43990000 AS Decimal(18, 0)), 14)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (61, 2, 4, CAST(20890000 AS Decimal(18, 0)), 14)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (62, 2, 1, CAST(27000000 AS Decimal(18, 0)), 14)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (63, 1, 86, CAST(10990000 AS Decimal(18, 0)), 14)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (64, 1, 74, CAST(16990000 AS Decimal(18, 0)), 14)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (65, 1, 21, CAST(21490000 AS Decimal(18, 0)), 14)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (66, 2, 6, CAST(43990000 AS Decimal(18, 0)), 15)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (67, 2, 4, CAST(20890000 AS Decimal(18, 0)), 15)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (68, 2, 1, CAST(27000000 AS Decimal(18, 0)), 15)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (69, 1, 86, CAST(10990000 AS Decimal(18, 0)), 15)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (70, 1, 74, CAST(16990000 AS Decimal(18, 0)), 15)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (71, 1, 21, CAST(21490000 AS Decimal(18, 0)), 15)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (72, 1, 74, CAST(16990000 AS Decimal(18, 0)), 16)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (73, 1, 21, CAST(21490000 AS Decimal(18, 0)), 16)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (74, 1, 13, CAST(24390000 AS Decimal(18, 0)), 16)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (75, 1, 74, CAST(16990000 AS Decimal(18, 0)), 17)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (76, 1, 21, CAST(21490000 AS Decimal(18, 0)), 17)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (77, 1, 13, CAST(24390000 AS Decimal(18, 0)), 17)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (78, 1, 6, CAST(43990000 AS Decimal(18, 0)), 17)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (79, 1, 74, CAST(16990000 AS Decimal(18, 0)), 18)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (80, 1, 21, CAST(21490000 AS Decimal(18, 0)), 18)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (81, 1, 13, CAST(24390000 AS Decimal(18, 0)), 18)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (82, 1, 6, CAST(43990000 AS Decimal(18, 0)), 18)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (83, 1, 74, CAST(16990000 AS Decimal(18, 0)), 19)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (84, 1, 21, CAST(21490000 AS Decimal(18, 0)), 19)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (85, 4, 13, CAST(24390000 AS Decimal(18, 0)), 19)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (86, 3, 6, CAST(43990000 AS Decimal(18, 0)), 19)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (87, 1, 10, CAST(33690000 AS Decimal(18, 0)), 19)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (88, 1, 3, CAST(48990000 AS Decimal(18, 0)), 19)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (89, 2, 3, CAST(48990000 AS Decimal(18, 0)), 20)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (90, 1, 5, CAST(16860000 AS Decimal(18, 0)), 20)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (91, 1, 89, CAST(210000 AS Decimal(18, 0)), 20)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (92, 1, 15, CAST(20000000 AS Decimal(18, 0)), 20)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (93, 5, 15, CAST(20000000 AS Decimal(18, 0)), 21)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (94, 2, 41, CAST(20000000 AS Decimal(18, 0)), 21)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (95, 5, 15, CAST(20000000 AS Decimal(18, 0)), 22)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (96, 2, 41, CAST(20000000 AS Decimal(18, 0)), 22)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (97, 1, 13, CAST(24390000 AS Decimal(18, 0)), 22)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (98, 1, 57, CAST(26990000 AS Decimal(18, 0)), 22)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (99, 5, 15, CAST(20000000 AS Decimal(18, 0)), 23)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (100, 2, 41, CAST(20000000 AS Decimal(18, 0)), 23)
GO
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (101, 1, 13, CAST(24390000 AS Decimal(18, 0)), 23)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (102, 1, 57, CAST(26990000 AS Decimal(18, 0)), 23)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (103, 2, 6, CAST(43990000 AS Decimal(18, 0)), 24)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (104, 2, 2, CAST(16000000 AS Decimal(18, 0)), 24)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (105, 2, 4, CAST(20890000 AS Decimal(18, 0)), 24)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (106, 2, 6, CAST(43990000 AS Decimal(18, 0)), 25)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (107, 2, 2, CAST(16000000 AS Decimal(18, 0)), 25)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (108, 2, 4, CAST(20890000 AS Decimal(18, 0)), 25)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (109, 35, 121, CAST(1230000 AS Decimal(18, 0)), 26)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (110, 2, 13, CAST(24390000 AS Decimal(18, 0)), 27)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (111, 3, 2, CAST(16000000 AS Decimal(18, 0)), 28)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (112, 4, 5, CAST(16860000 AS Decimal(18, 0)), 28)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (113, 2, 6, CAST(43990000 AS Decimal(18, 0)), 29)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (114, 5, 25, CAST(12990000 AS Decimal(18, 0)), 30)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (115, 7, 25, CAST(12990000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (116, 1, 1, CAST(27000000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (117, 1, 2, CAST(16000000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (118, 1, 3, CAST(48990000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (119, 1, 4, CAST(20890000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (120, 1, 5, CAST(16860000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (121, 1, 6, CAST(43990000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (122, 1, 7, CAST(53990000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (123, 1, 29, CAST(12390000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (124, 2, 34, CAST(34900000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (125, 2, 45, CAST(12490000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (126, 2, 44, CAST(21690000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (127, 4, 49, CAST(29000000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (128, 5, 54, CAST(18200000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (129, 3, 57, CAST(26990000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (130, 2, 53, CAST(54490000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (131, 2, 40, CAST(200000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (132, 2, 74, CAST(16990000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (133, 2, 75, CAST(120990000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (134, 2, 76, CAST(107990000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (135, 2, 90, CAST(380000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (136, 3, 113, CAST(320000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (137, 2, 122, CAST(1323233 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (138, 2, 121, CAST(1230000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (139, 2, 120, CAST(299000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (140, 2, 119, CAST(55000 AS Decimal(18, 0)), 31)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (141, 7, 25, CAST(12990000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (142, 1, 1, CAST(27000000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (143, 1, 2, CAST(16000000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (144, 1, 3, CAST(48990000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (145, 1, 4, CAST(20890000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (146, 1, 5, CAST(16860000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (147, 1, 6, CAST(43990000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (148, 1, 7, CAST(53990000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (149, 1, 29, CAST(12390000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (150, 2, 34, CAST(34900000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (151, 2, 45, CAST(12490000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (152, 2, 44, CAST(21690000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (153, 4, 49, CAST(29000000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (154, 5, 54, CAST(18200000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (155, 3, 57, CAST(26990000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (156, 2, 53, CAST(54490000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (157, 2, 40, CAST(200000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (158, 2, 74, CAST(16990000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (159, 2, 75, CAST(120990000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (160, 2, 76, CAST(107990000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (161, 2, 90, CAST(380000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (162, 3, 113, CAST(320000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (163, 2, 122, CAST(1323233 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (164, 2, 121, CAST(1230000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (165, 2, 120, CAST(299000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (166, 2, 119, CAST(55000 AS Decimal(18, 0)), 32)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (167, 7, 25, CAST(12990000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (168, 1, 1, CAST(27000000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (169, 1, 2, CAST(16000000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (170, 1, 3, CAST(48990000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (171, 1, 4, CAST(20890000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (172, 1, 5, CAST(16860000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (173, 1, 6, CAST(43990000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (174, 1, 7, CAST(53990000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (175, 1, 29, CAST(12390000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (176, 2, 34, CAST(34900000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (177, 2, 45, CAST(12490000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (178, 2, 44, CAST(21690000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (179, 4, 49, CAST(29000000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (180, 5, 54, CAST(18200000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (181, 3, 57, CAST(26990000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (182, 2, 53, CAST(54490000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (183, 2, 40, CAST(200000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (184, 2, 74, CAST(16990000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (185, 2, 75, CAST(120990000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (186, 2, 76, CAST(107990000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (187, 2, 90, CAST(380000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (188, 3, 113, CAST(320000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (189, 2, 122, CAST(1323233 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (190, 2, 121, CAST(1230000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (191, 2, 120, CAST(299000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (192, 2, 119, CAST(55000 AS Decimal(18, 0)), 33)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (193, 7, 25, CAST(12990000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (194, 1, 1, CAST(27000000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (195, 1, 2, CAST(16000000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (196, 1, 3, CAST(48990000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (197, 1, 4, CAST(20890000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (198, 1, 5, CAST(16860000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (199, 1, 6, CAST(43990000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (200, 1, 7, CAST(53990000 AS Decimal(18, 0)), 34)
GO
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (201, 1, 29, CAST(12390000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (202, 2, 34, CAST(34900000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (203, 2, 45, CAST(12490000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (204, 2, 44, CAST(21690000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (205, 4, 49, CAST(29000000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (206, 5, 54, CAST(18200000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (207, 3, 57, CAST(26990000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (208, 2, 53, CAST(54490000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (209, 2, 40, CAST(200000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (210, 2, 74, CAST(16990000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (211, 2, 75, CAST(120990000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (212, 2, 76, CAST(107990000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (213, 2, 90, CAST(380000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (214, 3, 113, CAST(320000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (215, 2, 122, CAST(1323233 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (216, 2, 121, CAST(1230000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (217, 2, 120, CAST(299000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (218, 2, 119, CAST(55000 AS Decimal(18, 0)), 34)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (219, 7, 25, CAST(12990000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (220, 1, 1, CAST(27000000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (221, 1, 2, CAST(16000000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (222, 1, 3, CAST(48990000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (223, 1, 4, CAST(20890000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (224, 1, 5, CAST(16860000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (225, 1, 6, CAST(43990000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (226, 1, 7, CAST(53990000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (227, 1, 29, CAST(12390000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (228, 2, 34, CAST(34900000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (229, 2, 45, CAST(12490000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (230, 2, 44, CAST(21690000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (231, 4, 49, CAST(29000000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (232, 5, 54, CAST(18200000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (233, 3, 57, CAST(26990000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (234, 2, 53, CAST(54490000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (235, 2, 40, CAST(200000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (236, 2, 74, CAST(16990000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (237, 2, 75, CAST(120990000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (238, 2, 76, CAST(107990000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (239, 2, 90, CAST(380000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (240, 3, 113, CAST(320000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (241, 2, 122, CAST(1323233 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (242, 2, 121, CAST(1230000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (243, 2, 120, CAST(299000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (244, 2, 119, CAST(55000 AS Decimal(18, 0)), 35)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (245, 7, 25, CAST(12990000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (246, 1, 1, CAST(27000000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (247, 1, 2, CAST(16000000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (248, 1, 3, CAST(48990000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (249, 1, 4, CAST(20890000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (250, 1, 5, CAST(16860000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (251, 1, 6, CAST(43990000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (252, 1, 7, CAST(53990000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (253, 1, 29, CAST(12390000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (254, 2, 34, CAST(34900000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (255, 2, 45, CAST(12490000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (256, 2, 44, CAST(21690000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (257, 4, 49, CAST(29000000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (258, 5, 54, CAST(18200000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (259, 3, 57, CAST(26990000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (260, 2, 53, CAST(54490000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (261, 2, 40, CAST(200000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (262, 2, 74, CAST(16990000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (263, 2, 75, CAST(120990000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (264, 2, 76, CAST(107990000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (265, 2, 90, CAST(380000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (266, 3, 113, CAST(320000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (267, 2, 122, CAST(1323233 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (268, 2, 121, CAST(1230000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (269, 2, 120, CAST(299000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (270, 2, 119, CAST(55000 AS Decimal(18, 0)), 36)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (271, 4, 55, CAST(44990000 AS Decimal(18, 0)), 37)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (272, 4, 55, CAST(44990000 AS Decimal(18, 0)), 38)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (273, 1, 122, CAST(1323233 AS Decimal(18, 0)), 38)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (274, 3, 73, CAST(25490000 AS Decimal(18, 0)), 38)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (275, 4, 55, CAST(44990000 AS Decimal(18, 0)), 39)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (276, 1, 122, CAST(1323233 AS Decimal(18, 0)), 39)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (277, 3, 73, CAST(25490000 AS Decimal(18, 0)), 39)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (278, 4, 27, CAST(24000000 AS Decimal(18, 0)), 39)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (279, 4, 55, CAST(44990000 AS Decimal(18, 0)), 40)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (280, 1, 122, CAST(1323233 AS Decimal(18, 0)), 40)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (281, 3, 73, CAST(25490000 AS Decimal(18, 0)), 40)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (282, 4, 27, CAST(24000000 AS Decimal(18, 0)), 40)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (283, 1, 28, CAST(32990000 AS Decimal(18, 0)), 40)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (284, 2, 23, CAST(25600000 AS Decimal(18, 0)), 40)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (285, 1, 60, CAST(54000000 AS Decimal(18, 0)), 41)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (286, 1, 60, CAST(54000000 AS Decimal(18, 0)), 42)
INSERT [dbo].[Shopping_cart_item] ([id], [quantity], [product_id], [price], [shopping_cart_id]) VALUES (287, 1, 54, CAST(18200000 AS Decimal(18, 0)), 42)
SET IDENTITY_INSERT [dbo].[Shopping_cart_item] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [first_name], [last_name], [email], [pass], [role], [phone], [img]) VALUES (1, N'Anh', N'Nguyễn Việt', N'hezz281103@gmail.com', N'1', 1, N'0982745114', N'uploads/z5203566723132_fb3ba16b62e65d4b48c54ea1edaa88fb.jpg')
INSERT [dbo].[Users] ([id], [first_name], [last_name], [email], [pass], [role], [phone], [img]) VALUES (2, N'Anh', N'Nguyễn', N'anhnguyen123', N'na567890', 1, N'0969792742', N'uploads/z5203566687066_0a4301be1f35f9dc475b4c4e9af275a6.jpg')
INSERT [dbo].[Users] ([id], [first_name], [last_name], [email], [pass], [role], [phone], [img]) VALUES (3, N'Hà', N'Nguyễn Thị', N'haXinhGai@gmail.com', N'thuha3112', 1, N'0964892487', N'uploads/female.png')
INSERT [dbo].[Users] ([id], [first_name], [last_name], [email], [pass], [role], [phone], [img]) VALUES (4, N'Hà', N'Nguyễn', N'haXinhGai1@gmail.com', N'1', 1, N'0964892487', N'uploads/326655_history_icon.png')
INSERT [dbo].[Users] ([id], [first_name], [last_name], [email], [pass], [role], [phone], [img]) VALUES (6, N'trang', N'pham', N'trang@gmail.com', N'1', 1, N'0123456789', N'uploads/Free Photo _ Laptop.jpg')
INSERT [dbo].[Users] ([id], [first_name], [last_name], [email], [pass], [role], [phone], [img]) VALUES (7, N'trang', N'thong minh', N'trang1@gmail.com', N'1', 1, N'012344566', N'uploads/male.png')
INSERT [dbo].[Users] ([id], [first_name], [last_name], [email], [pass], [role], [phone], [img]) VALUES (8, N'Sơn', N'Lê', N'truongson19062004@gmail.com', N'1', 0, N'0969792742', N'uploads/b928e5429d6347dd81e39e4e0df2d25a.png')
INSERT [dbo].[Users] ([id], [first_name], [last_name], [email], [pass], [role], [phone], [img]) VALUES (9, N'Nhung', N'Lê Thị', N'nhung@gmail.com', N'1', 1, N'0365956093', N'uploads/z5203566687066_0a4301be1f35f9dc475b4c4e9af275a6.jpg')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__product__4D94879B] FOREIGN KEY([product_category_id])
REFERENCES [dbo].[Product_category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__product__4D94879B]
GO
ALTER TABLE [dbo].[Shopping_cart]  WITH CHECK ADD  CONSTRAINT [FK_Shopping_cart_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Shopping_cart] CHECK CONSTRAINT [FK_Shopping_cart_Users]
GO
ALTER TABLE [dbo].[Shopping_cart_item]  WITH CHECK ADD  CONSTRAINT [FK__Shopping___produ__66603565] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Shopping_cart_item] CHECK CONSTRAINT [FK__Shopping___produ__66603565]
GO
ALTER TABLE [dbo].[Shopping_cart_item]  WITH CHECK ADD  CONSTRAINT [FK_Shopping_cart_item_Shopping_cart] FOREIGN KEY([shopping_cart_id])
REFERENCES [dbo].[Shopping_cart] ([id])
GO
ALTER TABLE [dbo].[Shopping_cart_item] CHECK CONSTRAINT [FK_Shopping_cart_item_Shopping_cart]
GO
