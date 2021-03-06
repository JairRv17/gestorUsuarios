USE [master]
GO
/****** Object:  Database [test]    Script Date: 18/01/2022 23:57:35 ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\test.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\test_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
USE [test]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[login]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[login_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[cedula] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[login_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ss_disability]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss_disability](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Icon] [nvarchar](100) NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ss_disability] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ss_genre]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss_genre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Icon] [nvarchar](max) NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ss_genre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ss_hobby]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss_hobby](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ss_hobby] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ss_match]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss_match](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReceiverId] [int] NOT NULL,
	[IsMatch] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ss_match] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ss_message]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss_message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MatchId] [int] NOT NULL,
	[SenderId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ss_message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ss_person]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss_person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LasName] [nvarchar](100) NULL,
	[Image] [nvarchar](200) NULL,
	[About] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[GenreId] [int] NOT NULL,
	[InterestedId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ss_person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ss_person_disability]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss_person_disability](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[DisabilityId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ss_person_disability] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ss_person_hobby]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss_person_hobby](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[HobbyId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ss_person_hobby] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ss_role]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss_role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[IsAdmin] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ss_role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ss_user]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss_user](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ss_user] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ss_user_role]    Script Date: 18/01/2022 23:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ss_user_role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_ss_user_role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220114185910_MyFirstMigration', N'5.0.12')
GO
SET IDENTITY_INSERT [dbo].[login] ON 

GO
INSERT [dbo].[login] ([login_id], [nombre], [cedula]) VALUES (1, N'12345', N'926996059')
GO
SET IDENTITY_INSERT [dbo].[login] OFF
GO
SET IDENTITY_INSERT [dbo].[ss_disability] ON 

GO
INSERT [dbo].[ss_disability] ([Id], [Icon], [Name], [Description], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (1, N'0xe307', N'Auditiva', N'Auditiva', 1, N'', CAST(N'2022-01-14 15:04:31.7800000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_disability] ([Id], [Icon], [Name], [Description], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (2, N'0xe14d', N'Fisica', N'Fisica', 1, N'', CAST(N'2022-01-14 15:04:31.7800000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_disability] ([Id], [Icon], [Name], [Description], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (3, N'0xe6bd', N'Visual', N'Visual', 1, N'', CAST(N'2022-01-14 15:04:31.7830000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_disability] ([Id], [Icon], [Name], [Description], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (4, N'0xe6bd', N'PsicoSocial', N'PsicoSocial', 1, N'', CAST(N'2022-01-14 15:04:31.7830000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_disability] ([Id], [Icon], [Name], [Description], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (5, N'0xe6bd', N'Intelectual', N'Intelectual', 1, N'', CAST(N'2022-01-14 15:04:31.7830000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_disability] ([Id], [Icon], [Name], [Description], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (6, N'0xe6bd', N'Otro', N'Otro', 1, N'', CAST(N'2022-01-14 15:04:31.7830000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ss_disability] OFF
GO
SET IDENTITY_INSERT [dbo].[ss_genre] ON 

GO
INSERT [dbo].[ss_genre] ([Id], [Icon], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (1, NULL, N'Hombre', 1, N'', CAST(N'2022-01-14 15:05:02.3930000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_genre] ([Id], [Icon], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (2, NULL, N'Mujer', 1, N'', CAST(N'2022-01-14 15:05:02.3930000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_genre] ([Id], [Icon], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (3, NULL, N'Otros', 1, N'', CAST(N'2022-01-14 15:05:02.3930000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ss_genre] OFF
GO
SET IDENTITY_INSERT [dbo].[ss_hobby] ON 

GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (1, N'0xef1e', N'Fotografía', 1, N'', CAST(N'2022-01-14 15:05:08.4500000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (2, N'0xf37e', N'Compras', 1, N'', CAST(N'2022-01-14 15:05:08.4500000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (3, N'0xf1c7', N'Karaoke', 1, N'', CAST(N'2022-01-14 15:05:08.4500000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (4, N'0xf097', N'Cocina', 1, N'', CAST(N'2022-01-14 15:05:08.4500000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (5, N'0xf1fb', N'Musica', 1, N'', CAST(N'2022-01-14 15:05:08.4530000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (6, N'0xf1f3', N'Peliculas', 1, N'', CAST(N'2022-01-14 15:05:08.4530000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (7, N'0xf01b8', N'Beber', 1, N'', CAST(N'2022-01-14 15:05:08.4530000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (8, N'0xf48e', N'Juegos', 1, N'', CAST(N'2022-01-14 15:05:08.4530000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (9, N'0xf45f', N'Viajar', 1, N'', CAST(N'2022-01-14 15:05:08.4530000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (10, N'0xf0a8', N'Dibujar', 1, N'', CAST(N'2022-01-14 15:05:08.4530000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (11, N'0xe5e3', N'Deportes', 1, N'', CAST(N'2022-01-14 15:05:08.4530000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_hobby] ([Id], [Image], [Name], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (12, N'0xe784', N'Animales', 1, N'', CAST(N'2022-01-14 15:05:08.4530000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ss_hobby] OFF
GO
SET IDENTITY_INSERT [dbo].[ss_person] ON 

GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (11, 1, N'Angel ', N'Anastacio', N'', NULL, NULL, NULL, 1, 2, 1, N'', CAST(N'2022-01-14 15:05:13.3430000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (12, 2, N'Andres', N'Paredes', N'', NULL, NULL, NULL, 1, 1, 1, N'', CAST(N'2022-01-14 15:05:13.3430000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (13, 3, N'Jesse ', N'Rodriguez', N'', NULL, NULL, NULL, 1, 1, 1, N'', CAST(N'2022-01-14 15:05:13.3430000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (14, 4, N'Michael', N'Galarza', N'', NULL, NULL, NULL, 1, 1, 1, N'', CAST(N'2022-01-14 15:05:13.3430000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (15, 5, N'Tony  ', N'Salas', N'', NULL, NULL, NULL, 1, 1, 1, N'', CAST(N'2022-01-14 15:05:13.3430000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (16, 6, N'Daniela ', N'Espinoza', N'', NULL, NULL, NULL, 2, 1, 1, N'', CAST(N'2022-01-14 15:05:13.3470000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (17, 7, N'Maria ', N'Tigrero', N'', NULL, NULL, NULL, 2, 1, 1, N'', CAST(N'2022-01-14 15:05:13.3470000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (18, 8, N'Julia ', N'Miranda', N'', NULL, NULL, NULL, 2, 1, 1, N'', CAST(N'2022-01-14 15:05:13.3470000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (19, 9, N'Isabella', N'Briones', N'', NULL, NULL, NULL, 2, 1, 1, N'masanzaz', CAST(N'2022-01-14 15:05:13.3470000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (20, 10, N'Pedro ', N'Toscano', N'', NULL, NULL, NULL, 2, 1, 1, N'', CAST(N'2022-01-14 15:05:13.3470000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (21, 9, N'Isabella', N'Briones', N'', NULL, NULL, NULL, 2, 1, 1, N'', CAST(N'2022-01-14 15:05:57.1230000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_person] ([Id], [UserId], [FirstName], [LasName], [Image], [About], [City], [DateOfBirth], [GenreId], [InterestedId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (22, 2, N'Andres', N'Paredes', N'', NULL, NULL, NULL, 1, 1, 1, N'Angel', CAST(N'2022-01-14 15:31:27.3500000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ss_person] OFF
GO
SET IDENTITY_INSERT [dbo].[ss_role] ON 

GO
INSERT [dbo].[ss_role] ([Id], [Name], [Description], [IsAdmin], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (1, N'Admin', N'admin', 1, 1, N'', CAST(N'2022-01-14 15:04:23.9070000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_role] ([Id], [Name], [Description], [IsAdmin], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (2, N'Person', N'Person', 0, 1, N'', CAST(N'2022-01-14 15:04:23.9070000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ss_role] OFF
GO
SET IDENTITY_INSERT [dbo].[ss_user] ON 

GO
INSERT [dbo].[ss_user] ([Id], [Username], [Password], [Email], [PhoneNumber], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (1, N'', N'', N'', N'0984028599', 1, N'', CAST(N'2022-01-14 15:04:43.5130000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_user] ([Id], [Username], [Password], [Email], [PhoneNumber], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (2, N'', N'', N'thsrr10@gmail.com', N'', 1, N'', CAST(N'2022-01-14 15:04:43.5130000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_user] ([Id], [Username], [Password], [Email], [PhoneNumber], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (3, N'', N'', N'', N'0960051723', 1, N'', CAST(N'2022-01-14 15:04:43.5170000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_user] ([Id], [Username], [Password], [Email], [PhoneNumber], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (4, N'', N'', N'', N'0980791320', 1, N'', CAST(N'2022-01-14 15:04:43.5170000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_user] ([Id], [Username], [Password], [Email], [PhoneNumber], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (5, N'', N'', N'', N'0961123453', 1, N'', CAST(N'2022-01-14 15:04:43.5170000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_user] ([Id], [Username], [Password], [Email], [PhoneNumber], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (6, N'', N'', N'', N'0987765345', 1, N'', CAST(N'2022-01-14 15:04:43.5170000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_user] ([Id], [Username], [Password], [Email], [PhoneNumber], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (7, N'', N'', N'', N'097665342', 1, N'', CAST(N'2022-01-14 15:04:43.5170000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_user] ([Id], [Username], [Password], [Email], [PhoneNumber], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (8, N'', N'', N'', N'0976654212', 1, N'', CAST(N'2022-01-14 15:04:43.5170000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_user] ([Id], [Username], [Password], [Email], [PhoneNumber], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (9, N'', N'', N'', N'0986543452', 1, N'', CAST(N'2022-01-14 15:04:43.5170000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_user] ([Id], [Username], [Password], [Email], [PhoneNumber], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (10, N'', N'', N'', N'0956654234', 1, N'', CAST(N'2022-01-14 15:04:43.5170000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ss_user] OFF
GO
SET IDENTITY_INSERT [dbo].[ss_user_role] ON 

GO
INSERT [dbo].[ss_user_role] ([Id], [UserId], [RoleId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (1, 1, 2, 1, N'', CAST(N'2022-01-14 15:04:50.2000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ss_user_role] ([Id], [UserId], [RoleId], [IsActive], [CreatedBy], [CreatedAt], [ModifiedBy], [ModifiedAt]) VALUES (2, 2, 2, 1, N'', CAST(N'2022-01-14 15:04:50.2030000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ss_user_role] OFF
GO
/****** Object:  Index [IX_ss_match_ReceiverId]    Script Date: 18/01/2022 23:57:36 ******/
CREATE NONCLUSTERED INDEX [IX_ss_match_ReceiverId] ON [dbo].[ss_match]
(
	[ReceiverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ss_match_SenderId]    Script Date: 18/01/2022 23:57:36 ******/
CREATE NONCLUSTERED INDEX [IX_ss_match_SenderId] ON [dbo].[ss_match]
(
	[SenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ss_message_MatchId]    Script Date: 18/01/2022 23:57:36 ******/
CREATE NONCLUSTERED INDEX [IX_ss_message_MatchId] ON [dbo].[ss_message]
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ss_person_GenreId]    Script Date: 18/01/2022 23:57:36 ******/
CREATE NONCLUSTERED INDEX [IX_ss_person_GenreId] ON [dbo].[ss_person]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ss_person_UserId]    Script Date: 18/01/2022 23:57:36 ******/
CREATE NONCLUSTERED INDEX [IX_ss_person_UserId] ON [dbo].[ss_person]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ss_person_disability_DisabilityId]    Script Date: 18/01/2022 23:57:36 ******/
CREATE NONCLUSTERED INDEX [IX_ss_person_disability_DisabilityId] ON [dbo].[ss_person_disability]
(
	[DisabilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ss_person_disability_PersonId]    Script Date: 18/01/2022 23:57:36 ******/
CREATE NONCLUSTERED INDEX [IX_ss_person_disability_PersonId] ON [dbo].[ss_person_disability]
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ss_person_hobby_HobbyId]    Script Date: 18/01/2022 23:57:36 ******/
CREATE NONCLUSTERED INDEX [IX_ss_person_hobby_HobbyId] ON [dbo].[ss_person_hobby]
(
	[HobbyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ss_person_hobby_PersonId]    Script Date: 18/01/2022 23:57:36 ******/
CREATE NONCLUSTERED INDEX [IX_ss_person_hobby_PersonId] ON [dbo].[ss_person_hobby]
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ss_user_role_RoleId]    Script Date: 18/01/2022 23:57:36 ******/
CREATE NONCLUSTERED INDEX [IX_ss_user_role_RoleId] ON [dbo].[ss_user_role]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ss_user_role_UserId]    Script Date: 18/01/2022 23:57:36 ******/
CREATE NONCLUSTERED INDEX [IX_ss_user_role_UserId] ON [dbo].[ss_user_role]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ss_match]  WITH CHECK ADD  CONSTRAINT [FK_ss_match_ss_person_ReceiverId] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[ss_person] ([Id])
GO
ALTER TABLE [dbo].[ss_match] CHECK CONSTRAINT [FK_ss_match_ss_person_ReceiverId]
GO
ALTER TABLE [dbo].[ss_match]  WITH CHECK ADD  CONSTRAINT [FK_ss_match_ss_person_SenderId] FOREIGN KEY([SenderId])
REFERENCES [dbo].[ss_person] ([Id])
GO
ALTER TABLE [dbo].[ss_match] CHECK CONSTRAINT [FK_ss_match_ss_person_SenderId]
GO
ALTER TABLE [dbo].[ss_message]  WITH CHECK ADD  CONSTRAINT [FK_ss_message_ss_match_MatchId] FOREIGN KEY([MatchId])
REFERENCES [dbo].[ss_match] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ss_message] CHECK CONSTRAINT [FK_ss_message_ss_match_MatchId]
GO
ALTER TABLE [dbo].[ss_person]  WITH CHECK ADD  CONSTRAINT [FK_ss_person_ss_genre_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[ss_genre] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ss_person] CHECK CONSTRAINT [FK_ss_person_ss_genre_GenreId]
GO
ALTER TABLE [dbo].[ss_person]  WITH CHECK ADD  CONSTRAINT [FK_ss_person_ss_user_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[ss_user] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ss_person] CHECK CONSTRAINT [FK_ss_person_ss_user_UserId]
GO
ALTER TABLE [dbo].[ss_person_disability]  WITH CHECK ADD  CONSTRAINT [FK_ss_person_disability_ss_disability_DisabilityId] FOREIGN KEY([DisabilityId])
REFERENCES [dbo].[ss_disability] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ss_person_disability] CHECK CONSTRAINT [FK_ss_person_disability_ss_disability_DisabilityId]
GO
ALTER TABLE [dbo].[ss_person_disability]  WITH CHECK ADD  CONSTRAINT [FK_ss_person_disability_ss_person_PersonId] FOREIGN KEY([PersonId])
REFERENCES [dbo].[ss_person] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ss_person_disability] CHECK CONSTRAINT [FK_ss_person_disability_ss_person_PersonId]
GO
ALTER TABLE [dbo].[ss_person_hobby]  WITH CHECK ADD  CONSTRAINT [FK_ss_person_hobby_ss_hobby_HobbyId] FOREIGN KEY([HobbyId])
REFERENCES [dbo].[ss_hobby] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ss_person_hobby] CHECK CONSTRAINT [FK_ss_person_hobby_ss_hobby_HobbyId]
GO
ALTER TABLE [dbo].[ss_person_hobby]  WITH CHECK ADD  CONSTRAINT [FK_ss_person_hobby_ss_person_PersonId] FOREIGN KEY([PersonId])
REFERENCES [dbo].[ss_person] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ss_person_hobby] CHECK CONSTRAINT [FK_ss_person_hobby_ss_person_PersonId]
GO
ALTER TABLE [dbo].[ss_user_role]  WITH CHECK ADD  CONSTRAINT [FK_ss_user_role_ss_role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[ss_role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ss_user_role] CHECK CONSTRAINT [FK_ss_user_role_ss_role_RoleId]
GO
ALTER TABLE [dbo].[ss_user_role]  WITH CHECK ADD  CONSTRAINT [FK_ss_user_role_ss_user_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[ss_user] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ss_user_role] CHECK CONSTRAINT [FK_ss_user_role_ss_user_UserId]
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
