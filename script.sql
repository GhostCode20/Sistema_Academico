USE [master]
GO
/****** Object:  Database [db_sisAcademico]    Script Date: 5/09/2023 7:45:47 a. m. ******/
CREATE DATABASE [db_sisAcademico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_sisAcademico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_sisAcademico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_sisAcademico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_sisAcademico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_sisAcademico] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_sisAcademico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_sisAcademico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_sisAcademico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_sisAcademico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_sisAcademico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_sisAcademico] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_sisAcademico] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_sisAcademico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_sisAcademico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_sisAcademico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_sisAcademico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_sisAcademico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_sisAcademico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_sisAcademico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_sisAcademico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_sisAcademico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_sisAcademico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_sisAcademico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_sisAcademico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_sisAcademico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_sisAcademico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_sisAcademico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_sisAcademico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_sisAcademico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_sisAcademico] SET  MULTI_USER 
GO
ALTER DATABASE [db_sisAcademico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_sisAcademico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_sisAcademico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_sisAcademico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_sisAcademico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_sisAcademico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_sisAcademico] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_sisAcademico] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_sisAcademico]
GO
/****** Object:  Table [dbo].[cursos]    Script Date: 5/09/2023 7:45:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cursos](
	[Pkcodigo] [varchar](100) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[creditos] [varchar](100) NOT NULL,
	[Fk_codigo_tblestado] [varchar](100) NOT NULL,
	[valor] [float] NOT NULL,
	[contenidos] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_calificaciones]    Script Date: 5/09/2023 7:45:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_calificaciones](
	[Pkitem] [bigint] IDENTITY(1,1) NOT NULL,
	[Fk_item_tbl_det_tblmatriculas] [bigint] NOT NULL,
	[fecha] [date] NOT NULL,
	[nota] [varchar](100) NOT NULL,
	[concepto] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_det_tblmatriculas]    Script Date: 5/09/2023 7:45:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_det_tblmatriculas](
	[Pkitem] [bigint] IDENTITY(1,1) NOT NULL,
	[Fk_matricula_tblmatricula] [varchar](100) NOT NULL,
	[Fk_codigo_tblcursos] [varchar](100) NOT NULL,
	[Fk_codigo_tblestado] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estado]    Script Date: 5/09/2023 7:45:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estado](
	[pkcodigo] [varchar](100) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[nomenclatura] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estrato]    Script Date: 5/09/2023 7:45:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estrato](
	[Pkcodigo] [varchar](100) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[nomenclatura] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estudiantes]    Script Date: 5/09/2023 7:45:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estudiantes](
	[pkid] [varchar](100) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[contacto] [varchar](100) NOT NULL,
	[correo] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[Fk_codigo_tblestrato] [varchar](100) NOT NULL,
	[Fk_codigo_tblsexo] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pkid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_matriculas]    Script Date: 5/09/2023 7:45:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_matriculas](
	[Pkmatricula] [bigint] IDENTITY(1,1) NOT NULL,
	[Fk_id_tblestudiantes] [varchar](100) NOT NULL,
	[fecha] [date] NOT NULL,
	[subtotal] [float] NOT NULL,
	[iva] [float] NOT NULL,
	[total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkmatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sexo]    Script Date: 5/09/2023 7:45:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sexo](
	[Pkcodigo] [varchar](100) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[nomenclatura] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cursos]  WITH CHECK ADD  CONSTRAINT [FK_cursos_tbl_estado] FOREIGN KEY([creditos])
REFERENCES [dbo].[tbl_estado] ([pkcodigo])
GO
ALTER TABLE [dbo].[cursos] CHECK CONSTRAINT [FK_cursos_tbl_estado]
GO
ALTER TABLE [dbo].[tbl_calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_calificaciones_tbl_det_tblmatriculas] FOREIGN KEY([Fk_item_tbl_det_tblmatriculas])
REFERENCES [dbo].[tbl_det_tblmatriculas] ([Pkitem])
GO
ALTER TABLE [dbo].[tbl_calificaciones] CHECK CONSTRAINT [FK_tbl_calificaciones_tbl_det_tblmatriculas]
GO
ALTER TABLE [dbo].[tbl_det_tblmatriculas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_tblmatriculas_cursos] FOREIGN KEY([Fk_codigo_tblcursos])
REFERENCES [dbo].[cursos] ([Pkcodigo])
GO
ALTER TABLE [dbo].[tbl_det_tblmatriculas] CHECK CONSTRAINT [FK_tbl_det_tblmatriculas_cursos]
GO
ALTER TABLE [dbo].[tbl_det_tblmatriculas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_tblmatriculas_cursos1] FOREIGN KEY([Fk_matricula_tblmatricula])
REFERENCES [dbo].[cursos] ([Pkcodigo])
GO
ALTER TABLE [dbo].[tbl_det_tblmatriculas] CHECK CONSTRAINT [FK_tbl_det_tblmatriculas_cursos1]
GO
ALTER TABLE [dbo].[tbl_estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_estudiantes_tbl_sexo] FOREIGN KEY([Fk_codigo_tblsexo])
REFERENCES [dbo].[tbl_sexo] ([Pkcodigo])
GO
ALTER TABLE [dbo].[tbl_estudiantes] CHECK CONSTRAINT [FK_tbl_estudiantes_tbl_sexo]
GO
ALTER TABLE [dbo].[tbl_estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_estudiantes_tbl_sexo1] FOREIGN KEY([nombre])
REFERENCES [dbo].[tbl_sexo] ([Pkcodigo])
GO
ALTER TABLE [dbo].[tbl_estudiantes] CHECK CONSTRAINT [FK_tbl_estudiantes_tbl_sexo1]
GO
ALTER TABLE [dbo].[tbl_matriculas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_matriculas_tbl_estudiantes] FOREIGN KEY([Fk_id_tblestudiantes])
REFERENCES [dbo].[tbl_estudiantes] ([pkid])
GO
ALTER TABLE [dbo].[tbl_matriculas] CHECK CONSTRAINT [FK_tbl_matriculas_tbl_estudiantes]
GO
USE [master]
GO
ALTER DATABASE [db_sisAcademico] SET  READ_WRITE 
GO
