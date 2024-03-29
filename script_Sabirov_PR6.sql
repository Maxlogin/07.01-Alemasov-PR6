USE [master]
GO
/****** Object:  Database [back_test_Sabirov]    Script Date: 17.03.2024 21:59:13 ******/
CREATE DATABASE [back_test_Sabirov]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user21', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\back_test_Sabirov.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'user21_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\back_test_Sabirov_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [back_test_Sabirov] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [back_test_Sabirov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [back_test_Sabirov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET ARITHABORT OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [back_test_Sabirov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [back_test_Sabirov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [back_test_Sabirov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [back_test_Sabirov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET RECOVERY FULL 
GO
ALTER DATABASE [back_test_Sabirov] SET  MULTI_USER 
GO
ALTER DATABASE [back_test_Sabirov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [back_test_Sabirov] SET DB_CHAINING OFF 
GO
ALTER DATABASE [back_test_Sabirov] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [back_test_Sabirov] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [back_test_Sabirov] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [back_test_Sabirov] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'back_test_Sabirov', N'ON'
GO
ALTER DATABASE [back_test_Sabirov] SET QUERY_STORE = OFF
GO
USE [back_test_Sabirov]
GO
/****** Object:  Table [dbo].[klients]    Script Date: 17.03.2024 21:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klients](
	[id_klient] [int] IDENTITY(1,1) NOT NULL,
	[f] [nvarchar](30) NULL,
	[i] [nvarchar](30) NULL,
	[o] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_klient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marshruts]    Script Date: 17.03.2024 21:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marshruts](
	[id_marshruta] [int] IDENTITY(1,1) NOT NULL,
	[strana_naznach] [int] NULL,
	[chel_poezdki] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marshruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[poezdki]    Script Date: 17.03.2024 21:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[poezdki](
	[id_poezdki] [int] IDENTITY(1,1) NOT NULL,
	[id_chely] [int] NULL,
	[id_klienta] [int] NULL,
	[id_marshruta] [int] NULL,
	[id_telephona_klienta] [int] NULL,
	[data_nach_pribiv] [date] NULL,
	[data_oconch_pribiv] [date] NULL,
	[Kol_vo_day_pribiv] [char](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_poezdki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 17.03.2024 21:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        TOP (100) PERCENT dbo.poezdki.id_poezdki, dbo.klients.f, dbo.klients.i, dbo.klients.o, dbo.marshruts.strana_naznach
FROM            dbo.klients INNER JOIN
                         dbo.poezdki ON dbo.klients.id_klient = dbo.poezdki.id_klienta INNER JOIN
                         dbo.marshruts ON dbo.poezdki.id_marshruta = dbo.marshruts.id_marshruta
WHERE        (dbo.klients.o = N'Петрович')
ORDER BY dbo.klients.o
GO
/****** Object:  View [dbo].[View_2]    Script Date: 17.03.2024 21:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.poezdki.id_poezdki, dbo.klients.f, dbo.klients.i, dbo.klients.o, dbo.marshruts.strana_naznach
FROM            dbo.klients INNER JOIN
                         dbo.poezdki ON dbo.klients.id_klient = dbo.poezdki.id_klienta INNER JOIN
                         dbo.marshruts ON dbo.poezdki.id_marshruta = dbo.marshruts.id_marshruta
WHERE        (dbo.marshruts.strana_naznach = 1)
GO
/****** Object:  Table [dbo].[cheli_poezdki]    Script Date: 17.03.2024 21:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cheli_poezdki](
	[id_chely] [int] IDENTITY(1,1) NOT NULL,
	[chel] [nvarchar](100) NULL,
	[stoimost_chely] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_chely] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[passports]    Script Date: 17.03.2024 21:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[passports](
	[id_passporta] [int] IDENTITY(1,1) NOT NULL,
	[id_klienta] [int] NULL,
	[passport] [char](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_passporta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Strana]    Script Date: 17.03.2024 21:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Strana](
	[id_strany] [int] IDENTITY(1,1) NOT NULL,
	[nazv_strany] [nvarchar](20) NULL,
	[stoimost_prebivaniya] [money] NULL,
	[stoimost_visa] [money] NULL,
	[stoimost_ts_uslug] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_strany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telephones]    Script Date: 17.03.2024 21:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telephones](
	[id_telephona] [int] IDENTITY(1,1) NOT NULL,
	[id_klienta] [int] NULL,
	[telephon] [char](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_telephona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[marshruts]  WITH CHECK ADD FOREIGN KEY([strana_naznach])
REFERENCES [dbo].[Strana] ([id_strany])
GO
ALTER TABLE [dbo].[passports]  WITH CHECK ADD FOREIGN KEY([id_klienta])
REFERENCES [dbo].[klients] ([id_klient])
GO
ALTER TABLE [dbo].[poezdki]  WITH CHECK ADD FOREIGN KEY([id_chely])
REFERENCES [dbo].[cheli_poezdki] ([id_chely])
GO
ALTER TABLE [dbo].[poezdki]  WITH CHECK ADD FOREIGN KEY([id_klienta])
REFERENCES [dbo].[klients] ([id_klient])
GO
ALTER TABLE [dbo].[poezdki]  WITH CHECK ADD FOREIGN KEY([id_marshruta])
REFERENCES [dbo].[marshruts] ([id_marshruta])
GO
ALTER TABLE [dbo].[poezdki]  WITH CHECK ADD FOREIGN KEY([id_telephona_klienta])
REFERENCES [dbo].[telephones] ([id_telephona])
GO
ALTER TABLE [dbo].[telephones]  WITH CHECK ADD FOREIGN KEY([id_klienta])
REFERENCES [dbo].[klients] ([id_klient])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "klients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "marshruts"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 119
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "poezdki"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "klients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "marshruts"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 119
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "poezdki"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
USE [master]
GO
ALTER DATABASE [back_test_Sabirov] SET  READ_WRITE 
GO
