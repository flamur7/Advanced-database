USE [master]
GO

/****** Object:  Database [LibMngSys] ******/
CREATE DATABASE [LibMngSys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibMngSys', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LibMngSys.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibMngSys_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LibMngSys_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LibMngSys] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibMngSys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibMngSys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibMngSys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibMngSys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibMngSys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibMngSys] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibMngSys] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibMngSys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibMngSys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibMngSys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibMngSys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibMngSys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibMngSys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibMngSys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibMngSys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibMngSys] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibMngSys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibMngSys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibMngSys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibMngSys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibMngSys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibMngSys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibMngSys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibMngSys] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibMngSys] SET  MULTI_USER 
GO
ALTER DATABASE [LibMngSys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibMngSys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibMngSys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibMngSys] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibMngSys] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibMngSys] SET QUERY_STORE = OFF
GO
USE [LibMngSys]
GO


-- ************************************** [dbo].[Roli]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roli]
(
 [Roli_ID]  int IDENTITY (1, 1) NOT NULL ,
 [Emertimi] varchar(50) NOT NULL ,


 CONSTRAINT [PK_Stafi] PRIMARY KEY CLUSTERED ([Roli_ID] ASC)
);
GO

INSERT [dbo].[Roli] ([Emertimi]) VALUES (N'Admini')
INSERT [dbo].[Roli] ([Emertimi]) VALUES (N'Useri')

-- ************************************** [dbo].[Autori]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autori]
(
 [Autori_ID] int IDENTITY (1, 1) NOT NULL ,
 [Emri]      varchar(50) NOT NULL ,


 CONSTRAINT [PK_Autori] PRIMARY KEY CLUSTERED ([Autori_ID] ASC)
);
GO

INSERT [dbo].[Autori] ([Emri]) VALUES (N'Fyodor Dostoevsky')
INSERT [dbo].[Autori] ([Emri]) VALUES (N'James Patterson')
INSERT [dbo].[Autori] ([Emri]) VALUES (N'David Baldacci')
SET IDENTITY_INSERT [dbo].[Autori] OFF

-- ************************************** [dbo].[Kategoria]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoria]
(
 [Kategoria_ID] int IDENTITY (1, 1) NOT NULL ,
 [Kategoria]    varchar(50) NOT NULL ,


 CONSTRAINT [PK_Kategoria] PRIMARY KEY CLUSTERED ([Kategoria_ID] ASC)
);
GO

INSERT [dbo].[Kategoria] ([Kategoria]) VALUES (N'Novel')
INSERT [dbo].[Kategoria] ([Kategoria]) VALUES (N'Mister')
INSERT [dbo].[Kategoria] ([Kategoria]) VALUES (N'Komedi')
INSERT [dbo].[Kategoria] ([Kategoria]) VALUES (N'Drame')
SET IDENTITY_INSERT [dbo].[Kategoria] OFF

-- ************************************** [dbo].[Libri]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libri]
(
 [Libri_ID]     int IDENTITY (1, 1) NOT NULL ,
 [Titulli]      varchar(250) NOT NULL ,
 [Qmimi]        int NOT NULL ,
 [ISBN]         varchar(50) NOT NULL ,
 [Nr_i_kopjeve] int NOT NULL ,
 [Autori_ID]    int NOT NULL ,
 [Kategoria_ID] int NOT NULL ,


 CONSTRAINT [PK_Libri] PRIMARY KEY CLUSTERED ([Libri_ID] ASC),
 CONSTRAINT [FK_Autori_Libri] FOREIGN KEY ([Autori_ID])  REFERENCES [dbo].[Autori]([Autori_ID]),
 CONSTRAINT [FK_Kategoria_Libri] FOREIGN KEY ([Kategoria_ID])  REFERENCES [dbo].[Kategoria]([Kategoria_ID])
);
GO

INSERT [dbo].[Libri] ([Titulli], [Qmimi], [ISBN], [Nr_i_kopjeve], [Autori_ID], [Kategoria_ID]) VALUES (N'Crime and Punishment', 10, '9780786105380', 15, 1, 1)
INSERT [dbo].[Libri] ([Titulli], [Qmimi], [ISBN], [Nr_i_kopjeve], [Autori_ID], [Kategoria_ID]) VALUES (N'Along Came a Spider', 12, '9781549168956', 8, 2, 2)
INSERT [dbo].[Libri] ([Titulli], [Qmimi], [ISBN], [Nr_i_kopjeve], [Autori_ID], [Kategoria_ID]) VALUES (N'Memory Man', 8, '9781478985570', 10, 3, 1)
SET IDENTITY_INSERT [dbo].[Libri] OFF

-- ************************************** [dbo].[Anetar]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anetar]
(
 [Anetar_ID]                   int IDENTITY (1, 1) NOT NULL ,
 [Emri]                        varchar(50) NOT NULL ,
 [Tel]                         int NULL ,
 [Data_e_skadimit_te_abonimit] date NOT NULL ,
 [Email]                       varchar(150) NOT NULL ,


 CONSTRAINT [PK_Anetar] PRIMARY KEY CLUSTERED ([Anetar_ID] ASC),
);
GO

INSERT [dbo].[Anetar] ([Emri], [Tel], [Data_e_skadimit_te_abonimit], [Email]) VALUES (N'Ramiz Hoxha', 045555643, CAST(N'2020-01-01' AS Date), 'ramiz.hoxha@ubt-uni.net')
INSERT [dbo].[Anetar] ([Emri], [Tel], [Data_e_skadimit_te_abonimit], [Email]) VALUES (N'Filan Fisteku', 044666452, CAST(N'2020-05-13' AS Date), 'filanfisteku@ubt-uni.net')
INSERT [dbo].[Anetar] ([Emri], [Tel], [Data_e_skadimit_te_abonimit], [Email]) VALUES (N'Jim Belushi', 045545666, CAST(N'2020-07-03' AS Date), 'jombelushi@gmail.com')
SET IDENTITY_INSERT [dbo].[Anetar] OFF

-- ************************************** [dbo].[Klienti]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienti]
(
 [Klienti_ID] int IDENTITY (1, 1) NOT NULL ,
 [Emri]       varchar(50) NOT NULL ,
 [Tel]        int NULL ,
 [Email]      varchar(150) NOT NULL ,


 CONSTRAINT [PK_Klienti] PRIMARY KEY CLUSTERED ([Klienti_ID] ASC),
);
GO

INSERT [dbo].[Klienti] ([Emri], [Tel], [Email]) VALUES (N'Shkurte Fejza', 045223335, N'Shkurte@gmail.com')
INSERT [dbo].[Klienti] ([Emri], [Tel], [Email]) VALUES (N'Naim Abazi', 049643563, N'Naim@gmail.com')
INSERT [dbo].[Klienti] ([Emri], [Tel], [Email]) VALUES (N'Linda Morina', 045664856, N'Linda@gmai.com')
SET IDENTITY_INSERT [dbo].[Klienti] OFF

-- ************************************** [dbo].[Shitjet]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shitjet]
(
 [Shitjet_ID]            int IDENTITY (1, 1) NOT NULL ,
 [Data_e_shitjes]   date NOT NULL ,
 [Libri_ID]         int NOT NULL ,
 [Klienti_ID]       int NULL,
 [Anetar_ID]		int NULL,

 CONSTRAINT [PK_Merr_Liber] PRIMARY KEY CLUSTERED ([Shitjet_ID] ASC),
 CONSTRAINT [FK_Anetar_Shitje] FOREIGN KEY ([Anetar_ID]) REFERENCES [dbo].[Anetar]([Anetar_ID]),
 CONSTRAINT [FK_Klienti_Shitje] FOREIGN KEY ([Klienti_ID]) REFERENCES [dbo].[Klienti]([Klienti_ID]),
 CONSTRAINT [FK_Libri_Shitje] FOREIGN KEY ([Libri_ID])  REFERENCES [dbo].[Libri]([Libri_ID])
);
GO

INSERT [dbo].[Shitjet] ([Data_e_shitjes], [Libri_ID], [Klienti_ID], [Anetar_ID]) VALUES (CAST(N'2019-07-03' AS Date), 1, NULL, 2)
INSERT [dbo].[Shitjet] ([Data_e_shitjes], [Libri_ID], [Klienti_ID], [Anetar_ID]) VALUES (CAST(N'2019-06-03' AS Date), 2, 1, NULL)
INSERT [dbo].[Shitjet] ([Data_e_shitjes], [Libri_ID], [Klienti_ID], [Anetar_ID]) VALUES (CAST(N'2019-05-03' AS Date), 3, 3, NULL)
SET IDENTITY_INSERT [dbo].[Shitjet] OFF

-- ************************************** [dbo].[Punetori]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Punetori]
(
 [Punetori_ID] int IDENTITY (1, 1) NOT NULL ,
 [Emri]        varchar(50) NOT NULL ,
 [Paga]        int NOT NULL ,
 [Roli_ID]     int NOT NULL ,
 [Username]    varchar(50) NOT NULL ,
 [Password]    varchar(550) NOT NULL ,


 CONSTRAINT [PK_Punetori] PRIMARY KEY CLUSTERED ([Punetori_ID] ASC),
 CONSTRAINT [FK_Roli_Punetori] FOREIGN KEY ([Roli_ID])  REFERENCES [dbo].[Roli]([Roli_ID])
);
GO

INSERT [dbo].[Punetori] ([Emri], [Paga], [Roli_ID], [Username], [Password]) VALUES (N'Erjon', 400, 1, 'erjon.fanaj', 'admin')
INSERT [dbo].[Punetori] ([Emri], [Paga], [Roli_ID], [Username], [Password]) VALUES (N'Flamur', 400, 1, 'flamur.gashi', 'admin')
INSERT [dbo].[Punetori] ([Emri], [Paga], [Roli_ID], [Username], [Password]) VALUES (N'Esma', 400, 1, 'esmakrasniqi', 'admin')
INSERT [dbo].[Punetori] ([Emri], [Paga], [Roli_ID], [Username], [Password]) VALUES (N'Lot', 400, 1, 'lotkyqyku', 'admin')
INSERT [dbo].[Punetori] ([Emri], [Paga], [Roli_ID], [Username], [Password]) VALUES (N'Puntor', 400, 2, 'user', 'user')
INSERT [dbo].[Punetori] ([Emri], [Paga], [Roli_ID], [Username], [Password]) VALUES (N'Admin', 450, 1, 'admin', 'admin')
