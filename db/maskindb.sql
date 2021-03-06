USE [master]
GO
/****** Object:  Database [maskinudlejningdb]    Script Date: 3/30/2016 12:53:32 PM ******/
CREATE DATABASE [maskinudlejningdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'maskinudlejningdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\maskinudlejningdb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'maskinudlejningdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\maskinudlejningdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [maskinudlejningdb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [maskinudlejningdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [maskinudlejningdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [maskinudlejningdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [maskinudlejningdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [maskinudlejningdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [maskinudlejningdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [maskinudlejningdb] SET  MULTI_USER 
GO
ALTER DATABASE [maskinudlejningdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [maskinudlejningdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [maskinudlejningdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [maskinudlejningdb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [maskinudlejningdb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [maskinudlejningdb]
GO
/****** Object:  Table [dbo].[cmsContent]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContent](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[contentType] [int] NOT NULL,
 CONSTRAINT [PK_cmsContent] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png'),
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0'),
	[allowAtRoot] [bit] NOT NULL CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentVersion]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[VersionId] [uniqueidentifier] NOT NULL,
	[VersionDate] [datetime] NOT NULL CONSTRAINT [DF_cmsContentVersion_VersionDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentXml]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentXml](
	[nodeId] [int] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataType]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cmsDataType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataTypePreValues]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataTypePreValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datatypeNodeId] [int] NOT NULL,
	[value] [ntext] NULL,
	[sortorder] [int] NOT NULL,
	[alias] [nvarchar](50) NULL,
 CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocument]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[documentUser] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[releaseDate] [datetime] NULL,
	[expireDate] [datetime] NULL,
	[updateDate] [datetime] NOT NULL CONSTRAINT [DF_cmsDocument_updateDate]  DEFAULT (getdate()),
	[templateId] [int] NULL,
	[newest] [bit] NOT NULL CONSTRAINT [DF_cmsDocument_newest]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsDocument] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[macroUseInEditor] [bit] NOT NULL CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0'),
	[macroRefreshRate] [int] NOT NULL CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0'),
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroScriptType] [nvarchar](255) NULL,
	[macroScriptAssembly] [nvarchar](255) NULL,
	[macroXSLT] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1'),
	[macroCachePersonalized] [bit] NOT NULL CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0'),
	[macroDontRender] [bit] NOT NULL CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0'),
	[macroPython] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0'),
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPreviewXml]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPreviewXml](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyData]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contentNodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NULL,
	[propertytypeid] [int] NOT NULL,
	[dataInt] [int] NULL,
	[dataDecimal] [decimal](38, 6) NULL,
	[dataDate] [datetime] NULL,
	[dataNvarchar] [nvarchar](500) NULL,
	[dataNtext] [ntext] NULL,
 CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0'),
	[mandatory] [bit] NOT NULL CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0'),
	[validationRegExp] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
	[UniqueID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()),
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()),
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsStylesheet]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsStylesheet](
	[nodeId] [int] NOT NULL,
	[filename] [nvarchar](100) NOT NULL,
	[content] [ntext] NULL,
 CONSTRAINT [PK_cmsStylesheet] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsStylesheetProperty]    Script Date: 3/30/2016 12:53:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsStylesheetProperty](
	[nodeId] [int] NOT NULL,
	[stylesheetPropertyEditor] [bit] NULL,
	[stylesheetPropertyAlias] [nvarchar](50) NULL,
	[stylesheetPropertyValue] [nvarchar](400) NULL,
 CONSTRAINT [PK_cmsStylesheetProperty] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[group] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTask]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTask](
	[closed] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskTypeId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[parentUserId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_cmsTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTaskType]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTaskType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsTaskType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
	[design] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDeployChecksum]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDeployChecksum](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entityType] [nvarchar](32) NOT NULL,
	[entityGuid] [uniqueidentifier] NULL,
	[entityPath] [nvarchar](256) NULL,
	[localChecksum] [nvarchar](32) NOT NULL,
	[compositeChecksum] [nvarchar](32) NULL,
 CONSTRAINT [PK_umbracoDeployChecksum] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDeployDependency]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDeployDependency](
	[sourceId] [int] NOT NULL,
	[targetId] [int] NOT NULL,
	[mode] [int] NOT NULL,
 CONSTRAINT [PK_umbracoDeployDependency] PRIMARY KEY CLUSTERED 
(
	[sourceId] ASC,
	[targetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDomains]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](10) NULL,
	[languageCultureName] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[NodeId] [int] NOT NULL,
	[Datestamp] [datetime] NOT NULL CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()),
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoMigration]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMigration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoMigration_createDate]  DEFAULT (getdate()),
	[version] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_umbracoMigration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trashed] [bit] NOT NULL CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0'),
	[parentID] [int] NOT NULL,
	[nodeUser] [int] NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_umbracoNode_uniqueID]  DEFAULT (newid()),
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_structure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NOT NULL,
	[childObjectType] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()),
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0'),
	[userNoConsole] [bit] NOT NULL CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0'),
	[userType] [int] NOT NULL,
	[startStructureID] [int] NOT NULL,
	[startMediaID] [int] NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2app]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2app](
	[user] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user2app] PRIMARY KEY CLUSTERED 
(
	[user] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodePermission]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodePermission](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserType]    Script Date: 3/30/2016 12:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userTypeAlias] [nvarchar](50) NULL,
	[userTypeName] [nvarchar](255) NOT NULL,
	[userTypeDefaultPermissions] [nvarchar](50) NULL,
 CONSTRAINT [PK_umbracoUserType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cmsContent] ON 

INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (1, 1050, 1049)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (3, 1055, 1031)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (4, 1056, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (5, 1057, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (6, 1058, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (7, 1059, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (8, 1060, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (9, 1061, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (10, 1062, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (11, 1063, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (12, 1064, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (13, 1065, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (14, 1066, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (15, 1067, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (16, 1068, 1031)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (17, 1069, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (18, 1070, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (19, 1080, 1073)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (20, 1085, 1083)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (21, 1087, 1073)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (22, 1095, 1088)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (23, 1096, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (24, 1100, 1099)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (25, 1102, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (26, 1106, 1105)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (27, 1113, 1108)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (28, 1114, 1112)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (29, 1115, 1031)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (30, 1116, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (31, 1117, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (32, 1120, 1119)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (33, 1122, 1112)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (34, 1123, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (35, 1124, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (36, 1125, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (37, 1126, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (38, 1127, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (39, 1128, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (40, 1129, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (41, 1130, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (42, 1131, 1089)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (43, 1132, 1112)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (44, 1133, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (45, 1134, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (46, 1135, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (47, 1136, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (48, 1137, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (49, 1138, 1112)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (50, 1139, 1112)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (51, 1140, 1112)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (52, 1144, 1141)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (53, 1145, 1143)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (54, 1146, 1143)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (55, 1147, 1143)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (56, 1148, 1143)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (57, 1149, 1143)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (58, 1150, 1143)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (59, 1151, 1143)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (60, 1152, 1143)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (61, 1153, 1143)
SET IDENTITY_INSERT [dbo].[cmsContent] OFF
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (535, 1049, N'home', N'icon-globe-inverted-america', N'folder.png', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (538, 1073, N'textPage', N'icon-newspaper-alt', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (539, 1083, N'contact', N'icon-old-phone', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (540, 1088, N'sortimentFolder', N'icon-folder', N'folder.png', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (541, 1089, N'sortiment', N'icon-files', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (542, 1099, N'sortimentPage', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (543, 1105, N'cart', N'icon-multiple-credit-cards', N'folder.png', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (544, 1108, N'usedMachinesFolder', N'icon-folders', N'folder.png', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (545, 1112, N'usedMachines', N'icon-shipping', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (546, 1119, N'machinePage', N'icon-truck', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (547, 1141, N'sponsorFolder', N'icon-folder-outline', N'folder.png', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (548, 1143, N'sponsor', N'icon-yen-bag', N'folder.png', NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1088, 1089)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1108, 1112)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1141, 1143)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1049, 1073, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1049, 1083, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1049, 1099, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1049, 1119, 3)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1088, 1089, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1108, 1112, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1141, 1143, 0)
SET IDENTITY_INSERT [dbo].[cmsContentVersion] ON 

INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1, 1050, N'8794b475-f3af-4745-ab69-5725ef4eb3d3', CAST(N'2016-03-23 12:37:47.373' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (3, 1050, N'7d194761-4a18-47bc-8886-dadb4ce6b29f', CAST(N'2016-03-23 13:30:28.550' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (6, 1055, N'59e22d08-8266-4f4f-970d-8c55b086d7e4', CAST(N'2016-03-23 14:31:32.660' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (7, 1056, N'f53590e5-77e7-4e31-87f8-c955ebb5184d', CAST(N'2016-03-23 14:37:12.480' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (8, 1057, N'3c787a9b-70b0-44a1-9308-ee4d2222c281', CAST(N'2016-03-23 14:37:31.750' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (9, 1058, N'ab6de0f2-ca9d-4410-8dad-12c6bcf215d7', CAST(N'2016-03-23 14:31:51.840' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (10, 1059, N'ec2cc161-edb3-4b8b-b2a0-de748293c7f7', CAST(N'2016-03-23 14:31:51.950' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (11, 1060, N'db4b9084-8879-42a6-b4ed-8892ae94d991', CAST(N'2016-03-23 14:31:52.067' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (12, 1061, N'407c4ea1-fa61-46dc-8588-09ae3447d556', CAST(N'2016-03-23 14:31:52.173' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (13, 1062, N'e7a3cc07-656a-4edf-8950-8d2191d2d23b', CAST(N'2016-03-23 14:31:52.297' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (14, 1063, N'c1039c5f-9e51-4c39-b663-e8b8b904e76b', CAST(N'2016-03-23 14:31:52.387' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (15, 1064, N'18590cd0-bed7-44cf-bdb4-8eec0035e2ce', CAST(N'2016-03-23 14:31:52.490' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (16, 1065, N'6419b43a-c283-4ae9-a5ea-2d4e51f00981', CAST(N'2016-03-23 14:31:52.540' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (17, 1066, N'64176c75-8ccc-4007-a7d7-8a654c1208f4', CAST(N'2016-03-23 14:37:19.213' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (18, 1067, N'955e0db6-77be-4ec8-abd2-4cfa3edb59d7', CAST(N'2016-03-23 14:37:23.337' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (19, 1068, N'38fc5bed-f5e9-4f55-870e-f33df0b48b4d', CAST(N'2016-03-23 14:43:58.670' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (20, 1069, N'2463b1c7-ef0b-4252-b9be-360df92e15f0', CAST(N'2016-03-23 14:44:02.917' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (21, 1050, N'b44f5fe8-e3c2-4eda-b5d1-d323ded6c489', CAST(N'2016-03-23 14:44:14.520' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (22, 1070, N'72c100de-0013-4ed1-8187-47ae69e09534', CAST(N'2016-03-23 14:51:48.880' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (23, 1050, N'29a4a22a-0da2-40c7-a380-303e192733c7', CAST(N'2016-03-23 14:52:05.367' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (25, 1050, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', CAST(N'2016-03-24 11:55:14.957' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (26, 1080, N'524db0cf-69e2-491f-a390-f9333fb2207b', CAST(N'2016-03-24 12:01:40.480' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (27, 1080, N'1e5e6057-32a0-42f2-9b19-f433bc23ebfd', CAST(N'2016-03-24 12:03:04.070' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (28, 1080, N'a317dd7b-67f6-4749-a3a8-2f0bf5571712', CAST(N'2016-03-24 12:07:02.047' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (29, 1080, N'b45351b8-b4af-4717-aee2-6b681a79316b', CAST(N'2016-03-24 12:09:23.720' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (30, 1085, N'cecd8ad9-04c6-4442-a1f7-25b0126a8f41', CAST(N'2016-03-24 12:15:23.010' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (31, 1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', CAST(N'2016-03-24 12:15:34.460' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (32, 1085, N'a8674da5-05f0-400b-b3a4-e6dc6835d693', CAST(N'2016-03-24 12:17:55.673' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (33, 1085, N'1a10e7df-f26a-401f-9f93-f1dfa71610e6', CAST(N'2016-03-24 12:23:13.433' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (34, 1085, N'23adf3c0-1ba3-4e3e-a094-0f1fffd1551a', CAST(N'2016-03-24 12:25:06.180' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (35, 1087, N'fcf20686-871f-44ad-bd47-e6433331f087', CAST(N'2016-03-24 12:34:48.790' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (36, 1087, N'cfd4f9ac-8ae5-4b4d-a286-cd8195f4134b', CAST(N'2016-03-24 12:35:16.803' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (37, 1085, N'72425bac-5637-4492-b16d-ec56e3ea84c3', CAST(N'2016-03-24 12:35:16.820' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (38, 1087, N'8732a1d8-463b-4f02-8c2e-002e91fd54d0', CAST(N'2016-03-24 12:35:31.107' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (39, 1095, N'b13e8737-bff3-4962-9763-2cf8a4347be3', CAST(N'2016-03-24 13:09:49.173' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (40, 1096, N'480aae4d-cfbd-4395-8880-c17dc2f360fe', CAST(N'2016-03-24 12:47:19.513' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (41, 1100, N'521328a6-b9dc-4680-9629-78da1f237b05', CAST(N'2016-03-24 12:55:06.063' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (42, 1100, N'c62968f5-6dc9-4484-9f6c-d9385239e06a', CAST(N'2016-03-24 12:55:10.320' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (43, 1096, N'1311d56b-5427-4dd2-8544-96e546fc1fc2', CAST(N'2016-03-24 13:08:47.840' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (44, 1100, N'7436ccef-aab9-446d-bb38-560bec8a11ff', CAST(N'2016-03-24 13:08:44.330' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (45, 1100, N'6b7b8b9d-2b51-40bf-81c8-de831be3f991', CAST(N'2016-03-24 13:10:13.853' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (46, 1102, N'697be575-3464-4f1e-8de5-b3be752b965f', CAST(N'2016-03-27 00:41:56.547' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (47, 1106, N'3eadb9d0-0c79-4b92-82d1-aefe5dc82903', CAST(N'2016-03-24 13:48:22.967' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (48, 1100, N'0e315bb3-504f-4912-84f2-1b4eeceac7bf', CAST(N'2016-03-24 21:44:35.047' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (49, 1085, N'55af568e-0a54-4bde-9570-8dd990db27b7', CAST(N'2016-03-24 21:44:35.123' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (50, 1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', CAST(N'2016-03-25 13:51:54.790' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (51, 1113, N'fb850c38-0e79-473c-9ddb-581ec68609f5', CAST(N'2016-03-25 13:57:16.210' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (52, 1114, N'3c9fdd61-b62d-4066-82ce-795fd239cd25', CAST(N'2016-03-25 13:57:56.357' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (53, 1115, N'438b4a8b-cfc4-4168-bb04-f186b0037cd8', CAST(N'2016-03-30 09:03:42.867' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (54, 1116, N'e0f78e60-9d76-4168-affd-640fbd81c133', CAST(N'2016-03-25 13:58:22.527' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (55, 1117, N'dfd3af3d-9bd6-4915-a827-961a13ec76e7', CAST(N'2016-03-25 13:58:22.603' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (56, 1114, N'29a07277-18cd-4052-941b-2c73a663467f', CAST(N'2016-03-25 13:58:42.523' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (57, 1120, N'69ddae73-5f65-4cb3-939c-dfbd8a054b66', CAST(N'2016-03-25 14:01:08.337' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (58, 1120, N'c0ab798c-6360-4eba-9ee2-1a1e3a6d5495', CAST(N'2016-03-25 14:16:21.050' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (59, 1085, N'be732fb2-b9cf-48f3-a1d6-e825697db08e', CAST(N'2016-03-25 14:16:21.057' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (60, 1120, N'26899b41-8b6e-4ff9-a816-6315ae21a5d8', CAST(N'2016-03-25 14:16:42.650' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (61, 1080, N'64863fa7-6460-482e-b937-0915ec49d2b9', CAST(N'2016-03-25 14:16:42.660' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (62, 1087, N'a3d68398-d42a-4c75-b168-d1966a8ba7c5', CAST(N'2016-03-25 14:16:42.667' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (63, 1100, N'1a8b12f0-79c7-4411-8b02-ab07d120f45b', CAST(N'2016-03-25 14:16:42.677' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (64, 1114, N'fb2af695-0437-430f-8481-28fe2eaf1078', CAST(N'2016-03-26 23:20:00.493' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (65, 1122, N'2666c3de-acdd-44ae-9828-2e908b81d596', CAST(N'2016-03-26 23:41:26.243' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (66, 1080, N'eb70ddbe-ea8a-4c97-8f64-9710987e4cef', CAST(N'2016-03-27 15:17:14.877' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (67, 1080, N'821e7f53-c1e3-4359-ad06-f99045a7cc94', CAST(N'2016-03-27 15:18:36.997' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (68, 1080, N'd608935b-fdb6-42d2-92e5-9e4e5e84be8b', CAST(N'2016-03-27 15:18:48.197' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (69, 1123, N'952c5947-cd4b-4715-ad04-bb3cd5e1877d', CAST(N'2016-03-27 18:40:36.410' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (70, 1124, N'8382ab20-df0c-4161-9ce1-308c9394ce78', CAST(N'2016-03-27 18:41:53.847' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (71, 1125, N'54ceb80b-0f0d-4fc4-8b19-e8e7d4831438', CAST(N'2016-03-27 18:42:36.887' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (72, 1126, N'80ab6f18-b79d-4a0b-b705-60d5ad43ebe6', CAST(N'2016-03-27 18:43:19.673' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (73, 1127, N'c263cf0e-2f7f-4ae4-821d-75236fd22471', CAST(N'2016-03-27 18:46:49.910' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (74, 1128, N'148dedb5-7764-4dd4-abc9-ca07e813579f', CAST(N'2016-03-27 18:47:36.050' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (75, 1129, N'48ee86c4-c6bf-45be-8368-1f3f8b4c0674', CAST(N'2016-03-27 18:48:09.413' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (76, 1130, N'ceab5b72-b405-4fbf-984b-48fd5ac94a01', CAST(N'2016-03-27 18:48:46.713' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (77, 1131, N'd0771336-241f-4a0d-8706-ad3a9759a7a4', CAST(N'2016-03-27 18:49:41.960' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (78, 1132, N'1423a520-5b5a-40dc-a84d-8d66b3a83062', CAST(N'2016-03-30 09:03:05.327' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (79, 1133, N'073409fc-f110-4cb3-8b1b-cff22c7d2de3', CAST(N'2016-03-30 09:03:30.687' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (80, 1134, N'ba9139ac-c1d2-433c-b3f8-7a42ae4494a3', CAST(N'2016-03-30 09:03:32.613' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (81, 1135, N'f8a4642e-d1b8-4a99-a1b2-c1187c1c8281', CAST(N'2016-03-30 09:03:34.367' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (82, 1136, N'eceb5781-6bdb-405d-b9b6-3983af9dab2e', CAST(N'2016-03-30 09:03:36.497' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (83, 1137, N'e0cdcdb9-5111-4dd9-96b9-ab7732316148', CAST(N'2016-03-30 09:03:39.270' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (84, 1132, N'ec6b15fe-d8a8-40aa-841d-6b2edbbeda4b', CAST(N'2016-03-30 09:17:19.877' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (85, 1122, N'5f859c17-f84a-41d8-9459-0f4050b55f32', CAST(N'2016-03-30 09:31:20.433' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (86, 1114, N'ad9bbd91-1532-4540-a5e8-b0d012ec22e3', CAST(N'2016-03-30 09:31:57.497' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (87, 1114, N'51ffc8e9-5d52-4bae-b291-525118cca996', CAST(N'2016-03-30 09:32:07.673' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (88, 1114, N'33ea28ba-13ac-460c-8abe-83a005cb349a', CAST(N'2016-03-30 09:32:10.853' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1086, 1138, N'ad1894b5-3b84-4ec7-a371-f2d850f7ba91', CAST(N'2016-03-30 10:57:04.130' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1087, 1139, N'8dd94ea1-b231-44cd-bfe4-0430587649a8', CAST(N'2016-03-30 10:57:52.253' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1088, 1140, N'd4f2f415-5087-4186-91db-e7b812cd70c5', CAST(N'2016-03-30 11:28:07.913' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1089, 1144, N'24a159f3-49ec-4dca-b2a9-e7101e763c18', CAST(N'2016-03-30 11:39:22.507' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1090, 1145, N'9ed2f0b3-7fa3-432d-9823-df8cc4ef798a', CAST(N'2016-03-30 11:40:47.660' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1091, 1145, N'98ede9c2-9835-4f7a-b02e-98a247f0be86', CAST(N'2016-03-30 11:40:56.320' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1092, 1145, N'd2a85cb9-4000-4a1d-bbce-82abcd2224aa', CAST(N'2016-03-30 11:41:02.190' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1093, 1146, N'a7873891-9ffa-478a-8efe-10c87f5a4be2', CAST(N'2016-03-30 11:42:04.840' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1094, 1147, N'29310804-668c-4573-a4b3-9f357d55096e', CAST(N'2016-03-30 11:42:35.667' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1095, 1147, N'e4116194-4885-4ece-94c1-0c17d38c3577', CAST(N'2016-03-30 11:42:43.897' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1096, 1148, N'e0c94675-9518-4d3c-81a2-c0a4ded3a79d', CAST(N'2016-03-30 11:50:02.983' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1097, 1149, N'866e08e5-f650-45eb-a20c-4f07d242e8b9', CAST(N'2016-03-30 11:50:45.153' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1098, 1150, N'0227d70e-44c5-4532-9288-0e72b5c79b48', CAST(N'2016-03-30 12:07:13.193' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1099, 1151, N'6cdc4498-af4a-450a-937f-9b35928892c6', CAST(N'2016-03-30 12:07:56.253' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1100, 1152, N'16d9a48f-061f-440e-8a24-7ec948c0a8e4', CAST(N'2016-03-30 12:08:27.310' AS DateTime))
GO
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1101, 1153, N'664c1195-1fef-4fa5-b305-d6c253019baf', CAST(N'2016-03-30 12:08:57.807' AS DateTime))
SET IDENTITY_INSERT [dbo].[cmsContentVersion] OFF
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1050, N'<home id="1050" key="928e3d11-a505-4f45-99c9-69143333d1a9" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-03-23T12:37:47" updateDate="2016-03-25T13:51:54" nodeName="Forside" urlName="forside" path="-1,1050" isDoc="" nodeType="1049" creatorName="Cthian" writerName="Cthian" writerID="0" template="1048" nodeTypeAlias="home"><header><![CDATA[Maskinudlejning]]></header><text><![CDATA[<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>]]></text><logo>1070</logo><catalogPdf><![CDATA[/media/1015/tm_prisliste_2016_layout_1.pdf]]></catalogPdf><city><![CDATA[Tønder]]></city><zipCode>6270</zipCode><phoneNumber>21906161</phoneNumber><eMail><![CDATA[toendermaskinudlejning@mail.dk]]></eMail><companyName><![CDATA[Tønder Maskinudlejning]]></companyName><address><![CDATA[Hydrovej 4]]></address></home>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1055, N'<Folder id="1055" key="44c32224-346a-4332-a23c-f569ec6ea16b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-03-23T14:31:27" updateDate="2016-03-23T14:31:32" nodeName="Sponsors" urlName="sponsors" path="-1,1055" isDoc="" nodeType="1031" writerName="Cthian" writerID="0" version="59e22d08-8266-4f4f-970d-8c55b086d7e4" template="0" nodeTypeAlias="Folder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1057, N'<Image id="1057" key="3b8d9d11-31e4-4d4f-bd99-36bd986c4fbb" parentID="1055" level="2" creatorID="0" sortOrder="1" createDate="2016-03-23T14:31:51" updateDate="2016-03-23T14:37:31" nodeName="mask_badboy.jpg" urlName="mask_badboyjpg" path="-1,1055,1057" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="3c787a9b-70b0-44a1-9308-ee4d2222c281" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{
  "src": "/media/1002/mask_badboy.jpg",
  "focalPoint": {
    "left": 0.5,
    "top": 0.5
  }
}]]></umbracoFile><umbracoWidth><![CDATA[100]]></umbracoWidth><umbracoHeight><![CDATA[33]]></umbracoHeight><umbracoBytes><![CDATA[20832]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1058, N'<Image id="1058" key="785f4bad-860a-48d1-9d77-cbc6bec951c2" parentID="1055" level="2" creatorID="0" sortOrder="2" createDate="2016-03-23T14:31:51" updateDate="2016-03-23T14:31:51" nodeName="mask_clubcar.jpg" urlName="mask_clubcarjpg" path="-1,1055,1058" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="ab6de0f2-ca9d-4410-8dad-12c6bcf215d7" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1003/mask_clubcar.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[100]]></umbracoWidth><umbracoHeight><![CDATA[33]]></umbracoHeight><umbracoBytes><![CDATA[18235]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1059, N'<Image id="1059" key="23fc334f-8255-4661-a109-94e960aa549a" parentID="1055" level="2" creatorID="0" sortOrder="3" createDate="2016-03-23T14:31:51" updateDate="2016-03-23T14:31:51" nodeName="mask_iseki.jpg" urlName="mask_isekijpg" path="-1,1055,1059" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="ec2cc161-edb3-4b8b-b2a0-de748293c7f7" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1004/mask_iseki.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[100]]></umbracoWidth><umbracoHeight><![CDATA[33]]></umbracoHeight><umbracoBytes><![CDATA[17647]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1060, N'<Image id="1060" key="7b3f8180-ce93-4208-996b-94258be2a97b" parentID="1055" level="2" creatorID="0" sortOrder="4" createDate="2016-03-23T14:31:52" updateDate="2016-03-23T14:31:52" nodeName="mask_ventrac.jpg" urlName="mask_ventracjpg" path="-1,1055,1060" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="db4b9084-8879-42a6-b4ed-8892ae94d991" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1005/mask_ventrac.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[100]]></umbracoWidth><umbracoHeight><![CDATA[33]]></umbracoHeight><umbracoBytes><![CDATA[17042]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1061, N'<Image id="1061" key="213349c4-6023-4f98-bc0d-264ec38d3d33" parentID="1055" level="2" creatorID="0" sortOrder="5" createDate="2016-03-23T14:31:52" updateDate="2016-03-23T14:31:52" nodeName="mask_vitra.jpg" urlName="mask_vitrajpg" path="-1,1055,1061" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="407c4ea1-fa61-46dc-8588-09ae3447d556" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1006/mask_vitra.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[100]]></umbracoWidth><umbracoHeight><![CDATA[33]]></umbracoHeight><umbracoBytes><![CDATA[17956]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1062, N'<Image id="1062" key="a83c49f8-f430-4dae-8f15-3ab63254499a" parentID="1055" level="2" creatorID="0" sortOrder="6" createDate="2016-03-23T14:31:52" updateDate="2016-03-23T14:31:52" nodeName="stiga.jpg" urlName="stigajpg" path="-1,1055,1062" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="e7a3cc07-656a-4edf-8950-8d2191d2d23b" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1007/stiga.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[125]]></umbracoWidth><umbracoHeight><![CDATA[109]]></umbracoHeight><umbracoBytes><![CDATA[27764]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1063, N'<Image id="1063" key="caa65212-cd52-4710-902e-48d78da60c33" parentID="1055" level="2" creatorID="0" sortOrder="7" createDate="2016-03-23T14:31:52" updateDate="2016-03-23T14:31:52" nodeName="stiga_0.jpg" urlName="stiga_0jpg" path="-1,1055,1063" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="c1039c5f-9e51-4c39-b663-e8b8b904e76b" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1008/stiga_0.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[100]]></umbracoWidth><umbracoHeight><![CDATA[99]]></umbracoHeight><umbracoBytes><![CDATA[32145]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1064, N'<Image id="1064" key="b679f970-3d61-4189-91a5-e3661918a5ff" parentID="1055" level="2" creatorID="0" sortOrder="8" createDate="2016-03-23T14:31:52" updateDate="2016-03-23T14:31:52" nodeName="stihl_logo.jpg" urlName="stihl_logojpg" path="-1,1055,1064" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="18590cd0-bed7-44cf-bdb4-8eec0035e2ce" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1009/stihl_logo.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[695]]></umbracoWidth><umbracoHeight><![CDATA[344]]></umbracoHeight><umbracoBytes><![CDATA[36185]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1065, N'<Image id="1065" key="3b852a4a-e053-40de-9962-f820aa9348cb" parentID="1055" level="2" creatorID="0" sortOrder="9" createDate="2016-03-23T14:31:52" updateDate="2016-03-23T14:31:52" nodeName="viking.jpg" urlName="vikingjpg" path="-1,1055,1065" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="6419b43a-c283-4ae9-a5ea-2d4e51f00981" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1010/viking.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[100]]></umbracoWidth><umbracoHeight><![CDATA[33]]></umbracoHeight><umbracoBytes><![CDATA[17032]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1068, N'<Folder id="1068" key="c691f6d6-0508-44fe-86a0-77e228f4c720" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2016-03-23T14:43:58" updateDate="2016-03-23T14:43:58" nodeName="Images" urlName="images" path="-1,1068" isDoc="" nodeType="1031" writerName="Cthian" writerID="0" version="38fc5bed-f5e9-4f55-870e-f33df0b48b4d" template="0" nodeTypeAlias="Folder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1069, N'<Image id="1069" key="410c50b7-ddba-4096-abcd-593939846bef" parentID="1068" level="2" creatorID="0" sortOrder="0" createDate="2016-03-23T14:44:02" updateDate="2016-03-23T14:44:02" nodeName="maskinlogo.gif" urlName="maskinlogogif" path="-1,1068,1069" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="2463b1c7-ef0b-4252-b9be-360df92e15f0" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1013/maskinlogo.gif'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[150]]></umbracoWidth><umbracoHeight><![CDATA[100]]></umbracoHeight><umbracoBytes><![CDATA[3544]]></umbracoBytes><umbracoExtension><![CDATA[gif]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1070, N'<Image id="1070" key="2bef80fe-85f5-4da4-9567-2707c5ba6fa3" parentID="1068" level="2" creatorID="0" sortOrder="1" createDate="2016-03-23T14:51:48" updateDate="2016-03-23T14:51:48" nodeName="maskinlogosmall.gif" urlName="maskinlogosmallgif" path="-1,1068,1070" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="72c100de-0013-4ed1-8187-47ae69e09534" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1014/maskinlogosmall.gif'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[90]]></umbracoWidth><umbracoHeight><![CDATA[60]]></umbracoHeight><umbracoBytes><![CDATA[3622]]></umbracoBytes><umbracoExtension><![CDATA[gif]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1080, N'<textPage id="1080" key="b5fac220-2ca6-4598-bf21-b73592bc394d" parentID="1050" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T12:01:19" updateDate="2016-03-27T15:18:48" nodeName="Lejebetingelser" urlName="lejebetingelser" path="-1,1050,1080" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p style="text-align: left;"><strong>§1</strong></p>
<p style="text-align: left;"><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<p style="text-align: left;"><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p style="text-align: left;"> </p>
<p style="text-align: left;">Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<p style="text-align: left;"> </p>
<table border="0" cellspacing="1" cellpadding="1" width="519" height="97">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>
<p> </p>]]></text><header><![CDATA[Lejebetingelser]]></header></textPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1085, N'<contact id="1085" key="72162d3f-70db-45ab-83c2-be1c28ce544b" parentID="1050" level="2" creatorID="0" sortOrder="4" createDate="2016-03-24T12:15:23" updateDate="2016-03-25T14:16:21" nodeName="Kontakt" urlName="kontakt" path="-1,1050,1085" isDoc="" nodeType="1083" creatorName="Cthian" writerName="Cthian" writerID="0" template="1082" nodeTypeAlias="contact"><text><![CDATA[<p>Hydrovej 4<br />6270 Tønder</p>
<p>Mobil: 21 90 61 61<br />Fax: 73 72 61 61</p>]]></text><header><![CDATA[Kontakt Tønder Maskinudlejning]]></header><googleMapsUrl><![CDATA[https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2291.2578835765157!2d8.861346316078947!3d54.9510370610063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b4ba347411b76d%3A0x873874e245e174d3!2sT%C3%B8nder+Maskinudlejning+ApS!5e0!3m2!1sda!2sdk!4v1458818558630]]></googleMapsUrl></contact>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1087, N'<textPage id="1087" key="4bd29351-2bc8-4d10-b5a9-f1531cc486d0" parentID="1050" level="2" creatorID="0" sortOrder="2" createDate="2016-03-24T12:34:48" updateDate="2016-03-25T14:16:42" nodeName="Værksted" urlName="vaerksted" path="-1,1050,1087" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p> </p>
<p><br />Vi er autoriseret Stiga, Stihl, Viking, Ventrac, Vitra, Bad Boy, Iseki og Club Car forhandler og opdaterer os løbende med kurser for at sikre os den nyeste viden om de maskiner vi sælger og servicerer.<br />Dette sikrer, at du som kunde trygt kan overlade din maskine til os, da vi har den fornødne ekspertise og viden samt det rigtige værktøj.<br />Vores værksted klarer reparationer af alle mærker, både stort og småt - herudnder garantireparation - uanset hvor din maskine er købt.<br />Ved behov sender vi vores servicebil til kunden<br />Online adgang til vore leverandører af reservedele<br />Vi har altid et stort udvalg i nye og brugte maskiner på lager. Mangler du en ny eller brugt maskine til haven så kontakt os, vi er altid friske med et godt tilbud</p>
<p> </p>
<p><strong>Undgå bøvl og problemer......</strong></p>
<p> </p>
<p>Når du køber din havemaskine hos os er den naturligvis klargjort, justeret, samt påfyldt korrekt olie og benzin</p>
<p> </p>
<p><strong>Rigtige redskaber sælges kun af rigtige eksperter....</strong></p>
<p> </p>
<p>Vi har et bredt udvalg indenfor maskiner til skov, have og park</p>
<p>Stort værksted med faguddannet personale</p>
<p>Vores kundekreds er både private og erhvervskunder</p>
<p>Vi er stolte af de produkter vi sælger</p>
<p> </p>
<p>Kig ind og få en snak med os.</p>
<p>Vi rådgiver gerne hvis du er i tvivl, så du får den bedste maskine til netop dit behov</p>
<p>Vi skal leve af, at vores kunder er tilfredse, derfor vil du opleve en kompetent service og faglig vejledning hos os.</p>
<p> </p>]]></text><header><![CDATA[Værksted]]></header></textPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1095, N'<sortimentFolder id="1095" key="994f03f9-edca-4cac-9f76-1aa7ff742ee8" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2016-03-24T12:45:42" updateDate="2016-03-24T13:09:49" nodeName="Sortiment mappe" urlName="sortiment-mappe" path="-1,1095" isDoc="" nodeType="1088" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortimentFolder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1096, N'<sortiment id="1096" key="61d49829-f8ba-4a32-83ff-8e1d5f1b5ce5" parentID="1095" level="2" creatorID="0" sortOrder="0" createDate="2016-03-24T12:47:19" updateDate="2016-03-24T13:08:47" nodeName="Muldjord" urlName="muldjord" path="-1,1095,1096" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><price>0</price><description><![CDATA[Muldjord]]></description><partNo>2011</partNo><size><![CDATA[En god muldjord til opfyldning af haven]]></size><group><![CDATA[Sand og grus]]></group></sortiment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1100, N'<sortimentPage id="1100" key="5446a1d6-d9b8-4a3c-a79c-90053c1608b6" parentID="1050" level="2" creatorID="0" sortOrder="3" createDate="2016-03-24T12:55:06" updateDate="2016-03-25T14:16:42" nodeName="Sortiment" urlName="sortiment" path="-1,1050,1100" isDoc="" nodeType="1099" creatorName="Cthian" writerName="Cthian" writerID="0" template="1098" nodeTypeAlias="sortimentPage"><sortiment>1095</sortiment></sortimentPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1102, N'<sortiment id="1102" key="1429eced-fca7-410b-9e84-5629712bf857" parentID="1095" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T13:16:29" updateDate="2016-03-27T00:41:56" nodeName="Champignonmuld" urlName="champignonmuld" path="-1,1095,1102" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><price>0.68</price><description><![CDATA[Champignonmuld]]></description><partNo>2000</partNo><size><![CDATA[Superflot flis, så kan du spare hakkejernet. Læg flis i alle dine bede.]]></size><group><![CDATA[Sand og grus]]></group></sortiment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1106, N'<cart id="1106" key="27c88e62-7dfd-4f0c-98ab-4778d6d69732" parentID="-1" level="1" creatorID="0" sortOrder="2" createDate="2016-03-24T13:48:22" updateDate="2016-03-24T13:48:22" nodeName="Cart" urlName="cart" path="-1,1106" isDoc="" nodeType="1105" creatorName="Cthian" writerName="Cthian" writerID="0" template="1104" nodeTypeAlias="cart" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1113, N'<usedMachinesFolder id="1113" key="d05b8e05-d37c-4bd5-ac3d-bcbd3692e2d6" parentID="-1" level="1" creatorID="0" sortOrder="3" createDate="2016-03-25T13:57:16" updateDate="2016-03-25T13:57:16" nodeName="Maskine mappe" urlName="maskine-mappe" path="-1,1113" isDoc="" nodeType="1108" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachinesFolder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1114, N'<usedMachines id="1114" key="71023f1e-5fcb-48ab-b8c5-bfb0c70613ed" parentID="1113" level="2" creatorID="0" sortOrder="0" createDate="2016-03-25T13:57:56" updateDate="2016-03-30T09:32:10" nodeName="Maskine 1" urlName="maskine-1" path="-1,1113,1114" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1116</picture><machineName><![CDATA[Havetraktor]]></machineName><description><![CDATA[Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut.]]></description><price>2000</price><information><![CDATA[<p><span>Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut. Donec sit amet est ut mauris accumsan gravida at in orci. Vivamus dui urna, posuere sit amet nulla vel, venenatis ullamcorper lacus. Integer vel consequat turpis. Vestibulum quam nunc, varius in volutpat vitae, ullamcorper sed ante. Vestibulum nisl mi, iaculis a velit sit amet, accumsan dapibus sapien.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1115, N'<Folder id="1115" key="ccd69868-9816-4325-8ce0-cabd96506f8c" parentID="-1" level="1" creatorID="0" sortOrder="2" createDate="2016-03-25T13:58:09" updateDate="2016-03-30T09:03:42" nodeName="Maskiner" urlName="maskiner" path="-1,1115" isDoc="" nodeType="1031" writerName="Cthian" writerID="0" version="438b4a8b-cfc4-4168-bb04-f186b0037cd8" template="0" nodeTypeAlias="Folder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1116, N'<Image id="1116" key="f7b5e680-66d9-419a-bcf3-21ea0501d86c" parentID="1115" level="2" creatorID="0" sortOrder="0" createDate="2016-03-25T13:58:22" updateDate="2016-03-25T13:58:22" nodeName="bfcd0cbc730e20fa26d794cbffd22128.JPG" urlName="bfcd0cbc730e20fa26d794cbffd22128jpg" path="-1,1115,1116" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="e0f78e60-9d76-4168-affd-640fbd81c133" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1016/bfcd0cbc730e20fa26d794cbffd22128.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[480]]></umbracoWidth><umbracoHeight><![CDATA[320]]></umbracoHeight><umbracoBytes><![CDATA[57250]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1117, N'<Image id="1117" key="8b17d88c-fc15-43a8-a873-8230629a5616" parentID="1115" level="2" creatorID="0" sortOrder="1" createDate="2016-03-25T13:58:22" updateDate="2016-03-25T13:58:22" nodeName="gravemaskine.jpg" urlName="gravemaskinejpg" path="-1,1115,1117" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="dfd3af3d-9bd6-4915-a827-961a13ec76e7" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1017/gravemaskine.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[536]]></umbracoWidth><umbracoHeight><![CDATA[402]]></umbracoHeight><umbracoBytes><![CDATA[46773]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1120, N'<machinePage id="1120" key="ca29b84a-a62e-484b-b659-28eac61fbaeb" parentID="1050" level="2" creatorID="0" sortOrder="0" createDate="2016-03-25T14:01:08" updateDate="2016-03-25T14:16:42" nodeName="Brugte maskiner" urlName="brugte-maskiner" path="-1,1050,1120" isDoc="" nodeType="1119" creatorName="Cthian" writerName="Cthian" writerID="0" template="1118" nodeTypeAlias="machinePage"><machineFolder>1113</machineFolder></machinePage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1122, N'<usedMachines id="1122" key="89daa37f-2e77-4653-93d0-368b9b8e2516" parentID="1113" level="2" creatorID="0" sortOrder="1" createDate="2016-03-26T23:41:26" updateDate="2016-03-30T09:31:20" nodeName="Maskine 2" urlName="maskine-2" path="-1,1113,1122" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1117</picture><machineName><![CDATA[Gravemaskine]]></machineName><description><![CDATA[Phasellus pharetra erat eu tincidunt condimentum. Vestibulum interdum at nisi vitae sagittis. Quisque et porttitor tellus.]]></description><price>3000</price><information><![CDATA[<p><span>Phasellus pharetra erat eu tincidunt condimentum. Vestibulum interdum at nisi vitae sagittis. Quisque et porttitor tellus. Sed luctus, diam vitae sagittis molestie, purus ante consequat justo, nec porta lacus libero in orci. Aenean consectetur, urna ut lacinia viverra, magna magna consequat leo, nec maximus tortor tellus et enim. Curabitur quis elit aliquam, sagittis odio et, lobortis sapien. Nulla facilisi. Pellentesque auctor eu lacus sit amet blandit. Ut id imperdiet est.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1123, N'<sortiment id="1123" key="053121a3-befc-4185-9717-88a78c911810" parentID="1095" level="2" creatorID="0" sortOrder="2" createDate="2016-03-27T18:40:36" updateDate="2016-03-27T18:40:36" nodeName="Lift" urlName="lift" path="-1,1095,1123" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Lift]]></description><partNo>1</partNo><rentday>980</rentday><size><![CDATA[15,5 meter]]></size><group><![CDATA[Maskiner m.v.]]></group></sortiment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1124, N'<sortiment id="1124" key="271f8f43-5348-41b7-b45a-1064112fe0d9" parentID="1095" level="2" creatorID="0" sortOrder="3" createDate="2016-03-27T18:41:53" updateDate="2016-03-27T18:41:53" nodeName="Lift (1)" urlName="lift-1" path="-1,1095,1124" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Lift 18,30 meter]]></description><partNo>10</partNo><rentday>700</rentday><group><![CDATA[Maskiner m.v.]]></group></sortiment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1125, N'<sortiment id="1125" key="7ba41ee4-7fdb-4a21-9699-c0eccb588dc1" parentID="1095" level="2" creatorID="0" sortOrder="4" createDate="2016-03-27T18:42:36" updateDate="2016-03-27T18:42:36" nodeName="Betonhammer" urlName="betonhammer" path="-1,1095,1125" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Betonhammer inkl. 2 mejsler]]></description><partNo>1000</partNo><rentday>280</rentday><size><![CDATA[27 kg.]]></size><group><![CDATA[Maskiner m.v.]]></group><force><![CDATA[220 v.]]></force></sortiment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1126, N'<sortiment id="1126" key="2e80696a-de94-44ed-9cda-064f1bd0d9ec" parentID="1095" level="2" creatorID="0" sortOrder="5" createDate="2016-03-27T18:43:19" updateDate="2016-03-27T18:43:19" nodeName="Bygningshammer" urlName="bygningshammer" path="-1,1095,1126" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Bygningshammer inkl. 2 mejsler]]></description><partNo>1001</partNo><rentday>120</rentday><size><![CDATA[7 kg.]]></size><group><![CDATA[Maskiner m.v.]]></group><force><![CDATA[220 v.]]></force></sortiment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1127, N'<sortiment id="1127" key="c1c200b5-e3bb-44d4-9f9a-4884ad6c3216" parentID="1095" level="2" creatorID="0" sortOrder="6" createDate="2016-03-27T18:44:09" updateDate="2016-03-27T18:46:49" nodeName="Borehammer" urlName="borehammer" path="-1,1095,1127" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Borehammer]]></description><partNo>1003</partNo><rentday>120</rentday><size><![CDATA[5 kg.]]></size><group><![CDATA[Maskiner m.v.]]></group><force><![CDATA[220 v.]]></force></sortiment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1128, N'<sortiment id="1128" key="13cc1400-51e7-4268-97c8-d98e7d400234" parentID="1095" level="2" creatorID="0" sortOrder="7" createDate="2016-03-27T18:47:36" updateDate="2016-03-27T18:47:36" nodeName="Stillads" urlName="stillads" path="-1,1095,1128" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Stillads, ekstra højde per meter]]></description><partNo>1004</partNo><rentday>50</rentday><group><![CDATA[Maskiner m.v.]]></group></sortiment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1129, N'<sortiment id="1129" key="d449c278-6963-4c18-849a-9666572fa93c" parentID="1095" level="2" creatorID="0" sortOrder="8" createDate="2016-03-27T18:48:09" updateDate="2016-03-27T18:48:09" nodeName="Borekrone" urlName="borekrone" path="-1,1095,1129" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Borekrone u/maskine ekskl. forbrug]]></description><partNo>1006</partNo><rentday>80</rentday><group><![CDATA[Maskiner m.v.]]></group></sortiment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1130, N'<sortiment id="1130" key="b5684efa-64b7-43b2-b805-81cb76adba0f" parentID="1095" level="2" creatorID="0" sortOrder="9" createDate="2016-03-27T18:48:46" updateDate="2016-03-27T18:48:46" nodeName="Håndbetonsliber" urlName="haandbetonsliber" path="-1,1095,1130" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Håndbetonsliber excl. tilbehør og forbrug]]></description><partNo>1007</partNo><rentday>280</rentday><group><![CDATA[Maskiner m.v.]]></group><force><![CDATA[230 v.]]></force></sortiment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1131, N'<sortiment id="1131" key="0a0c5ace-a4e0-48cb-84e5-643bbb0eda6d" parentID="1095" level="2" creatorID="0" sortOrder="10" createDate="2016-03-27T18:49:41" updateDate="2016-03-27T18:49:41" nodeName="Asfalt- og betonskæremaskine" urlName="asfalt-og-betonskaeremaskine" path="-1,1095,1131" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Asfalt- og betonskæremaskine ekskl. forbrug]]></description><partNo>1008</partNo><rentday>380</rentday><size><![CDATA[Skæredybde 170 mm. klingediam. 500 mm. vand 27 lt.]]></size><group><![CDATA[Maskiner m.v.]]></group><force><![CDATA[Benzin]]></force></sortiment>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1132, N'<usedMachines id="1132" key="6b41b7f2-daaf-48a7-b3dd-c59c1590c652" parentID="1113" level="2" creatorID="0" sortOrder="2" createDate="2016-03-30T09:03:05" updateDate="2016-03-30T09:17:19" nodeName="Machine 3" urlName="machine-3" path="-1,1113,1132" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1133</picture><machineName><![CDATA[Bobcat]]></machineName><description><![CDATA[Nam ac erat massa. Nulla sit amet purus sit amet est placerat faucibus at vitae enim. Proin convallis orci odio, et suscipit nulla pharetra ut.]]></description><price>12000</price><information><![CDATA[<p><span>Nam ac erat massa. Nulla sit amet purus sit amet est placerat faucibus at vitae enim. Proin convallis orci odio, et suscipit nulla pharetra ut. Suspendisse vel ligula vel velit ultricies sagittis eget nec nulla. Proin commodo tortor quis euismod maximus. Quisque imperdiet tortor sed viverra eleifend. Duis vel varius odio, vel vehicula enim. Suspendisse maximus nunc vel lectus dignissim, et ultricies erat viverra. Phasellus sit amet luctus turpis. Vestibulum eros velit, condimentum et elit sed, vehicula condimentum libero. Donec tincidunt tempus semper. Quisque vitae placerat dolor. Donec turpis enim, vulputate id turpis eget, sollicitudin sollicitudin tortor. In semper varius mauris tristique auctor. Aliquam erat volutpat. Etiam eget ante sed urna auctor vehicula.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1133, N'<Image id="1133" key="a4cf8d80-8df8-4389-a782-b5690bf0be37" parentID="1115" level="2" creatorID="0" sortOrder="2" createDate="2016-03-30T09:03:30" updateDate="2016-03-30T09:03:30" nodeName="bobcat-300x224.jpg" urlName="bobcat-300x224jpg" path="-1,1115,1133" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="073409fc-f110-4cb3-8b1b-cff22c7d2de3" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1018/bobcat-300x224.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[300]]></umbracoWidth><umbracoHeight><![CDATA[224]]></umbracoHeight><umbracoBytes><![CDATA[22756]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1134, N'<Image id="1134" key="948ad02e-ffdf-4f26-b1ef-e680cfb5c441" parentID="1115" level="2" creatorID="0" sortOrder="3" createDate="2016-03-30T09:03:32" updateDate="2016-03-30T09:03:32" nodeName="28982_1_xl.jpg" urlName="28982_1_xljpg" path="-1,1115,1134" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="ba9139ac-c1d2-433c-b3f8-7a42ae4494a3" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1019/28982_1_xl.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[640]]></umbracoWidth><umbracoHeight><![CDATA[445]]></umbracoHeight><umbracoBytes><![CDATA[55569]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1135, N'<Image id="1135" key="18af6d05-21fe-4853-b024-339afff861e4" parentID="1115" level="2" creatorID="0" sortOrder="4" createDate="2016-03-30T09:03:34" updateDate="2016-03-30T09:03:34" nodeName="dsc00813_jpg-for-web-normal.jpg" urlName="dsc00813_jpg-for-web-normaljpg" path="-1,1115,1135" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="f8a4642e-d1b8-4a99-a1b2-c1187c1c8281" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1020/dsc00813_jpg-for-web-normal.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[320]]></umbracoWidth><umbracoHeight><![CDATA[240]]></umbracoHeight><umbracoBytes><![CDATA[18254]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1136, N'<Image id="1136" key="587c10c1-389a-4888-960e-5b3ea1c80fe5" parentID="1115" level="2" creatorID="0" sortOrder="5" createDate="2016-03-30T09:03:36" updateDate="2016-03-30T09:03:36" nodeName="IMG_8280.JPG" urlName="img_8280jpg" path="-1,1115,1136" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="eceb5781-6bdb-405d-b9b6-3983af9dab2e" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1021/img_8280.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[800]]></umbracoWidth><umbracoHeight><![CDATA[600]]></umbracoHeight><umbracoBytes><![CDATA[87077]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1137, N'<Image id="1137" key="3cf0c886-949e-4ad8-a3b3-dbf31aafdd58" parentID="1115" level="2" creatorID="0" sortOrder="6" createDate="2016-03-30T09:03:39" updateDate="2016-03-30T09:03:39" nodeName="Brugte-maskiner_Lamborghini-traktor.jpg" urlName="brugte-maskiner_lamborghini-traktorjpg" path="-1,1115,1137" isDoc="" nodeType="1032" writerName="Cthian" writerID="0" version="e0cdcdb9-5111-4dd9-96b9-ab7732316148" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{src: ''/media/1022/brugte-maskiner_lamborghini-traktor.jpg'', crops: []}]]></umbracoFile><umbracoWidth><![CDATA[800]]></umbracoWidth><umbracoHeight><![CDATA[500]]></umbracoHeight><umbracoBytes><![CDATA[106562]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1138, N'<usedMachines id="1138" key="7a449133-23f0-4607-af43-121012c998db" parentID="1113" level="2" creatorID="0" sortOrder="3" createDate="2016-03-30T10:57:04" updateDate="2016-03-30T10:57:04" nodeName="Maskine 4" urlName="maskine-4" path="-1,1113,1138" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1134</picture><machineName><![CDATA[Mejetærsker]]></machineName><description><![CDATA[Praesent fringilla sagittis nisl, a porttitor quam convallis non. Aenean fringilla interdum diam, vitae faucibus turpis lobortis semper.]]></description><price>30000</price><information><![CDATA[<p><span>Praesent fringilla sagittis nisl, a porttitor quam convallis non. Aenean fringilla interdum diam, vitae faucibus turpis lobortis semper. Nunc rutrum eleifend orci bibendum faucibus. Duis eget porttitor elit. Suspendisse auctor in quam laoreet pellentesque. Aliquam mattis lacus dapibus magna lacinia placerat. Vestibulum molestie, justo posuere euismod facilisis, sem tellus sollicitudin mauris, at dictum ante nunc id quam. Curabitur condimentum augue vel massa pretium, pharetra placerat urna elementum. Nulla facilisi. Sed odio purus, rhoncus ac cursus non, mattis sit amet ante.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1139, N'<usedMachines id="1139" key="b598c32c-c533-4db6-ba9f-35a62dc57b7e" parentID="1113" level="2" creatorID="0" sortOrder="4" createDate="2016-03-30T10:57:52" updateDate="2016-03-30T10:57:52" nodeName="Maskine 5" urlName="maskine-5" path="-1,1113,1139" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1135</picture><machineName><![CDATA[Fræser]]></machineName><description><![CDATA[enean eget libero elementum, vulputate tellus at, commodo sem. Cras id tristique turpis.]]></description><price>2000</price><information><![CDATA[<p><span>Aenean eget libero elementum, vulputate tellus at, commodo sem. Cras id tristique turpis. Vestibulum malesuada vestibulum euismod. Pellentesque consequat fermentum nisi vitae lobortis. Mauris condimentum consequat dolor vitae cursus. Nam efficitur urna et lacus posuere dignissim. Suspendisse sodales risus ut felis cursus, in tincidunt dui gravida. Morbi consectetur elit eget risus porta commodo. Suspendisse scelerisque purus sed libero ultrices feugiat. Donec mattis elit ac maximus maximus. In id condimentum orci. Donec blandit nisl augue, ut pellentesque orci mollis vel. Nam tristique dui ac nunc posuere, vitae facilisis libero blandit.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1140, N'<usedMachines id="1140" key="764d09aa-9ab8-411b-8a1c-c7b68b9e6544" parentID="1113" level="2" creatorID="0" sortOrder="5" createDate="2016-03-30T11:28:07" updateDate="2016-03-30T11:28:07" nodeName="Maskine 6" urlName="maskine-6" path="-1,1113,1140" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1137</picture><machineName><![CDATA[Traktor]]></machineName><description><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu sapien nunc.]]></description><price>50000</price><information><![CDATA[<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu sapien nunc. Phasellus sapien sapien, aliquam sit amet malesuada tincidunt, fermentum eu lorem. Fusce vel tellus volutpat, rutrum metus eget, elementum mi. Morbi euismod eu sem ut cursus. Nam egestas ullamcorper maximus. Maecenas condimentum nulla et dictum consequat. Nulla sit amet leo mi. Duis ullamcorper augue ac lobortis viverra. Donec in facilisis velit, eu rhoncus neque. Etiam massa elit, sollicitudin placerat tristique in, porta ac ligula. Morbi vitae condimentum tortor, at elementum purus. Nunc a erat convallis, ultricies tellus vitae, malesuada nunc.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1144, N'<sponsorFolder id="1144" key="759d7f67-c7f5-4262-aabe-7141aaef3178" parentID="-1" level="1" creatorID="0" sortOrder="4" createDate="2016-03-30T11:39:22" updateDate="2016-03-30T11:39:22" nodeName="Sponsors" urlName="sponsors" path="-1,1144" isDoc="" nodeType="1141" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsorFolder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1145, N'<sponsor id="1145" key="0a210c42-b276-463d-a4a7-fb4999777dfb" parentID="1144" level="2" creatorID="0" sortOrder="0" createDate="2016-03-30T11:40:47" updateDate="2016-03-30T11:41:02" nodeName="Bad boy" urlName="bad-boy" path="-1,1144,1145" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1057</image><link><![CDATA[[
  {
    "caption": "Bad boy",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": true,
    "isInternal": false,
    "type": "external",
    "title": "Bad boy"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1146, N'<sponsor id="1146" key="fd10f86f-1508-4cf6-8740-c5f62e4b0f0e" parentID="1144" level="2" creatorID="0" sortOrder="1" createDate="2016-03-30T11:41:43" updateDate="2016-03-30T11:42:04" nodeName="Stiga" urlName="stiga" path="-1,1144,1146" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1062</image><link><![CDATA[[
  {
    "caption": "Stiga",
    "link": "http://www.stiga.dk/hjem.html",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Stiga"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1147, N'<sponsor id="1147" key="3006ffa7-0625-451d-baa7-19fdd15e607b" parentID="1144" level="2" creatorID="0" sortOrder="2" createDate="2016-03-30T11:42:35" updateDate="2016-03-30T11:42:43" nodeName="Stihl" urlName="stihl" path="-1,1144,1147" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1064</image><link><![CDATA[[
  {
    "caption": "Stihl",
    "link": "http://www.stihl.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Stihl"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1148, N'<sponsor id="1148" key="6f241c3b-1f14-4a23-818f-ec320e87f5d4" parentID="1144" level="2" creatorID="0" sortOrder="3" createDate="2016-03-30T11:50:02" updateDate="2016-03-30T11:50:02" nodeName="Viking" urlName="viking" path="-1,1144,1148" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1065</image><link><![CDATA[[
  {
    "caption": "Viking",
    "link": "http://www.stihl.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Viking"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1149, N'<sponsor id="1149" key="bb10057c-0714-41b7-9d91-a02f7aca00d2" parentID="1144" level="2" creatorID="0" sortOrder="4" createDate="2016-03-30T11:50:45" updateDate="2016-03-30T11:50:45" nodeName="Club car" urlName="club-car" path="-1,1144,1149" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1058</image><link><![CDATA[[
  {
    "caption": "Club car",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Club car"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1150, N'<sponsor id="1150" key="a5ba6dc4-c9a0-48c5-b973-d8a8edb75433" parentID="1144" level="2" creatorID="0" sortOrder="5" createDate="2016-03-30T12:07:13" updateDate="2016-03-30T12:07:13" nodeName="ISEKI" urlName="iseki" path="-1,1144,1150" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1059</image><link><![CDATA[[
  {
    "caption": "ISEKI",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ISEKI"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1151, N'<sponsor id="1151" key="715f506d-4ea3-4d7a-a181-8b90aa06e295" parentID="1144" level="2" creatorID="0" sortOrder="6" createDate="2016-03-30T12:07:56" updateDate="2016-03-30T12:07:56" nodeName="Ventrac" urlName="ventrac" path="-1,1144,1151" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1060</image><link><![CDATA[[
  {
    "caption": "Ventrac",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Ventrac"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1152, N'<sponsor id="1152" key="6f066018-a7e0-46f4-9668-3b1dd8703eb7" parentID="1144" level="2" creatorID="0" sortOrder="7" createDate="2016-03-30T12:08:27" updateDate="2016-03-30T12:08:27" nodeName="Vitra" urlName="vitra" path="-1,1144,1152" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1061</image><link><![CDATA[[
  {
    "caption": "VITRA",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "VITRA"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1153, N'<sponsor id="1153" key="02951e04-1caf-4be8-be28-366aa374ade0" parentID="1144" level="2" creatorID="0" sortOrder="8" createDate="2016-03-30T12:08:57" updateDate="2016-03-30T12:08:57" nodeName="Stiga shoppen" urlName="stiga-shoppen" path="-1,1144,1153" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1063</image><link><![CDATA[[
  {
    "caption": "Stiga shoppen",
    "link": "http://www.stiga.dk/hjem.html",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Stiga shoppen"
  }
]]]></link></sponsor>')
SET IDENTITY_INSERT [dbo].[cmsDataType] ON 

INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-28, -97, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-27, -96, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-26, -95, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (1, -49, N'Umbraco.TrueFalse', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (2, -51, N'Umbraco.Integer', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (3, -87, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (4, -88, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (5, -89, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (6, -90, N'Umbraco.UploadField', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (7, -92, N'Umbraco.NoEdit', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (8, -36, N'Umbraco.DateTime', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (9, -37, N'Umbraco.ColorPickerAlias', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (11, -39, N'Umbraco.DropDownMultiple', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (12, -40, N'Umbraco.RadioButtonList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (13, -41, N'Umbraco.Date', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (14, -42, N'Umbraco.DropDown', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (15, -43, N'Umbraco.CheckBoxList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (16, 1034, N'Umbraco.ContentPickerAlias', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (17, 1035, N'Umbraco.MediaPicker', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (18, 1036, N'Umbraco.MemberPicker', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (21, 1040, N'Umbraco.RelatedLinks', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (22, 1041, N'Umbraco.Tags', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (24, 1043, N'Umbraco.ImageCropper', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (25, 1045, N'Umbraco.MultipleMediaPicker', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (26, 1047, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (27, 1071, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (28, 1075, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (29, 1076, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (30, 1077, N'Umbraco.Integer', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (31, 1078, N'Umbraco.EmailAddress', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (32, 1079, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (33, 1084, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (34, 1086, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (35, 1090, N'Umbraco.Decimal', N'Decimal')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (36, 1091, N'Umbraco.DropDown', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (37, 1092, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (38, 1093, N'Umbraco.Decimal', N'Decimal')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (39, 1094, N'Umbraco.Decimal', N'Decimal')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (40, 1097, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (41, 1101, N'Umbraco.Integer', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (42, 1103, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (43, 1107, N'Umbraco.UploadField', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (44, 1109, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (45, 1110, N'Umbraco.Decimal', N'Decimal')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (46, 1111, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (47, 1121, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (48, 1142, N'Umbraco.RelatedLinks', N'Ntext')
SET IDENTITY_INSERT [dbo].[cmsDataType] OFF
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] ON 

INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-9, -96, N'[{"alias":"sortOrder","isSystem":1, "header": "Sort order"},{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]', 5, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-8, -96, N'[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}]', 4, N'layouts')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-7, -96, N'desc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-6, -96, N'VersionDate', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-5, -96, N'100', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-4, -97, N'[{"alias":"email","isSystem":1},{"alias":"username","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]', 4, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-3, -97, N'asc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-2, -97, N'Name', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-1, -97, N'10', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (3, -87, N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (4, 1041, N'default', 0, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (5, 1045, N'1', 0, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (6, 1077, NULL, 1, N'min')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (7, 1077, NULL, 2, N'step')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (8, 1077, NULL, 3, N'max')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (9, 1078, NULL, 1, N'IsRequired')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (10, 1090, NULL, 1, N'min')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (11, 1090, NULL, 2, N'step')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (12, 1090, NULL, 3, N'max')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (13, 1091, N'Maskiner m.v.', 1, N'0')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (14, 1091, N'Sand og grus', 2, N'1')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (15, 1093, NULL, 1, N'min')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (16, 1093, NULL, 2, N'step')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (17, 1093, NULL, 3, N'max')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (18, 1094, NULL, 1, N'min')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (19, 1094, NULL, 2, N'step')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (20, 1094, NULL, 3, N'max')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (21, 1034, N'1', 1, N'showOpenButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (22, 1034, N'0', 2, N'showEditButton')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (23, 1034, N'', 3, N'startNodeId')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (24, 1034, N'0', 4, N'showPathOnHover')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (25, 1101, NULL, 1, N'min')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (26, 1101, NULL, 2, N'step')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (27, 1101, NULL, 3, N'max')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (29, 1107, N'', 1, N'thumbs')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (30, 1110, NULL, 1, N'min')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (31, 1110, NULL, 2, N'step')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (32, 1110, NULL, 3, N'max')
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] OFF
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 0, 0, N'8732a1d8-463b-4f02-8c2e-002e91fd54d0', N'Værksted', NULL, NULL, CAST(N'2016-03-24 12:35:31.107' AS DateTime), 1081, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1139, 1, 0, N'8dd94ea1-b231-44cd-bfe4-0430587649a8', N'Maskine 5', NULL, NULL, CAST(N'2016-03-30 10:57:52.253' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1080, 0, 0, N'64863fa7-6460-482e-b937-0915ec49d2b9', N'Lejebetingelser', NULL, NULL, CAST(N'2016-03-25 14:16:42.660' AS DateTime), 1081, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1147, 1, 0, N'e4116194-4885-4ece-94c1-0c17d38c3577', N'Stihl', NULL, NULL, CAST(N'2016-03-30 11:42:43.897' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1150, 1, 0, N'0227d70e-44c5-4532-9288-0e72b5c79b48', N'ISEKI', NULL, NULL, CAST(N'2016-03-30 12:07:13.193' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1085, 0, 0, N'23adf3c0-1ba3-4e3e-a094-0f1fffd1551a', N'Kontakt', NULL, NULL, CAST(N'2016-03-24 12:25:06.180' AS DateTime), 1082, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1122, 1, 0, N'5f859c17-f84a-41d8-9459-0f4050b55f32', N'Maskine 2', NULL, NULL, CAST(N'2016-03-30 09:31:20.433' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1146, 1, 0, N'a7873891-9ffa-478a-8efe-10c87f5a4be2', N'Stiga', NULL, NULL, CAST(N'2016-03-30 11:42:04.840' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1120, 0, 0, N'c0ab798c-6360-4eba-9ee2-1a1e3a6d5495', N'Brugte maskiner', NULL, NULL, CAST(N'2016-03-25 14:16:21.050' AS DateTime), 1118, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 0, 0, N'0e315bb3-504f-4912-84f2-1b4eeceac7bf', N'Sortiment', NULL, NULL, CAST(N'2016-03-24 21:44:35.047' AS DateTime), 1098, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1129, 1, 0, N'48ee86c4-c6bf-45be-8368-1f3f8b4c0674', N'Borekrone', NULL, NULL, CAST(N'2016-03-27 18:48:09.413' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1085, 0, 0, N'cecd8ad9-04c6-4442-a1f7-25b0126a8f41', N'Kontakt', NULL, NULL, CAST(N'2016-03-24 12:15:23.010' AS DateTime), 1082, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1114, 0, 0, N'fb2af695-0437-430f-8481-28fe2eaf1078', N'Maskine 1', NULL, NULL, CAST(N'2016-03-26 23:20:00.493' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1114, 0, 0, N'29a07277-18cd-4052-941b-2c73a663467f', N'Maskine 1', NULL, NULL, CAST(N'2016-03-25 13:58:42.523' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1095, 1, 0, N'b13e8737-bff3-4962-9763-2cf8a4347be3', N'Sortiment mappe', NULL, NULL, CAST(N'2016-03-24 13:09:49.173' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1122, 0, 0, N'2666c3de-acdd-44ae-9828-2e908b81d596', N'Maskine 2', NULL, NULL, CAST(N'2016-03-26 23:41:26.243' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1080, 0, 0, N'a317dd7b-67f6-4749-a3a8-2f0bf5571712', N'Lejebetingelser', NULL, NULL, CAST(N'2016-03-24 12:07:02.047' AS DateTime), 1081, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1050, 0, 0, N'29a4a22a-0da2-40c7-a380-303e192733c7', N'Home', NULL, NULL, CAST(N'2016-03-23 14:52:05.367' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1124, 1, 0, N'8382ab20-df0c-4161-9ce1-308c9394ce78', N'Lift (1)', NULL, NULL, CAST(N'2016-03-27 18:41:53.847' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1130, 1, 0, N'ceab5b72-b405-4fbf-984b-48fd5ac94a01', N'Håndbetonsliber', NULL, NULL, CAST(N'2016-03-27 18:48:46.713' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1149, 1, 0, N'866e08e5-f650-45eb-a20c-4f07d242e8b9', N'Club car', NULL, NULL, CAST(N'2016-03-30 11:50:45.153' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1114, 0, 0, N'51ffc8e9-5d52-4bae-b291-525118cca996', N'Maskine 1', NULL, NULL, CAST(N'2016-03-30 09:32:07.673' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 0, 0, N'7436ccef-aab9-446d-bb38-560bec8a11ff', N'Sortiment', NULL, NULL, CAST(N'2016-03-24 13:08:44.330' AS DateTime), 1098, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1050, 0, 0, N'8794b475-f3af-4745-ab69-5725ef4eb3d3', N'Home', NULL, NULL, CAST(N'2016-03-23 12:37:47.373' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1113, 1, 0, N'fb850c38-0e79-473c-9ddb-581ec68609f5', N'Maskine mappe', NULL, NULL, CAST(N'2016-03-25 13:57:16.210' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1126, 1, 0, N'80ab6f18-b79d-4a0b-b705-60d5ad43ebe6', N'Bygningshammer', NULL, NULL, CAST(N'2016-03-27 18:43:19.673' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1120, 1, 0, N'26899b41-8b6e-4ff9-a816-6315ae21a5d8', N'Brugte maskiner', NULL, NULL, CAST(N'2016-03-25 14:16:42.650' AS DateTime), 1118, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1132, 1, 0, N'ec6b15fe-d8a8-40aa-841d-6b2edbbeda4b', N'Machine 3', NULL, NULL, CAST(N'2016-03-30 09:17:19.877' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1080, 0, 0, N'b45351b8-b4af-4717-aee2-6b681a79316b', N'Lejebetingelser', NULL, NULL, CAST(N'2016-03-24 12:09:23.720' AS DateTime), 1081, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1127, 1, 0, N'c263cf0e-2f7f-4ae4-821d-75236fd22471', N'Borehammer', NULL, NULL, CAST(N'2016-03-27 18:46:49.910' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 0, 0, N'521328a6-b9dc-4680-9629-78da1f237b05', N'Sortiment', NULL, NULL, CAST(N'2016-03-24 12:55:06.063' AS DateTime), 1098, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1114, 0, 0, N'3c9fdd61-b62d-4066-82ce-795fd239cd25', N'Maskine 1', NULL, NULL, CAST(N'2016-03-25 13:57:56.357' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1050, 0, 0, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', N'Forside', NULL, NULL, CAST(N'2016-03-24 12:15:34.460' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1152, 1, 0, N'16d9a48f-061f-440e-8a24-7ec948c0a8e4', N'Vitra', NULL, NULL, CAST(N'2016-03-30 12:08:27.310' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1145, 1, 0, N'd2a85cb9-4000-4a1d-bbce-82abcd2224aa', N'Bad boy', NULL, NULL, CAST(N'2016-03-30 11:41:02.190' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1114, 1, 0, N'33ea28ba-13ac-460c-8abe-83a005cb349a', N'Maskine 1', NULL, NULL, CAST(N'2016-03-30 09:32:10.853' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1132, 0, 0, N'1423a520-5b5a-40dc-a84d-8d66b3a83062', N'Machine 3', NULL, NULL, CAST(N'2016-03-30 09:03:05.327' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1085, 0, 0, N'55af568e-0a54-4bde-9570-8dd990db27b7', N'Kontakt', NULL, NULL, CAST(N'2016-03-24 21:44:35.123' AS DateTime), 1082, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1096, 1, 0, N'1311d56b-5427-4dd2-8544-96e546fc1fc2', N'Muldjord', NULL, NULL, CAST(N'2016-03-24 13:08:47.840' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1080, 0, 0, N'eb70ddbe-ea8a-4c97-8f64-9710987e4cef', N'Lejebetingelser', NULL, NULL, CAST(N'2016-03-27 15:17:14.877' AS DateTime), 1081, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1145, 0, 0, N'98ede9c2-9835-4f7a-b02e-98a247f0be86', N'Bad boy', NULL, NULL, CAST(N'2016-03-30 11:40:56.320' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1151, 1, 0, N'6cdc4498-af4a-450a-937f-9b35928892c6', N'Ventrac', NULL, NULL, CAST(N'2016-03-30 12:07:56.253' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1080, 1, 0, N'd608935b-fdb6-42d2-92e5-9e4e5e84be8b', N'Lejebetingelser', NULL, NULL, CAST(N'2016-03-27 15:18:48.197' AS DateTime), 1081, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1147, 0, 0, N'29310804-668c-4573-a4b3-9f357d55096e', N'Stihl', NULL, NULL, CAST(N'2016-03-30 11:42:35.667' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 1, 0, N'1a8b12f0-79c7-4411-8b02-ab07d120f45b', N'Sortiment', NULL, NULL, CAST(N'2016-03-25 14:16:42.677' AS DateTime), 1098, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1131, 1, 0, N'd0771336-241f-4a0d-8706-ad3a9759a7a4', N'Asfalt- og betonskæremaskine', NULL, NULL, CAST(N'2016-03-27 18:49:41.960' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1106, 1, 0, N'3eadb9d0-0c79-4b92-82d1-aefe5dc82903', N'Cart', NULL, NULL, CAST(N'2016-03-24 13:48:22.967' AS DateTime), 1104, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1114, 0, 0, N'ad9bbd91-1532-4540-a5e8-b0d012ec22e3', N'Maskine 1', NULL, NULL, CAST(N'2016-03-30 09:31:57.497' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1102, 1, 0, N'697be575-3464-4f1e-8de5-b3be752b965f', N'Champignonmuld', NULL, NULL, CAST(N'2016-03-27 00:41:56.547' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1123, 1, 0, N'952c5947-cd4b-4715-ad04-bb3cd5e1877d', N'Lift', NULL, NULL, CAST(N'2016-03-27 18:40:36.410' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1050, 0, 0, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', N'Home', NULL, NULL, CAST(N'2016-03-24 11:55:14.957' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1148, 1, 0, N'e0c94675-9518-4d3c-81a2-c0a4ded3a79d', N'Viking', NULL, NULL, CAST(N'2016-03-30 11:50:02.983' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1096, 0, 0, N'480aae4d-cfbd-4395-8880-c17dc2f360fe', N'Muldjord', NULL, NULL, CAST(N'2016-03-24 12:47:19.513' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1050, 1, 0, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', N'Forside', NULL, NULL, CAST(N'2016-03-25 13:51:54.790' AS DateTime), 1048, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1128, 1, 0, N'148dedb5-7764-4dd4-abc9-ca07e813579f', N'Stillads', NULL, NULL, CAST(N'2016-03-27 18:47:36.050' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 0, 0, N'cfd4f9ac-8ae5-4b4d-a286-cd8195f4134b', N'Værksted', NULL, NULL, CAST(N'2016-03-24 12:35:16.803' AS DateTime), 1081, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 1, 0, N'a3d68398-d42a-4c75-b168-d1966a8ba7c5', N'Værksted', NULL, NULL, CAST(N'2016-03-25 14:16:42.667' AS DateTime), 1081, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1050, 0, 0, N'b44f5fe8-e3c2-4eda-b5d1-d323ded6c489', N'Home', NULL, NULL, CAST(N'2016-03-23 14:44:14.520' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1153, 1, 0, N'664c1195-1fef-4fa5-b305-d6c253019baf', N'Stiga shoppen', NULL, NULL, CAST(N'2016-03-30 12:08:57.807' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 0, 0, N'c62968f5-6dc9-4484-9f6c-d9385239e06a', N'Sortiment', NULL, NULL, CAST(N'2016-03-24 12:55:10.320' AS DateTime), 1098, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1050, 0, 0, N'7d194761-4a18-47bc-8886-dadb4ce6b29f', N'Home', NULL, NULL, CAST(N'2016-03-23 13:30:28.550' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 0, 0, N'6b7b8b9d-2b51-40bf-81c8-de831be3f991', N'Sortiment', NULL, NULL, CAST(N'2016-03-24 13:10:13.853' AS DateTime), 1098, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1145, 0, 0, N'9ed2f0b3-7fa3-432d-9823-df8cc4ef798a', N'Bad boy', NULL, NULL, CAST(N'2016-03-30 11:40:47.660' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1120, 0, 0, N'69ddae73-5f65-4cb3-939c-dfbd8a054b66', N'Brugte maskiner', NULL, NULL, CAST(N'2016-03-25 14:01:08.337' AS DateTime), 1118, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 0, 0, N'fcf20686-871f-44ad-bd47-e6433331f087', N'Værksted', NULL, NULL, CAST(N'2016-03-24 12:34:48.790' AS DateTime), 1081, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1085, 0, 0, N'a8674da5-05f0-400b-b3a4-e6dc6835d693', N'Kontakt', NULL, NULL, CAST(N'2016-03-24 12:17:55.673' AS DateTime), 1082, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1144, 1, 0, N'24a159f3-49ec-4dca-b2a9-e7101e763c18', N'Sponsors', NULL, NULL, CAST(N'2016-03-30 11:39:22.507' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1140, 1, 0, N'd4f2f415-5087-4186-91db-e7b812cd70c5', N'Maskine 6', NULL, NULL, CAST(N'2016-03-30 11:28:07.913' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1085, 1, 0, N'be732fb2-b9cf-48f3-a1d6-e825697db08e', N'Kontakt', NULL, NULL, CAST(N'2016-03-25 14:16:21.057' AS DateTime), 1082, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1125, 1, 0, N'54ceb80b-0f0d-4fc4-8b19-e8e7d4831438', N'Betonhammer', NULL, NULL, CAST(N'2016-03-27 18:42:36.887' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1085, 0, 0, N'72425bac-5637-4492-b16d-ec56e3ea84c3', N'Kontakt', NULL, NULL, CAST(N'2016-03-24 12:35:16.820' AS DateTime), 1082, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1085, 0, 0, N'1a10e7df-f26a-401f-9f93-f1dfa71610e6', N'Kontakt', NULL, NULL, CAST(N'2016-03-24 12:23:13.433' AS DateTime), 1082, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1138, 1, 0, N'ad1894b5-3b84-4ec7-a371-f2d850f7ba91', N'Maskine 4', NULL, NULL, CAST(N'2016-03-30 10:57:04.130' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1080, 0, 0, N'1e5e6057-32a0-42f2-9b19-f433bc23ebfd', N'Lejebetingelser', NULL, NULL, CAST(N'2016-03-24 12:03:04.070' AS DateTime), 1081, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1080, 0, 0, N'524db0cf-69e2-491f-a390-f9333fb2207b', N'Lejebetingelser', NULL, NULL, CAST(N'2016-03-24 12:01:40.480' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1080, 0, 0, N'821e7f53-c1e3-4359-ad06-f99045a7cc94', N'Lejebetingelser', NULL, NULL, CAST(N'2016-03-27 15:18:36.997' AS DateTime), 1081, 0)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1049, 1048, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1073, 1081, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1083, 1082, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1099, 1098, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1105, 1104, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1119, 1118, 1)
SET IDENTITY_INSERT [dbo].[cmsMacro] ON 

INSERT [dbo].[cmsMacro] ([id], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroScriptType], [macroScriptAssembly], [macroXSLT], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroPython]) VALUES (1, 0, 0, N'menu', N'menu', N'', N'', N'', 0, 0, 1, N'~/Views/MacroPartials/menu.cshtml')
INSERT [dbo].[cmsMacro] ([id], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroScriptType], [macroScriptAssembly], [macroXSLT], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroPython]) VALUES (3, 0, 0, N'sponsorlist', N'sponsorlist', N'', N'', N'', 0, 0, 1, N'~/Views/MacroPartials/sponsorlist.cshtml')
INSERT [dbo].[cmsMacro] ([id], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroScriptType], [macroScriptAssembly], [macroXSLT], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroPython]) VALUES (4, 0, 0, N'Machines', N'Machines', N'', N'', N'', 0, 0, 1, N'~/Views/MacroPartials/Machines.cshtml')
INSERT [dbo].[cmsMacro] ([id], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroScriptType], [macroScriptAssembly], [macroXSLT], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroPython]) VALUES (5, 0, 0, N'menumobile', N'menumobile', N'', N'', N'', 0, 0, 1, N'~/Views/MacroPartials/menumobile.cshtml')
SET IDENTITY_INSERT [dbo].[cmsMacro] OFF
SET IDENTITY_INSERT [dbo].[cmsMacroProperty] ON 

INSERT [dbo].[cmsMacroProperty] ([id], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (1, N'Umbraco.Integer', 1, 0, N'startNodeId', N'startNodeId')
INSERT [dbo].[cmsMacroProperty] ([id], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (2, N'Umbraco.Integer', 3, 0, N'mediaId', N'mediaId')
INSERT [dbo].[cmsMacroProperty] ([id], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (3, N'Umbraco.Integer', 4, 0, N'startNodeId', N'startNodeId')
INSERT [dbo].[cmsMacroProperty] ([id], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (4, N'Umbraco.Integer', 5, 0, N'startNodeId', N'startNodeId')
SET IDENTITY_INSERT [dbo].[cmsMacroProperty] OFF
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'29a4a22a-0da2-40c7-a380-303e192733c7', CAST(N'2016-03-23 14:52:05.393' AS DateTime), N'<home id="1050" key="928e3d11-a505-4f45-99c9-69143333d1a9" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-03-23T12:37:47" updateDate="2016-03-23T14:52:05" nodeName="Home" urlName="home" path="-1,1050" isDoc="" nodeType="1049" creatorName="Cthian" writerName="Cthian" writerID="0" template="1048" nodeTypeAlias="home"><header><![CDATA[Maskinudlejning]]></header><text><![CDATA[<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>]]></text><logo>1070</logo></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'8794b475-f3af-4745-ab69-5725ef4eb3d3', CAST(N'2016-03-23 12:37:47.420' AS DateTime), N'<home id="1050" key="928e3d11-a505-4f45-99c9-69143333d1a9" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-03-23T12:37:47" updateDate="2016-03-23T12:37:47" nodeName="Home" urlName="home" path="-1,1050" isDoc="" nodeType="1049" creatorName="Cthian" writerName="Cthian" writerID="0" template="1048" nodeTypeAlias="home"><header><![CDATA[Maskinudlejning]]></header><text><![CDATA[<p>Bla bla</p>]]></text></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', CAST(N'2016-03-24 12:15:34.473' AS DateTime), N'<home id="1050" key="928e3d11-a505-4f45-99c9-69143333d1a9" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-03-23T12:37:47" updateDate="2016-03-24T12:15:34" nodeName="Forside" urlName="forside" path="-1,1050" isDoc="" nodeType="1049" creatorName="Cthian" writerName="Cthian" writerID="0" template="1048" nodeTypeAlias="home"><header><![CDATA[Maskinudlejning]]></header><text><![CDATA[<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>]]></text><logo>1070</logo><city><![CDATA[Tønder]]></city><zipCode>6270</zipCode><phoneNumber>21906161</phoneNumber><eMail><![CDATA[toendermaskinudlejning@mail.dk]]></eMail><companyName><![CDATA[Tønder Maskinudlejning]]></companyName><address><![CDATA[Hydrovej 4]]></address></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', CAST(N'2016-03-24 11:55:14.970' AS DateTime), N'<home id="1050" key="928e3d11-a505-4f45-99c9-69143333d1a9" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-03-23T12:37:47" updateDate="2016-03-24T11:55:14" nodeName="Home" urlName="home" path="-1,1050" isDoc="" nodeType="1049" creatorName="Cthian" writerName="Cthian" writerID="0" template="1048" nodeTypeAlias="home"><header><![CDATA[Maskinudlejning]]></header><text><![CDATA[<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>]]></text><logo>1070</logo><city><![CDATA[Tønder]]></city><zipCode>6270</zipCode><phoneNumber>21906161</phoneNumber><eMail><![CDATA[toendermaskinudlejning@mail.dk]]></eMail><companyName><![CDATA[Tønder Maskinudlejning]]></companyName><address><![CDATA[Hydrovej 4]]></address></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', CAST(N'2016-03-25 13:51:54.807' AS DateTime), N'<home id="1050" key="928e3d11-a505-4f45-99c9-69143333d1a9" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-03-23T12:37:47" updateDate="2016-03-25T13:51:54" nodeName="Forside" urlName="forside" path="-1,1050" isDoc="" nodeType="1049" creatorName="Cthian" writerName="Cthian" writerID="0" template="1048" nodeTypeAlias="home"><header><![CDATA[Maskinudlejning]]></header><text><![CDATA[<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>]]></text><logo>1070</logo><catalogPdf><![CDATA[/media/1015/tm_prisliste_2016_layout_1.pdf]]></catalogPdf><city><![CDATA[Tønder]]></city><zipCode>6270</zipCode><phoneNumber>21906161</phoneNumber><eMail><![CDATA[toendermaskinudlejning@mail.dk]]></eMail><companyName><![CDATA[Tønder Maskinudlejning]]></companyName><address><![CDATA[Hydrovej 4]]></address></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'b44f5fe8-e3c2-4eda-b5d1-d323ded6c489', CAST(N'2016-03-23 14:44:14.550' AS DateTime), N'<home id="1050" key="928e3d11-a505-4f45-99c9-69143333d1a9" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-03-23T12:37:47" updateDate="2016-03-23T14:44:14" nodeName="Home" urlName="home" path="-1,1050" isDoc="" nodeType="1049" creatorName="Cthian" writerName="Cthian" writerID="0" template="1048" nodeTypeAlias="home"><header><![CDATA[Maskinudlejning]]></header><text><![CDATA[<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>]]></text><logo>1069</logo></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'7d194761-4a18-47bc-8886-dadb4ce6b29f', CAST(N'2016-03-23 13:30:28.563' AS DateTime), N'<home id="1050" key="928e3d11-a505-4f45-99c9-69143333d1a9" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-03-23T12:37:47" updateDate="2016-03-23T13:30:28" nodeName="Home" urlName="home" path="-1,1050" isDoc="" nodeType="1049" creatorName="Cthian" writerName="Cthian" writerID="0" template="1048" nodeTypeAlias="home"><header><![CDATA[Maskinudlejning]]></header><text><![CDATA[<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>]]></text></home>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1080, N'64863fa7-6460-482e-b937-0915ec49d2b9', CAST(N'2016-03-25 14:16:42.667' AS DateTime), N'<textPage id="1080" key="b5fac220-2ca6-4598-bf21-b73592bc394d" parentID="1050" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T12:01:19" updateDate="2016-03-25T14:16:42" nodeName="Lejebetingelser" urlName="lejebetingelser" path="-1,1050,1080" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p><strong>§1</strong></p>
<p><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<p><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p> </p>
<p><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p> </p>
<p><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p> </p>
<p><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p> </p>
<p><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p> </p>
<p><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p> </p>
<p><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p> </p>
<p><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p> </p>
<p><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p> </p>
<p><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p> </p>
<p><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p> </p>
<p><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p> </p>
<p>Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<p> </p>
<table border="0" cellspacing="1" cellpadding="1" width="100%">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>]]></text><header><![CDATA[Lejebetingelser]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1080, N'a317dd7b-67f6-4749-a3a8-2f0bf5571712', CAST(N'2016-03-24 12:07:02.053' AS DateTime), N'<textPage id="1080" key="b5fac220-2ca6-4598-bf21-b73592bc394d" parentID="1050" level="2" creatorID="0" sortOrder="0" createDate="2016-03-24T12:01:19" updateDate="2016-03-24T12:07:02" nodeName="Lejebetingelser" urlName="lejebetingelser" path="-1,1050,1080" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p><strong>§1</strong></p>
<p><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<p><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p> </p>
<p><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p> </p>
<p><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p> </p>
<p><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p> </p>
<p><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p> </p>
<p><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p> </p>
<p><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p> </p>
<p><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p> </p>
<p><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p> </p>
<p><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p> </p>
<p><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p> </p>
<p><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p> </p>
<p>Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<p> </p>
<table border="0" cellspacing="1" cellpadding="1" width="100%" align="left">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>]]></text><header><![CDATA[Lejebetingelser]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1080, N'b45351b8-b4af-4717-aee2-6b681a79316b', CAST(N'2016-03-24 12:09:23.727' AS DateTime), N'<textPage id="1080" key="b5fac220-2ca6-4598-bf21-b73592bc394d" parentID="1050" level="2" creatorID="0" sortOrder="0" createDate="2016-03-24T12:01:19" updateDate="2016-03-24T12:09:23" nodeName="Lejebetingelser" urlName="lejebetingelser" path="-1,1050,1080" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p><strong>§1</strong></p>
<p><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<p><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p> </p>
<p><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p> </p>
<p><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p> </p>
<p><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p> </p>
<p><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p> </p>
<p><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p> </p>
<p><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p> </p>
<p><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p> </p>
<p><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p> </p>
<p><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p> </p>
<p><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p> </p>
<p><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p> </p>
<p>Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<p> </p>
<table border="0" cellspacing="1" cellpadding="1" width="100%">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>]]></text><header><![CDATA[Lejebetingelser]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1080, N'eb70ddbe-ea8a-4c97-8f64-9710987e4cef', CAST(N'2016-03-27 15:17:14.927' AS DateTime), N'<textPage id="1080" key="b5fac220-2ca6-4598-bf21-b73592bc394d" parentID="1050" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T12:01:19" updateDate="2016-03-27T15:17:14" nodeName="Lejebetingelser" urlName="lejebetingelser" path="-1,1050,1080" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p style="text-align: left;"><strong>§1</strong></p>
<p style="text-align: left;"><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<table border="0" cellspacing="1" cellpadding="1" width="519" height="97">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p style="text-align: left;"> </p>
<p style="text-align: left;">Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<p> </p>]]></text><header><![CDATA[Lejebetingelser]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1080, N'd608935b-fdb6-42d2-92e5-9e4e5e84be8b', CAST(N'2016-03-27 15:18:48.210' AS DateTime), N'<textPage id="1080" key="b5fac220-2ca6-4598-bf21-b73592bc394d" parentID="1050" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T12:01:19" updateDate="2016-03-27T15:18:48" nodeName="Lejebetingelser" urlName="lejebetingelser" path="-1,1050,1080" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p style="text-align: left;"><strong>§1</strong></p>
<p style="text-align: left;"><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<p style="text-align: left;"><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p style="text-align: left;"> </p>
<p style="text-align: left;">Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<p style="text-align: left;"> </p>
<table border="0" cellspacing="1" cellpadding="1" width="519" height="97">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>
<p> </p>]]></text><header><![CDATA[Lejebetingelser]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1080, N'1e5e6057-32a0-42f2-9b19-f433bc23ebfd', CAST(N'2016-03-24 12:03:04.080' AS DateTime), N'<textPage id="1080" key="b5fac220-2ca6-4598-bf21-b73592bc394d" parentID="1050" level="2" creatorID="0" sortOrder="0" createDate="2016-03-24T12:01:19" updateDate="2016-03-24T12:03:04" nodeName="Lejebetingelser" urlName="lejebetingelser" path="-1,1050,1080" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p><strong>§1</strong></p>
<p><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p>Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<table border="0" cellspacing="1" cellpadding="1" width="100%" align="left">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>]]></text><header><![CDATA[Lejebetingelser]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1080, N'524db0cf-69e2-491f-a390-f9333fb2207b', CAST(N'2016-03-24 12:01:40.497' AS DateTime), N'<textPage id="1080" key="b5fac220-2ca6-4598-bf21-b73592bc394d" parentID="1050" level="2" creatorID="0" sortOrder="0" createDate="2016-03-24T12:01:19" updateDate="2016-03-24T12:01:40" nodeName="Lejebetingelser" urlName="lejebetingelser" path="-1,1050,1080" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1048" nodeTypeAlias="textPage"><text><![CDATA[<p><strong>§1</strong></p>
<p><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p>Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<table border="0" cellspacing="1" cellpadding="1" width="100%" align="left">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>]]></text><header><![CDATA[Lejebetingelser]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1080, N'821e7f53-c1e3-4359-ad06-f99045a7cc94', CAST(N'2016-03-27 15:18:37.010' AS DateTime), N'<textPage id="1080" key="b5fac220-2ca6-4598-bf21-b73592bc394d" parentID="1050" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T12:01:19" updateDate="2016-03-27T15:18:36" nodeName="Lejebetingelser" urlName="lejebetingelser" path="-1,1050,1080" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p style="text-align: left;"><strong>§1</strong></p>
<p style="text-align: left;"><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<p style="text-align: left;"><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p style="text-align: left;"> </p>
<p style="text-align: left;">Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<table border="0" cellspacing="1" cellpadding="1" width="519" height="97">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>
<p> </p>]]></text><header><![CDATA[Lejebetingelser]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1085, N'23adf3c0-1ba3-4e3e-a094-0f1fffd1551a', CAST(N'2016-03-24 12:25:06.187' AS DateTime), N'<contact id="1085" key="72162d3f-70db-45ab-83c2-be1c28ce544b" parentID="1050" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T12:15:23" updateDate="2016-03-24T12:25:06" nodeName="Kontakt" urlName="kontakt" path="-1,1050,1085" isDoc="" nodeType="1083" creatorName="Cthian" writerName="Cthian" writerID="0" template="1082" nodeTypeAlias="contact"><text><![CDATA[<p>Hydrovej 4<br />6270 Tønder</p>
<p>Mobil: 21 90 61 61<br />Fax: 73 72 61 61</p>]]></text><header><![CDATA[Kontakt Tønder Maskinudlejning]]></header><googleMapsUrl><![CDATA[https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2291.2578835765157!2d8.861346316078947!3d54.9510370610063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b4ba347411b76d%3A0x873874e245e174d3!2sT%C3%B8nder+Maskinudlejning+ApS!5e0!3m2!1sda!2sdk!4v1458818558630]]></googleMapsUrl></contact>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1085, N'cecd8ad9-04c6-4442-a1f7-25b0126a8f41', CAST(N'2016-03-24 12:15:23.017' AS DateTime), N'<contact id="1085" key="72162d3f-70db-45ab-83c2-be1c28ce544b" parentID="1050" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T12:15:23" updateDate="2016-03-24T12:15:23" nodeName="Kontakt" urlName="kontakt" path="-1,1050,1085" isDoc="" nodeType="1083" creatorName="Cthian" writerName="Cthian" writerID="0" template="1082" nodeTypeAlias="contact" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1085, N'55af568e-0a54-4bde-9570-8dd990db27b7', CAST(N'2016-03-24 21:44:35.130' AS DateTime), N'<contact id="1085" key="72162d3f-70db-45ab-83c2-be1c28ce544b" parentID="1050" level="2" creatorID="0" sortOrder="3" createDate="2016-03-24T12:15:23" updateDate="2016-03-24T21:44:35" nodeName="Kontakt" urlName="kontakt" path="-1,1050,1085" isDoc="" nodeType="1083" creatorName="Cthian" writerName="Cthian" writerID="0" template="1082" nodeTypeAlias="contact"><text><![CDATA[<p>Hydrovej 4<br />6270 Tønder</p>
<p>Mobil: 21 90 61 61<br />Fax: 73 72 61 61</p>]]></text><header><![CDATA[Kontakt Tønder Maskinudlejning]]></header><googleMapsUrl><![CDATA[https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2291.2578835765157!2d8.861346316078947!3d54.9510370610063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b4ba347411b76d%3A0x873874e245e174d3!2sT%C3%B8nder+Maskinudlejning+ApS!5e0!3m2!1sda!2sdk!4v1458818558630]]></googleMapsUrl></contact>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1085, N'a8674da5-05f0-400b-b3a4-e6dc6835d693', CAST(N'2016-03-24 12:17:55.680' AS DateTime), N'<contact id="1085" key="72162d3f-70db-45ab-83c2-be1c28ce544b" parentID="1050" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T12:15:23" updateDate="2016-03-24T12:17:55" nodeName="Kontakt" urlName="kontakt" path="-1,1050,1085" isDoc="" nodeType="1083" creatorName="Cthian" writerName="Cthian" writerID="0" template="1082" nodeTypeAlias="contact"><googleMapsUrl><![CDATA[https://www.google.com/maps/embed/v1/place?q=place_id:ChIJbbcRdDS6tEcR03ThReJ0OIc&]]></googleMapsUrl></contact>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1085, N'be732fb2-b9cf-48f3-a1d6-e825697db08e', CAST(N'2016-03-25 14:16:21.063' AS DateTime), N'<contact id="1085" key="72162d3f-70db-45ab-83c2-be1c28ce544b" parentID="1050" level="2" creatorID="0" sortOrder="4" createDate="2016-03-24T12:15:23" updateDate="2016-03-25T14:16:21" nodeName="Kontakt" urlName="kontakt" path="-1,1050,1085" isDoc="" nodeType="1083" creatorName="Cthian" writerName="Cthian" writerID="0" template="1082" nodeTypeAlias="contact"><text><![CDATA[<p>Hydrovej 4<br />6270 Tønder</p>
<p>Mobil: 21 90 61 61<br />Fax: 73 72 61 61</p>]]></text><header><![CDATA[Kontakt Tønder Maskinudlejning]]></header><googleMapsUrl><![CDATA[https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2291.2578835765157!2d8.861346316078947!3d54.9510370610063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b4ba347411b76d%3A0x873874e245e174d3!2sT%C3%B8nder+Maskinudlejning+ApS!5e0!3m2!1sda!2sdk!4v1458818558630]]></googleMapsUrl></contact>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1085, N'72425bac-5637-4492-b16d-ec56e3ea84c3', CAST(N'2016-03-24 12:35:16.827' AS DateTime), N'<contact id="1085" key="72162d3f-70db-45ab-83c2-be1c28ce544b" parentID="1050" level="2" creatorID="0" sortOrder="2" createDate="2016-03-24T12:15:23" updateDate="2016-03-24T12:35:16" nodeName="Kontakt" urlName="kontakt" path="-1,1050,1085" isDoc="" nodeType="1083" creatorName="Cthian" writerName="Cthian" writerID="0" template="1082" nodeTypeAlias="contact"><text><![CDATA[<p>Hydrovej 4<br />6270 Tønder</p>
<p>Mobil: 21 90 61 61<br />Fax: 73 72 61 61</p>]]></text><header><![CDATA[Kontakt Tønder Maskinudlejning]]></header><googleMapsUrl><![CDATA[https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2291.2578835765157!2d8.861346316078947!3d54.9510370610063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b4ba347411b76d%3A0x873874e245e174d3!2sT%C3%B8nder+Maskinudlejning+ApS!5e0!3m2!1sda!2sdk!4v1458818558630]]></googleMapsUrl></contact>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1085, N'1a10e7df-f26a-401f-9f93-f1dfa71610e6', CAST(N'2016-03-24 12:23:13.440' AS DateTime), N'<contact id="1085" key="72162d3f-70db-45ab-83c2-be1c28ce544b" parentID="1050" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T12:15:23" updateDate="2016-03-24T12:23:13" nodeName="Kontakt" urlName="kontakt" path="-1,1050,1085" isDoc="" nodeType="1083" creatorName="Cthian" writerName="Cthian" writerID="0" template="1082" nodeTypeAlias="contact"><googleMapsUrl><![CDATA[https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2291.2578835765157!2d8.861346316078947!3d54.9510370610063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b4ba347411b76d%3A0x873874e245e174d3!2sT%C3%B8nder+Maskinudlejning+ApS!5e0!3m2!1sda!2sdk!4v1458818558630]]></googleMapsUrl></contact>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1087, N'8732a1d8-463b-4f02-8c2e-002e91fd54d0', CAST(N'2016-03-24 12:35:31.113' AS DateTime), N'<textPage id="1087" key="4bd29351-2bc8-4d10-b5a9-f1531cc486d0" parentID="1050" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T12:34:48" updateDate="2016-03-24T12:35:31" nodeName="Værksted" urlName="vaerksted" path="-1,1050,1087" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p> </p>
<p><br />Vi er autoriseret Stiga, Stihl, Viking, Ventrac, Vitra, Bad Boy, Iseki og Club Car forhandler og opdaterer os løbende med kurser for at sikre os den nyeste viden om de maskiner vi sælger og servicerer.<br />Dette sikrer, at du som kunde trygt kan overlade din maskine til os, da vi har den fornødne ekspertise og viden samt det rigtige værktøj.<br />Vores værksted klarer reparationer af alle mærker, både stort og småt - herudnder garantireparation - uanset hvor din maskine er købt.<br />Ved behov sender vi vores servicebil til kunden<br />Online adgang til vore leverandører af reservedele<br />Vi har altid et stort udvalg i nye og brugte maskiner på lager. Mangler du en ny eller brugt maskine til haven så kontakt os, vi er altid friske med et godt tilbud</p>
<p> </p>
<p><strong>Undgå bøvl og problemer......</strong></p>
<p> </p>
<p>Når du køber din havemaskine hos os er den naturligvis klargjort, justeret, samt påfyldt korrekt olie og benzin</p>
<p> </p>
<p><strong>Rigtige redskaber sælges kun af rigtige eksperter....</strong></p>
<p> </p>
<p>Vi har et bredt udvalg indenfor maskiner til skov, have og park</p>
<p>Stort værksted med faguddannet personale</p>
<p>Vores kundekreds er både private og erhvervskunder</p>
<p>Vi er stolte af de produkter vi sælger</p>
<p> </p>
<p>Kig ind og få en snak med os.</p>
<p>Vi rådgiver gerne hvis du er i tvivl, så du får den bedste maskine til netop dit behov</p>
<p>Vi skal leve af, at vores kunder er tilfredse, derfor vil du opleve en kompetent service og faglig vejledning hos os.</p>
<p> </p>]]></text><header><![CDATA[Værksted]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1087, N'cfd4f9ac-8ae5-4b4d-a286-cd8195f4134b', CAST(N'2016-03-24 12:35:16.820' AS DateTime), N'<textPage id="1087" key="4bd29351-2bc8-4d10-b5a9-f1531cc486d0" parentID="1050" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T12:34:48" updateDate="2016-03-24T12:35:16" nodeName="Værksted" urlName="vaerksted" path="-1,1050,1087" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p> </p>
<p><br />Vi er autoriseret Stiga, Stihl, Viking, Ventrac, Vitra, Bad Boy, Iseki og Club Car forhandler og opdaterer os løbende med kurser for at sikre os den nyeste viden om de maskiner vi sælger og servicerer.<br />Dette sikrer, at du som kunde trygt kan overlade din maskine til os, da vi har den fornødne ekspertise og viden samt det rigtige værktøj.<br />Vores værksted klarer reparationer af alle mærker, både stort og småt - herudnder garantireparation - uanset hvor din maskine er købt.<br />Ved behov sender vi vores servicebil til kunden<br />Online adgang til vore leverandører af reservedele<br />Vi har altid et stort udvalg i nye og brugte maskiner på lager. Mangler du en ny eller brugt maskine til haven så kontakt os, vi er altid friske med et godt tilbud</p>
<p><strong>Undgå bøvl og problemer......</strong></p>
<p> </p>
<p>Når du køber din havemaskine hos os er den naturligvis klargjort, justeret, samt påfyldt korrekt olie og benzin</p>
<p> </p>
<p><strong>Rigtige redskaber sælges kun af rigtige eksperter....</strong></p>
<p> </p>
<p>Vi har et bredt udvalg indenfor maskiner til skov, have og park</p>
<p>Stort værksted med faguddannet personale</p>
<p>Vores kundekreds er både private og erhvervskunder</p>
<p>Vi er stolte af de produkter vi sælger</p>
<p> </p>
<p>Kig ind og få en snak med os.</p>
<p>Vi rådgiver gerne hvis du er i tvivl, så du får den bedste maskine til netop dit behov</p>
<p>Vi skal leve af, at vores kunder er tilfredse, derfor vil du opleve en kompetent service og faglig vejledning hos os.</p>
<p> </p>]]></text><header><![CDATA[Værksted]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1087, N'a3d68398-d42a-4c75-b168-d1966a8ba7c5', CAST(N'2016-03-25 14:16:42.673' AS DateTime), N'<textPage id="1087" key="4bd29351-2bc8-4d10-b5a9-f1531cc486d0" parentID="1050" level="2" creatorID="0" sortOrder="2" createDate="2016-03-24T12:34:48" updateDate="2016-03-25T14:16:42" nodeName="Værksted" urlName="vaerksted" path="-1,1050,1087" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p> </p>
<p><br />Vi er autoriseret Stiga, Stihl, Viking, Ventrac, Vitra, Bad Boy, Iseki og Club Car forhandler og opdaterer os løbende med kurser for at sikre os den nyeste viden om de maskiner vi sælger og servicerer.<br />Dette sikrer, at du som kunde trygt kan overlade din maskine til os, da vi har den fornødne ekspertise og viden samt det rigtige værktøj.<br />Vores værksted klarer reparationer af alle mærker, både stort og småt - herudnder garantireparation - uanset hvor din maskine er købt.<br />Ved behov sender vi vores servicebil til kunden<br />Online adgang til vore leverandører af reservedele<br />Vi har altid et stort udvalg i nye og brugte maskiner på lager. Mangler du en ny eller brugt maskine til haven så kontakt os, vi er altid friske med et godt tilbud</p>
<p> </p>
<p><strong>Undgå bøvl og problemer......</strong></p>
<p> </p>
<p>Når du køber din havemaskine hos os er den naturligvis klargjort, justeret, samt påfyldt korrekt olie og benzin</p>
<p> </p>
<p><strong>Rigtige redskaber sælges kun af rigtige eksperter....</strong></p>
<p> </p>
<p>Vi har et bredt udvalg indenfor maskiner til skov, have og park</p>
<p>Stort værksted med faguddannet personale</p>
<p>Vores kundekreds er både private og erhvervskunder</p>
<p>Vi er stolte af de produkter vi sælger</p>
<p> </p>
<p>Kig ind og få en snak med os.</p>
<p>Vi rådgiver gerne hvis du er i tvivl, så du får den bedste maskine til netop dit behov</p>
<p>Vi skal leve af, at vores kunder er tilfredse, derfor vil du opleve en kompetent service og faglig vejledning hos os.</p>
<p> </p>]]></text><header><![CDATA[Værksted]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1087, N'fcf20686-871f-44ad-bd47-e6433331f087', CAST(N'2016-03-24 12:34:48.827' AS DateTime), N'<textPage id="1087" key="4bd29351-2bc8-4d10-b5a9-f1531cc486d0" parentID="1050" level="2" creatorID="0" sortOrder="2" createDate="2016-03-24T12:34:48" updateDate="2016-03-24T12:34:48" nodeName="Værksted" urlName="vaerksted" path="-1,1050,1087" isDoc="" nodeType="1073" creatorName="Cthian" writerName="Cthian" writerID="0" template="1081" nodeTypeAlias="textPage"><text><![CDATA[<p> </p>
<p><br />Vi er autoriseret Stiga, Stihl, Viking, Ventrac, Vitra, Bad Boy, Iseki og Club Car forhandler og opdaterer os løbende med kurser for at sikre os den nyeste viden om de maskiner vi sælger og servicerer.<br />Dette sikrer, at du som kunde trygt kan overlade din maskine til os, da vi har den fornødne ekspertise og viden samt det rigtige værktøj.<br />Vores værksted klarer reparationer af alle mærker, både stort og småt - herudnder garantireparation - uanset hvor din maskine er købt.<br />Ved behov sender vi vores servicebil til kunden<br />Online adgang til vore leverandører af reservedele<br />Vi har altid et stort udvalg i nye og brugte maskiner på lager. Mangler du en ny eller brugt maskine til haven så kontakt os, vi er altid friske med et godt tilbud</p>
<p><strong>Undgå bøvl og problemer......</strong></p>
<p> </p>
<p>Når du køber din havemaskine hos os er den naturligvis klargjort, justeret, samt påfyldt korrekt olie og benzin</p>
<p> </p>
<p><strong>Rigtige redskaber sælges kun af rigtige eksperter....</strong></p>
<p> </p>
<p>Vi har et bredt udvalg indenfor maskiner til skov, have og park</p>
<p>Stort værksted med faguddannet personale</p>
<p>Vores kundekreds er både private og erhvervskunder</p>
<p>Vi er stolte af de produkter vi sælger</p>
<p> </p>
<p>Kig ind og få en snak med os.</p>
<p>Vi rådgiver gerne hvis du er i tvivl, så du får den bedste maskine til netop dit behov</p>
<p>Vi skal leve af, at vores kunder er tilfredse, derfor vil du opleve en kompetent service og faglig vejledning hos os.</p>
<p> </p>]]></text><header><![CDATA[Værksted]]></header></textPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1095, N'b13e8737-bff3-4962-9763-2cf8a4347be3', CAST(N'2016-03-24 13:09:49.183' AS DateTime), N'<sortimentFolder id="1095" key="994f03f9-edca-4cac-9f76-1aa7ff742ee8" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2016-03-24T12:45:42" updateDate="2016-03-24T13:09:49" nodeName="Sortiment mappe" urlName="sortiment-mappe" path="-1,1095" isDoc="" nodeType="1088" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortimentFolder" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1096, N'1311d56b-5427-4dd2-8544-96e546fc1fc2', CAST(N'2016-03-24 13:08:47.853' AS DateTime), N'<sortiment id="1096" key="61d49829-f8ba-4a32-83ff-8e1d5f1b5ce5" parentID="1095" level="2" creatorID="0" sortOrder="0" createDate="2016-03-24T12:47:19" updateDate="2016-03-24T13:08:47" nodeName="Muldjord" urlName="muldjord" path="-1,1095,1096" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><price>0</price><description><![CDATA[Muldjord]]></description><partNo>2011</partNo><size><![CDATA[En god muldjord til opfyldning af haven]]></size><group><![CDATA[Sand og grus]]></group></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1096, N'480aae4d-cfbd-4395-8880-c17dc2f360fe', CAST(N'2016-03-24 12:47:19.563' AS DateTime), N'<sortiment id="1096" key="61d49829-f8ba-4a32-83ff-8e1d5f1b5ce5" parentID="1095" level="2" creatorID="0" sortOrder="0" createDate="2016-03-24T12:47:19" updateDate="2016-03-24T12:47:19" nodeName="Muldjord" urlName="muldjord" path="-1,1095,1096" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><price>0</price><varenummer>2011</varenummer><description><![CDATA[Muldjord]]></description><size><![CDATA[En god muldjord til opfyldning af haven]]></size><group><![CDATA[Sand og grus]]></group></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1100, N'0e315bb3-504f-4912-84f2-1b4eeceac7bf', CAST(N'2016-03-24 21:44:35.107' AS DateTime), N'<sortimentPage id="1100" key="5446a1d6-d9b8-4a3c-a79c-90053c1608b6" parentID="1050" level="2" creatorID="0" sortOrder="2" createDate="2016-03-24T12:55:06" updateDate="2016-03-24T21:44:35" nodeName="Sortiment" urlName="sortiment" path="-1,1050,1100" isDoc="" nodeType="1099" creatorName="Cthian" writerName="Cthian" writerID="0" template="1098" nodeTypeAlias="sortimentPage"><sortiment>1095</sortiment></sortimentPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1100, N'7436ccef-aab9-446d-bb38-560bec8a11ff', CAST(N'2016-03-24 13:08:44.380' AS DateTime), N'<sortimentPage id="1100" key="5446a1d6-d9b8-4a3c-a79c-90053c1608b6" parentID="1050" level="2" creatorID="0" sortOrder="3" createDate="2016-03-24T12:55:06" updateDate="2016-03-24T13:08:44" nodeName="Sortiment" urlName="sortiment" path="-1,1050,1100" isDoc="" nodeType="1099" creatorName="Cthian" writerName="Cthian" writerID="0" template="1098" nodeTypeAlias="sortimentPage" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1100, N'521328a6-b9dc-4680-9629-78da1f237b05', CAST(N'2016-03-24 12:55:06.073' AS DateTime), N'<sortimentPage id="1100" key="5446a1d6-d9b8-4a3c-a79c-90053c1608b6" parentID="1050" level="2" creatorID="0" sortOrder="3" createDate="2016-03-24T12:55:06" updateDate="2016-03-24T12:55:06" nodeName="Sortiment" urlName="sortiment" path="-1,1050,1100" isDoc="" nodeType="1099" creatorName="Cthian" writerName="Cthian" writerID="0" template="1098" nodeTypeAlias="sortimentPage" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1100, N'1a8b12f0-79c7-4411-8b02-ab07d120f45b', CAST(N'2016-03-25 14:16:42.680' AS DateTime), N'<sortimentPage id="1100" key="5446a1d6-d9b8-4a3c-a79c-90053c1608b6" parentID="1050" level="2" creatorID="0" sortOrder="3" createDate="2016-03-24T12:55:06" updateDate="2016-03-25T14:16:42" nodeName="Sortiment" urlName="sortiment" path="-1,1050,1100" isDoc="" nodeType="1099" creatorName="Cthian" writerName="Cthian" writerID="0" template="1098" nodeTypeAlias="sortimentPage"><sortiment>1095</sortiment></sortimentPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1100, N'c62968f5-6dc9-4484-9f6c-d9385239e06a', CAST(N'2016-03-24 12:55:10.340' AS DateTime), N'<sortimentPage id="1100" key="5446a1d6-d9b8-4a3c-a79c-90053c1608b6" parentID="1050" level="2" creatorID="0" sortOrder="3" createDate="2016-03-24T12:55:06" updateDate="2016-03-24T12:55:10" nodeName="Sortiment" urlName="sortiment" path="-1,1050,1100" isDoc="" nodeType="1099" creatorName="Cthian" writerName="Cthian" writerID="0" template="1098" nodeTypeAlias="sortimentPage"><sortiment>1095</sortiment></sortimentPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1100, N'6b7b8b9d-2b51-40bf-81c8-de831be3f991', CAST(N'2016-03-24 13:10:13.863' AS DateTime), N'<sortimentPage id="1100" key="5446a1d6-d9b8-4a3c-a79c-90053c1608b6" parentID="1050" level="2" creatorID="0" sortOrder="3" createDate="2016-03-24T12:55:06" updateDate="2016-03-24T13:10:13" nodeName="Sortiment" urlName="sortiment" path="-1,1050,1100" isDoc="" nodeType="1099" creatorName="Cthian" writerName="Cthian" writerID="0" template="1098" nodeTypeAlias="sortimentPage"><sortiment>1095</sortiment></sortimentPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1102, N'697be575-3464-4f1e-8de5-b3be752b965f', CAST(N'2016-03-27 00:41:56.553' AS DateTime), N'<sortiment id="1102" key="1429eced-fca7-410b-9e84-5629712bf857" parentID="1095" level="2" creatorID="0" sortOrder="1" createDate="2016-03-24T13:16:29" updateDate="2016-03-27T00:41:56" nodeName="Champignonmuld" urlName="champignonmuld" path="-1,1095,1102" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><price>0.68</price><description><![CDATA[Champignonmuld]]></description><partNo>2000</partNo><size><![CDATA[Superflot flis, så kan du spare hakkejernet. Læg flis i alle dine bede.]]></size><group><![CDATA[Sand og grus]]></group></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1106, N'3eadb9d0-0c79-4b92-82d1-aefe5dc82903', CAST(N'2016-03-24 13:48:22.997' AS DateTime), N'<cart id="1106" key="27c88e62-7dfd-4f0c-98ab-4778d6d69732" parentID="-1" level="1" creatorID="0" sortOrder="2" createDate="2016-03-24T13:48:22" updateDate="2016-03-24T13:48:22" nodeName="Cart" urlName="cart" path="-1,1106" isDoc="" nodeType="1105" creatorName="Cthian" writerName="Cthian" writerID="0" template="1104" nodeTypeAlias="cart" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1113, N'fb850c38-0e79-473c-9ddb-581ec68609f5', CAST(N'2016-03-25 13:57:16.230' AS DateTime), N'<usedMachinesFolder id="1113" key="d05b8e05-d37c-4bd5-ac3d-bcbd3692e2d6" parentID="-1" level="1" creatorID="0" sortOrder="3" createDate="2016-03-25T13:57:16" updateDate="2016-03-25T13:57:16" nodeName="Maskine mappe" urlName="maskine-mappe" path="-1,1113" isDoc="" nodeType="1108" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachinesFolder" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1114, N'fb2af695-0437-430f-8481-28fe2eaf1078', CAST(N'2016-03-26 23:20:00.560' AS DateTime), N'<usedMachines id="1114" key="71023f1e-5fcb-48ab-b8c5-bfb0c70613ed" parentID="1113" level="2" creatorID="0" sortOrder="0" createDate="2016-03-25T13:57:56" updateDate="2016-03-26T23:20:00" nodeName="Maskine 1" urlName="maskine-1" path="-1,1113,1114" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1116</picture><machineName><![CDATA[Havetraktor]]></machineName><description><![CDATA[Information omkring havetraktor]]></description><price>2000</price><information><![CDATA[<p>Information omkring havetraktor</p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1114, N'29a07277-18cd-4052-941b-2c73a663467f', CAST(N'2016-03-25 13:58:42.540' AS DateTime), N'<usedMachines id="1114" key="71023f1e-5fcb-48ab-b8c5-bfb0c70613ed" parentID="1113" level="2" creatorID="0" sortOrder="0" createDate="2016-03-25T13:57:56" updateDate="2016-03-25T13:58:42" nodeName="Maskine 1" urlName="maskine-1" path="-1,1113,1114" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1116</picture><machineName><![CDATA[Havetraktor]]></machineName><price>2000</price><information><![CDATA[<p>Information omkring havetraktor</p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1114, N'51ffc8e9-5d52-4bae-b291-525118cca996', CAST(N'2016-03-30 09:32:07.693' AS DateTime), N'<usedMachines id="1114" key="71023f1e-5fcb-48ab-b8c5-bfb0c70613ed" parentID="1113" level="2" creatorID="0" sortOrder="0" createDate="2016-03-25T13:57:56" updateDate="2016-03-30T09:32:07" nodeName="Maskine 1" urlName="maskine-1" path="-1,1113,1114" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1116</picture><machineName><![CDATA[Havetraktor]]></machineName><description><![CDATA[Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut.]]></description><price>2000</price><information><![CDATA[<p><span>Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut. Donec sit amet est ut mauris accumsan gravida at in orci. Vivamus dui urna, posuere sit amet nulla vel, venenatis ullamcorper lacus. Integer vel consequat turpis. Vestibulum quam nunc, varius in volutpat vitae, ullamcorper sed ante. Vestibulum nisl mi, iaculis a velit sit amet, accumsan dapibus sapien.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1114, N'3c9fdd61-b62d-4066-82ce-795fd239cd25', CAST(N'2016-03-25 13:57:56.370' AS DateTime), N'<usedMachines id="1114" key="71023f1e-5fcb-48ab-b8c5-bfb0c70613ed" parentID="1113" level="2" creatorID="0" sortOrder="0" createDate="2016-03-25T13:57:56" updateDate="2016-03-25T13:57:56" nodeName="Maskine 1" urlName="maskine-1" path="-1,1113,1114" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><machineName><![CDATA[Havetraktor]]></machineName><information><![CDATA[<p>Information omkring havetraktor</p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1114, N'33ea28ba-13ac-460c-8abe-83a005cb349a', CAST(N'2016-03-30 09:32:10.877' AS DateTime), N'<usedMachines id="1114" key="71023f1e-5fcb-48ab-b8c5-bfb0c70613ed" parentID="1113" level="2" creatorID="0" sortOrder="0" createDate="2016-03-25T13:57:56" updateDate="2016-03-30T09:32:10" nodeName="Maskine 1" urlName="maskine-1" path="-1,1113,1114" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1116</picture><machineName><![CDATA[Havetraktor]]></machineName><description><![CDATA[Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut.]]></description><price>2000</price><information><![CDATA[<p><span>Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut. Donec sit amet est ut mauris accumsan gravida at in orci. Vivamus dui urna, posuere sit amet nulla vel, venenatis ullamcorper lacus. Integer vel consequat turpis. Vestibulum quam nunc, varius in volutpat vitae, ullamcorper sed ante. Vestibulum nisl mi, iaculis a velit sit amet, accumsan dapibus sapien.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1114, N'ad9bbd91-1532-4540-a5e8-b0d012ec22e3', CAST(N'2016-03-30 09:31:57.533' AS DateTime), N'<usedMachines id="1114" key="71023f1e-5fcb-48ab-b8c5-bfb0c70613ed" parentID="1113" level="2" creatorID="0" sortOrder="0" createDate="2016-03-25T13:57:56" updateDate="2016-03-30T09:31:57" nodeName="Maskine 1" urlName="maskine-1" path="-1,1113,1114" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1116</picture><machineName><![CDATA[Havetraktor]]></machineName><description><![CDATA[Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut. Donec sit amet est ut mauris accumsan gravida at in orci.]]></description><price>2000</price><information><![CDATA[<p><span>Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut. Donec sit amet est ut mauris accumsan gravida at in orci. Vivamus dui urna, posuere sit amet nulla vel, venenatis ullamcorper lacus. Integer vel consequat turpis. Vestibulum quam nunc, varius in volutpat vitae, ullamcorper sed ante. Vestibulum nisl mi, iaculis a velit sit amet, accumsan dapibus sapien.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1120, N'c0ab798c-6360-4eba-9ee2-1a1e3a6d5495', CAST(N'2016-03-25 14:16:21.057' AS DateTime), N'<machinePage id="1120" key="ca29b84a-a62e-484b-b659-28eac61fbaeb" parentID="1050" level="2" creatorID="0" sortOrder="3" createDate="2016-03-25T14:01:08" updateDate="2016-03-25T14:16:21" nodeName="Brugte maskiner" urlName="brugte-maskiner" path="-1,1050,1120" isDoc="" nodeType="1119" creatorName="Cthian" writerName="Cthian" writerID="0" template="1118" nodeTypeAlias="machinePage"><machineFolder>1113</machineFolder></machinePage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1120, N'26899b41-8b6e-4ff9-a816-6315ae21a5d8', CAST(N'2016-03-25 14:16:42.657' AS DateTime), N'<machinePage id="1120" key="ca29b84a-a62e-484b-b659-28eac61fbaeb" parentID="1050" level="2" creatorID="0" sortOrder="0" createDate="2016-03-25T14:01:08" updateDate="2016-03-25T14:16:42" nodeName="Brugte maskiner" urlName="brugte-maskiner" path="-1,1050,1120" isDoc="" nodeType="1119" creatorName="Cthian" writerName="Cthian" writerID="0" template="1118" nodeTypeAlias="machinePage"><machineFolder>1113</machineFolder></machinePage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1120, N'69ddae73-5f65-4cb3-939c-dfbd8a054b66', CAST(N'2016-03-25 14:01:08.347' AS DateTime), N'<machinePage id="1120" key="ca29b84a-a62e-484b-b659-28eac61fbaeb" parentID="1050" level="2" creatorID="0" sortOrder="4" createDate="2016-03-25T14:01:08" updateDate="2016-03-25T14:01:08" nodeName="Brugte maskiner" urlName="brugte-maskiner" path="-1,1050,1120" isDoc="" nodeType="1119" creatorName="Cthian" writerName="Cthian" writerID="0" template="1118" nodeTypeAlias="machinePage"><machineFolder>1113</machineFolder></machinePage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1122, N'5f859c17-f84a-41d8-9459-0f4050b55f32', CAST(N'2016-03-30 09:31:20.440' AS DateTime), N'<usedMachines id="1122" key="89daa37f-2e77-4653-93d0-368b9b8e2516" parentID="1113" level="2" creatorID="0" sortOrder="1" createDate="2016-03-26T23:41:26" updateDate="2016-03-30T09:31:20" nodeName="Maskine 2" urlName="maskine-2" path="-1,1113,1122" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1117</picture><machineName><![CDATA[Gravemaskine]]></machineName><description><![CDATA[Phasellus pharetra erat eu tincidunt condimentum. Vestibulum interdum at nisi vitae sagittis. Quisque et porttitor tellus.]]></description><price>3000</price><information><![CDATA[<p><span>Phasellus pharetra erat eu tincidunt condimentum. Vestibulum interdum at nisi vitae sagittis. Quisque et porttitor tellus. Sed luctus, diam vitae sagittis molestie, purus ante consequat justo, nec porta lacus libero in orci. Aenean consectetur, urna ut lacinia viverra, magna magna consequat leo, nec maximus tortor tellus et enim. Curabitur quis elit aliquam, sagittis odio et, lobortis sapien. Nulla facilisi. Pellentesque auctor eu lacus sit amet blandit. Ut id imperdiet est.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1122, N'2666c3de-acdd-44ae-9828-2e908b81d596', CAST(N'2016-03-26 23:41:26.283' AS DateTime), N'<usedMachines id="1122" key="89daa37f-2e77-4653-93d0-368b9b8e2516" parentID="1113" level="2" creatorID="0" sortOrder="1" createDate="2016-03-26T23:41:26" updateDate="2016-03-26T23:41:26" nodeName="Maskine 2" urlName="maskine-2" path="-1,1113,1122" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1117</picture><machineName><![CDATA[Gravemaskine]]></machineName><description><![CDATA[Gravemaskine]]></description><price>3000</price><information><![CDATA[<p>Gravemaskine</p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1123, N'952c5947-cd4b-4715-ad04-bb3cd5e1877d', CAST(N'2016-03-27 18:40:36.470' AS DateTime), N'<sortiment id="1123" key="053121a3-befc-4185-9717-88a78c911810" parentID="1095" level="2" creatorID="0" sortOrder="2" createDate="2016-03-27T18:40:36" updateDate="2016-03-27T18:40:36" nodeName="Lift" urlName="lift" path="-1,1095,1123" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Lift]]></description><partNo>1</partNo><rentday>980</rentday><size><![CDATA[15,5 meter]]></size><group><![CDATA[Maskiner m.v.]]></group></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1124, N'8382ab20-df0c-4161-9ce1-308c9394ce78', CAST(N'2016-03-27 18:41:53.860' AS DateTime), N'<sortiment id="1124" key="271f8f43-5348-41b7-b45a-1064112fe0d9" parentID="1095" level="2" creatorID="0" sortOrder="3" createDate="2016-03-27T18:41:53" updateDate="2016-03-27T18:41:53" nodeName="Lift (1)" urlName="lift-1" path="-1,1095,1124" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Lift 18,30 meter]]></description><partNo>10</partNo><rentday>700</rentday><group><![CDATA[Maskiner m.v.]]></group></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1125, N'54ceb80b-0f0d-4fc4-8b19-e8e7d4831438', CAST(N'2016-03-27 18:42:36.900' AS DateTime), N'<sortiment id="1125" key="7ba41ee4-7fdb-4a21-9699-c0eccb588dc1" parentID="1095" level="2" creatorID="0" sortOrder="4" createDate="2016-03-27T18:42:36" updateDate="2016-03-27T18:42:36" nodeName="Betonhammer" urlName="betonhammer" path="-1,1095,1125" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Betonhammer inkl. 2 mejsler]]></description><partNo>1000</partNo><rentday>280</rentday><size><![CDATA[27 kg.]]></size><group><![CDATA[Maskiner m.v.]]></group><force><![CDATA[220 v.]]></force></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1126, N'80ab6f18-b79d-4a0b-b705-60d5ad43ebe6', CAST(N'2016-03-27 18:43:19.683' AS DateTime), N'<sortiment id="1126" key="2e80696a-de94-44ed-9cda-064f1bd0d9ec" parentID="1095" level="2" creatorID="0" sortOrder="5" createDate="2016-03-27T18:43:19" updateDate="2016-03-27T18:43:19" nodeName="Bygningshammer" urlName="bygningshammer" path="-1,1095,1126" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Bygningshammer inkl. 2 mejsler]]></description><partNo>1001</partNo><rentday>120</rentday><size><![CDATA[7 kg.]]></size><group><![CDATA[Maskiner m.v.]]></group><force><![CDATA[220 v.]]></force></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1127, N'c263cf0e-2f7f-4ae4-821d-75236fd22471', CAST(N'2016-03-27 18:46:49.937' AS DateTime), N'<sortiment id="1127" key="c1c200b5-e3bb-44d4-9f9a-4884ad6c3216" parentID="1095" level="2" creatorID="0" sortOrder="6" createDate="2016-03-27T18:44:09" updateDate="2016-03-27T18:46:49" nodeName="Borehammer" urlName="borehammer" path="-1,1095,1127" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Borehammer]]></description><partNo>1003</partNo><rentday>120</rentday><size><![CDATA[5 kg.]]></size><group><![CDATA[Maskiner m.v.]]></group><force><![CDATA[220 v.]]></force></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1128, N'148dedb5-7764-4dd4-abc9-ca07e813579f', CAST(N'2016-03-27 18:47:36.063' AS DateTime), N'<sortiment id="1128" key="13cc1400-51e7-4268-97c8-d98e7d400234" parentID="1095" level="2" creatorID="0" sortOrder="7" createDate="2016-03-27T18:47:36" updateDate="2016-03-27T18:47:36" nodeName="Stillads" urlName="stillads" path="-1,1095,1128" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Stillads, ekstra højde per meter]]></description><partNo>1004</partNo><rentday>50</rentday><group><![CDATA[Maskiner m.v.]]></group></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1129, N'48ee86c4-c6bf-45be-8368-1f3f8b4c0674', CAST(N'2016-03-27 18:48:09.423' AS DateTime), N'<sortiment id="1129" key="d449c278-6963-4c18-849a-9666572fa93c" parentID="1095" level="2" creatorID="0" sortOrder="8" createDate="2016-03-27T18:48:09" updateDate="2016-03-27T18:48:09" nodeName="Borekrone" urlName="borekrone" path="-1,1095,1129" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Borekrone u/maskine ekskl. forbrug]]></description><partNo>1006</partNo><rentday>80</rentday><group><![CDATA[Maskiner m.v.]]></group></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1130, N'ceab5b72-b405-4fbf-984b-48fd5ac94a01', CAST(N'2016-03-27 18:48:46.723' AS DateTime), N'<sortiment id="1130" key="b5684efa-64b7-43b2-b805-81cb76adba0f" parentID="1095" level="2" creatorID="0" sortOrder="9" createDate="2016-03-27T18:48:46" updateDate="2016-03-27T18:48:46" nodeName="Håndbetonsliber" urlName="haandbetonsliber" path="-1,1095,1130" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Håndbetonsliber excl. tilbehør og forbrug]]></description><partNo>1007</partNo><rentday>280</rentday><group><![CDATA[Maskiner m.v.]]></group><force><![CDATA[230 v.]]></force></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1131, N'd0771336-241f-4a0d-8706-ad3a9759a7a4', CAST(N'2016-03-27 18:49:41.970' AS DateTime), N'<sortiment id="1131" key="0a0c5ace-a4e0-48cb-84e5-643bbb0eda6d" parentID="1095" level="2" creatorID="0" sortOrder="10" createDate="2016-03-27T18:49:41" updateDate="2016-03-27T18:49:41" nodeName="Asfalt- og betonskæremaskine" urlName="asfalt-og-betonskaeremaskine" path="-1,1095,1131" isDoc="" nodeType="1089" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sortiment"><description><![CDATA[Asfalt- og betonskæremaskine ekskl. forbrug]]></description><partNo>1008</partNo><rentday>380</rentday><size><![CDATA[Skæredybde 170 mm. klingediam. 500 mm. vand 27 lt.]]></size><group><![CDATA[Maskiner m.v.]]></group><force><![CDATA[Benzin]]></force></sortiment>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1132, N'ec6b15fe-d8a8-40aa-841d-6b2edbbeda4b', CAST(N'2016-03-30 09:17:19.973' AS DateTime), N'<usedMachines id="1132" key="6b41b7f2-daaf-48a7-b3dd-c59c1590c652" parentID="1113" level="2" creatorID="0" sortOrder="2" createDate="2016-03-30T09:03:05" updateDate="2016-03-30T09:17:19" nodeName="Machine 3" urlName="machine-3" path="-1,1113,1132" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1133</picture><machineName><![CDATA[Bobcat]]></machineName><description><![CDATA[Nam ac erat massa. Nulla sit amet purus sit amet est placerat faucibus at vitae enim. Proin convallis orci odio, et suscipit nulla pharetra ut.]]></description><price>12000</price><information><![CDATA[<p><span>Nam ac erat massa. Nulla sit amet purus sit amet est placerat faucibus at vitae enim. Proin convallis orci odio, et suscipit nulla pharetra ut. Suspendisse vel ligula vel velit ultricies sagittis eget nec nulla. Proin commodo tortor quis euismod maximus. Quisque imperdiet tortor sed viverra eleifend. Duis vel varius odio, vel vehicula enim. Suspendisse maximus nunc vel lectus dignissim, et ultricies erat viverra. Phasellus sit amet luctus turpis. Vestibulum eros velit, condimentum et elit sed, vehicula condimentum libero. Donec tincidunt tempus semper. Quisque vitae placerat dolor. Donec turpis enim, vulputate id turpis eget, sollicitudin sollicitudin tortor. In semper varius mauris tristique auctor. Aliquam erat volutpat. Etiam eget ante sed urna auctor vehicula.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1132, N'1423a520-5b5a-40dc-a84d-8d66b3a83062', CAST(N'2016-03-30 09:03:05.487' AS DateTime), N'<usedMachines id="1132" key="6b41b7f2-daaf-48a7-b3dd-c59c1590c652" parentID="1113" level="2" creatorID="0" sortOrder="2" createDate="2016-03-30T09:03:05" updateDate="2016-03-30T09:03:05" nodeName="Machine 3" urlName="machine-3" path="-1,1113,1132" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1138, N'ad1894b5-3b84-4ec7-a371-f2d850f7ba91', CAST(N'2016-03-30 10:57:04.480' AS DateTime), N'<usedMachines id="1138" key="7a449133-23f0-4607-af43-121012c998db" parentID="1113" level="2" creatorID="0" sortOrder="3" createDate="2016-03-30T10:57:04" updateDate="2016-03-30T10:57:04" nodeName="Maskine 4" urlName="maskine-4" path="-1,1113,1138" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1134</picture><machineName><![CDATA[Mejetærsker]]></machineName><description><![CDATA[Praesent fringilla sagittis nisl, a porttitor quam convallis non. Aenean fringilla interdum diam, vitae faucibus turpis lobortis semper.]]></description><price>30000</price><information><![CDATA[<p><span>Praesent fringilla sagittis nisl, a porttitor quam convallis non. Aenean fringilla interdum diam, vitae faucibus turpis lobortis semper. Nunc rutrum eleifend orci bibendum faucibus. Duis eget porttitor elit. Suspendisse auctor in quam laoreet pellentesque. Aliquam mattis lacus dapibus magna lacinia placerat. Vestibulum molestie, justo posuere euismod facilisis, sem tellus sollicitudin mauris, at dictum ante nunc id quam. Curabitur condimentum augue vel massa pretium, pharetra placerat urna elementum. Nulla facilisi. Sed odio purus, rhoncus ac cursus non, mattis sit amet ante.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1139, N'8dd94ea1-b231-44cd-bfe4-0430587649a8', CAST(N'2016-03-30 10:57:52.280' AS DateTime), N'<usedMachines id="1139" key="b598c32c-c533-4db6-ba9f-35a62dc57b7e" parentID="1113" level="2" creatorID="0" sortOrder="4" createDate="2016-03-30T10:57:52" updateDate="2016-03-30T10:57:52" nodeName="Maskine 5" urlName="maskine-5" path="-1,1113,1139" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1135</picture><machineName><![CDATA[Fræser]]></machineName><description><![CDATA[enean eget libero elementum, vulputate tellus at, commodo sem. Cras id tristique turpis.]]></description><price>2000</price><information><![CDATA[<p><span>Aenean eget libero elementum, vulputate tellus at, commodo sem. Cras id tristique turpis. Vestibulum malesuada vestibulum euismod. Pellentesque consequat fermentum nisi vitae lobortis. Mauris condimentum consequat dolor vitae cursus. Nam efficitur urna et lacus posuere dignissim. Suspendisse sodales risus ut felis cursus, in tincidunt dui gravida. Morbi consectetur elit eget risus porta commodo. Suspendisse scelerisque purus sed libero ultrices feugiat. Donec mattis elit ac maximus maximus. In id condimentum orci. Donec blandit nisl augue, ut pellentesque orci mollis vel. Nam tristique dui ac nunc posuere, vitae facilisis libero blandit.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1140, N'd4f2f415-5087-4186-91db-e7b812cd70c5', CAST(N'2016-03-30 11:28:07.943' AS DateTime), N'<usedMachines id="1140" key="764d09aa-9ab8-411b-8a1c-c7b68b9e6544" parentID="1113" level="2" creatorID="0" sortOrder="5" createDate="2016-03-30T11:28:07" updateDate="2016-03-30T11:28:07" nodeName="Maskine 6" urlName="maskine-6" path="-1,1113,1140" isDoc="" nodeType="1112" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="usedMachines"><picture>1137</picture><machineName><![CDATA[Traktor]]></machineName><description><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu sapien nunc.]]></description><price>50000</price><information><![CDATA[<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu sapien nunc. Phasellus sapien sapien, aliquam sit amet malesuada tincidunt, fermentum eu lorem. Fusce vel tellus volutpat, rutrum metus eget, elementum mi. Morbi euismod eu sem ut cursus. Nam egestas ullamcorper maximus. Maecenas condimentum nulla et dictum consequat. Nulla sit amet leo mi. Duis ullamcorper augue ac lobortis viverra. Donec in facilisis velit, eu rhoncus neque. Etiam massa elit, sollicitudin placerat tristique in, porta ac ligula. Morbi vitae condimentum tortor, at elementum purus. Nunc a erat convallis, ultricies tellus vitae, malesuada nunc.</span></p>]]></information></usedMachines>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1144, N'24a159f3-49ec-4dca-b2a9-e7101e763c18', CAST(N'2016-03-30 11:39:22.517' AS DateTime), N'<sponsorFolder id="1144" key="759d7f67-c7f5-4262-aabe-7141aaef3178" parentID="-1" level="1" creatorID="0" sortOrder="4" createDate="2016-03-30T11:39:22" updateDate="2016-03-30T11:39:22" nodeName="Sponsors" urlName="sponsors" path="-1,1144" isDoc="" nodeType="1141" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsorFolder" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1145, N'd2a85cb9-4000-4a1d-bbce-82abcd2224aa', CAST(N'2016-03-30 11:41:02.197' AS DateTime), N'<sponsor id="1145" key="0a210c42-b276-463d-a4a7-fb4999777dfb" parentID="1144" level="2" creatorID="0" sortOrder="0" createDate="2016-03-30T11:40:47" updateDate="2016-03-30T11:41:02" nodeName="Bad boy" urlName="bad-boy" path="-1,1144,1145" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1057</image><link><![CDATA[[
  {
    "caption": "Bad boy",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": true,
    "isInternal": false,
    "type": "external",
    "title": "Bad boy"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1145, N'98ede9c2-9835-4f7a-b02e-98a247f0be86', CAST(N'2016-03-30 11:40:56.363' AS DateTime), N'<sponsor id="1145" key="0a210c42-b276-463d-a4a7-fb4999777dfb" parentID="1144" level="2" creatorID="0" sortOrder="0" createDate="2016-03-30T11:40:47" updateDate="2016-03-30T11:40:56" nodeName="Bad boy" urlName="bad-boy" path="-1,1144,1145" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1057</image><link><![CDATA[[
  {
    "caption": "Bad boy",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Bad boy"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1145, N'9ed2f0b3-7fa3-432d-9823-df8cc4ef798a', CAST(N'2016-03-30 11:40:47.667' AS DateTime), N'<sponsor id="1145" key="0a210c42-b276-463d-a4a7-fb4999777dfb" parentID="1144" level="2" creatorID="0" sortOrder="0" createDate="2016-03-30T11:40:47" updateDate="2016-03-30T11:40:47" nodeName="Bad boy" urlName="bad-boy" path="-1,1144,1145" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1057</image></sponsor>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1146, N'a7873891-9ffa-478a-8efe-10c87f5a4be2', CAST(N'2016-03-30 11:42:04.853' AS DateTime), N'<sponsor id="1146" key="fd10f86f-1508-4cf6-8740-c5f62e4b0f0e" parentID="1144" level="2" creatorID="0" sortOrder="1" createDate="2016-03-30T11:41:43" updateDate="2016-03-30T11:42:04" nodeName="Stiga" urlName="stiga" path="-1,1144,1146" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1062</image><link><![CDATA[[
  {
    "caption": "Stiga",
    "link": "http://www.stiga.dk/hjem.html",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Stiga"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1147, N'e4116194-4885-4ece-94c1-0c17d38c3577', CAST(N'2016-03-30 11:42:43.903' AS DateTime), N'<sponsor id="1147" key="3006ffa7-0625-451d-baa7-19fdd15e607b" parentID="1144" level="2" creatorID="0" sortOrder="2" createDate="2016-03-30T11:42:35" updateDate="2016-03-30T11:42:43" nodeName="Stihl" urlName="stihl" path="-1,1144,1147" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1064</image><link><![CDATA[[
  {
    "caption": "Stihl",
    "link": "http://www.stihl.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Stihl"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1147, N'29310804-668c-4573-a4b3-9f357d55096e', CAST(N'2016-03-30 11:42:35.683' AS DateTime), N'<sponsor id="1147" key="3006ffa7-0625-451d-baa7-19fdd15e607b" parentID="1144" level="2" creatorID="0" sortOrder="2" createDate="2016-03-30T11:42:35" updateDate="2016-03-30T11:42:35" nodeName="Stihl" urlName="stihl" path="-1,1144,1147" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1064</image></sponsor>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1148, N'e0c94675-9518-4d3c-81a2-c0a4ded3a79d', CAST(N'2016-03-30 11:50:02.993' AS DateTime), N'<sponsor id="1148" key="6f241c3b-1f14-4a23-818f-ec320e87f5d4" parentID="1144" level="2" creatorID="0" sortOrder="3" createDate="2016-03-30T11:50:02" updateDate="2016-03-30T11:50:02" nodeName="Viking" urlName="viking" path="-1,1144,1148" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1065</image><link><![CDATA[[
  {
    "caption": "Viking",
    "link": "http://www.stihl.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Viking"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1149, N'866e08e5-f650-45eb-a20c-4f07d242e8b9', CAST(N'2016-03-30 11:50:45.170' AS DateTime), N'<sponsor id="1149" key="bb10057c-0714-41b7-9d91-a02f7aca00d2" parentID="1144" level="2" creatorID="0" sortOrder="4" createDate="2016-03-30T11:50:45" updateDate="2016-03-30T11:50:45" nodeName="Club car" urlName="club-car" path="-1,1144,1149" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1058</image><link><![CDATA[[
  {
    "caption": "Club car",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Club car"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1150, N'0227d70e-44c5-4532-9288-0e72b5c79b48', CAST(N'2016-03-30 12:07:13.223' AS DateTime), N'<sponsor id="1150" key="a5ba6dc4-c9a0-48c5-b973-d8a8edb75433" parentID="1144" level="2" creatorID="0" sortOrder="5" createDate="2016-03-30T12:07:13" updateDate="2016-03-30T12:07:13" nodeName="ISEKI" urlName="iseki" path="-1,1144,1150" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1059</image><link><![CDATA[[
  {
    "caption": "ISEKI",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ISEKI"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1151, N'6cdc4498-af4a-450a-937f-9b35928892c6', CAST(N'2016-03-30 12:07:56.290' AS DateTime), N'<sponsor id="1151" key="715f506d-4ea3-4d7a-a181-8b90aa06e295" parentID="1144" level="2" creatorID="0" sortOrder="6" createDate="2016-03-30T12:07:56" updateDate="2016-03-30T12:07:56" nodeName="Ventrac" urlName="ventrac" path="-1,1144,1151" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1060</image><link><![CDATA[[
  {
    "caption": "Ventrac",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Ventrac"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1152, N'16d9a48f-061f-440e-8a24-7ec948c0a8e4', CAST(N'2016-03-30 12:08:27.313' AS DateTime), N'<sponsor id="1152" key="6f066018-a7e0-46f4-9668-3b1dd8703eb7" parentID="1144" level="2" creatorID="0" sortOrder="7" createDate="2016-03-30T12:08:27" updateDate="2016-03-30T12:08:27" nodeName="Vitra" urlName="vitra" path="-1,1144,1152" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1061</image><link><![CDATA[[
  {
    "caption": "VITRA",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "VITRA"
  }
]]]></link></sponsor>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1153, N'664c1195-1fef-4fa5-b305-d6c253019baf', CAST(N'2016-03-30 12:08:57.813' AS DateTime), N'<sponsor id="1153" key="02951e04-1caf-4be8-be28-366aa374ade0" parentID="1144" level="2" creatorID="0" sortOrder="8" createDate="2016-03-30T12:08:57" updateDate="2016-03-30T12:08:57" nodeName="Stiga shoppen" urlName="stiga-shoppen" path="-1,1144,1153" isDoc="" nodeType="1143" creatorName="Cthian" writerName="Cthian" writerID="0" template="0" nodeTypeAlias="sponsor"><image>1063</image><link><![CDATA[[
  {
    "caption": "Stiga shoppen",
    "link": "http://www.stiga.dk/hjem.html",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Stiga shoppen"
  }
]]]></link></sponsor>')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] ON 

INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1, 1050, N'8794b475-f3af-4745-ab69-5725ef4eb3d3', 35, NULL, NULL, NULL, N'Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (2, 1050, N'8794b475-f3af-4745-ab69-5725ef4eb3d3', 36, NULL, NULL, NULL, NULL, N'<p>Bla bla</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (5, 1050, N'7d194761-4a18-47bc-8886-dadb4ce6b29f', 35, NULL, NULL, NULL, N'Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (6, 1050, N'7d194761-4a18-47bc-8886-dadb4ce6b29f', 36, NULL, NULL, NULL, NULL, N'<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (11, 1055, N'59e22d08-8266-4f4f-970d-8c55b086d7e4', 27, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (12, 1056, N'f53590e5-77e7-4e31-87f8-c955ebb5184d', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1001/katalogstudent023.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (13, 1056, N'f53590e5-77e7-4e31-87f8-c955ebb5184d', 7, NULL, NULL, NULL, N'150', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (14, 1056, N'f53590e5-77e7-4e31-87f8-c955ebb5184d', 8, NULL, NULL, NULL, N'84', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (15, 1056, N'f53590e5-77e7-4e31-87f8-c955ebb5184d', 9, NULL, NULL, NULL, N'4209', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (16, 1056, N'f53590e5-77e7-4e31-87f8-c955ebb5184d', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (17, 1057, N'3c787a9b-70b0-44a1-9308-ee4d2222c281', 6, NULL, NULL, NULL, NULL, N'{
  "src": "/media/1002/mask_badboy.jpg",
  "focalPoint": {
    "left": 0.5,
    "top": 0.5
  }
}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (18, 1057, N'3c787a9b-70b0-44a1-9308-ee4d2222c281', 7, NULL, NULL, NULL, N'100', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (19, 1057, N'3c787a9b-70b0-44a1-9308-ee4d2222c281', 8, NULL, NULL, NULL, N'33', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (20, 1057, N'3c787a9b-70b0-44a1-9308-ee4d2222c281', 9, NULL, NULL, NULL, N'20832', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (21, 1057, N'3c787a9b-70b0-44a1-9308-ee4d2222c281', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (22, 1058, N'ab6de0f2-ca9d-4410-8dad-12c6bcf215d7', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1003/mask_clubcar.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (23, 1058, N'ab6de0f2-ca9d-4410-8dad-12c6bcf215d7', 7, NULL, NULL, NULL, N'100', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (24, 1058, N'ab6de0f2-ca9d-4410-8dad-12c6bcf215d7', 8, NULL, NULL, NULL, N'33', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (25, 1058, N'ab6de0f2-ca9d-4410-8dad-12c6bcf215d7', 9, NULL, NULL, NULL, N'18235', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (26, 1058, N'ab6de0f2-ca9d-4410-8dad-12c6bcf215d7', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (27, 1059, N'ec2cc161-edb3-4b8b-b2a0-de748293c7f7', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1004/mask_iseki.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (28, 1059, N'ec2cc161-edb3-4b8b-b2a0-de748293c7f7', 7, NULL, NULL, NULL, N'100', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (29, 1059, N'ec2cc161-edb3-4b8b-b2a0-de748293c7f7', 8, NULL, NULL, NULL, N'33', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (30, 1059, N'ec2cc161-edb3-4b8b-b2a0-de748293c7f7', 9, NULL, NULL, NULL, N'17647', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (31, 1059, N'ec2cc161-edb3-4b8b-b2a0-de748293c7f7', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (32, 1060, N'db4b9084-8879-42a6-b4ed-8892ae94d991', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1005/mask_ventrac.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (33, 1060, N'db4b9084-8879-42a6-b4ed-8892ae94d991', 7, NULL, NULL, NULL, N'100', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (34, 1060, N'db4b9084-8879-42a6-b4ed-8892ae94d991', 8, NULL, NULL, NULL, N'33', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (35, 1060, N'db4b9084-8879-42a6-b4ed-8892ae94d991', 9, NULL, NULL, NULL, N'17042', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (36, 1060, N'db4b9084-8879-42a6-b4ed-8892ae94d991', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (37, 1061, N'407c4ea1-fa61-46dc-8588-09ae3447d556', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1006/mask_vitra.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (38, 1061, N'407c4ea1-fa61-46dc-8588-09ae3447d556', 7, NULL, NULL, NULL, N'100', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (39, 1061, N'407c4ea1-fa61-46dc-8588-09ae3447d556', 8, NULL, NULL, NULL, N'33', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (40, 1061, N'407c4ea1-fa61-46dc-8588-09ae3447d556', 9, NULL, NULL, NULL, N'17956', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (41, 1061, N'407c4ea1-fa61-46dc-8588-09ae3447d556', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (42, 1062, N'e7a3cc07-656a-4edf-8950-8d2191d2d23b', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1007/stiga.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (43, 1062, N'e7a3cc07-656a-4edf-8950-8d2191d2d23b', 7, NULL, NULL, NULL, N'125', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (44, 1062, N'e7a3cc07-656a-4edf-8950-8d2191d2d23b', 8, NULL, NULL, NULL, N'109', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (45, 1062, N'e7a3cc07-656a-4edf-8950-8d2191d2d23b', 9, NULL, NULL, NULL, N'27764', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (46, 1062, N'e7a3cc07-656a-4edf-8950-8d2191d2d23b', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (47, 1063, N'c1039c5f-9e51-4c39-b663-e8b8b904e76b', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1008/stiga_0.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (48, 1063, N'c1039c5f-9e51-4c39-b663-e8b8b904e76b', 7, NULL, NULL, NULL, N'100', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (49, 1063, N'c1039c5f-9e51-4c39-b663-e8b8b904e76b', 8, NULL, NULL, NULL, N'99', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (50, 1063, N'c1039c5f-9e51-4c39-b663-e8b8b904e76b', 9, NULL, NULL, NULL, N'32145', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (51, 1063, N'c1039c5f-9e51-4c39-b663-e8b8b904e76b', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (52, 1064, N'18590cd0-bed7-44cf-bdb4-8eec0035e2ce', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1009/stihl_logo.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (53, 1064, N'18590cd0-bed7-44cf-bdb4-8eec0035e2ce', 7, NULL, NULL, NULL, N'695', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (54, 1064, N'18590cd0-bed7-44cf-bdb4-8eec0035e2ce', 8, NULL, NULL, NULL, N'344', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (55, 1064, N'18590cd0-bed7-44cf-bdb4-8eec0035e2ce', 9, NULL, NULL, NULL, N'36185', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (56, 1064, N'18590cd0-bed7-44cf-bdb4-8eec0035e2ce', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (57, 1065, N'6419b43a-c283-4ae9-a5ea-2d4e51f00981', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1010/viking.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (58, 1065, N'6419b43a-c283-4ae9-a5ea-2d4e51f00981', 7, NULL, NULL, NULL, N'100', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (59, 1065, N'6419b43a-c283-4ae9-a5ea-2d4e51f00981', 8, NULL, NULL, NULL, N'33', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (60, 1065, N'6419b43a-c283-4ae9-a5ea-2d4e51f00981', 9, NULL, NULL, NULL, N'17032', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (61, 1065, N'6419b43a-c283-4ae9-a5ea-2d4e51f00981', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (62, 1066, N'64176c75-8ccc-4007-a7d7-8a654c1208f4', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1011/bfcd0cbc730e20fa26d794cbffd22128.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (63, 1066, N'64176c75-8ccc-4007-a7d7-8a654c1208f4', 7, NULL, NULL, NULL, N'480', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (64, 1066, N'64176c75-8ccc-4007-a7d7-8a654c1208f4', 8, NULL, NULL, NULL, N'320', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (65, 1066, N'64176c75-8ccc-4007-a7d7-8a654c1208f4', 9, NULL, NULL, NULL, N'57250', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (66, 1066, N'64176c75-8ccc-4007-a7d7-8a654c1208f4', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (67, 1067, N'955e0db6-77be-4ec8-abd2-4cfa3edb59d7', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1012/gravemaskine.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (68, 1067, N'955e0db6-77be-4ec8-abd2-4cfa3edb59d7', 7, NULL, NULL, NULL, N'536', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (69, 1067, N'955e0db6-77be-4ec8-abd2-4cfa3edb59d7', 8, NULL, NULL, NULL, N'402', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (70, 1067, N'955e0db6-77be-4ec8-abd2-4cfa3edb59d7', 9, NULL, NULL, NULL, N'46773', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (71, 1067, N'955e0db6-77be-4ec8-abd2-4cfa3edb59d7', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (72, 1050, N'7d194761-4a18-47bc-8886-dadb4ce6b29f', 37, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (73, 1068, N'38fc5bed-f5e9-4f55-870e-f33df0b48b4d', 27, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (74, 1069, N'2463b1c7-ef0b-4252-b9be-360df92e15f0', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1013/maskinlogo.gif'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (75, 1069, N'2463b1c7-ef0b-4252-b9be-360df92e15f0', 7, NULL, NULL, NULL, N'150', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (76, 1069, N'2463b1c7-ef0b-4252-b9be-360df92e15f0', 8, NULL, NULL, NULL, N'100', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (77, 1069, N'2463b1c7-ef0b-4252-b9be-360df92e15f0', 9, NULL, NULL, NULL, N'3544', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (78, 1069, N'2463b1c7-ef0b-4252-b9be-360df92e15f0', 10, NULL, NULL, NULL, N'gif', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (79, 1050, N'b44f5fe8-e3c2-4eda-b5d1-d323ded6c489', 35, NULL, NULL, NULL, N'Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (80, 1050, N'b44f5fe8-e3c2-4eda-b5d1-d323ded6c489', 36, NULL, NULL, NULL, NULL, N'<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (81, 1050, N'b44f5fe8-e3c2-4eda-b5d1-d323ded6c489', 37, 1069, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (82, 1070, N'72c100de-0013-4ed1-8187-47ae69e09534', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1014/maskinlogosmall.gif'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (83, 1070, N'72c100de-0013-4ed1-8187-47ae69e09534', 7, NULL, NULL, NULL, N'90', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (84, 1070, N'72c100de-0013-4ed1-8187-47ae69e09534', 8, NULL, NULL, NULL, N'60', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (85, 1070, N'72c100de-0013-4ed1-8187-47ae69e09534', 9, NULL, NULL, NULL, N'3622', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (86, 1070, N'72c100de-0013-4ed1-8187-47ae69e09534', 10, NULL, NULL, NULL, N'gif', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (87, 1050, N'29a4a22a-0da2-40c7-a380-303e192733c7', 35, NULL, NULL, NULL, N'Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (88, 1050, N'29a4a22a-0da2-40c7-a380-303e192733c7', 36, NULL, NULL, NULL, NULL, N'<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (89, 1050, N'29a4a22a-0da2-40c7-a380-303e192733c7', 37, 1070, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (94, 1050, N'29a4a22a-0da2-40c7-a380-303e192733c7', 45, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (95, 1050, N'29a4a22a-0da2-40c7-a380-303e192733c7', 42, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (96, 1050, N'29a4a22a-0da2-40c7-a380-303e192733c7', 43, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (97, 1050, N'29a4a22a-0da2-40c7-a380-303e192733c7', 44, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (98, 1050, N'29a4a22a-0da2-40c7-a380-303e192733c7', 40, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (99, 1050, N'29a4a22a-0da2-40c7-a380-303e192733c7', 41, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (100, 1050, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', 35, NULL, NULL, NULL, N'Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (101, 1050, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', 36, NULL, NULL, NULL, NULL, N'<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (102, 1050, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', 37, 1070, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (103, 1050, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', 45, NULL, NULL, NULL, N'Tønder', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (104, 1050, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', 42, 6270, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (105, 1050, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', 43, 21906161, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (106, 1050, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', 44, NULL, NULL, NULL, N'toendermaskinudlejning@mail.dk', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (107, 1050, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', 40, NULL, NULL, NULL, N'Tønder Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (108, 1050, N'127fc239-0eb3-4a2c-a91f-bff73d4de227', 41, NULL, NULL, NULL, N'Hydrovej 4', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (109, 1080, N'524db0cf-69e2-491f-a390-f9333fb2207b', 39, NULL, NULL, NULL, NULL, N'<p><strong>§1</strong></p>
<p><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p>Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<table border="0" cellspacing="1" cellpadding="1" width="100%" align="left">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>')
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (110, 1080, N'524db0cf-69e2-491f-a390-f9333fb2207b', 38, NULL, NULL, NULL, N'Lejebetingelser', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (111, 1080, N'1e5e6057-32a0-42f2-9b19-f433bc23ebfd', 39, NULL, NULL, NULL, NULL, N'<p><strong>§1</strong></p>
<p><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p>Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<table border="0" cellspacing="1" cellpadding="1" width="100%" align="left">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (112, 1080, N'1e5e6057-32a0-42f2-9b19-f433bc23ebfd', 38, NULL, NULL, NULL, N'Lejebetingelser', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (113, 1080, N'a317dd7b-67f6-4749-a3a8-2f0bf5571712', 39, NULL, NULL, NULL, NULL, N'<p><strong>§1</strong></p>
<p><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<p><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p> </p>
<p><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p> </p>
<p><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p> </p>
<p><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p> </p>
<p><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p> </p>
<p><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p> </p>
<p><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p> </p>
<p><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p> </p>
<p><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p> </p>
<p><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p> </p>
<p><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p> </p>
<p><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p> </p>
<p>Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<p> </p>
<table border="0" cellspacing="1" cellpadding="1" width="100%" align="left">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (114, 1080, N'a317dd7b-67f6-4749-a3a8-2f0bf5571712', 38, NULL, NULL, NULL, N'Lejebetingelser', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (115, 1080, N'b45351b8-b4af-4717-aee2-6b681a79316b', 39, NULL, NULL, NULL, NULL, N'<p><strong>§1</strong></p>
<p><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<p><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p> </p>
<p><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p> </p>
<p><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p> </p>
<p><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p> </p>
<p><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p> </p>
<p><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p> </p>
<p><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p> </p>
<p><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p> </p>
<p><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p> </p>
<p><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p> </p>
<p><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p> </p>
<p><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p> </p>
<p>Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<p> </p>
<table border="0" cellspacing="1" cellpadding="1" width="100%">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (116, 1080, N'b45351b8-b4af-4717-aee2-6b681a79316b', 38, NULL, NULL, NULL, N'Lejebetingelser', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (117, 1085, N'cecd8ad9-04c6-4442-a1f7-25b0126a8f41', 46, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (118, 1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', 35, NULL, NULL, NULL, N'Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (119, 1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', 36, NULL, NULL, NULL, NULL, N'<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (120, 1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', 37, 1070, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (121, 1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', 45, NULL, NULL, NULL, N'Tønder', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (122, 1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', 42, 6270, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (123, 1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', 43, 21906161, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (124, 1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', 44, NULL, NULL, NULL, N'toendermaskinudlejning@mail.dk', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (125, 1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', 40, NULL, NULL, NULL, N'Tønder Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (126, 1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', 41, NULL, NULL, NULL, N'Hydrovej 4', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (127, 1085, N'a8674da5-05f0-400b-b3a4-e6dc6835d693', 46, NULL, NULL, NULL, N'https://www.google.com/maps/embed/v1/place?q=place_id:ChIJbbcRdDS6tEcR03ThReJ0OIc&', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (128, 1085, N'1a10e7df-f26a-401f-9f93-f1dfa71610e6', 46, NULL, NULL, NULL, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2291.2578835765157!2d8.861346316078947!3d54.9510370610063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b4ba347411b76d%3A0x873874e245e174d3!2sT%C3%B8nder+Maskinudlejning+ApS!5e0!3m2!1sda!2sdk!4v1458818558630', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (129, 1085, N'1a10e7df-f26a-401f-9f93-f1dfa71610e6', 48, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (130, 1085, N'1a10e7df-f26a-401f-9f93-f1dfa71610e6', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (131, 1085, N'23adf3c0-1ba3-4e3e-a094-0f1fffd1551a', 48, NULL, NULL, NULL, NULL, N'<p>Hydrovej 4<br />6270 Tønder</p>
<p>Mobil: 21 90 61 61<br />Fax: 73 72 61 61</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (132, 1085, N'23adf3c0-1ba3-4e3e-a094-0f1fffd1551a', 47, NULL, NULL, NULL, N'Kontakt Tønder Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (133, 1085, N'23adf3c0-1ba3-4e3e-a094-0f1fffd1551a', 46, NULL, NULL, NULL, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2291.2578835765157!2d8.861346316078947!3d54.9510370610063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b4ba347411b76d%3A0x873874e245e174d3!2sT%C3%B8nder+Maskinudlejning+ApS!5e0!3m2!1sda!2sdk!4v1458818558630', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (134, 1087, N'fcf20686-871f-44ad-bd47-e6433331f087', 39, NULL, NULL, NULL, NULL, N'<p> </p>
<p><br />Vi er autoriseret Stiga, Stihl, Viking, Ventrac, Vitra, Bad Boy, Iseki og Club Car forhandler og opdaterer os løbende med kurser for at sikre os den nyeste viden om de maskiner vi sælger og servicerer.<br />Dette sikrer, at du som kunde trygt kan overlade din maskine til os, da vi har den fornødne ekspertise og viden samt det rigtige værktøj.<br />Vores værksted klarer reparationer af alle mærker, både stort og småt - herudnder garantireparation - uanset hvor din maskine er købt.<br />Ved behov sender vi vores servicebil til kunden<br />Online adgang til vore leverandører af reservedele<br />Vi har altid et stort udvalg i nye og brugte maskiner på lager. Mangler du en ny eller brugt maskine til haven så kontakt os, vi er altid friske med et godt tilbud</p>
<p><strong>Undgå bøvl og problemer......</strong></p>
<p> </p>
<p>Når du køber din havemaskine hos os er den naturligvis klargjort, justeret, samt påfyldt korrekt olie og benzin</p>
<p> </p>
<p><strong>Rigtige redskaber sælges kun af rigtige eksperter....</strong></p>
<p> </p>
<p>Vi har et bredt udvalg indenfor maskiner til skov, have og park</p>
<p>Stort værksted med faguddannet personale</p>
<p>Vores kundekreds er både private og erhvervskunder</p>
<p>Vi er stolte af de produkter vi sælger</p>
<p> </p>
<p>Kig ind og få en snak med os.</p>
<p>Vi rådgiver gerne hvis du er i tvivl, så du får den bedste maskine til netop dit behov</p>
<p>Vi skal leve af, at vores kunder er tilfredse, derfor vil du opleve en kompetent service og faglig vejledning hos os.</p>
<p> </p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (135, 1087, N'fcf20686-871f-44ad-bd47-e6433331f087', 38, NULL, NULL, NULL, N'Værksted', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (136, 1087, N'cfd4f9ac-8ae5-4b4d-a286-cd8195f4134b', 39, NULL, NULL, NULL, NULL, N'<p> </p>
<p><br />Vi er autoriseret Stiga, Stihl, Viking, Ventrac, Vitra, Bad Boy, Iseki og Club Car forhandler og opdaterer os løbende med kurser for at sikre os den nyeste viden om de maskiner vi sælger og servicerer.<br />Dette sikrer, at du som kunde trygt kan overlade din maskine til os, da vi har den fornødne ekspertise og viden samt det rigtige værktøj.<br />Vores værksted klarer reparationer af alle mærker, både stort og småt - herudnder garantireparation - uanset hvor din maskine er købt.<br />Ved behov sender vi vores servicebil til kunden<br />Online adgang til vore leverandører af reservedele<br />Vi har altid et stort udvalg i nye og brugte maskiner på lager. Mangler du en ny eller brugt maskine til haven så kontakt os, vi er altid friske med et godt tilbud</p>
<p><strong>Undgå bøvl og problemer......</strong></p>
<p> </p>
<p>Når du køber din havemaskine hos os er den naturligvis klargjort, justeret, samt påfyldt korrekt olie og benzin</p>
<p> </p>
<p><strong>Rigtige redskaber sælges kun af rigtige eksperter....</strong></p>
<p> </p>
<p>Vi har et bredt udvalg indenfor maskiner til skov, have og park</p>
<p>Stort værksted med faguddannet personale</p>
<p>Vores kundekreds er både private og erhvervskunder</p>
<p>Vi er stolte af de produkter vi sælger</p>
<p> </p>
<p>Kig ind og få en snak med os.</p>
<p>Vi rådgiver gerne hvis du er i tvivl, så du får den bedste maskine til netop dit behov</p>
<p>Vi skal leve af, at vores kunder er tilfredse, derfor vil du opleve en kompetent service og faglig vejledning hos os.</p>
<p> </p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (137, 1087, N'cfd4f9ac-8ae5-4b4d-a286-cd8195f4134b', 38, NULL, NULL, NULL, N'Værksted', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (138, 1085, N'72425bac-5637-4492-b16d-ec56e3ea84c3', 48, NULL, NULL, NULL, NULL, N'<p>Hydrovej 4<br />6270 Tønder</p>
<p>Mobil: 21 90 61 61<br />Fax: 73 72 61 61</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (139, 1085, N'72425bac-5637-4492-b16d-ec56e3ea84c3', 47, NULL, NULL, NULL, N'Kontakt Tønder Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (140, 1085, N'72425bac-5637-4492-b16d-ec56e3ea84c3', 46, NULL, NULL, NULL, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2291.2578835765157!2d8.861346316078947!3d54.9510370610063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b4ba347411b76d%3A0x873874e245e174d3!2sT%C3%B8nder+Maskinudlejning+ApS!5e0!3m2!1sda!2sdk!4v1458818558630', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (141, 1087, N'8732a1d8-463b-4f02-8c2e-002e91fd54d0', 39, NULL, NULL, NULL, NULL, N'<p> </p>
<p><br />Vi er autoriseret Stiga, Stihl, Viking, Ventrac, Vitra, Bad Boy, Iseki og Club Car forhandler og opdaterer os løbende med kurser for at sikre os den nyeste viden om de maskiner vi sælger og servicerer.<br />Dette sikrer, at du som kunde trygt kan overlade din maskine til os, da vi har den fornødne ekspertise og viden samt det rigtige værktøj.<br />Vores værksted klarer reparationer af alle mærker, både stort og småt - herudnder garantireparation - uanset hvor din maskine er købt.<br />Ved behov sender vi vores servicebil til kunden<br />Online adgang til vore leverandører af reservedele<br />Vi har altid et stort udvalg i nye og brugte maskiner på lager. Mangler du en ny eller brugt maskine til haven så kontakt os, vi er altid friske med et godt tilbud</p>
<p> </p>
<p><strong>Undgå bøvl og problemer......</strong></p>
<p> </p>
<p>Når du køber din havemaskine hos os er den naturligvis klargjort, justeret, samt påfyldt korrekt olie og benzin</p>
<p> </p>
<p><strong>Rigtige redskaber sælges kun af rigtige eksperter....</strong></p>
<p> </p>
<p>Vi har et bredt udvalg indenfor maskiner til skov, have og park</p>
<p>Stort værksted med faguddannet personale</p>
<p>Vores kundekreds er både private og erhvervskunder</p>
<p>Vi er stolte af de produkter vi sælger</p>
<p> </p>
<p>Kig ind og få en snak med os.</p>
<p>Vi rådgiver gerne hvis du er i tvivl, så du får den bedste maskine til netop dit behov</p>
<p>Vi skal leve af, at vores kunder er tilfredse, derfor vil du opleve en kompetent service og faglig vejledning hos os.</p>
<p> </p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (142, 1087, N'8732a1d8-463b-4f02-8c2e-002e91fd54d0', 38, NULL, NULL, NULL, N'Værksted', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (143, 1096, N'480aae4d-cfbd-4395-8880-c17dc2f360fe', 54, NULL, CAST(0.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (145, 1096, N'480aae4d-cfbd-4395-8880-c17dc2f360fe', 51, NULL, NULL, NULL, N'Muldjord', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (146, 1096, N'480aae4d-cfbd-4395-8880-c17dc2f360fe', 53, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (147, 1096, N'480aae4d-cfbd-4395-8880-c17dc2f360fe', 52, NULL, NULL, NULL, NULL, N'En god muldjord til opfyldning af haven')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (148, 1096, N'480aae4d-cfbd-4395-8880-c17dc2f360fe', 50, NULL, NULL, NULL, N'14', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (149, 1096, N'480aae4d-cfbd-4395-8880-c17dc2f360fe', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (150, 1100, N'521328a6-b9dc-4680-9629-78da1f237b05', 56, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (151, 1100, N'c62968f5-6dc9-4484-9f6c-d9385239e06a', 56, 1095, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (152, 1096, N'480aae4d-cfbd-4395-8880-c17dc2f360fe', 57, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (153, 1096, N'1311d56b-5427-4dd2-8544-96e546fc1fc2', 54, NULL, CAST(0.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (154, 1096, N'1311d56b-5427-4dd2-8544-96e546fc1fc2', 51, NULL, NULL, NULL, N'Muldjord', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (155, 1096, N'1311d56b-5427-4dd2-8544-96e546fc1fc2', 57, 2011, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (156, 1096, N'1311d56b-5427-4dd2-8544-96e546fc1fc2', 53, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (157, 1096, N'1311d56b-5427-4dd2-8544-96e546fc1fc2', 52, NULL, NULL, NULL, NULL, N'En god muldjord til opfyldning af haven')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (158, 1096, N'1311d56b-5427-4dd2-8544-96e546fc1fc2', 50, NULL, NULL, NULL, N'14', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (159, 1096, N'1311d56b-5427-4dd2-8544-96e546fc1fc2', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (160, 1100, N'7436ccef-aab9-446d-bb38-560bec8a11ff', 56, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (161, 1100, N'6b7b8b9d-2b51-40bf-81c8-de831be3f991', 56, 1095, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (162, 1102, N'697be575-3464-4f1e-8de5-b3be752b965f', 54, NULL, CAST(0.680000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (163, 1102, N'697be575-3464-4f1e-8de5-b3be752b965f', 51, NULL, NULL, NULL, N'Champignonmuld', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (164, 1102, N'697be575-3464-4f1e-8de5-b3be752b965f', 57, 2000, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (165, 1102, N'697be575-3464-4f1e-8de5-b3be752b965f', 53, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (166, 1102, N'697be575-3464-4f1e-8de5-b3be752b965f', 52, NULL, NULL, NULL, NULL, N'Superflot flis, så kan du spare hakkejernet. Læg flis i alle dine bede.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (167, 1102, N'697be575-3464-4f1e-8de5-b3be752b965f', 50, NULL, NULL, NULL, N'14', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (168, 1102, N'697be575-3464-4f1e-8de5-b3be752b965f', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (169, 1106, N'3eadb9d0-0c79-4b92-82d1-aefe5dc82903', 58, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (170, 1100, N'0e315bb3-504f-4912-84f2-1b4eeceac7bf', 56, 1095, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (171, 1085, N'55af568e-0a54-4bde-9570-8dd990db27b7', 48, NULL, NULL, NULL, NULL, N'<p>Hydrovej 4<br />6270 Tønder</p>
<p>Mobil: 21 90 61 61<br />Fax: 73 72 61 61</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (172, 1085, N'55af568e-0a54-4bde-9570-8dd990db27b7', 47, NULL, NULL, NULL, N'Kontakt Tønder Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (173, 1085, N'55af568e-0a54-4bde-9570-8dd990db27b7', 46, NULL, NULL, NULL, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2291.2578835765157!2d8.861346316078947!3d54.9510370610063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b4ba347411b76d%3A0x873874e245e174d3!2sT%C3%B8nder+Maskinudlejning+ApS!5e0!3m2!1sda!2sdk!4v1458818558630', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (174, 1050, N'eb1bd137-e0af-4466-b9e1-7afb64fb71fc', 59, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (175, 1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', 35, NULL, NULL, NULL, N'Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (176, 1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', 36, NULL, NULL, NULL, NULL, N'<p>Velkommen til Tønder Maskinudlejning</p>
<p>Maskinudlejning - så er det os!<br />Tønder Maskinudlejning er et professionelt udlejningsfirma. Vi udlejer store og små maskiner og alt inden for værktøj til byggebranchen, håndværkere og private. Med 20 års erfaring inden for entreprenørbranchen er vi de helt rigtige samarbejdspartnere.<br />Hos os kan du leje alt hvad du har brug for til enhver opgave. Vi har fx. minilæssere, minigravemaskiner og alt inden for småt værktøj, herudover har vi alt til hus renovering og havefolket.</p>
<p>Vi tilbyder containerservice. Vore containere rummer fra 11-25 m3. Ring og forhør nærmere.</p>
<p>Vi er leveringsdygtige i sand og grus, som vi læsser efter vægt, så du får præcis det du betaler for. Har du ønsker ud over det du kan se i vores katalog eller kan finde i vores sortimentsliste er du velkommen til at kontakte os.</p>
<p>Vores have- parkafd. har alt indenfor nye maskiner, hvad vi ikke har på lager kan skaffes. Altid en masse gode brugte maskiner på lager. <br />Vi er autoriseret Stiga og Stihl forhandler.</p>
<p>Vi tilbyder også udlejning af personlifte fra 12 meter til 18,30 meter. Ring og hør nærmere.</p>
<p>Vores team står klar til at betjene Jer :)<br /> <br />HUSK vi er til at handle med!</p>
<p>Mød os på facebook!</p>
<p>Se seneste nyt og billeder på vores facebook profil</p>
<p>KIG IND</p>
<p>Tønder Maskinudlejning, Hydrovej 4, 6270 Tønder, tlf. 21 90 61 61<br />Åbningstider: mandag-fredag fra 7.00-17.00 · lørdag fra 8.00-12.00</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (177, 1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', 37, 1070, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (178, 1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', 59, NULL, NULL, NULL, N'/media/1015/tm_prisliste_2016_layout_1.pdf', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (179, 1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', 45, NULL, NULL, NULL, N'Tønder', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (180, 1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', 42, 6270, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (181, 1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', 43, 21906161, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (182, 1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', 44, NULL, NULL, NULL, N'toendermaskinudlejning@mail.dk', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (183, 1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', 40, NULL, NULL, NULL, N'Tønder Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (184, 1050, N'290d0599-93c6-4dde-ace3-c708ffcc5dc1', 41, NULL, NULL, NULL, N'Hydrovej 4', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (185, 1114, N'3c9fdd61-b62d-4066-82ce-795fd239cd25', 62, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (186, 1114, N'3c9fdd61-b62d-4066-82ce-795fd239cd25', 60, NULL, NULL, NULL, N'Havetraktor', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (187, 1114, N'3c9fdd61-b62d-4066-82ce-795fd239cd25', 63, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (188, 1114, N'3c9fdd61-b62d-4066-82ce-795fd239cd25', 61, NULL, NULL, NULL, NULL, N'<p>Information omkring havetraktor</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (189, 1115, N'438b4a8b-cfc4-4168-bb04-f186b0037cd8', 27, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (190, 1116, N'e0f78e60-9d76-4168-affd-640fbd81c133', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1016/bfcd0cbc730e20fa26d794cbffd22128.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (191, 1116, N'e0f78e60-9d76-4168-affd-640fbd81c133', 7, NULL, NULL, NULL, N'480', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (192, 1116, N'e0f78e60-9d76-4168-affd-640fbd81c133', 8, NULL, NULL, NULL, N'320', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (193, 1116, N'e0f78e60-9d76-4168-affd-640fbd81c133', 9, NULL, NULL, NULL, N'57250', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (194, 1116, N'e0f78e60-9d76-4168-affd-640fbd81c133', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (195, 1117, N'dfd3af3d-9bd6-4915-a827-961a13ec76e7', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1017/gravemaskine.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (196, 1117, N'dfd3af3d-9bd6-4915-a827-961a13ec76e7', 7, NULL, NULL, NULL, N'536', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (197, 1117, N'dfd3af3d-9bd6-4915-a827-961a13ec76e7', 8, NULL, NULL, NULL, N'402', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (198, 1117, N'dfd3af3d-9bd6-4915-a827-961a13ec76e7', 9, NULL, NULL, NULL, N'46773', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (199, 1117, N'dfd3af3d-9bd6-4915-a827-961a13ec76e7', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (200, 1114, N'29a07277-18cd-4052-941b-2c73a663467f', 62, 1116, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (201, 1114, N'29a07277-18cd-4052-941b-2c73a663467f', 60, NULL, NULL, NULL, N'Havetraktor', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (202, 1114, N'29a07277-18cd-4052-941b-2c73a663467f', 63, NULL, CAST(2000.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (203, 1114, N'29a07277-18cd-4052-941b-2c73a663467f', 61, NULL, NULL, NULL, NULL, N'<p>Information omkring havetraktor</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (204, 1120, N'69ddae73-5f65-4cb3-939c-dfbd8a054b66', 64, 1113, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (205, 1120, N'c0ab798c-6360-4eba-9ee2-1a1e3a6d5495', 64, 1113, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (206, 1085, N'be732fb2-b9cf-48f3-a1d6-e825697db08e', 48, NULL, NULL, NULL, NULL, N'<p>Hydrovej 4<br />6270 Tønder</p>
<p>Mobil: 21 90 61 61<br />Fax: 73 72 61 61</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (207, 1085, N'be732fb2-b9cf-48f3-a1d6-e825697db08e', 47, NULL, NULL, NULL, N'Kontakt Tønder Maskinudlejning', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (208, 1085, N'be732fb2-b9cf-48f3-a1d6-e825697db08e', 46, NULL, NULL, NULL, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2291.2578835765157!2d8.861346316078947!3d54.9510370610063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b4ba347411b76d%3A0x873874e245e174d3!2sT%C3%B8nder+Maskinudlejning+ApS!5e0!3m2!1sda!2sdk!4v1458818558630', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (209, 1120, N'26899b41-8b6e-4ff9-a816-6315ae21a5d8', 64, 1113, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (210, 1080, N'64863fa7-6460-482e-b937-0915ec49d2b9', 39, NULL, NULL, NULL, NULL, N'<p><strong>§1</strong></p>
<p><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<p><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p> </p>
<p><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p> </p>
<p><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p> </p>
<p><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p> </p>
<p><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p> </p>
<p><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p> </p>
<p><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p> </p>
<p><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p> </p>
<p><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p> </p>
<p><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p> </p>
<p><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p> </p>
<p><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p> </p>
<p>Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<p> </p>
<table border="0" cellspacing="1" cellpadding="1" width="100%">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>')
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (211, 1080, N'64863fa7-6460-482e-b937-0915ec49d2b9', 38, NULL, NULL, NULL, N'Lejebetingelser', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (212, 1087, N'a3d68398-d42a-4c75-b168-d1966a8ba7c5', 39, NULL, NULL, NULL, NULL, N'<p> </p>
<p><br />Vi er autoriseret Stiga, Stihl, Viking, Ventrac, Vitra, Bad Boy, Iseki og Club Car forhandler og opdaterer os løbende med kurser for at sikre os den nyeste viden om de maskiner vi sælger og servicerer.<br />Dette sikrer, at du som kunde trygt kan overlade din maskine til os, da vi har den fornødne ekspertise og viden samt det rigtige værktøj.<br />Vores værksted klarer reparationer af alle mærker, både stort og småt - herudnder garantireparation - uanset hvor din maskine er købt.<br />Ved behov sender vi vores servicebil til kunden<br />Online adgang til vore leverandører af reservedele<br />Vi har altid et stort udvalg i nye og brugte maskiner på lager. Mangler du en ny eller brugt maskine til haven så kontakt os, vi er altid friske med et godt tilbud</p>
<p> </p>
<p><strong>Undgå bøvl og problemer......</strong></p>
<p> </p>
<p>Når du køber din havemaskine hos os er den naturligvis klargjort, justeret, samt påfyldt korrekt olie og benzin</p>
<p> </p>
<p><strong>Rigtige redskaber sælges kun af rigtige eksperter....</strong></p>
<p> </p>
<p>Vi har et bredt udvalg indenfor maskiner til skov, have og park</p>
<p>Stort værksted med faguddannet personale</p>
<p>Vores kundekreds er både private og erhvervskunder</p>
<p>Vi er stolte af de produkter vi sælger</p>
<p> </p>
<p>Kig ind og få en snak med os.</p>
<p>Vi rådgiver gerne hvis du er i tvivl, så du får den bedste maskine til netop dit behov</p>
<p>Vi skal leve af, at vores kunder er tilfredse, derfor vil du opleve en kompetent service og faglig vejledning hos os.</p>
<p> </p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (213, 1087, N'a3d68398-d42a-4c75-b168-d1966a8ba7c5', 38, NULL, NULL, NULL, N'Værksted', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (214, 1100, N'1a8b12f0-79c7-4411-8b02-ab07d120f45b', 56, 1095, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (215, 1114, N'29a07277-18cd-4052-941b-2c73a663467f', 65, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (216, 1114, N'fb2af695-0437-430f-8481-28fe2eaf1078', 62, 1116, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (217, 1114, N'fb2af695-0437-430f-8481-28fe2eaf1078', 60, NULL, NULL, NULL, N'Havetraktor', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (218, 1114, N'fb2af695-0437-430f-8481-28fe2eaf1078', 65, NULL, NULL, NULL, N'Information omkring havetraktor', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (219, 1114, N'fb2af695-0437-430f-8481-28fe2eaf1078', 63, NULL, CAST(2000.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (220, 1114, N'fb2af695-0437-430f-8481-28fe2eaf1078', 61, NULL, NULL, NULL, NULL, N'<p>Information omkring havetraktor</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (221, 1122, N'2666c3de-acdd-44ae-9828-2e908b81d596', 62, 1117, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (222, 1122, N'2666c3de-acdd-44ae-9828-2e908b81d596', 60, NULL, NULL, NULL, N'Gravemaskine', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (223, 1122, N'2666c3de-acdd-44ae-9828-2e908b81d596', 65, NULL, NULL, NULL, NULL, N'Gravemaskine')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (224, 1122, N'2666c3de-acdd-44ae-9828-2e908b81d596', 63, NULL, CAST(3000.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (225, 1122, N'2666c3de-acdd-44ae-9828-2e908b81d596', 61, NULL, NULL, NULL, NULL, N'<p>Gravemaskine</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (226, 1080, N'eb70ddbe-ea8a-4c97-8f64-9710987e4cef', 39, NULL, NULL, NULL, NULL, N'<p style="text-align: left;"><strong>§1</strong></p>
<p style="text-align: left;"><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<table border="0" cellspacing="1" cellpadding="1" width="519" height="97">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p style="text-align: left;"> </p>
<p style="text-align: left;">Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<p> </p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (227, 1080, N'eb70ddbe-ea8a-4c97-8f64-9710987e4cef', 38, NULL, NULL, NULL, N'Lejebetingelser', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (228, 1080, N'821e7f53-c1e3-4359-ad06-f99045a7cc94', 39, NULL, NULL, NULL, NULL, N'<p style="text-align: left;"><strong>§1</strong></p>
<p style="text-align: left;"><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<p style="text-align: left;"><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p style="text-align: left;"> </p>
<p style="text-align: left;">Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<table border="0" cellspacing="1" cellpadding="1" width="519" height="97">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>
<p> </p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (229, 1080, N'821e7f53-c1e3-4359-ad06-f99045a7cc94', 38, NULL, NULL, NULL, N'Lejebetingelser', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (230, 1080, N'd608935b-fdb6-42d2-92e5-9e4e5e84be8b', 39, NULL, NULL, NULL, NULL, N'<p style="text-align: left;"><strong>§1</strong></p>
<p style="text-align: left;"><span>Der beregnes leje pr. kalenderdag (pr. dato), Der regnes med en 8 timers arbejdsdag. Arbejdes der ud over 8 timer betales der 1 dags ekstra leje pr. påbegyndt 8 timer.</span></p>
<p> </p>
<p style="text-align: left;"><strong>§ 2 </strong><br />Lejemålet betragtes som påbegyndt den dato det lejede afgår fra lager. Lejemålet løber til og med den dag, det ankommer på udlejers lager. Finder aflevering sted inden kl. 7.15, beregnes der leje til og med dagen før. Afhentes det lejede ikke af lejeren på aftalt dato og tidspunkt, er udlejeren berettiget til at udleje til anden side. Med mindre andet er aftalt om lejeperioden, er lejer på udlejers anfordring pligtig til at aflevere det lejede med dags varsel. Sker aflevering ikke, er udlejeren berettiget til selv at foretage afhentning for lejers regning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§3 </strong><br />Fragt- og transportomkostninger til og fra lageret betales af lejeren.<br />Fragtbrev eller lignende fra fx jernbane, fragtmand, post eller skib betragtes som kvittering for, at materialet er leveret til lejeren.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§4 </strong><br />Lejeren bærer risikoen for det lejede i lejeperioden og er ansvarlig for enhver skade af en hvilken som helst årsag der i lejetiden tilføjes det lejede. Lejeren er forpligtet til at betale forsikring. Det lejede er kaskoforsikret af Tønder Maskinudlejning under hele lejeperioden. Forsikringpræmie og selvrisiko betales af lejer. Ud over selvrisikoen er der mulighed for forsikringsselskabet at tage regres over for lejer.<br />Dersom det lejede bortkommer, ikke afleveres eller afleveres så ødelagt, at reparationsomkostningerne af udlejer skønnes at ville overstige en ny dagspris, betales erstatning med ny dagspris. I øvrigt betaler lejeren reparationsomkostninger efter regning. Det lejede skal afleveres i rengjort stand. Er rengøring nødvendig, betaler lejeren herfor efter regning. Lejeren betaler leje for den tid, der medgår til reparation og rengøring. Lejeren er ansvarlig for forskriftsmæssig og lovmæssig anvendelse af det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§5 </strong><br />For skade, det lejede måtte påføre 3. mand i lejeperioden, bærer lejeren alene ansvaret. Lejeren bærer selv risikoen for ethvert tab, det måtte kunne henføres til det lejede, herunder lejerens forsinkede levering af en ydelse, driftstab m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§6 </strong><br />Det lejede må af lejeren kun opbevares/anvendes på aftalt plads og må ikke uden udlejers skriftlige samtykke fjernes herfra, bortset fra transport til og fra udlejeren. Sker opbevaring/anvendelse anderledes end anført ved nærværende bestemmelse, betragtes lejeforholdet som misligholdt. Udlejer er herved berettiget til på egen hånd at tage det udlejede tilbage for lejers regning og tage det udlejede tilbage ved en umiddelbar fogedforretning efter retsplejelovens regler. Det lejede må ikke installeres eller anbringes på sådan måde at det kan henføres til tilbehør til fast ejendom og dermed blive omfattet af panterettigheder. Udlejeren har til enhver tid ret til at besigtige det lejede.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§7</strong><br />I lejeperioden sørger lejeren selv for vedligeholdelse af det lejede, herunder smøring, oliepåfyldning, punktering m.v. Der må alene anvendes smøremidler, olie og brændstof af anerkendt mærke. Lejeren sørger for belysning, markering m.v.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§8 </strong><br />Hvor intet andet er aftalt, betales lejen kontant. Ved betaling senere end det af udlejeren fastsatte betalingstidspunkt betaler lejeren renter med 2% pr. påbegyndt måned af det til enhver tid værende restbeløb. Udlejeren er til enhver tid berettiget til at kræve depositum enten forud for et lejemåls begyndelse eller som vilkår for et lejemåls fastsættelse.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§9 </strong><br />I tilfælde af lejers misligholdelse af nærværende lejekontrakt er udlejer berettiget til at tage det lejede tilbage ved en umiddelbar fogedforretning.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§10 </strong><br />Lejeprisen er ekskl. moms og forbrugsmaterialer såsom: brændstof, olie, skærpning af mejsler, forbrug af diamantklinger m.m.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§11 </strong><br />Skader, som opstår ved fortsæt, grov uagtsomhed eller anden misligholdelse af lejer, dækkes ikke af forsikringen, men afholdes således fuldt ud af lejer.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>§12 </strong><br />Forsikringsbetingelser, (uddrag):<br />Selskab: Sønderjysk Forsikring<br />Forsikringstager: Tønder Maskinudlejning. Dog indtræder lejer i forsikringstages sted med hensyn til betaling af præmie, selvrisiko og evt. regres.</p>
<p style="text-align: left;"> </p>
<p style="text-align: left;"><strong>Der gøres opmærksom på at i tilfælde med brand, tyveri, hærværk eller lignende ophører lejemålet ikke før den af politiet udleverede kvittering for anmeldelse er afleveret til Tønder Maskinudlejning.</strong></p>
<p style="text-align: left;"> </p>
<p style="text-align: left;">Forsikring og miljøtillæg er med i lejepriserne.<br />Priserne er ekskl. moms og betales af lejer. Præmie 6% af listepris, betales af lejer. Der tages forbehold for prisændringer og trykfejl.</p>
<p style="text-align: left;"> </p>
<table border="0" cellspacing="1" cellpadding="1" width="519" height="97">
<tbody>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Maskinens listepris</span></td>
<td width="50%" align="left" valign="top" bgcolor="#4879b4"><span>Selvrisiko af maskinens listepris</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 0-10.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>25%</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 10.001-20.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr.  5.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.001-75.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 10.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 75.001-200.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 15.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 200.001-400.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 20.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 400.001-600.000</span></td>
<td width="50%" align="left" valign="top" bgcolor="#cecece"><span>Kr. 25.000</span></td>
</tr>
<tr>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 600.001-</span></td>
<td width="50%" align="left" valign="top" bgcolor="#ffffff"><span>Kr. 30.000</span></td>
</tr>
</tbody>
</table>
<p> </p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (231, 1080, N'd608935b-fdb6-42d2-92e5-9e4e5e84be8b', 38, NULL, NULL, NULL, N'Lejebetingelser', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (232, 1123, N'952c5947-cd4b-4715-ad04-bb3cd5e1877d', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (233, 1123, N'952c5947-cd4b-4715-ad04-bb3cd5e1877d', 51, NULL, NULL, NULL, N'Lift', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (234, 1123, N'952c5947-cd4b-4715-ad04-bb3cd5e1877d', 57, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (235, 1123, N'952c5947-cd4b-4715-ad04-bb3cd5e1877d', 53, NULL, CAST(980.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (236, 1123, N'952c5947-cd4b-4715-ad04-bb3cd5e1877d', 52, NULL, NULL, NULL, NULL, N'15,5 meter')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (237, 1123, N'952c5947-cd4b-4715-ad04-bb3cd5e1877d', 50, NULL, NULL, NULL, N'13', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (238, 1123, N'952c5947-cd4b-4715-ad04-bb3cd5e1877d', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (239, 1124, N'8382ab20-df0c-4161-9ce1-308c9394ce78', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (240, 1124, N'8382ab20-df0c-4161-9ce1-308c9394ce78', 51, NULL, NULL, NULL, N'Lift 18,30 meter', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (241, 1124, N'8382ab20-df0c-4161-9ce1-308c9394ce78', 57, 10, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (242, 1124, N'8382ab20-df0c-4161-9ce1-308c9394ce78', 53, NULL, CAST(700.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (243, 1124, N'8382ab20-df0c-4161-9ce1-308c9394ce78', 52, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (244, 1124, N'8382ab20-df0c-4161-9ce1-308c9394ce78', 50, NULL, NULL, NULL, N'13', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (245, 1124, N'8382ab20-df0c-4161-9ce1-308c9394ce78', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (246, 1125, N'54ceb80b-0f0d-4fc4-8b19-e8e7d4831438', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (247, 1125, N'54ceb80b-0f0d-4fc4-8b19-e8e7d4831438', 51, NULL, NULL, NULL, N'Betonhammer inkl. 2 mejsler', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (248, 1125, N'54ceb80b-0f0d-4fc4-8b19-e8e7d4831438', 57, 1000, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (249, 1125, N'54ceb80b-0f0d-4fc4-8b19-e8e7d4831438', 53, NULL, CAST(280.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (250, 1125, N'54ceb80b-0f0d-4fc4-8b19-e8e7d4831438', 52, NULL, NULL, NULL, NULL, N'27 kg.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (251, 1125, N'54ceb80b-0f0d-4fc4-8b19-e8e7d4831438', 50, NULL, NULL, NULL, N'13', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (252, 1125, N'54ceb80b-0f0d-4fc4-8b19-e8e7d4831438', 55, NULL, NULL, NULL, N'220 v.', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (253, 1126, N'80ab6f18-b79d-4a0b-b705-60d5ad43ebe6', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (254, 1126, N'80ab6f18-b79d-4a0b-b705-60d5ad43ebe6', 51, NULL, NULL, NULL, N'Bygningshammer inkl. 2 mejsler', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (255, 1126, N'80ab6f18-b79d-4a0b-b705-60d5ad43ebe6', 57, 1001, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (256, 1126, N'80ab6f18-b79d-4a0b-b705-60d5ad43ebe6', 53, NULL, CAST(120.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (257, 1126, N'80ab6f18-b79d-4a0b-b705-60d5ad43ebe6', 52, NULL, NULL, NULL, NULL, N'7 kg.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (258, 1126, N'80ab6f18-b79d-4a0b-b705-60d5ad43ebe6', 50, NULL, NULL, NULL, N'13', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (259, 1126, N'80ab6f18-b79d-4a0b-b705-60d5ad43ebe6', 55, NULL, NULL, NULL, N'220 v.', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (260, 1127, N'c263cf0e-2f7f-4ae4-821d-75236fd22471', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (261, 1127, N'c263cf0e-2f7f-4ae4-821d-75236fd22471', 51, NULL, NULL, NULL, N'Borehammer', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (262, 1127, N'c263cf0e-2f7f-4ae4-821d-75236fd22471', 57, 1003, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (263, 1127, N'c263cf0e-2f7f-4ae4-821d-75236fd22471', 53, NULL, CAST(120.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (264, 1127, N'c263cf0e-2f7f-4ae4-821d-75236fd22471', 52, NULL, NULL, NULL, NULL, N'5 kg.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (265, 1127, N'c263cf0e-2f7f-4ae4-821d-75236fd22471', 50, NULL, NULL, NULL, N'13', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (266, 1127, N'c263cf0e-2f7f-4ae4-821d-75236fd22471', 55, NULL, NULL, NULL, N'220 v.', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (267, 1128, N'148dedb5-7764-4dd4-abc9-ca07e813579f', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (268, 1128, N'148dedb5-7764-4dd4-abc9-ca07e813579f', 51, NULL, NULL, NULL, N'Stillads, ekstra højde per meter', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (269, 1128, N'148dedb5-7764-4dd4-abc9-ca07e813579f', 57, 1004, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (270, 1128, N'148dedb5-7764-4dd4-abc9-ca07e813579f', 53, NULL, CAST(50.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (271, 1128, N'148dedb5-7764-4dd4-abc9-ca07e813579f', 52, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (272, 1128, N'148dedb5-7764-4dd4-abc9-ca07e813579f', 50, NULL, NULL, NULL, N'13', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (273, 1128, N'148dedb5-7764-4dd4-abc9-ca07e813579f', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (274, 1129, N'48ee86c4-c6bf-45be-8368-1f3f8b4c0674', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (275, 1129, N'48ee86c4-c6bf-45be-8368-1f3f8b4c0674', 51, NULL, NULL, NULL, N'Borekrone u/maskine ekskl. forbrug', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (276, 1129, N'48ee86c4-c6bf-45be-8368-1f3f8b4c0674', 57, 1006, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (277, 1129, N'48ee86c4-c6bf-45be-8368-1f3f8b4c0674', 53, NULL, CAST(80.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (278, 1129, N'48ee86c4-c6bf-45be-8368-1f3f8b4c0674', 52, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (279, 1129, N'48ee86c4-c6bf-45be-8368-1f3f8b4c0674', 50, NULL, NULL, NULL, N'13', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (280, 1129, N'48ee86c4-c6bf-45be-8368-1f3f8b4c0674', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (281, 1130, N'ceab5b72-b405-4fbf-984b-48fd5ac94a01', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (282, 1130, N'ceab5b72-b405-4fbf-984b-48fd5ac94a01', 51, NULL, NULL, NULL, N'Håndbetonsliber excl. tilbehør og forbrug', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (283, 1130, N'ceab5b72-b405-4fbf-984b-48fd5ac94a01', 57, 1007, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (284, 1130, N'ceab5b72-b405-4fbf-984b-48fd5ac94a01', 53, NULL, CAST(280.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (285, 1130, N'ceab5b72-b405-4fbf-984b-48fd5ac94a01', 52, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (286, 1130, N'ceab5b72-b405-4fbf-984b-48fd5ac94a01', 50, NULL, NULL, NULL, N'13', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (287, 1130, N'ceab5b72-b405-4fbf-984b-48fd5ac94a01', 55, NULL, NULL, NULL, N'230 v.', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (288, 1131, N'd0771336-241f-4a0d-8706-ad3a9759a7a4', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (289, 1131, N'd0771336-241f-4a0d-8706-ad3a9759a7a4', 51, NULL, NULL, NULL, N'Asfalt- og betonskæremaskine ekskl. forbrug', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (290, 1131, N'd0771336-241f-4a0d-8706-ad3a9759a7a4', 57, 1008, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (291, 1131, N'd0771336-241f-4a0d-8706-ad3a9759a7a4', 53, NULL, CAST(380.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (292, 1131, N'd0771336-241f-4a0d-8706-ad3a9759a7a4', 52, NULL, NULL, NULL, NULL, N'Skæredybde 170 mm. klingediam. 500 mm. vand 27 lt.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (293, 1131, N'd0771336-241f-4a0d-8706-ad3a9759a7a4', 50, NULL, NULL, NULL, N'13', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (294, 1131, N'd0771336-241f-4a0d-8706-ad3a9759a7a4', 55, NULL, NULL, NULL, N'Benzin', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (295, 1132, N'1423a520-5b5a-40dc-a84d-8d66b3a83062', 62, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (296, 1132, N'1423a520-5b5a-40dc-a84d-8d66b3a83062', 60, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (297, 1132, N'1423a520-5b5a-40dc-a84d-8d66b3a83062', 65, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (298, 1132, N'1423a520-5b5a-40dc-a84d-8d66b3a83062', 63, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (299, 1132, N'1423a520-5b5a-40dc-a84d-8d66b3a83062', 61, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (300, 1133, N'073409fc-f110-4cb3-8b1b-cff22c7d2de3', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1018/bobcat-300x224.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (301, 1133, N'073409fc-f110-4cb3-8b1b-cff22c7d2de3', 7, NULL, NULL, NULL, N'300', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (302, 1133, N'073409fc-f110-4cb3-8b1b-cff22c7d2de3', 8, NULL, NULL, NULL, N'224', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (303, 1133, N'073409fc-f110-4cb3-8b1b-cff22c7d2de3', 9, NULL, NULL, NULL, N'22756', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (304, 1133, N'073409fc-f110-4cb3-8b1b-cff22c7d2de3', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (305, 1134, N'ba9139ac-c1d2-433c-b3f8-7a42ae4494a3', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1019/28982_1_xl.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (306, 1134, N'ba9139ac-c1d2-433c-b3f8-7a42ae4494a3', 7, NULL, NULL, NULL, N'640', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (307, 1134, N'ba9139ac-c1d2-433c-b3f8-7a42ae4494a3', 8, NULL, NULL, NULL, N'445', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (308, 1134, N'ba9139ac-c1d2-433c-b3f8-7a42ae4494a3', 9, NULL, NULL, NULL, N'55569', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (309, 1134, N'ba9139ac-c1d2-433c-b3f8-7a42ae4494a3', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (310, 1135, N'f8a4642e-d1b8-4a99-a1b2-c1187c1c8281', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1020/dsc00813_jpg-for-web-normal.jpg'', crops: []}')
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (311, 1135, N'f8a4642e-d1b8-4a99-a1b2-c1187c1c8281', 7, NULL, NULL, NULL, N'320', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (312, 1135, N'f8a4642e-d1b8-4a99-a1b2-c1187c1c8281', 8, NULL, NULL, NULL, N'240', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (313, 1135, N'f8a4642e-d1b8-4a99-a1b2-c1187c1c8281', 9, NULL, NULL, NULL, N'18254', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (314, 1135, N'f8a4642e-d1b8-4a99-a1b2-c1187c1c8281', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (315, 1136, N'eceb5781-6bdb-405d-b9b6-3983af9dab2e', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1021/img_8280.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (316, 1136, N'eceb5781-6bdb-405d-b9b6-3983af9dab2e', 7, NULL, NULL, NULL, N'800', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (317, 1136, N'eceb5781-6bdb-405d-b9b6-3983af9dab2e', 8, NULL, NULL, NULL, N'600', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (318, 1136, N'eceb5781-6bdb-405d-b9b6-3983af9dab2e', 9, NULL, NULL, NULL, N'87077', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (319, 1136, N'eceb5781-6bdb-405d-b9b6-3983af9dab2e', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (320, 1137, N'e0cdcdb9-5111-4dd9-96b9-ab7732316148', 6, NULL, NULL, NULL, NULL, N'{src: ''/media/1022/brugte-maskiner_lamborghini-traktor.jpg'', crops: []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (321, 1137, N'e0cdcdb9-5111-4dd9-96b9-ab7732316148', 7, NULL, NULL, NULL, N'800', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (322, 1137, N'e0cdcdb9-5111-4dd9-96b9-ab7732316148', 8, NULL, NULL, NULL, N'500', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (323, 1137, N'e0cdcdb9-5111-4dd9-96b9-ab7732316148', 9, NULL, NULL, NULL, N'106562', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (324, 1137, N'e0cdcdb9-5111-4dd9-96b9-ab7732316148', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (325, 1132, N'ec6b15fe-d8a8-40aa-841d-6b2edbbeda4b', 62, 1133, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (326, 1132, N'ec6b15fe-d8a8-40aa-841d-6b2edbbeda4b', 60, NULL, NULL, NULL, N'Bobcat', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (327, 1132, N'ec6b15fe-d8a8-40aa-841d-6b2edbbeda4b', 65, NULL, NULL, NULL, NULL, N'Nam ac erat massa. Nulla sit amet purus sit amet est placerat faucibus at vitae enim. Proin convallis orci odio, et suscipit nulla pharetra ut.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (328, 1132, N'ec6b15fe-d8a8-40aa-841d-6b2edbbeda4b', 63, NULL, CAST(12000.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (329, 1132, N'ec6b15fe-d8a8-40aa-841d-6b2edbbeda4b', 61, NULL, NULL, NULL, NULL, N'<p><span>Nam ac erat massa. Nulla sit amet purus sit amet est placerat faucibus at vitae enim. Proin convallis orci odio, et suscipit nulla pharetra ut. Suspendisse vel ligula vel velit ultricies sagittis eget nec nulla. Proin commodo tortor quis euismod maximus. Quisque imperdiet tortor sed viverra eleifend. Duis vel varius odio, vel vehicula enim. Suspendisse maximus nunc vel lectus dignissim, et ultricies erat viverra. Phasellus sit amet luctus turpis. Vestibulum eros velit, condimentum et elit sed, vehicula condimentum libero. Donec tincidunt tempus semper. Quisque vitae placerat dolor. Donec turpis enim, vulputate id turpis eget, sollicitudin sollicitudin tortor. In semper varius mauris tristique auctor. Aliquam erat volutpat. Etiam eget ante sed urna auctor vehicula.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (330, 1122, N'5f859c17-f84a-41d8-9459-0f4050b55f32', 62, 1117, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (331, 1122, N'5f859c17-f84a-41d8-9459-0f4050b55f32', 60, NULL, NULL, NULL, N'Gravemaskine', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (332, 1122, N'5f859c17-f84a-41d8-9459-0f4050b55f32', 65, NULL, NULL, NULL, NULL, N'Phasellus pharetra erat eu tincidunt condimentum. Vestibulum interdum at nisi vitae sagittis. Quisque et porttitor tellus.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (333, 1122, N'5f859c17-f84a-41d8-9459-0f4050b55f32', 63, NULL, CAST(3000.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (334, 1122, N'5f859c17-f84a-41d8-9459-0f4050b55f32', 61, NULL, NULL, NULL, NULL, N'<p><span>Phasellus pharetra erat eu tincidunt condimentum. Vestibulum interdum at nisi vitae sagittis. Quisque et porttitor tellus. Sed luctus, diam vitae sagittis molestie, purus ante consequat justo, nec porta lacus libero in orci. Aenean consectetur, urna ut lacinia viverra, magna magna consequat leo, nec maximus tortor tellus et enim. Curabitur quis elit aliquam, sagittis odio et, lobortis sapien. Nulla facilisi. Pellentesque auctor eu lacus sit amet blandit. Ut id imperdiet est.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (335, 1114, N'ad9bbd91-1532-4540-a5e8-b0d012ec22e3', 62, 1116, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (336, 1114, N'ad9bbd91-1532-4540-a5e8-b0d012ec22e3', 60, NULL, NULL, NULL, N'Havetraktor', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (337, 1114, N'ad9bbd91-1532-4540-a5e8-b0d012ec22e3', 65, NULL, NULL, NULL, NULL, N'Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut. Donec sit amet est ut mauris accumsan gravida at in orci.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (338, 1114, N'ad9bbd91-1532-4540-a5e8-b0d012ec22e3', 63, NULL, CAST(2000.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (339, 1114, N'ad9bbd91-1532-4540-a5e8-b0d012ec22e3', 61, NULL, NULL, NULL, NULL, N'<p><span>Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut. Donec sit amet est ut mauris accumsan gravida at in orci. Vivamus dui urna, posuere sit amet nulla vel, venenatis ullamcorper lacus. Integer vel consequat turpis. Vestibulum quam nunc, varius in volutpat vitae, ullamcorper sed ante. Vestibulum nisl mi, iaculis a velit sit amet, accumsan dapibus sapien.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (340, 1114, N'51ffc8e9-5d52-4bae-b291-525118cca996', 62, 1116, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (341, 1114, N'51ffc8e9-5d52-4bae-b291-525118cca996', 60, NULL, NULL, NULL, N'Havetraktor', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (342, 1114, N'51ffc8e9-5d52-4bae-b291-525118cca996', 65, NULL, NULL, NULL, NULL, N'Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (343, 1114, N'51ffc8e9-5d52-4bae-b291-525118cca996', 63, NULL, CAST(2000.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (344, 1114, N'51ffc8e9-5d52-4bae-b291-525118cca996', 61, NULL, NULL, NULL, NULL, N'<p><span>Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut. Donec sit amet est ut mauris accumsan gravida at in orci. Vivamus dui urna, posuere sit amet nulla vel, venenatis ullamcorper lacus. Integer vel consequat turpis. Vestibulum quam nunc, varius in volutpat vitae, ullamcorper sed ante. Vestibulum nisl mi, iaculis a velit sit amet, accumsan dapibus sapien.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (345, 1114, N'33ea28ba-13ac-460c-8abe-83a005cb349a', 62, 1116, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (346, 1114, N'33ea28ba-13ac-460c-8abe-83a005cb349a', 60, NULL, NULL, NULL, N'Havetraktor', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (347, 1114, N'33ea28ba-13ac-460c-8abe-83a005cb349a', 65, NULL, NULL, NULL, NULL, N'Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (348, 1114, N'33ea28ba-13ac-460c-8abe-83a005cb349a', 63, NULL, CAST(2000.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (349, 1114, N'33ea28ba-13ac-460c-8abe-83a005cb349a', 61, NULL, NULL, NULL, NULL, N'<p><span>Sed lobortis accumsan nunc, eu varius mi sodales ac. Phasellus egestas est ligula, in fringilla elit fringilla ut. Donec sit amet est ut mauris accumsan gravida at in orci. Vivamus dui urna, posuere sit amet nulla vel, venenatis ullamcorper lacus. Integer vel consequat turpis. Vestibulum quam nunc, varius in volutpat vitae, ullamcorper sed ante. Vestibulum nisl mi, iaculis a velit sit amet, accumsan dapibus sapien.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1335, 1138, N'ad1894b5-3b84-4ec7-a371-f2d850f7ba91', 62, 1134, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1336, 1138, N'ad1894b5-3b84-4ec7-a371-f2d850f7ba91', 60, NULL, NULL, NULL, N'Mejetærsker', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1337, 1138, N'ad1894b5-3b84-4ec7-a371-f2d850f7ba91', 65, NULL, NULL, NULL, NULL, N'Praesent fringilla sagittis nisl, a porttitor quam convallis non. Aenean fringilla interdum diam, vitae faucibus turpis lobortis semper.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1338, 1138, N'ad1894b5-3b84-4ec7-a371-f2d850f7ba91', 63, NULL, CAST(30000.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1339, 1138, N'ad1894b5-3b84-4ec7-a371-f2d850f7ba91', 61, NULL, NULL, NULL, NULL, N'<p><span>Praesent fringilla sagittis nisl, a porttitor quam convallis non. Aenean fringilla interdum diam, vitae faucibus turpis lobortis semper. Nunc rutrum eleifend orci bibendum faucibus. Duis eget porttitor elit. Suspendisse auctor in quam laoreet pellentesque. Aliquam mattis lacus dapibus magna lacinia placerat. Vestibulum molestie, justo posuere euismod facilisis, sem tellus sollicitudin mauris, at dictum ante nunc id quam. Curabitur condimentum augue vel massa pretium, pharetra placerat urna elementum. Nulla facilisi. Sed odio purus, rhoncus ac cursus non, mattis sit amet ante.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1340, 1139, N'8dd94ea1-b231-44cd-bfe4-0430587649a8', 62, 1135, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1341, 1139, N'8dd94ea1-b231-44cd-bfe4-0430587649a8', 60, NULL, NULL, NULL, N'Fræser', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1342, 1139, N'8dd94ea1-b231-44cd-bfe4-0430587649a8', 65, NULL, NULL, NULL, NULL, N'enean eget libero elementum, vulputate tellus at, commodo sem. Cras id tristique turpis.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1343, 1139, N'8dd94ea1-b231-44cd-bfe4-0430587649a8', 63, NULL, CAST(2000.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1344, 1139, N'8dd94ea1-b231-44cd-bfe4-0430587649a8', 61, NULL, NULL, NULL, NULL, N'<p><span>Aenean eget libero elementum, vulputate tellus at, commodo sem. Cras id tristique turpis. Vestibulum malesuada vestibulum euismod. Pellentesque consequat fermentum nisi vitae lobortis. Mauris condimentum consequat dolor vitae cursus. Nam efficitur urna et lacus posuere dignissim. Suspendisse sodales risus ut felis cursus, in tincidunt dui gravida. Morbi consectetur elit eget risus porta commodo. Suspendisse scelerisque purus sed libero ultrices feugiat. Donec mattis elit ac maximus maximus. In id condimentum orci. Donec blandit nisl augue, ut pellentesque orci mollis vel. Nam tristique dui ac nunc posuere, vitae facilisis libero blandit.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1345, 1140, N'd4f2f415-5087-4186-91db-e7b812cd70c5', 62, 1137, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1346, 1140, N'd4f2f415-5087-4186-91db-e7b812cd70c5', 60, NULL, NULL, NULL, N'Traktor', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1347, 1140, N'd4f2f415-5087-4186-91db-e7b812cd70c5', 65, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu sapien nunc.')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1348, 1140, N'd4f2f415-5087-4186-91db-e7b812cd70c5', 63, NULL, CAST(50000.000000 AS Decimal(38, 6)), NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1349, 1140, N'd4f2f415-5087-4186-91db-e7b812cd70c5', 61, NULL, NULL, NULL, NULL, N'<p><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu sapien nunc. Phasellus sapien sapien, aliquam sit amet malesuada tincidunt, fermentum eu lorem. Fusce vel tellus volutpat, rutrum metus eget, elementum mi. Morbi euismod eu sem ut cursus. Nam egestas ullamcorper maximus. Maecenas condimentum nulla et dictum consequat. Nulla sit amet leo mi. Duis ullamcorper augue ac lobortis viverra. Donec in facilisis velit, eu rhoncus neque. Etiam massa elit, sollicitudin placerat tristique in, porta ac ligula. Morbi vitae condimentum tortor, at elementum purus. Nunc a erat convallis, ultricies tellus vitae, malesuada nunc.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1350, 1145, N'9ed2f0b3-7fa3-432d-9823-df8cc4ef798a', 66, 1057, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1351, 1145, N'9ed2f0b3-7fa3-432d-9823-df8cc4ef798a', 67, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1352, 1145, N'98ede9c2-9835-4f7a-b02e-98a247f0be86', 66, 1057, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1353, 1145, N'98ede9c2-9835-4f7a-b02e-98a247f0be86', 67, NULL, NULL, NULL, NULL, N'[
  {
    "caption": "Bad boy",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Bad boy"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1354, 1145, N'd2a85cb9-4000-4a1d-bbce-82abcd2224aa', 66, 1057, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1355, 1145, N'd2a85cb9-4000-4a1d-bbce-82abcd2224aa', 67, NULL, NULL, NULL, NULL, N'[
  {
    "caption": "Bad boy",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": true,
    "isInternal": false,
    "type": "external",
    "title": "Bad boy"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1356, 1146, N'a7873891-9ffa-478a-8efe-10c87f5a4be2', 66, 1062, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1357, 1146, N'a7873891-9ffa-478a-8efe-10c87f5a4be2', 67, NULL, NULL, NULL, NULL, N'[
  {
    "caption": "Stiga",
    "link": "http://www.stiga.dk/hjem.html",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Stiga"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1358, 1147, N'29310804-668c-4573-a4b3-9f357d55096e', 66, 1064, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1359, 1147, N'29310804-668c-4573-a4b3-9f357d55096e', 67, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1360, 1147, N'e4116194-4885-4ece-94c1-0c17d38c3577', 66, 1064, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1361, 1147, N'e4116194-4885-4ece-94c1-0c17d38c3577', 67, NULL, NULL, NULL, NULL, N'[
  {
    "caption": "Stihl",
    "link": "http://www.stihl.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Stihl"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1362, 1148, N'e0c94675-9518-4d3c-81a2-c0a4ded3a79d', 66, 1065, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1363, 1148, N'e0c94675-9518-4d3c-81a2-c0a4ded3a79d', 67, NULL, NULL, NULL, NULL, N'[
  {
    "caption": "Viking",
    "link": "http://www.stihl.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Viking"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1364, 1149, N'866e08e5-f650-45eb-a20c-4f07d242e8b9', 66, 1058, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1365, 1149, N'866e08e5-f650-45eb-a20c-4f07d242e8b9', 67, NULL, NULL, NULL, NULL, N'[
  {
    "caption": "Club car",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Club car"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1366, 1150, N'0227d70e-44c5-4532-9288-0e72b5c79b48', 66, 1059, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1367, 1150, N'0227d70e-44c5-4532-9288-0e72b5c79b48', 67, NULL, NULL, NULL, NULL, N'[
  {
    "caption": "ISEKI",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ISEKI"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1368, 1151, N'6cdc4498-af4a-450a-937f-9b35928892c6', 66, 1060, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1369, 1151, N'6cdc4498-af4a-450a-937f-9b35928892c6', 67, NULL, NULL, NULL, NULL, N'[
  {
    "caption": "Ventrac",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Ventrac"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1370, 1152, N'16d9a48f-061f-440e-8a24-7ec948c0a8e4', 66, 1061, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1371, 1152, N'16d9a48f-061f-440e-8a24-7ec948c0a8e4', 67, NULL, NULL, NULL, NULL, N'[
  {
    "caption": "VITRA",
    "link": "http://www.hcpetersen.dk/",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "VITRA"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1372, 1153, N'664c1195-1fef-4fa5-b305-d6c253019baf', 66, 1063, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1373, 1153, N'664c1195-1fef-4fa5-b305-d6c253019baf', 67, NULL, NULL, NULL, NULL, N'[
  {
    "caption": "Stiga shoppen",
    "link": "http://www.stiga.dk/hjem.html",
    "newWindow": true,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "Stiga shoppen"
  }
]')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Upload image', 0, 0, NULL, NULL, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (7, -92, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (8, -92, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (9, -92, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 0, NULL, NULL, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (26, -92, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (27, -96, 1031, 5, N'contents', N'Contents:', 0, 0, NULL, NULL, N'0000001b-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (29, -92, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (32, -92, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (33, -92, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (34, -92, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (35, 1047, 1049, 12, N'header', N'Header', 0, 0, NULL, NULL, N'd994f54c-cc72-4cf0-9a1a-66fd952e2735')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (36, -87, 1049, 12, N'text', N'Text', 1, 0, NULL, NULL, N'fb8656c6-e6a4-4928-ac1a-7c43e2da8c7b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (37, 1035, 1049, 13, N'logo', N'Logo', 0, 0, NULL, NULL, N'73a82a77-748e-4148-b1fd-18a0f0544ac2')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (38, 1071, 1073, 14, N'header', N'Header', 0, 0, NULL, NULL, N'c197c535-a3af-4bd0-b988-fc8c0eb88a11')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (39, -87, 1073, 14, N'text', N'Text', 1, 0, NULL, NULL, N'dbca46c1-2d7a-425a-b8c7-0160735b1407')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (40, 1075, 1049, 15, N'companyName', N'Company name', 0, 0, NULL, NULL, N'893a694c-f476-4707-9521-87add4bf2bcf')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (41, 1076, 1049, 15, N'address', N'Address', 1, 0, NULL, NULL, N'95a40c46-637b-4e4e-ac00-aaf5591d0483')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (42, -51, 1049, 15, N'zipCode', N'Zip code', 3, 0, NULL, NULL, N'05de6464-f903-4895-bbca-3276bf0d75d3')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (43, 1077, 1049, 15, N'phoneNumber', N'Phone number', 4, 0, NULL, NULL, N'0888b9f2-3977-40d5-a71d-4a2aa30497cc')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (44, 1078, 1049, 15, N'eMail', N'E-mail', 5, 0, NULL, NULL, N'4390152a-8783-4304-8798-5322faf045fb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (45, 1079, 1049, 15, N'city', N'City', 2, 0, NULL, NULL, N'0883ba9e-eb0e-401c-bd48-0bdfda767a4f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (46, 1084, 1083, 16, N'googleMapsUrl', N'Google maps url', 0, 0, NULL, NULL, N'48e95d51-c0c3-4ece-a1df-a9d0aa296eb4')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (47, 1086, 1083, 16, N'header', N'Header', 1, 0, NULL, NULL, N'f256d121-15c7-4eea-9dfd-913bee356cbc')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (48, -87, 1083, 16, N'text', N'Text', 2, 0, NULL, NULL, N'3bf3498c-714c-4d9a-9682-3cbe9240a5a8')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (50, 1091, 1089, 17, N'group', N'Group', 1, 0, NULL, NULL, N'2e0d7fef-c411-474b-b29b-f1785973d8ed')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (51, 1092, 1089, 17, N'description', N'Description', 2, 0, NULL, NULL, N'4354111d-5410-45ce-82b9-482b794f1ec2')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (52, -89, 1089, 17, N'size', N'Size', 3, 0, NULL, NULL, N'3992cb24-e99b-4c50-b9d0-dac35ba1f62d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (53, 1093, 1089, 17, N'rentday', N'Rent/day', 5, 0, NULL, NULL, N'06034cb9-62d6-4f0f-875c-bbf13f7fa1b6')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (54, 1094, 1089, 17, N'price', N'Price', 6, 0, NULL, NULL, N'be8332e2-f40d-4ce5-8a77-1f75c52ddf30')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (55, 1097, 1089, 17, N'force', N'Force', 4, 0, NULL, NULL, N'bcfa93aa-cc15-48dd-90a8-fc877c915e0c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (56, 1034, 1099, 18, N'sortiment', N'Sortiment', 0, 0, NULL, NULL, N'fe0cf763-9afd-4b8c-9576-89e9033868fa')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (57, 1101, 1089, 17, N'partNo', N'Part no.', 0, 0, NULL, NULL, N'412665c7-eb4c-448d-945e-9f39374e8a75')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (58, 1103, 1105, 19, N'paygate', N'Paygate', 0, 0, NULL, NULL, N'52fcbf4c-f830-47a9-9273-3c9196dcfd2d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (59, 1107, 1049, 13, N'catalogPdf', N'Catalog pdf', 1, 0, NULL, NULL, N'3c43c84d-cc10-4b5b-8421-5ba7f0bd8fe3')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (60, 1111, 1112, 20, N'machineName', N'Name', 0, 0, NULL, NULL, N'953e049a-525a-487c-aef5-1dda3211b851')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (61, -87, 1112, 20, N'information', N'Information', 2, 0, NULL, NULL, N'7aa3caab-61cf-4977-a0f9-6f456d6e6f34')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (62, 1035, 1112, 20, N'picture', N'Picture', 3, 0, NULL, NULL, N'6017ce7b-92b1-4798-80b0-0c87e18f3fbd')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (63, 1110, 1112, 20, N'price', N'Price', 4, 0, NULL, NULL, N'cd6e99f9-6331-41ca-8430-6dcd62de0d2c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (64, 1034, 1119, 21, N'machineFolder', N'Machine folder', 0, 0, NULL, NULL, N'7857fa2c-1fbc-424e-b2a0-ea61dd89cdad')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (65, -89, 1112, 20, N'description', N'Description', 1, 0, NULL, N'Short description of the product', N'27f04e1f-4d0e-4593-8f1e-1fdf0c8e1bef')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (66, 1035, 1143, 22, N'image', N'Image', 0, 0, NULL, NULL, N'9d8f7137-a3cc-44ec-8069-b1a7305c5cfb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (67, 1142, 1143, 22, N'link', N'Link', 1, 0, NULL, NULL, N'01cf9bf1-db82-45d2-9cac-ec02e5a52114')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (3, 1032, N'Image', 1, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (4, 1033, N'File', 1, N'50899f9c-023a-4466-b623-aba9049885fe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (5, 1031, N'Contents', 1, N'79995fa2-63ee-453c-a29b-2e66f324cdbe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (11, 1044, N'Membership', 1, N'0756729d-d665-46e3-b84a-37aceaa614f8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (12, 1049, N'Content', 0, N'c65bb3b2-674e-4f1b-b97c-2bd5f768fbe5')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (13, 1049, N'Meta', 1, N'1444385a-0298-4d21-a91f-119944052b7c')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (14, 1073, N'Content', 0, N'8e1d2447-a029-4600-b0f5-28a4a8a4b798')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (15, 1049, N'Contact information', 2, N'485ed5b4-e374-460d-98e5-f83b5bdaf0b2')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (16, 1083, N'Information', 0, N'254ed1e0-c74d-4892-904d-7c330c6d5efb')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (17, 1089, N'Sortiment information', 0, N'9ad45148-04a5-4379-b342-866cb0de0b76')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (18, 1099, N'Content', 0, N'66211bfd-59bb-4dfe-9419-8c3d15d928b3')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (19, 1105, N'Information', 0, N'a36ef56f-2327-41f9-a5de-246e740023ac')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (20, 1112, N'Information', 0, N'7c803a52-c33f-4b7d-9304-92479c701821')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (21, 1119, N'Content', 0, N'0d699963-3481-4897-99da-39a70ee1c0f9')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (22, 1143, N'Content', 0, N'74af2362-4c24-4f68-b0ce-aad9358f6e13')
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
SET IDENTITY_INSERT [dbo].[cmsTaskType] ON 

INSERT [dbo].[cmsTaskType] ([id], [alias]) VALUES (1, N'toTranslate')
SET IDENTITY_INSERT [dbo].[cmsTaskType] OFF
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (2, 1048, N'Home', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.Home>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "layout.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (3, 1051, N'layout', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/t/dt/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
    <link href="~/Content/css/main.css" rel="stylesheet" />
</head>
<body>
    <header class="header-l">
        <div class="container">
            <nav class="menu">
                @Umbraco.RenderMacro("menu", new {startNodeId="1050"})
            </nav>
				<nav class="menu-mobile">
                @Umbraco.RenderMacro("menuMobile", new {startNodeId="1050"})</nav>
        </div>
    </header>
    <div class="content">
        <div class="container">
            @RenderBody()
            <div class="sponsor-list">@Umbraco.RenderMacro("sponsorlist", new {mediaId="1144"}) </div>
        </div>
    </div>
    <footer class="footer">
        <div class="container">
            @RenderPage("~/Views/Partials/FooterSection.cshtml")
        </div>
    </footer>

    <script src="~/Content/js/main.js"></script>
</body>
</html>')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (6, 1081, N'TextPage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "layout.cshtml";
}

    <div class="con-1">
        @Umbraco.Field("header")

        @Umbraco.Field("text")
    </div>')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (7, 1082, N'Contact', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.Contact>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "layout.cshtml";
}

  <div class="con-1">
        <h3> @Umbraco.Field("header")</h3>

        @Umbraco.Field("text")
<iframe width="600" height="450" frameborder="0" style="border:0"
src="@Umbraco.Field("googleMapsUrl")" allowfullscreen></iframe>
    </div>
')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (8, 1098, N'SortimentPage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.SortimentPage>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "layout.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (9, 1104, N'Cart', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.Cart>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "layout.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (10, 1118, N'MachinePage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.MachinePage>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "layout.cshtml";
            var node = Umbraco.TypedContent(Model.Content.GetPropertyValue<int>("machineFolder"));
}
<div class="con-1">

	   <ul>
              @foreach (var item in node.Children.Where("Visible"))
                {
                var content = Umbraco.Content(@item.Id);
				<li>
					<img width="190" src="@Umbraco.Media(content.picture).Url" /><br>
					<h4>@content.machineName</h4>
					<p><strong>Price:</strong>@content.Price</p>
					<p>@content.description</p>
					<input type="hidden" value="@content.information" />
                </li>
				
            }
        </ul>
</div>')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (242, CAST(N'2016-03-30 07:03:05.787' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1132]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (243, CAST(N'2016-03-30 07:03:30.757' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Path\":\"-1,1115,1133\",\"Id\":1133,\"Operation\":0}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (244, CAST(N'2016-03-30 07:03:32.630' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Path\":\"-1,1115,1134\",\"Id\":1134,\"Operation\":0}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (245, CAST(N'2016-03-30 07:03:34.383' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Path\":\"-1,1115,1135\",\"Id\":1135,\"Operation\":0}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (246, CAST(N'2016-03-30 07:03:36.527' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Path\":\"-1,1115,1136\",\"Id\":1136,\"Operation\":0}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (247, CAST(N'2016-03-30 07:03:39.290' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Path\":\"-1,1115,1137\",\"Id\":1137,\"Operation\":0}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (248, CAST(N'2016-03-30 07:03:42.983' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Path\":\"-1,1115\",\"Id\":1115,\"Operation\":0}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (249, CAST(N'2016-03-30 07:17:20.040' AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1132]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1132]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (250, CAST(N'2016-03-30 07:31:20.493' AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1122]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1122]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (251, CAST(N'2016-03-30 07:31:57.550' AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1114]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1114]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (252, CAST(N'2016-03-30 07:32:07.750' AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1114]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (253, CAST(N'2016-03-30 07:32:10.893' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1114]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P7376/D2] E45E56012042491BB04D7821008338F4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1250, CAST(N'2016-03-30 08:57:05.073' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1138]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1251, CAST(N'2016-03-30 08:57:52.300' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1139]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1252, CAST(N'2016-03-30 09:28:07.967' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1140]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1253, CAST(N'2016-03-30 09:37:34.033' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"sponsorFolder\",\"Id\":1141,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1254, CAST(N'2016-03-30 09:38:19.373' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"UniqueId\":\"533c9cda-faed-4316-8788-12b2a7123929\",\"Id\":1142}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1255, CAST(N'2016-03-30 09:38:23.603' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"sponsor\",\"Id\":1143,\"PropertyTypeIds\":[66,67],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1256, CAST(N'2016-03-30 09:38:31.963' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"sponsorFolder\",\"Id\":1141,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"DescendantPayloads\":[{\"Alias\":\"sponsor\",\"Id\":1143,\"PropertyTypeIds\":[66,67],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1257, CAST(N'2016-03-30 09:38:39.287' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"sponsorFolder\",\"Id\":1141,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"DescendantPayloads\":[{\"Alias\":\"sponsor\",\"Id\":1143,\"PropertyTypeIds\":[66,67],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1258, CAST(N'2016-03-30 09:38:55.197' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"sponsor\",\"Id\":1143,\"PropertyTypeIds\":[66,67],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1259, CAST(N'2016-03-30 09:39:01.643' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"sponsorFolder\",\"Id\":1141,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"DescendantPayloads\":[{\"Alias\":\"sponsor\",\"Id\":1143,\"PropertyTypeIds\":[66,67],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1260, CAST(N'2016-03-30 09:39:25.020' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1144]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1261, CAST(N'2016-03-30 09:40:47.683' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1145]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1262, CAST(N'2016-03-30 09:40:56.400' AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1145]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1145]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1263, CAST(N'2016-03-30 09:41:02.217' AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1145]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1145]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1264, CAST(N'2016-03-30 09:41:43.980' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1146]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1265, CAST(N'2016-03-30 09:42:04.870' AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1146]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1146]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1266, CAST(N'2016-03-30 09:42:35.700' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1267, CAST(N'2016-03-30 09:42:43.923' AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1268, CAST(N'2016-03-30 09:44:01.060' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1051]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1269, CAST(N'2016-03-30 09:46:43.133' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1051]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1270, CAST(N'2016-03-30 09:50:03.013' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1148]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1271, CAST(N'2016-03-30 09:50:45.197' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1149]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D2] C8CAE6628F63407494FDBE709DC919FD')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1272, CAST(N'2016-03-30 10:07:13.360' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1150]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D4] E6B8EFA157714B21A43124A67BA7E8A4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1273, CAST(N'2016-03-30 10:07:56.317' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1151]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D4] E6B8EFA157714B21A43124A67BA7E8A4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1274, CAST(N'2016-03-30 10:08:27.337' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1152]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D4] E6B8EFA157714B21A43124A67BA7E8A4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1275, CAST(N'2016-03-30 10:08:57.833' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1153]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D4] E6B8EFA157714B21A43124A67BA7E8A4')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1276, CAST(N'2016-03-30 10:28:42.577' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1]","JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D5] F95E92B75C014BD2BAE5AD82AEEF94C5')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (1277, CAST(N'2016-03-30 10:29:13.830' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1]","JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1]","JsonPayload":null}]', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT [P4188/D5] F95E92B75C014BD2BAE5AD82AEEF94C5')
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName]) VALUES (1, N'en-US', N'en-US')
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1, 0, 1046, CAST(N'2016-03-23 12:32:25.953' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (2, 0, 1046, CAST(N'2016-03-23 12:32:33.213' AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (3, 0, 1047, CAST(N'2016-03-23 12:33:04.550' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (4, 0, 1048, CAST(N'2016-03-23 12:33:46.607' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (5, 0, 1049, CAST(N'2016-03-23 12:33:46.730' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (6, 0, 1049, CAST(N'2016-03-23 12:36:43.933' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (7, 0, 1049, CAST(N'2016-03-23 12:37:12.567' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (8, 0, 0, CAST(N'2016-03-23 12:37:20.837' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (9, 0, 1050, CAST(N'2016-03-23 12:37:47.553' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (10, 0, -1, CAST(N'2016-03-23 12:39:03.370' AS DateTime), N'Delete', N'Delete PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (11, 0, -1, CAST(N'2016-03-23 12:39:06.870' AS DateTime), N'Delete', N'Delete PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (12, 0, -1, CAST(N'2016-03-23 12:39:10.353' AS DateTime), N'Delete', N'Delete PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (13, 0, -1, CAST(N'2016-03-23 12:39:14.303' AS DateTime), N'Delete', N'Delete PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (14, 0, -1, CAST(N'2016-03-23 12:39:20.797' AS DateTime), N'Delete', N'Delete PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (15, 0, -1, CAST(N'2016-03-23 12:39:24.333' AS DateTime), N'Delete', N'Delete PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (16, 0, -1, CAST(N'2016-03-23 12:39:34.557' AS DateTime), N'Delete', N'Delete PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (17, 0, -1, CAST(N'2016-03-23 12:39:37.103' AS DateTime), N'Delete', N'Delete PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (18, 0, -1, CAST(N'2016-03-23 12:42:49.797' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (19, 0, -1, CAST(N'2016-03-23 12:42:49.820' AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (20, 0, -1, CAST(N'2016-03-23 12:44:08.187' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (21, 0, 1051, CAST(N'2016-03-23 12:45:44.800' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (22, 0, 1051, CAST(N'2016-03-23 12:45:50.753' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (23, 0, 1048, CAST(N'2016-03-23 13:13:24.000' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (24, 0, 1048, CAST(N'2016-03-23 13:13:42.470' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (25, 0, 1048, CAST(N'2016-03-23 13:14:35.760' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (26, 0, 1051, CAST(N'2016-03-23 13:16:03.707' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (27, 0, -1, CAST(N'2016-03-23 13:16:28.577' AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (28, 0, 1051, CAST(N'2016-03-23 13:17:46.040' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (29, 0, 1051, CAST(N'2016-03-23 13:25:41.317' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (30, 0, 1052, CAST(N'2016-03-23 13:26:17.043' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (31, 0, 1049, CAST(N'2016-03-23 13:26:30.183' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (32, 0, 1052, CAST(N'2016-03-23 13:26:44.037' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (33, 0, 0, CAST(N'2016-03-23 13:26:50.173' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (34, 0, -1, CAST(N'2016-03-23 13:27:37.290' AS DateTime), N'Delete', N'Delete Content of Type 1052 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (35, 0, 1052, CAST(N'2016-03-23 13:27:37.400' AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (36, 0, 1053, CAST(N'2016-03-23 13:27:58.667' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (37, 0, 1049, CAST(N'2016-03-23 13:28:14.750' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (38, 0, 0, CAST(N'2016-03-23 13:29:05.257' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (39, 0, 1054, CAST(N'2016-03-23 13:29:20.187' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (40, 0, 1054, CAST(N'2016-03-23 13:30:22.293' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (41, 0, 1050, CAST(N'2016-03-23 13:30:28.577' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (42, 0, 1054, CAST(N'2016-03-23 13:30:58.307' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (43, 0, 1054, CAST(N'2016-03-23 14:13:45.097' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (44, 0, 1053, CAST(N'2016-03-23 14:14:11.960' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (45, 0, 1054, CAST(N'2016-03-23 14:14:28.650' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (46, 0, 1054, CAST(N'2016-03-23 14:15:15.100' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (47, 0, 0, CAST(N'2016-03-23 14:31:22.807' AS DateTime), N'New', N'Media '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (48, 0, 1055, CAST(N'2016-03-23 14:31:27.807' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (49, 0, 1055, CAST(N'2016-03-23 14:31:32.673' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (50, 0, 0, CAST(N'2016-03-23 14:31:51.503' AS DateTime), N'New', N'Media ''katalogstudent023.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (51, 0, 1056, CAST(N'2016-03-23 14:31:51.600' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (52, 0, 0, CAST(N'2016-03-23 14:31:51.707' AS DateTime), N'New', N'Media ''mask_badboy.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (53, 0, 1057, CAST(N'2016-03-23 14:31:51.743' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (54, 0, 0, CAST(N'2016-03-23 14:31:51.833' AS DateTime), N'New', N'Media ''mask_clubcar.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (55, 0, 1058, CAST(N'2016-03-23 14:31:51.850' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (56, 0, 0, CAST(N'2016-03-23 14:31:51.940' AS DateTime), N'New', N'Media ''mask_iseki.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (57, 0, 1059, CAST(N'2016-03-23 14:31:51.963' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (58, 0, 0, CAST(N'2016-03-23 14:31:52.060' AS DateTime), N'New', N'Media ''mask_ventrac.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (59, 0, 1060, CAST(N'2016-03-23 14:31:52.077' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (60, 0, 0, CAST(N'2016-03-23 14:31:52.167' AS DateTime), N'New', N'Media ''mask_vitra.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (61, 0, 1061, CAST(N'2016-03-23 14:31:52.183' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (62, 0, 0, CAST(N'2016-03-23 14:31:52.263' AS DateTime), N'New', N'Media ''stiga.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (63, 0, 1062, CAST(N'2016-03-23 14:31:52.307' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (64, 0, 0, CAST(N'2016-03-23 14:31:52.380' AS DateTime), N'New', N'Media ''stiga_0.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (65, 0, 1063, CAST(N'2016-03-23 14:31:52.397' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (66, 0, 0, CAST(N'2016-03-23 14:31:52.473' AS DateTime), N'New', N'Media ''stihl_logo.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (67, 0, 1064, CAST(N'2016-03-23 14:31:52.500' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (68, 0, 0, CAST(N'2016-03-23 14:31:52.533' AS DateTime), N'New', N'Media ''viking.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (69, 0, 1065, CAST(N'2016-03-23 14:31:52.557' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (70, 0, 0, CAST(N'2016-03-23 14:31:52.597' AS DateTime), N'New', N'Media ''bfcd0cbc730e20fa26d794cbffd22128.JPG'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (71, 0, 1066, CAST(N'2016-03-23 14:31:52.627' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (72, 0, 0, CAST(N'2016-03-23 14:31:52.667' AS DateTime), N'New', N'Media ''gravemaskine.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (73, 0, 1067, CAST(N'2016-03-23 14:31:52.693' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (74, 0, -1, CAST(N'2016-03-23 14:33:16.887' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (75, 0, -1, CAST(N'2016-03-23 14:33:16.897' AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (76, 0, -1, CAST(N'2016-03-23 14:33:20.623' AS DateTime), N'Delete', N'Delete PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (77, 0, -1, CAST(N'2016-03-23 14:33:44.193' AS DateTime), N'Delete', N'Delete Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (78, 0, -1, CAST(N'2016-03-23 14:33:55.357' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (79, 0, -1, CAST(N'2016-03-23 14:33:55.357' AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (80, 0, -1, CAST(N'2016-03-23 14:34:27.550' AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (81, 0, 1051, CAST(N'2016-03-23 14:35:20.503' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (82, 0, 1056, CAST(N'2016-03-23 14:37:12.527' AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (83, 0, 1066, CAST(N'2016-03-23 14:37:19.230' AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (84, 0, 1067, CAST(N'2016-03-23 14:37:23.353' AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (85, 0, 1057, CAST(N'2016-03-23 14:37:31.767' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (86, 0, 1049, CAST(N'2016-03-23 14:43:45.133' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (87, 0, 0, CAST(N'2016-03-23 14:43:55.813' AS DateTime), N'New', N'Media '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (88, 0, 1068, CAST(N'2016-03-23 14:43:58.683' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (89, 0, 0, CAST(N'2016-03-23 14:44:02.897' AS DateTime), N'New', N'Media ''maskinlogo.gif'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (90, 0, 1069, CAST(N'2016-03-23 14:44:02.930' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (91, 0, 1050, CAST(N'2016-03-23 14:44:14.630' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (92, 0, 0, CAST(N'2016-03-23 14:51:48.827' AS DateTime), N'New', N'Media ''maskinlogosmall.gif'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (93, 0, 1070, CAST(N'2016-03-23 14:51:48.983' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (94, 0, 1050, CAST(N'2016-03-23 14:52:05.463' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (95, 0, 1053, CAST(N'2016-03-24 11:41:50.093' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (96, 0, 1054, CAST(N'2016-03-24 11:42:14.610' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (97, 0, 1054, CAST(N'2016-03-24 11:42:14.787' AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (98, 0, -1, CAST(N'2016-03-24 11:42:14.790' AS DateTime), N'Delete', N'Delete Content of Type 1053 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (99, 0, 1053, CAST(N'2016-03-24 11:42:14.820' AS DateTime), N'Delete', N'Delete ContentType performed by user')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (100, 0, 1071, CAST(N'2016-03-24 11:42:38.747' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (101, 0, 1072, CAST(N'2016-03-24 11:42:54.967' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (102, 0, 1073, CAST(N'2016-03-24 11:42:55.000' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (103, 0, 1072, CAST(N'2016-03-24 11:43:42.617' AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (104, 0, 1073, CAST(N'2016-03-24 11:43:48.570' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (105, 0, 1074, CAST(N'2016-03-24 11:44:14.457' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (106, 0, 1074, CAST(N'2016-03-24 11:45:15.470' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (107, 0, 1074, CAST(N'2016-03-24 11:45:46.363' AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (108, 0, -1, CAST(N'2016-03-24 11:46:31.440' AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (109, 0, -1, CAST(N'2016-03-24 11:47:34.623' AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (110, 0, -1, CAST(N'2016-03-24 11:47:56.260' AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (111, 0, 1051, CAST(N'2016-03-24 11:49:03.623' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (112, 0, -1, CAST(N'2016-03-24 11:49:15.253' AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (113, 0, 1075, CAST(N'2016-03-24 11:50:11.747' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (114, 0, 1076, CAST(N'2016-03-24 11:50:34.853' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (115, 0, 1077, CAST(N'2016-03-24 11:51:25.413' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (116, 0, 1078, CAST(N'2016-03-24 11:51:46.630' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (117, 0, 1049, CAST(N'2016-03-24 11:51:49.310' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (118, 0, 1049, CAST(N'2016-03-24 11:52:07.070' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (119, 0, -1, CAST(N'2016-03-24 11:52:24.847' AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (120, 0, -1, CAST(N'2016-03-24 11:52:54.060' AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (121, 0, -1, CAST(N'2016-03-24 11:53:15.893' AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (122, 0, -1, CAST(N'2016-03-24 11:53:34.383' AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (123, 0, 1079, CAST(N'2016-03-24 11:53:56.633' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (124, 0, 1049, CAST(N'2016-03-24 11:54:06.477' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (125, 0, 1049, CAST(N'2016-03-24 11:54:16.260' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (126, 0, 1050, CAST(N'2016-03-24 11:55:15.010' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (127, 0, 1051, CAST(N'2016-03-24 11:56:58.683' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (128, 0, -1, CAST(N'2016-03-24 11:57:12.540' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (129, 0, 1049, CAST(N'2016-03-24 11:58:00.273' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (130, 0, 0, CAST(N'2016-03-24 11:58:05.050' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (131, 0, 1080, CAST(N'2016-03-24 12:01:19.217' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (132, 0, 1080, CAST(N'2016-03-24 12:01:40.513' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (133, 0, 1073, CAST(N'2016-03-24 12:01:59.900' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (134, 0, 1081, CAST(N'2016-03-24 12:02:25.737' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (135, 0, 1081, CAST(N'2016-03-24 12:02:44.157' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (136, 0, 1073, CAST(N'2016-03-24 12:02:56.620' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (137, 0, 1080, CAST(N'2016-03-24 12:03:04.093' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (138, 0, 1080, CAST(N'2016-03-24 12:07:02.073' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (139, 0, 1080, CAST(N'2016-03-24 12:09:23.740' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (140, 0, 1082, CAST(N'2016-03-24 12:13:40.417' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (141, 0, 1083, CAST(N'2016-03-24 12:13:40.437' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (142, 0, 1083, CAST(N'2016-03-24 12:13:47.547' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (143, 0, 1084, CAST(N'2016-03-24 12:14:24.123' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (144, 0, 1083, CAST(N'2016-03-24 12:14:58.687' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (145, 0, 1049, CAST(N'2016-03-24 12:15:11.580' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (146, 0, 0, CAST(N'2016-03-24 12:15:15.390' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (147, 0, 1085, CAST(N'2016-03-24 12:15:23.033' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (148, 0, 1050, CAST(N'2016-03-24 12:15:34.487' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (149, 0, 1085, CAST(N'2016-03-24 12:17:33.557' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (150, 0, 1085, CAST(N'2016-03-24 12:17:55.693' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (151, 0, 1082, CAST(N'2016-03-24 12:18:33.587' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (152, 0, 1085, CAST(N'2016-03-24 12:23:13.457' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (153, 0, 1083, CAST(N'2016-03-24 12:24:16.563' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (154, 0, 1086, CAST(N'2016-03-24 12:24:32.217' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (155, 0, 1083, CAST(N'2016-03-24 12:24:48.510' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (156, 0, 1085, CAST(N'2016-03-24 12:25:06.200' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (157, 0, 1082, CAST(N'2016-03-24 12:25:29.430' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (158, 0, 0, CAST(N'2016-03-24 12:34:07.750' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (159, 0, 1087, CAST(N'2016-03-24 12:34:48.957' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (160, 0, 0, CAST(N'2016-03-24 12:35:16.857' AS DateTime), N'Sort', N'Sorting content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (161, 0, 1087, CAST(N'2016-03-24 12:35:31.127' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (162, 0, 1088, CAST(N'2016-03-24 12:39:46.310' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (163, 0, 1089, CAST(N'2016-03-24 12:39:58.397' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (164, 0, 1089, CAST(N'2016-03-24 12:40:13.457' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (165, 0, 1090, CAST(N'2016-03-24 12:41:00.787' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (166, 0, 1091, CAST(N'2016-03-24 12:42:36.473' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (167, 0, 1092, CAST(N'2016-03-24 12:43:15.090' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (168, 0, 1093, CAST(N'2016-03-24 12:44:58.093' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (169, 0, 1094, CAST(N'2016-03-24 12:45:15.280' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (170, 0, 1089, CAST(N'2016-03-24 12:45:17.010' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (171, 0, 1088, CAST(N'2016-03-24 12:45:27.977' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (172, 0, 0, CAST(N'2016-03-24 12:45:32.520' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (173, 0, 1095, CAST(N'2016-03-24 12:45:42.713' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (174, 0, 1088, CAST(N'2016-03-24 12:45:58.200' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (175, 0, 0, CAST(N'2016-03-24 12:46:03.207' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (176, 0, 1096, CAST(N'2016-03-24 12:47:19.657' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (177, 0, 1097, CAST(N'2016-03-24 12:48:03.960' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (178, 0, 1089, CAST(N'2016-03-24 12:48:15.937' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (179, 0, 1089, CAST(N'2016-03-24 12:48:37.507' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (180, 0, 1088, CAST(N'2016-03-24 12:49:04.037' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (181, 0, 1089, CAST(N'2016-03-24 12:49:26.583' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (182, 0, 1049, CAST(N'2016-03-24 12:49:35.753' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (183, 0, 1083, CAST(N'2016-03-24 12:49:43.810' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (184, 0, 1073, CAST(N'2016-03-24 12:50:23.440' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (185, 0, 1034, CAST(N'2016-03-24 12:53:10.037' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (186, 0, 1098, CAST(N'2016-03-24 12:54:38.503' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (187, 0, 1099, CAST(N'2016-03-24 12:54:38.530' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (188, 0, 1049, CAST(N'2016-03-24 12:54:55.850' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (189, 0, 0, CAST(N'2016-03-24 12:54:59.587' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (190, 0, 1100, CAST(N'2016-03-24 12:55:06.083' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (191, 0, 1100, CAST(N'2016-03-24 12:55:10.357' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (192, 0, 1098, CAST(N'2016-03-24 12:57:58.287' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (193, 0, 1101, CAST(N'2016-03-24 13:06:50.227' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (194, 0, 1089, CAST(N'2016-03-24 13:06:56.807' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (195, 0, 1089, CAST(N'2016-03-24 13:07:06.763' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (196, 0, 1096, CAST(N'2016-03-24 13:07:45.970' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (197, 0, 1096, CAST(N'2016-03-24 13:07:56.530' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (198, 0, 1089, CAST(N'2016-03-24 13:08:34.923' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (199, 0, 1100, CAST(N'2016-03-24 13:08:44.557' AS DateTime), N'Publish', N'Save and Publish performed by user')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (200, 0, 1096, CAST(N'2016-03-24 13:08:47.870' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (201, 0, 1095, CAST(N'2016-03-24 13:09:49.200' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (202, 0, 1100, CAST(N'2016-03-24 13:10:02.197' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (203, 0, 1100, CAST(N'2016-03-24 13:10:13.887' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (204, 0, 0, CAST(N'2016-03-24 13:15:44.433' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (205, 0, 1102, CAST(N'2016-03-24 13:16:29.610' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (206, 0, 1103, CAST(N'2016-03-24 13:47:52.683' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (207, 0, 1104, CAST(N'2016-03-24 13:47:54.333' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (208, 0, 1105, CAST(N'2016-03-24 13:47:54.463' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (209, 0, 1104, CAST(N'2016-03-24 13:48:04.830' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (210, 0, 1105, CAST(N'2016-03-24 13:48:13.857' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (211, 0, 0, CAST(N'2016-03-24 13:48:18.530' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (212, 0, 1106, CAST(N'2016-03-24 13:48:23.083' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (213, 0, 1105, CAST(N'2016-03-24 13:48:42.770' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (214, 0, 0, CAST(N'2016-03-24 21:44:35.307' AS DateTime), N'Sort', N'Sorting content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (215, 0, 1107, CAST(N'2016-03-25 13:44:27.117' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (216, 0, 1107, CAST(N'2016-03-25 13:44:46.633' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (217, 0, 1049, CAST(N'2016-03-25 13:44:49.370' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (218, 0, 1050, CAST(N'2016-03-25 13:45:51.137' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (219, 0, 1050, CAST(N'2016-03-25 13:51:54.820' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (220, 0, 1108, CAST(N'2016-03-25 13:52:58.230' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (221, 0, 1109, CAST(N'2016-03-25 13:53:43.480' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (222, 0, 1110, CAST(N'2016-03-25 13:54:38.603' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (223, 0, 1111, CAST(N'2016-03-25 13:55:04.493' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (224, 0, 1112, CAST(N'2016-03-25 13:56:06.893' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (225, 0, 1112, CAST(N'2016-03-25 13:56:27.767' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (226, 0, 1108, CAST(N'2016-03-25 13:56:37.870' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (227, 0, 1112, CAST(N'2016-03-25 13:56:54.507' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (228, 0, 1108, CAST(N'2016-03-25 13:57:01.997' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (229, 0, 0, CAST(N'2016-03-25 13:57:08.087' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (230, 0, 1113, CAST(N'2016-03-25 13:57:16.253' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (231, 0, 0, CAST(N'2016-03-25 13:57:22.487' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (232, 0, 1114, CAST(N'2016-03-25 13:57:56.383' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (233, 0, 0, CAST(N'2016-03-25 13:58:03.953' AS DateTime), N'New', N'Media '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (234, 0, 1115, CAST(N'2016-03-25 13:58:09.350' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (235, 0, 0, CAST(N'2016-03-25 13:58:22.453' AS DateTime), N'New', N'Media ''bfcd0cbc730e20fa26d794cbffd22128.JPG'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (236, 0, 1116, CAST(N'2016-03-25 13:58:22.537' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (237, 0, 0, CAST(N'2016-03-25 13:58:22.580' AS DateTime), N'New', N'Media ''gravemaskine.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (238, 0, 1117, CAST(N'2016-03-25 13:58:22.617' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (239, 0, 1115, CAST(N'2016-03-25 13:58:24.230' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (240, 0, 1114, CAST(N'2016-03-25 13:58:42.553' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (241, 0, 1118, CAST(N'2016-03-25 13:59:51.110' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (242, 0, 1119, CAST(N'2016-03-25 13:59:51.127' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (243, 0, 1049, CAST(N'2016-03-25 14:00:02.727' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (244, 0, 1119, CAST(N'2016-03-25 14:00:49.550' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (245, 0, 0, CAST(N'2016-03-25 14:00:53.793' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (246, 0, 1120, CAST(N'2016-03-25 14:01:08.367' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (247, 0, 1118, CAST(N'2016-03-25 14:01:34.290' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (248, 0, 0, CAST(N'2016-03-25 14:16:21.097' AS DateTime), N'Sort', N'Sorting content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (249, 0, 0, CAST(N'2016-03-25 14:16:42.727' AS DateTime), N'Sort', N'Sorting content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (250, 0, 1121, CAST(N'2016-03-26 23:19:16.447' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (251, 0, 1112, CAST(N'2016-03-26 23:19:48.597' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (252, 0, 1114, CAST(N'2016-03-26 23:20:00.727' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (253, 0, 1112, CAST(N'2016-03-26 23:20:15.510' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (254, 0, 1118, CAST(N'2016-03-26 23:20:55.083' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (255, 0, 1118, CAST(N'2016-03-26 23:21:26.817' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (256, 0, -1, CAST(N'2016-03-26 23:22:14.953' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (257, 0, -1, CAST(N'2016-03-26 23:22:14.967' AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (258, 0, -1, CAST(N'2016-03-26 23:22:35.163' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (259, 0, -1, CAST(N'2016-03-26 23:23:06.217' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (260, 0, -1, CAST(N'2016-03-26 23:25:03.097' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (261, 0, -1, CAST(N'2016-03-26 23:25:39.963' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (262, 0, -1, CAST(N'2016-03-26 23:25:54.247' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (263, 0, 1112, CAST(N'2016-03-26 23:26:01.683' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (264, 0, 1118, CAST(N'2016-03-26 23:26:12.793' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (265, 0, -1, CAST(N'2016-03-26 23:26:31.277' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (266, 0, -1, CAST(N'2016-03-26 23:26:36.380' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (267, 0, -1, CAST(N'2016-03-26 23:26:45.447' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (268, 0, -1, CAST(N'2016-03-26 23:27:03.760' AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (269, 0, 1118, CAST(N'2016-03-26 23:27:35.753' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (270, 0, 1118, CAST(N'2016-03-26 23:29:40.037' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (271, 0, 1118, CAST(N'2016-03-26 23:29:46.797' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (272, 0, 1118, CAST(N'2016-03-26 23:30:49.240' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (273, 0, 1118, CAST(N'2016-03-26 23:31:20.830' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (274, 0, 1118, CAST(N'2016-03-26 23:31:30.070' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (275, 0, 1118, CAST(N'2016-03-26 23:31:42.627' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (276, 0, 1118, CAST(N'2016-03-26 23:32:03.200' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (277, 0, 1118, CAST(N'2016-03-26 23:32:05.390' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (278, 0, 1118, CAST(N'2016-03-26 23:32:39.603' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (279, 0, 1118, CAST(N'2016-03-26 23:32:46.040' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (280, 0, 1118, CAST(N'2016-03-26 23:34:08.373' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (281, 0, 1118, CAST(N'2016-03-26 23:34:19.207' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (282, 0, 1118, CAST(N'2016-03-26 23:34:35.623' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (283, 0, 1118, CAST(N'2016-03-26 23:34:43.930' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (284, 0, 1118, CAST(N'2016-03-26 23:35:03.637' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (285, 0, 1118, CAST(N'2016-03-26 23:35:11.620' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (286, 0, 1118, CAST(N'2016-03-26 23:39:06.257' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (287, 0, 1118, CAST(N'2016-03-26 23:39:42.963' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (288, 0, 1118, CAST(N'2016-03-26 23:39:50.793' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (289, 0, 1118, CAST(N'2016-03-26 23:40:33.057' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (290, 0, 1118, CAST(N'2016-03-26 23:40:39.987' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (291, 0, 0, CAST(N'2016-03-26 23:40:53.013' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (292, 0, 1122, CAST(N'2016-03-26 23:41:26.423' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (293, 0, 1102, CAST(N'2016-03-27 00:41:37.683' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (294, 0, 1102, CAST(N'2016-03-27 00:41:42.890' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (295, 0, 1102, CAST(N'2016-03-27 00:41:56.570' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (296, 0, 1080, CAST(N'2016-03-27 15:17:15.097' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (297, 0, 1080, CAST(N'2016-03-27 15:18:37.027' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (298, 0, 1080, CAST(N'2016-03-27 15:18:48.223' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (299, 0, -1, CAST(N'2016-03-27 15:24:53.763' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (300, 0, -1, CAST(N'2016-03-27 15:24:53.840' AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (301, 0, -1, CAST(N'2016-03-27 15:25:13.560' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (302, 0, -1, CAST(N'2016-03-27 15:25:36.897' AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (303, 0, -1, CAST(N'2016-03-27 15:25:38.743' AS DateTime), N'Save', N'Save Macro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (304, 0, 1051, CAST(N'2016-03-27 15:26:12.740' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (305, 0, 1051, CAST(N'2016-03-27 15:26:22.523' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (306, 0, -1, CAST(N'2016-03-27 15:27:26.787' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (307, 0, -1, CAST(N'2016-03-27 15:28:23.743' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (308, 0, -1, CAST(N'2016-03-27 15:31:59.927' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (309, 0, -1, CAST(N'2016-03-27 15:32:00.863' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (310, 0, -1, CAST(N'2016-03-27 15:32:01.543' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (311, 0, -1, CAST(N'2016-03-27 15:32:01.720' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (312, 0, -1, CAST(N'2016-03-27 15:32:01.900' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (313, 0, -1, CAST(N'2016-03-27 15:32:02.027' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (314, 0, -1, CAST(N'2016-03-27 15:33:39.440' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (315, 0, 1051, CAST(N'2016-03-27 15:35:40.963' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (316, 0, 0, CAST(N'2016-03-27 18:39:58.973' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (317, 0, 1123, CAST(N'2016-03-27 18:40:36.617' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (318, 0, 0, CAST(N'2016-03-27 18:40:43.833' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (319, 0, 1124, CAST(N'2016-03-27 18:41:53.877' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (320, 0, 0, CAST(N'2016-03-27 18:42:00.463' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (321, 0, 1125, CAST(N'2016-03-27 18:42:36.913' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (322, 0, 0, CAST(N'2016-03-27 18:42:42.093' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (323, 0, 1126, CAST(N'2016-03-27 18:43:19.697' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (324, 0, 0, CAST(N'2016-03-27 18:43:35.830' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (325, 0, 1127, CAST(N'2016-03-27 18:44:09.430' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (326, 0, 1127, CAST(N'2016-03-27 18:46:49.960' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (327, 0, 0, CAST(N'2016-03-27 18:46:55.077' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (328, 0, 1128, CAST(N'2016-03-27 18:47:36.077' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (329, 0, 0, CAST(N'2016-03-27 18:47:45.790' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (330, 0, 1129, CAST(N'2016-03-27 18:48:09.437' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (331, 0, 0, CAST(N'2016-03-27 18:48:15.147' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (332, 0, 1130, CAST(N'2016-03-27 18:48:46.737' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (333, 0, 0, CAST(N'2016-03-27 18:48:54.317' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (334, 0, 1131, CAST(N'2016-03-27 18:49:41.990' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (335, 0, -1, CAST(N'2016-03-29 10:49:06.707' AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (336, 0, 0, CAST(N'2016-03-30 08:53:58.670' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (337, 0, 1132, CAST(N'2016-03-30 09:03:05.760' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (338, 0, 0, CAST(N'2016-03-30 09:03:30.513' AS DateTime), N'New', N'Media ''bobcat-300x224.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (339, 0, 1133, CAST(N'2016-03-30 09:03:30.753' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (340, 0, 0, CAST(N'2016-03-30 09:03:32.593' AS DateTime), N'New', N'Media ''28982_1_xl.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (341, 0, 1134, CAST(N'2016-03-30 09:03:32.630' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (342, 0, 0, CAST(N'2016-03-30 09:03:34.353' AS DateTime), N'New', N'Media ''dsc00813_jpg-for-web-normal.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (343, 0, 1135, CAST(N'2016-03-30 09:03:34.380' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (344, 0, 0, CAST(N'2016-03-30 09:03:36.437' AS DateTime), N'New', N'Media ''IMG_8280.JPG'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (345, 0, 1136, CAST(N'2016-03-30 09:03:36.527' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (346, 0, 0, CAST(N'2016-03-30 09:03:39.177' AS DateTime), N'New', N'Media ''Brugte-maskiner_Lamborghini-traktor.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (347, 0, 1137, CAST(N'2016-03-30 09:03:39.290' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (348, 0, 1115, CAST(N'2016-03-30 09:03:42.970' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (349, 0, 1132, CAST(N'2016-03-30 09:17:19.997' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (350, 0, 1122, CAST(N'2016-03-30 09:31:20.487' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (351, 0, 1114, CAST(N'2016-03-30 09:31:57.543' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (352, 0, 1114, CAST(N'2016-03-30 09:32:07.700' AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (353, 0, 1114, CAST(N'2016-03-30 09:32:10.887' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (354, 0, 0, CAST(N'2016-03-30 09:42:44.313' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1350, 0, 0, CAST(N'2016-03-30 10:55:58.663' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1351, 0, 0, CAST(N'2016-03-30 10:56:11.373' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1352, 0, 1138, CAST(N'2016-03-30 10:57:05.040' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1353, 0, 0, CAST(N'2016-03-30 10:57:08.363' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1354, 0, 1139, CAST(N'2016-03-30 10:57:52.293' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1355, 0, 0, CAST(N'2016-03-30 11:20:48.073' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1356, 0, 1140, CAST(N'2016-03-30 11:28:07.957' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1357, 0, 1141, CAST(N'2016-03-30 11:37:33.923' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1358, 0, 1142, CAST(N'2016-03-30 11:38:19.370' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1359, 0, 1143, CAST(N'2016-03-30 11:38:23.577' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1360, 0, 1141, CAST(N'2016-03-30 11:38:31.960' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1361, 0, 1141, CAST(N'2016-03-30 11:38:39.280' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1362, 0, 1143, CAST(N'2016-03-30 11:38:55.170' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1363, 0, 1141, CAST(N'2016-03-30 11:39:01.640' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1364, 0, 0, CAST(N'2016-03-30 11:39:16.743' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1365, 0, 1144, CAST(N'2016-03-30 11:39:22.527' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1366, 0, 0, CAST(N'2016-03-30 11:39:28.663' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1367, 0, 1145, CAST(N'2016-03-30 11:40:47.680' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1368, 0, 1145, CAST(N'2016-03-30 11:40:56.393' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1369, 0, 1145, CAST(N'2016-03-30 11:41:02.210' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1370, 0, 0, CAST(N'2016-03-30 11:41:11.273' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1371, 0, 1146, CAST(N'2016-03-30 11:41:43.970' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1372, 0, 1146, CAST(N'2016-03-30 11:42:04.863' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1373, 0, 0, CAST(N'2016-03-30 11:42:18.463' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1374, 0, 1147, CAST(N'2016-03-30 11:42:35.693' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1375, 0, 1147, CAST(N'2016-03-30 11:42:43.917' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1376, 0, -1, CAST(N'2016-03-30 11:43:32.350' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1377, 0, -1, CAST(N'2016-03-30 11:43:33.787' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1378, 0, 1051, CAST(N'2016-03-30 11:44:01.057' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1379, 0, -1, CAST(N'2016-03-30 11:45:10.380' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1380, 0, -1, CAST(N'2016-03-30 11:45:20.847' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1381, 0, -1, CAST(N'2016-03-30 11:45:34.647' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1382, 0, -1, CAST(N'2016-03-30 11:45:34.650' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1383, 0, -1, CAST(N'2016-03-30 11:46:21.293' AS DateTime), N'Save', N'Save PartialViewMacro performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1384, 0, 1051, CAST(N'2016-03-30 11:46:43.130' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1385, 0, 0, CAST(N'2016-03-30 11:49:19.467' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1386, 0, 1148, CAST(N'2016-03-30 11:50:03.003' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1387, 0, 0, CAST(N'2016-03-30 11:50:07.107' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1388, 0, 1149, CAST(N'2016-03-30 11:50:45.190' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1389, 0, 0, CAST(N'2016-03-30 12:06:15.357' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1390, 0, 1150, CAST(N'2016-03-30 12:07:13.340' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1391, 0, 0, CAST(N'2016-03-30 12:07:16.340' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1392, 0, 1151, CAST(N'2016-03-30 12:07:56.310' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1393, 0, 0, CAST(N'2016-03-30 12:08:00.187' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1394, 0, 1152, CAST(N'2016-03-30 12:08:27.330' AS DateTime), N'Publish', N'Save and Publish performed by user')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1395, 0, 0, CAST(N'2016-03-30 12:08:40.467' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1396, 0, 1153, CAST(N'2016-03-30 12:08:57.823' AS DateTime), N'Publish', N'Save and Publish performed by user')
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
SET IDENTITY_INSERT [dbo].[umbracoMigration] ON 

INSERT [dbo].[umbracoMigration] ([id], [name], [createDate], [version]) VALUES (1, N'Umbraco', CAST(N'2016-03-21 18:27:34.780' AS DateTime), N'7.4.2')
SET IDENTITY_INSERT [dbo].[umbracoMigration] OFF
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-97, 0, -1, 0, 1, N'-1,-97', 2, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-96, 0, -1, 0, 1, N'-1,-96', 2, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-95, 0, -1, 0, 1, N'-1,-95', 2, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-92, 0, -1, 0, 1, N'-1,-92', 35, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', N'Label', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.370' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-90, 0, -1, 0, 1, N'-1,-90', 34, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.370' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-89, 0, -1, 0, 1, N'-1,-89', 33, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.370' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-88, 0, -1, 0, 1, N'-1,-88', 32, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.370' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-87, 0, -1, 0, 1, N'-1,-87', 4, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-51, 0, -1, 0, 1, N'-1,-51', 2, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-49, 0, -1, 0, 1, N'-1,-49', 2, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-43, 0, -1, 0, 1, N'-1,-43', 2, N'fbaf13a8-4036-41f2-93a3-974f678c312a', N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-42, 0, -1, 0, 1, N'-1,-42', 2, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-41, 0, -1, 0, 1, N'-1,-41', 2, N'5046194e-4237-453c-a547-15db3a07c4e1', N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-40, 0, -1, 0, 1, N'-1,-40', 2, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-39, 0, -1, 0, 1, N'-1,-39', 2, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-37, 0, -1, 0, 1, N'-1,-37', 2, N'0225af17-b302-49cb-9176-b9f35cab9c17', N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-36, 0, -1, 0, 1, N'-1,-36', 2, N'e4d66c0f-b935-4200-81f0-025f7256b89a', N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-21, 0, -1, 0, 0, N'-1,-21', 0, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(N'2016-03-21 18:27:34.370' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-20, 0, -1, 0, 0, N'-1,-20', 0, N'0f582a79-1e41-4cf0-bfa0-76340651891a', N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(N'2016-03-21 18:27:34.370' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-1, 0, -1, 0, 0, N'-1', 0, N'916724a5-173d-4619-b97e-b9de133dd6f5', N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(N'2016-03-21 18:27:34.357' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1031, 0, -1, 0, 1, N'-1,1031', 2, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1032, 0, -1, 0, 1, N'-1,1032', 2, N'cc07b313-0843-4aa8-bbda-871c8da728c8', N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1033, 0, -1, 0, 1, N'-1,1033', 2, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1034, 0, -1, 0, 1, N'-1,1034', 2, N'a6857c73-d6e9-480c-b6e6-f15f6ad11125', N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1035, 0, -1, 0, 1, N'-1,1035', 2, N'93929b9a-93a2-4e2a-b239-d99334440a59', N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1036, 0, -1, 0, 1, N'-1,1036', 2, N'2b24165f-9782-4aa3-b459-1de4a4d21f60', N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1040, 0, -1, 0, 1, N'-1,1040', 2, N'21e798da-e06e-4eda-a511-ed257f78d4fa', N'Related Links', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1041, 0, -1, 0, 1, N'-1,1041', 2, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1043, 0, -1, 0, 1, N'-1,1043', 2, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.377' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1044, 0, -1, 0, 1, N'-1,1044', 0, N'd59be02f-1df9-4228-aa1e-01917d806cda', N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(N'2016-03-21 18:27:34.377' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1045, 0, -1, 0, 1, N'-1,1045', 2, N'7e3962cc-ce20-4ffc-b661-5897a894ba7e', N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-21 18:27:34.377' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1047, 0, -1, 0, 1, N'-1,1047', 24, N'8389f5e8-0547-41b5-ba55-da5cf69b5104', N'Home - Header - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-23 12:33:04.487' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1048, 0, 1051, NULL, 1, N'-1,1051,1048', 0, N'0bf8515f-e638-45c7-8b63-1e5065e50bf7', N'Home', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-03-23 12:33:46.600' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1049, 0, -1, 0, 1, N'-1,1049', 31, N'a13ec84c-cbe1-4641-95be-f0683fc8d36c', N'Home', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-23 12:33:46.653' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1050, 0, -1, 0, 1, N'-1,1050', 0, N'928e3d11-a505-4f45-99c9-69143333d1a9', N'Forside', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-23 12:37:47.373' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1051, 0, -1, NULL, 1, N'-1,1051', 0, N'41c16a18-493b-4ec5-bb42-c70b528958e7', N'layout', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-03-23 12:45:44.797' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1055, 0, -1, 0, 1, N'-1,1055', 0, N'44c32224-346a-4332-a23c-f569ec6ea16b', N'Sponsors', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:27.690' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1056, 1, -21, 0, 1, N'-1,-21,1056', 1, N'9d6c5158-bb9f-4d45-b717-d32f72628810', N'katalogstudent023.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:51.583' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1057, 0, 1055, 0, 2, N'-1,1055,1057', 1, N'3b8d9d11-31e4-4d4f-bd99-36bd986c4fbb', N'mask_badboy.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:51.730' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1058, 0, 1055, 0, 2, N'-1,1055,1058', 2, N'785f4bad-860a-48d1-9d77-cbc6bec951c2', N'mask_clubcar.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:51.840' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1059, 0, 1055, 0, 2, N'-1,1055,1059', 3, N'23fc334f-8255-4661-a109-94e960aa549a', N'mask_iseki.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:51.950' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1060, 0, 1055, 0, 2, N'-1,1055,1060', 4, N'7b3f8180-ce93-4208-996b-94258be2a97b', N'mask_ventrac.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:52.067' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1061, 0, 1055, 0, 2, N'-1,1055,1061', 5, N'213349c4-6023-4f98-bc0d-264ec38d3d33', N'mask_vitra.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:52.173' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1062, 0, 1055, 0, 2, N'-1,1055,1062', 6, N'a83c49f8-f430-4dae-8f15-3ab63254499a', N'stiga.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:52.297' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1063, 0, 1055, 0, 2, N'-1,1055,1063', 7, N'caa65212-cd52-4710-902e-48d78da60c33', N'stiga_0.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:52.387' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1064, 0, 1055, 0, 2, N'-1,1055,1064', 8, N'b679f970-3d61-4189-91a5-e3661918a5ff', N'stihl_logo.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:52.490' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1065, 0, 1055, 0, 2, N'-1,1055,1065', 9, N'3b852a4a-e053-40de-9962-f820aa9348cb', N'viking.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:52.540' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1066, 1, -21, 0, 1, N'-1,-21,1066', 2, N'9c662365-231e-4d60-87a5-b8ea4a636c59', N'bfcd0cbc730e20fa26d794cbffd22128.JPG', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:52.613' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1067, 1, -21, 0, 1, N'-1,-21,1067', 3, N'56075aff-7ec1-48a0-acb2-a93192d50645', N'gravemaskine.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:31:52.683' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1068, 0, -1, 0, 1, N'-1,1068', 1, N'c691f6d6-0508-44fe-86a0-77e228f4c720', N'Images', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:43:58.670' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1069, 0, 1068, 0, 2, N'-1,1068,1069', 0, N'410c50b7-ddba-4096-abcd-593939846bef', N'maskinlogo.gif', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:44:02.917' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1070, 0, 1068, 0, 2, N'-1,1068,1070', 1, N'2bef80fe-85f5-4da4-9567-2707c5ba6fa3', N'maskinlogosmall.gif', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-23 14:51:48.880' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1071, 0, -1, 0, 1, N'-1,1071', 25, N'd24b80e2-daed-402e-aa69-ae734566e4ed', N'TextPage - Header - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 11:42:38.720' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1073, 0, -1, 0, 1, N'-1,1073', 24, N'4b2441a4-8df8-40a9-ae15-11e2e9f151f5', N'TextPage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-24 11:42:54.980' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1075, 0, -1, 0, 1, N'-1,1075', 26, N'470017fe-d7a1-4af8-ad4e-c3fa05587b42', N'Home - Company name - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 11:50:11.733' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1076, 0, -1, 0, 1, N'-1,1076', 27, N'7bbb00f5-044c-45c4-a786-22131c3cb17c', N'Home - Address - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 11:50:34.840' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1077, 0, -1, 0, 1, N'-1,1077', 28, N'3febed35-f742-4a02-b96a-75630c1a751a', N'Home - Phone number - Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 11:51:25.400' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1078, 0, -1, 0, 1, N'-1,1078', 29, N'b2baa965-6378-4364-a72c-a4828688895c', N'Home - E-mail - Email address', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 11:51:46.620' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1079, 0, -1, 0, 1, N'-1,1079', 30, N'927beb67-94e9-443f-bfae-a13cca233b18', N'Home - City - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 11:53:56.623' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1080, 0, 1050, 0, 2, N'-1,1050,1080', 1, N'b5fac220-2ca6-4598-bf21-b73592bc394d', N'Lejebetingelser', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-24 12:01:19.047' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1081, 0, 1051, NULL, 1, N'-1,1051,1081', 0, N'150a11cf-8e1b-4267-b0ef-19dd7ea0fa8e', N'TextPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-03-24 12:02:25.727' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1082, 0, 1051, NULL, 1, N'-1,1051,1082', 0, N'12635d9b-cb76-48d0-b326-0ab07ae7662f', N'Contact', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-03-24 12:13:40.407' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1083, 0, -1, 0, 1, N'-1,1083', 23, N'2cb10cd2-1a09-432a-9b53-997228a1c323', N'Contact', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-24 12:13:40.420' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1084, 0, -1, 0, 1, N'-1,1084', 31, N'10ddfba5-f51c-4a2e-928b-8d8aa6d323db', N'Contact - Google maps url - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 12:14:24.097' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1085, 0, 1050, 0, 2, N'-1,1050,1085', 4, N'72162d3f-70db-45ab-83c2-be1c28ce544b', N'Kontakt', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-24 12:15:23.010' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1086, 0, -1, 0, 1, N'-1,1086', 32, N'e53fab3f-2e76-48f3-9ad8-d29a4f0390d2', N'Contact - Header - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 12:24:32.207' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1087, 0, 1050, 0, 2, N'-1,1050,1087', 2, N'4bd29351-2bc8-4d10-b5a9-f1531cc486d0', N'Værksted', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-24 12:34:48.790' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1088, 0, -1, 0, 1, N'-1,1088', 21, N'ed891510-8a25-4925-827f-086dd586957c', N'Sortiment folder', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-24 12:39:46.253' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1089, 0, 1088, 0, 2, N'-1,1088,1089', 8, N'af063f6e-7317-48a7-b45d-e12304d83d48', N'Sortiment', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-24 12:39:58.390' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1090, 0, -1, 0, 1, N'-1,1090', 33, N'8f309472-7028-4f2f-9f22-2254f11224d8', N'Sortiment - Varenummer - Decimal', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 12:41:00.757' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1091, 0, -1, 0, 1, N'-1,1091', 34, N'd67be858-2307-4c17-abc4-6f78ccd8ed7c', N'Sortiment - Dropdown list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 12:42:36.463' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1092, 0, -1, 0, 1, N'-1,1092', 35, N'ef8c5478-c662-4605-8fc3-c02ce10ae03e', N'Sortiment - Description - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 12:43:15.080' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1093, 0, -1, 0, 1, N'-1,1093', 36, N'b1205514-43b8-45ae-a9ad-2f65988403fd', N'Sortiment - Rentday - Decimal', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 12:44:58.083' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1094, 0, -1, 0, 1, N'-1,1094', 37, N'839e60b8-c735-4b0a-89cd-dbf5397b3620', N'Sortiment - Price - Decimal', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 12:45:15.267' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1095, 0, -1, 0, 1, N'-1,1095', 1, N'994f03f9-edca-4cac-9f76-1aa7ff742ee8', N'Sortiment mappe', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-24 12:45:42.690' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1096, 0, 1095, 0, 2, N'-1,1095,1096', 0, N'61d49829-f8ba-4a32-83ff-8e1d5f1b5ce5', N'Muldjord', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-24 12:47:19.513' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1097, 0, -1, 0, 1, N'-1,1097', 38, N'b24f9d5f-0e2f-4997-80af-2d09e1cf3b98', N'Sortiment - Force - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 12:48:03.933' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1098, 0, 1051, NULL, 1, N'-1,1051,1098', 0, N'ab464382-bebc-440e-b636-351bc5c2b506', N'SortimentPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-03-24 12:54:38.493' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1099, 0, -1, 0, 1, N'-1,1099', 4, N'd306e675-7c6b-4175-bf4b-1c2ff7a577fe', N'SortimentPage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-24 12:54:38.513' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1100, 0, 1050, 0, 2, N'-1,1050,1100', 3, N'5446a1d6-d9b8-4a3c-a79c-90053c1608b6', N'Sortiment', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-24 12:55:06.063' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1101, 0, -1, 0, 1, N'-1,1101', 39, N'2bc826b6-f3a6-4e85-a538-21b1f15f9663', N'Sortiment - Part no. - Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 13:06:50.203' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1102, 0, 1095, 0, 2, N'-1,1095,1102', 1, N'1429eced-fca7-410b-9e84-5629712bf857', N'Champignonmuld', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-24 13:16:29.573' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1103, 0, -1, 0, 1, N'-1,1103', 40, N'9e9b04b9-e4b4-45e2-a8fe-4837e5227eca', N'Cart - Paygate - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-24 13:47:52.603' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1104, 0, 1051, NULL, 1, N'-1,1051,1104', 0, N'73d69745-9344-44cc-97a1-6765cf7152dd', N'Cart', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-03-24 13:47:54.317' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1105, 0, -1, 0, 1, N'-1,1105', 27, N'ff0f7bee-5f61-4edd-a24b-50db5d353cdc', N'Cart', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-24 13:47:54.370' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1106, 0, -1, 0, 1, N'-1,1106', 2, N'27c88e62-7dfd-4f0c-98ab-4778d6d69732', N'Cart', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-24 13:48:22.967' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1107, 0, -1, 0, 1, N'-1,1107', 41, N'7a3ac299-db97-4028-84e2-931b2235a545', N'Home - Catalog pdf - File upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-25 13:44:27.033' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1108, 0, -1, 0, 1, N'-1,1108', 30, N'12b9ea5c-f790-4968-b0b9-95afefc51603', N'Used machines folder', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-25 13:52:58.180' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1109, 0, -1, 0, 1, N'-1,1109', 42, N'df30378e-b705-4149-8002-120cf1726154', N'Used machines - Machine name - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-25 13:53:43.453' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1110, 0, -1, 0, 1, N'-1,1110', 43, N'577411ee-d379-46a8-be5a-5160d0fa523a', N'Used machines - Price - Decimal', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-25 13:54:38.590' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1111, 0, -1, 0, 1, N'-1,1111', 44, N'4eea750d-7f96-4e19-9d3e-e9963d262e10', N'Used machines - Name - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-25 13:55:04.483' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1112, 0, 1108, 0, 2, N'-1,1108,1112', 5, N'dd64eec5-55ae-4e37-9e3b-80c590185a18', N'Used machines', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-25 13:56:06.873' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1113, 0, -1, 0, 1, N'-1,1113', 3, N'd05b8e05-d37c-4bd5-ac3d-bcbd3692e2d6', N'Maskine mappe', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-25 13:57:16.210' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1114, 0, 1113, 0, 2, N'-1,1113,1114', 0, N'71023f1e-5fcb-48ab-b8c5-bfb0c70613ed', N'Maskine 1', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-25 13:57:56.357' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1115, 0, -1, 0, 1, N'-1,1115', 2, N'ccd69868-9816-4325-8ce0-cabd96506f8c', N'Maskiner', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-25 13:58:09.310' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1116, 0, 1115, 0, 2, N'-1,1115,1116', 0, N'f7b5e680-66d9-419a-bcf3-21ea0501d86c', N'bfcd0cbc730e20fa26d794cbffd22128.JPG', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-25 13:58:22.527' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1117, 0, 1115, 0, 2, N'-1,1115,1117', 1, N'8b17d88c-fc15-43a8-a873-8230629a5616', N'gravemaskine.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-25 13:58:22.603' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1118, 0, 1051, NULL, 1, N'-1,1051,1118', 0, N'364f5568-d898-4165-929e-728e9cec3643', N'MachinePage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-03-25 13:59:51.090' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1119, 0, -1, 0, 1, N'-1,1119', 32, N'ab3b8331-ae50-4b8b-81a5-6f9185ee2cbc', N'MachinePage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-25 13:59:51.117' AS DateTime))
GO
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1120, 0, 1050, 0, 2, N'-1,1050,1120', 0, N'ca29b84a-a62e-484b-b659-28eac61fbaeb', N'Brugte maskiner', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-25 14:01:08.337' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1121, 0, -1, 0, 1, N'-1,1121', 45, N'73e79ec7-6b5d-4cb4-b02d-d273feaf33ad', N'Used machines - Description - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-26 23:19:16.343' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1122, 0, 1113, 0, 2, N'-1,1113,1122', 1, N'89daa37f-2e77-4653-93d0-368b9b8e2516', N'Maskine 2', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-26 23:41:26.243' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1123, 0, 1095, 0, 2, N'-1,1095,1123', 2, N'053121a3-befc-4185-9717-88a78c911810', N'Lift', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-27 18:40:36.410' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1124, 0, 1095, 0, 2, N'-1,1095,1124', 3, N'271f8f43-5348-41b7-b45a-1064112fe0d9', N'Lift (1)', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-27 18:41:53.847' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1125, 0, 1095, 0, 2, N'-1,1095,1125', 4, N'7ba41ee4-7fdb-4a21-9699-c0eccb588dc1', N'Betonhammer', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-27 18:42:36.887' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1126, 0, 1095, 0, 2, N'-1,1095,1126', 5, N'2e80696a-de94-44ed-9cda-064f1bd0d9ec', N'Bygningshammer', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-27 18:43:19.673' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1127, 0, 1095, 0, 2, N'-1,1095,1127', 6, N'c1c200b5-e3bb-44d4-9f9a-4884ad6c3216', N'Borehammer', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-27 18:44:09.400' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1128, 0, 1095, 0, 2, N'-1,1095,1128', 7, N'13cc1400-51e7-4268-97c8-d98e7d400234', N'Stillads', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-27 18:47:36.050' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1129, 0, 1095, 0, 2, N'-1,1095,1129', 8, N'd449c278-6963-4c18-849a-9666572fa93c', N'Borekrone', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-27 18:48:09.413' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1130, 0, 1095, 0, 2, N'-1,1095,1130', 9, N'b5684efa-64b7-43b2-b805-81cb76adba0f', N'Håndbetonsliber', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-27 18:48:46.713' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1131, 0, 1095, 0, 2, N'-1,1095,1131', 10, N'0a0c5ace-a4e0-48cb-84e5-643bbb0eda6d', N'Asfalt- og betonskæremaskine', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-27 18:49:41.960' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1132, 0, 1113, 0, 2, N'-1,1113,1132', 2, N'6b41b7f2-daaf-48a7-b3dd-c59c1590c652', N'Machine 3', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 09:03:05.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1133, 0, 1115, 0, 2, N'-1,1115,1133', 2, N'a4cf8d80-8df8-4389-a782-b5690bf0be37', N'bobcat-300x224.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-30 09:03:30.687' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1134, 0, 1115, 0, 2, N'-1,1115,1134', 3, N'948ad02e-ffdf-4f26-b1ef-e680cfb5c441', N'28982_1_xl.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-30 09:03:32.613' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1135, 0, 1115, 0, 2, N'-1,1115,1135', 4, N'18af6d05-21fe-4853-b024-339afff861e4', N'dsc00813_jpg-for-web-normal.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-30 09:03:34.367' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1136, 0, 1115, 0, 2, N'-1,1115,1136', 5, N'587c10c1-389a-4888-960e-5b3ea1c80fe5', N'IMG_8280.JPG', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-30 09:03:36.497' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1137, 0, 1115, 0, 2, N'-1,1115,1137', 6, N'3cf0c886-949e-4ad8-a3b3-dbf31aafdd58', N'Brugte-maskiner_Lamborghini-traktor.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-03-30 09:03:39.270' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1138, 0, 1113, 0, 2, N'-1,1113,1138', 3, N'7a449133-23f0-4607-af43-121012c998db', N'Maskine 4', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 10:57:04.130' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1139, 0, 1113, 0, 2, N'-1,1113,1139', 4, N'b598c32c-c533-4db6-ba9f-35a62dc57b7e', N'Maskine 5', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 10:57:52.253' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1140, 0, 1113, 0, 2, N'-1,1113,1140', 5, N'764d09aa-9ab8-411b-8a1c-c7b68b9e6544', N'Maskine 6', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 11:28:07.913' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1141, 0, -1, 0, 1, N'-1,1141', 35, N'220233ca-45e2-4b71-be7f-b718200974ad', N'Sponsor folder', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-30 11:37:33.790' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1142, 0, -1, 0, 1, N'-1,1142', 46, N'533c9cda-faed-4316-8788-12b2a7123929', N'Sponsor - Link - Related links', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-03-30 11:38:19.343' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1143, 0, 1141, 0, 2, N'-1,1141,1143', 1, N'd612e683-a607-4d69-a080-08b06245db1c', N'Sponsor', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-03-30 11:38:23.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1144, 0, -1, 0, 1, N'-1,1144', 4, N'759d7f67-c7f5-4262-aabe-7141aaef3178', N'Sponsors', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 11:39:22.507' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1145, 0, 1144, 0, 2, N'-1,1144,1145', 0, N'0a210c42-b276-463d-a4a7-fb4999777dfb', N'Bad boy', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 11:40:47.660' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1146, 0, 1144, 0, 2, N'-1,1144,1146', 1, N'fd10f86f-1508-4cf6-8740-c5f62e4b0f0e', N'Stiga', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 11:41:43.947' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1147, 0, 1144, 0, 2, N'-1,1144,1147', 2, N'3006ffa7-0625-451d-baa7-19fdd15e607b', N'Stihl', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 11:42:35.667' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1148, 0, 1144, 0, 2, N'-1,1144,1148', 3, N'6f241c3b-1f14-4a23-818f-ec320e87f5d4', N'Viking', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 11:50:02.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1149, 0, 1144, 0, 2, N'-1,1144,1149', 4, N'bb10057c-0714-41b7-9d91-a02f7aca00d2', N'Club car', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 11:50:45.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1150, 0, 1144, 0, 2, N'-1,1144,1150', 5, N'a5ba6dc4-c9a0-48c5-b973-d8a8edb75433', N'ISEKI', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 12:07:13.193' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1151, 0, 1144, 0, 2, N'-1,1144,1151', 6, N'715f506d-4ea3-4d7a-a181-8b90aa06e295', N'Ventrac', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 12:07:56.253' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1152, 0, 1144, 0, 2, N'-1,1144,1152', 7, N'6f066018-a7e0-46f4-9668-3b1dd8703eb7', N'Vitra', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 12:08:27.310' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1153, 0, 1144, 0, 2, N'-1,1144,1153', 8, N'02951e04-1caf-4be8-be28-366aa374ade0', N'Stiga shoppen', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-03-30 12:08:57.807' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://dev.maskinudlejning:80/umbraco', N'DESKTOP-SLIIGBF//LM/W3SVC/2/ROOT', CAST(N'2016-03-21 18:27:55.670' AS DateTime), CAST(N'2016-03-29 09:06:23.380' AS DateTime), 0, 0)
INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (2, N'http://dev.maskinudlejning:80/umbraco', N'DESKTOP-RKIPENR//LM/W3SVC/3/ROOT', CAST(N'2016-03-29 09:29:23.163' AS DateTime), CAST(N'2016-03-30 12:53:16.190' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userType], [startStructureID], [startMediaID], [userName], [userLogin], [userPassword], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate]) VALUES (0, 0, 0, 1, -1, -1, N'Cthian', N'bbr1993@live.dk', N'IISYit2QBHS5DR0uma4hkveWKjk=', N'bbr1993@live.dk', N'en-GB', N'f8dd3cfc-6b4b-4a3a-ae0c-f67002db47c1', 0, NULL, CAST(N'2016-03-21 18:27:35.450' AS DateTime), CAST(N'2016-03-30 12:28:03.827' AS DateTime))
INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userType], [startStructureID], [startMediaID], [userName], [userLogin], [userPassword], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate]) VALUES (1, 0, 0, 1, -1, -1, N'Videndjurs', N'Videndjurs', N'eIi7uJMF0xXt+j20Kuv3wavJnho=', N'info@thomasboeriis.dk', N'en', N'ab2c7f08-71df-4a9d-9fe4-e29b85f20e1a', 0, NULL, CAST(N'2016-03-30 12:29:13.783' AS DateTime), CAST(N'2016-03-30 12:28:42.567' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'content')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'developer')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'forms')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'media')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'member')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'settings')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'users')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (1, N'content')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (1, N'developer')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (1, N'forms')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (1, N'media')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (1, N'member')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (1, N'settings')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (1, N'translation')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (1, N'users')
SET IDENTITY_INSERT [dbo].[umbracoUserType] ON 

INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (2, N'writer', N'Writer', N'CAH:F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (4, N'translator', N'Translator', N'AF')
SET IDENTITY_INSERT [dbo].[umbracoUserType] OFF
/****** Object:  Index [IX_cmsContent]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContent] ON [dbo].[cmsContent]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentType]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsContentType_icon]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType]
(
	[icon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentVersion_ContentId]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentVersion_ContentId] ON [dbo].[cmsContentVersion]
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentVersion_VersionId]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentVersion_VersionId] ON [dbo].[cmsContentVersion]
(
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDataType_nodeId]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDataType_nodeId] ON [dbo].[cmsDataType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDictionary_id]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDocument] ON [dbo].[cmsDocument]
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument_newest]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDocument_newest] ON [dbo].[cmsDocument]
(
	[newest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument_published]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDocument_published] ON [dbo].[cmsDocument]
(
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMacroPropertyAlias]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro]
(
	[macroAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMacroProperty_Alias]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty]
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData] ON [dbo].[cmsPropertyData]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_1]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_1] ON [dbo].[cmsPropertyData]
(
	[contentNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_2]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_2] ON [dbo].[cmsPropertyData]
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_3]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_3] ON [dbo].[cmsPropertyData]
(
	[propertytypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeUniqueID]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeUniqueID] ON [dbo].[cmsPropertyType]
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeGroupUniqueID]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [dbo].[cmsPropertyTypeGroup]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsTags]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags]
(
	[tag] ASC,
	[group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsTaskType_alias]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTaskType_alias] ON [dbo].[cmsTaskType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTemplate_nodeId]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoAccess_nodeId]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccess_nodeId] ON [dbo].[umbracoAccess]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoAccessRule]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccessRule] ON [dbo].[umbracoAccessRule]
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoDeployChecksum]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoDeployChecksum] ON [dbo].[umbracoDeployChecksum]
(
	[entityType] ASC,
	[entityGuid] ASC,
	[entityPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoLanguage_languageISOCode]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage]
(
	[languageISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLog]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog]
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoMigration]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoMigration] ON [dbo].[umbracoMigration]
(
	[name] ASC,
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeObjectType]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeObjectType] ON [dbo].[umbracoNode]
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeParentId]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeParentId] ON [dbo].[umbracoNode]
(
	[parentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeTrashed]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeTrashed] ON [dbo].[umbracoNode]
(
	[trashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeUniqueID]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoNodeUniqueID] ON [dbo].[umbracoNode]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_computerName]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer]
(
	[computerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoServer_isActive]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer]
(
	[isActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoUser_userLogin]    Script Date: 3/30/2016 12:53:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser]
(
	[userLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_closed]  DEFAULT ('0') FOR [closed]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_cmsContentType_nodeId] FOREIGN KEY([contentType])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId] FOREIGN KEY([ContentId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentVersion] CHECK CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentXml] CHECK CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDataType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDataType] CHECK CONSTRAINT [FK_cmsDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDataTypePreValues]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId] FOREIGN KEY([datatypeNodeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDataTypePreValues] CHECK CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId] FOREIGN KEY([versionId])
REFERENCES [dbo].[cmsContentVersion] ([VersionId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY([propertytypeid])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY([contentNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsStylesheet]  WITH CHECK ADD  CONSTRAINT [FK_cmsStylesheet_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsStylesheet] CHECK CONSTRAINT [FK_cmsStylesheet_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY([ParentId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_cmsTags]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY([taskTypeId])
REFERENCES [dbo].[cmsTaskType] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_cmsTaskType_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY([parentUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser1]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoDeployDependency]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id1] FOREIGN KEY([sourceId])
REFERENCES [dbo].[umbracoDeployChecksum] ([id])
GO
ALTER TABLE [dbo].[umbracoDeployDependency] CHECK CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id1]
GO
ALTER TABLE [dbo].[umbracoDeployDependency]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id2] FOREIGN KEY([targetId])
REFERENCES [dbo].[umbracoDeployChecksum] ([id])
GO
ALTER TABLE [dbo].[umbracoDeployDependency] CHECK CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id2]
GO
ALTER TABLE [dbo].[umbracoDomains]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomains] CHECK CONSTRAINT [FK_umbracoDomains_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser_umbracoUserType_id] FOREIGN KEY([userType])
REFERENCES [dbo].[umbracoUserType] ([id])
GO
ALTER TABLE [dbo].[umbracoUser] CHECK CONSTRAINT [FK_umbracoUser_umbracoUserType_id]
GO
ALTER TABLE [dbo].[umbracoUser2app]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2app_umbracoUser_id] FOREIGN KEY([user])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2app] CHECK CONSTRAINT [FK_umbracoUser2app_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id]
GO
USE [master]
GO
ALTER DATABASE [maskinudlejningdb] SET  READ_WRITE 
GO
