USE [QLDoAn]
GO
/****** Object:  Table [dbo].[Lock]    Script Date: 6/2/2021 9:53:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lock](
	[Year] [int] NOT NULL,
	[AddStudent] [bit] NULL,
	[AddTeacher1] [bit] NULL,
	[AddProject] [bit] NULL,
	[Mark1] [bit] NULL,
	[AddTeacher2] [bit] NULL,
	[Mark2] [bit] NULL,
	[ToCMT] [bit] NULL,
	[Mark3] [bit] NULL,
 CONSTRAINT [PK_Lock] PRIMARY KEY CLUSTERED 
(
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Lock] ([Year], [AddStudent], [AddTeacher1], [AddProject], [Mark1], [AddTeacher2], [Mark2], [ToCMT], [Mark3]) VALUES (2021, 1, 1, 1, 1, 1, 1, 1, 0)
