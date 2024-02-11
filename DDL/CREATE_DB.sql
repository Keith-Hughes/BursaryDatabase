
CREATE DATABASE BURSARYDATABASE
GO
USE BURSARYDATABASE
GO

CREATE TABLE [dbo].[Roles] (
    [RoleID]   INT          IDENTITY (1, 1) NOT NULL,
    [RoleName] VARCHAR (20) NULL
);


CREATE TABLE [dbo].[Users] (
    [UserID]    INT           IDENTITY (1, 1) NOT NULL,
    [FirstName] VARCHAR (MAX) NULL,
    [LastName]  VARCHAR (MAX) NULL,
    [Username]  VARCHAR (50)  NULL,
    [Password]  CHAR (64)     NULL,
    [Email]     VARCHAR (254) NULL,
    [Address]   VARCHAR (100) NULL,
    [RoleID]    INT           NULL
);


CREATE TABLE [dbo].[Institutions] (
    [InstitutionID]   INT           IDENTITY (1, 1) NOT NULL,
    [InstitutionName] VARCHAR (120) NOT NULL,
    [Email]           VARCHAR (120) NOT NULL,
    [InstitutionType] VARCHAR (100) NOT NULL
);


CREATE TABLE [dbo].[Races] (
    [RaceID]   INT          IDENTITY (1, 1) NOT NULL,
    [RaceName] VARCHAR (20) NULL
);


CREATE TABLE [dbo].[Students] (
    [StudentID]     INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]     VARCHAR (120) NOT NULL,
    [LastName]      VARCHAR (120) NOT NULL,
    [DateOfBirth]   DATE          NOT NULL,
    [RaceID]        INT           NOT NULL,
    [InstitutionID] INT           NOT NULL,
    [Department]    VARCHAR (50)  NOT NULL
);


CREATE TABLE [dbo].[BursaryAllocations] (
    [BursaryAllocationID] INT   IDENTITY (1, 1) NOT NULL,
    [InstitutionID]       INT   NULL,
    [AllocationAmount]    MONEY NULL,
    [AllocationUsed]      MONEY NULL,
    [DateOfAllocation]    DATE  NULL
);


CREATE TABLE [dbo].[DocumentTypes] (
    [DocumentTypeID] INT          IDENTITY (1, 1) NOT NULL,
    [DocumentType]   VARCHAR (20) NULL
);


CREATE TABLE [dbo].[InstitutionAdmins] (
    [InstitutionAdminID] INT           IDENTITY (1, 1) NOT NULL,
    [InstitutionID]      INT           NOT NULL,
    [UserID]             INT           NOT NULL,
    [DepartmentName]     VARCHAR (120) NOT NULL,
    [Position]           VARCHAR (100) NOT NULL,
    [Email]              VARCHAR (120) NOT NULL,
    [InstitutionType]    VARCHAR (100) NOT NULL
);


CREATE TABLE [dbo].[Statuses] (
    [StatusID]   INT          IDENTITY (1, 1) NOT NULL,
    [StatusName] VARCHAR (20) NULL
);


CREATE TABLE [dbo].[BBDAdmins] (
    [BBDAdminID] INT IDENTITY(1, 1) NOT NULL,
    [UserID]     INT NULL
);


CREATE TABLE [dbo].[StudentRequests] (
    [RequestID]           INT           NOT NULL IDENTITY(1,1),
    [StudentID]           INT           NULL,
    [Motivation]          VARCHAR (255) NOT NULL,
    [Amount]              MONEY         NOT NULL,
    [StatusID]            INT           NULL,
    [DateOfRequestSent]   DATE          NOT NULL,
    [DateOfStatusUpdate]  DATE          NULL,
    [InstitutionAdminsID] INT           NULL,
    [BBDAdminID]          INT           NULL
);


CREATE TABLE [dbo].[Qualifications] (
    [QalificationID]    INT           IDENTITY (1, 1) NOT NULL,
    [StudentID]         INT           NULL,
    [QualificationName] VARCHAR (255) NULL,
    [QualificationType] VARCHAR (255) NULL,
    [Description]       VARCHAR (255) NULL,
    [StartingDate]      DATE          NULL,
    [EndingDate]        DATE          NULL,
    [AverageMark]       INT           NULL,
    [Deapartname]       VARCHAR (120) NULL
);



CREATE TABLE [Bursary] (
  [BursaryID] INT PRIMARY KEY IDENTITY(1,1),
  [BursaryName] VARCHAR(120),
  [Description] VARCHAR(255),
  [MaximumFundingPerStudent] MONEY,
  [AppliationClosingdate] DATE,
  [YearOfAlllocation] INT,
  
);

