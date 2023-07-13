USE [master]
GO
/****** Object:  Database [LalosCars]    Script Date: 10/07/2023 05:01:53 p. m. ******/
CREATE DATABASE [LalosCars]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LalosCars', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LalosCars.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LalosCars_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LalosCars_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LalosCars] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LalosCars].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LalosCars] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LalosCars] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LalosCars] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LalosCars] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LalosCars] SET ARITHABORT OFF 
GO
ALTER DATABASE [LalosCars] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LalosCars] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LalosCars] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LalosCars] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LalosCars] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LalosCars] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LalosCars] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LalosCars] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LalosCars] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LalosCars] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LalosCars] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LalosCars] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LalosCars] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LalosCars] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LalosCars] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LalosCars] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LalosCars] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LalosCars] SET RECOVERY FULL 
GO
ALTER DATABASE [LalosCars] SET  MULTI_USER 
GO
ALTER DATABASE [LalosCars] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LalosCars] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LalosCars] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LalosCars] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LalosCars] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LalosCars] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LalosCars', N'ON'
GO
ALTER DATABASE [LalosCars] SET QUERY_STORE = ON
GO
ALTER DATABASE [LalosCars] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LalosCars]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 10/07/2023 05:01:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 10/07/2023 05:01:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
	[fecha_nacimiento] [date] NULL,
	[sexo] [varchar](2) NULL,
	[usuario] [varchar](40) NULL,
	[contraseña] [varbinary](max) NULL,
 CONSTRAINT [PK__cliente__677F38F52219E77F] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coche]    Script Date: 10/07/2023 05:01:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coche](
	[id_coche] [int] IDENTITY(1,1) NOT NULL,
	[matricula] [varchar](25) NULL,
	[marca] [varchar](25) NULL,
	[modelo] [varchar](25) NULL,
	[color] [varchar](25) NULL,
	[precio] [decimal](10, 2) NULL,
	[id_concesionario] [int] NOT NULL,
	[id_categoria] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_coche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[concesionario]    Script Date: 10/07/2023 05:01:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[concesionario](
	[id_concesionario] [int] IDENTITY(1,1) NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[telefono] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_concesionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contacto]    Script Date: 10/07/2023 05:01:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contacto](
	[id_contacto] [int] IDENTITY(1,1) NOT NULL,
	[telefono] [varchar](25) NULL,
	[mail] [varchar](50) NULL,
	[id_cliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_revision]    Script Date: 10/07/2023 05:01:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_revision](
	[id_detalle_revision] [int] IDENTITY(1,1) NOT NULL,
	[id_revision] [int] NOT NULL,
	[nombre] [varchar](125) NULL,
	[costo] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle_revision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direccion]    Script Date: 10/07/2023 05:01:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direccion](
	[id_direccion] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](50) NULL,
	[ciudad] [varchar](50) NULL,
	[calle] [varchar](50) NULL,
	[numero] [varchar](10) NULL,
	[id_cliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 10/07/2023 05:01:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[fecha_nacimiento] [date] NULL,
	[sexo] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 10/07/2023 05:01:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[telefono] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[revision]    Script Date: 10/07/2023 05:01:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[revision](
	[id_revision] [int] IDENTITY(1,1) NOT NULL,
	[id_coche] [int] NOT NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_revision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 10/07/2023 05:01:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[id_coche] [int] NOT NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categoria] ON 
GO
INSERT [dbo].[categoria] ([id_categoria], [nombre]) VALUES (4, N'sd')
GO
SET IDENTITY_INSERT [dbo].[categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 
GO
INSERT [dbo].[cliente] ([id_cliente], [nombre], [fecha_nacimiento], [sexo], [usuario], [contraseña]) VALUES (5, N'string', CAST(N'2023-06-30' AS Date), N's', N'string', 0x62)
GO
INSERT [dbo].[cliente] ([id_cliente], [nombre], [fecha_nacimiento], [sexo], [usuario], [contraseña]) VALUES (1002, N'a', CAST(N'2003-12-12' AS Date), N'a', N'asd', 0x617364)
GO
INSERT [dbo].[cliente] ([id_cliente], [nombre], [fecha_nacimiento], [sexo], [usuario], [contraseña]) VALUES (1006, N'string', CAST(N'2023-07-07' AS Date), N'sg', N'sg', 0x737472696E67)
GO
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[coche] ON 
GO
INSERT [dbo].[coche] ([id_coche], [matricula], [marca], [modelo], [color], [precio], [id_concesionario], [id_categoria]) VALUES (1006, N'string', N'string', N'string', N'string', CAST(0.00 AS Decimal(10, 2)), 6, 4)
GO
SET IDENTITY_INSERT [dbo].[coche] OFF
GO
SET IDENTITY_INSERT [dbo].[concesionario] ON 
GO
INSERT [dbo].[concesionario] ([id_concesionario], [id_proveedor], [nombre], [telefono]) VALUES (6, 2, N'string', N'string')
GO
SET IDENTITY_INSERT [dbo].[concesionario] OFF
GO
SET IDENTITY_INSERT [dbo].[contacto] ON 
GO
INSERT [dbo].[contacto] ([id_contacto], [telefono], [mail], [id_cliente]) VALUES (4, N'string', N'string', 5)
GO
SET IDENTITY_INSERT [dbo].[contacto] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_revision] ON 
GO
INSERT [dbo].[detalle_revision] ([id_detalle_revision], [id_revision], [nombre], [costo]) VALUES (2, 1, N'string', CAST(0.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[detalle_revision] OFF
GO
SET IDENTITY_INSERT [dbo].[empleado] ON 
GO
INSERT [dbo].[empleado] ([id_empleado], [nombre], [fecha_nacimiento], [sexo]) VALUES (1003, N'string', CAST(N'2023-07-07' AS Date), N's')
GO
SET IDENTITY_INSERT [dbo].[empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[proveedor] ON 
GO
INSERT [dbo].[proveedor] ([id_proveedor], [nombre], [telefono]) VALUES (2, N'1', N'1')
GO
INSERT [dbo].[proveedor] ([id_proveedor], [nombre], [telefono]) VALUES (1003, N'string', N'string')
GO
SET IDENTITY_INSERT [dbo].[proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[revision] ON 
GO
INSERT [dbo].[revision] ([id_revision], [id_coche], [fecha]) VALUES (1, 3, CAST(N'2023-07-07' AS Date))
GO
SET IDENTITY_INSERT [dbo].[revision] OFF
GO
ALTER TABLE [dbo].[coche]  WITH CHECK ADD  CONSTRAINT [FK__coche__id_catego__4222D4EF] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[coche] CHECK CONSTRAINT [FK__coche__id_catego__4222D4EF]
GO
ALTER TABLE [dbo].[coche]  WITH CHECK ADD  CONSTRAINT [FK__coche__id_conces__412EB0B6] FOREIGN KEY([id_concesionario])
REFERENCES [dbo].[concesionario] ([id_concesionario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[coche] CHECK CONSTRAINT [FK__coche__id_conces__412EB0B6]
GO
ALTER TABLE [dbo].[concesionario]  WITH CHECK ADD  CONSTRAINT [FK__concesion__id_pr__398D8EEE] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[concesionario] CHECK CONSTRAINT [FK__concesion__id_pr__398D8EEE]
GO
ALTER TABLE [dbo].[contacto]  WITH CHECK ADD  CONSTRAINT [FK__contacto__id_cli__4BAC3F29] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[contacto] CHECK CONSTRAINT [FK__contacto__id_cli__4BAC3F29]
GO
ALTER TABLE [dbo].[detalle_revision]  WITH CHECK ADD FOREIGN KEY([id_revision])
REFERENCES [dbo].[revision] ([id_revision])
GO
ALTER TABLE [dbo].[direccion]  WITH CHECK ADD  CONSTRAINT [FK__direccion__id_cl__4E88ABD4] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[direccion] CHECK CONSTRAINT [FK__direccion__id_cl__4E88ABD4]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK__venta__id_client__534D60F1] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK__venta__id_client__534D60F1]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK__venta__id_coche__5535A963] FOREIGN KEY([id_coche])
REFERENCES [dbo].[coche] ([id_coche])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK__venta__id_coche__5535A963]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK__venta__id_emplea__5441852A] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[empleado] ([id_empleado])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK__venta__id_emplea__5441852A]
GO
USE [master]
GO
ALTER DATABASE [LalosCars] SET  READ_WRITE 
GO
