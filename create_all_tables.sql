CREATE TABLE Bursary(
BursaryID INT IDENTITY(1,1) PRIMARY KEY,
BursaryName VARCHAR(120),
MaximumFundingPerStudent MONEY DEFAULT 125000.00,
ApplicationClosingDate DATE,
YearOfAllocation INT
)
GO


CREATE TABLE Roles( 
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(20)
    )
GO


CREATE TABLE Users(
    UserID INT IDENTITY(1,1) PRIMARY KEY, 
    FirstName VARCHAR(MAX) NOT NULL, 
    LastName VARCHAR(MAX) NOT NULL, 
    Username VARCHAR(50) UNIQUE NOT NULL, 
    Password CHAR(64) NOT NULL, 
    Email VARCHAR(254) NOT NULL, 
    Address VARCHAR(100) NOT NULL, 
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID)
    )
GO

CREATE TABLE BBDAdmins(
	BBDAdminID INT IDENTITY(1,1) PRIMARY KEY,
	UserID INT FOREIGN KEY REFERENCES Users(UserID)
)
GO

CREATE TABLE Institutions (
	InstitutionID INT IDENTITY(1,1) NOT NULL,
    InstitutionName	VARCHAR(120) NOT NULL,	
    Email VARCHAR(120) NOT NULL, 
    InstitutionType VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Institution PRIMARY KEY (InstitutionID)
    )
GO

CREATE TABLE BursaryAllocations(
    BursaryAllocationID INT IDENTITY(1,1) PRIMARY KEY,
    InstitutionID INT FOREIGN KEY REFERENCES Institutions(InstitutionID),
    AllocationAmount MONEY NOT NULL,
    AllocationUsed MONEY NOT NULL DEFAULT 0,
    DateOfAllocation DATE DEFAULT GETDATE()
)
GO

CREATE TABLE InstitutionAdmins (
       InstitutionAdminID INT IDENTITY(1,1) NOT NULL,
       InstitutionID INT NOT NULL,	
       UserID INT NOT NULL,
       DepartmentName VARCHAR(120) NOT NULL,
       Position VARCHAR(100) NOT NULL,
       CONSTRAINT PK_InstitutionAdminID PRIMARY KEY (InstitutionAdminID),
       CONSTRAINT FK_InstitionAdmins_Institutions FOREIGN KEY (InstitutionID) REFERENCES Institutions(InstitutionID),
       CONSTRAINT FK_InstitionAdmins_Users FOREIGN KEY (UserID) REFERENCES Users(UserID)
    )
GO

CREATE TABLE Races (
       RaceID INT IDENTITY(1,1) NOT NULL,
       Race VARCHAR(20) NOT NULL,	
       CONSTRAINT PK_Races PRIMARY KEY (RaceID),
    )
GO

CREATE TABLE Statuses(
    StatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName VARCHAR(10)
)
GO

CREATE TABLE [DocumentTypes] (
    [DocumentTypeID] INT IDENTITY PRIMARY KEY,
    [DocumentType] VARCHAR(20)
    )
GO


CREATE TABLE Students (
       StudentID INT IDENTITY(1,1) NOT NULL,
       FirstName VARCHAR(120) NOT NULL,	
       LastName VARCHAR(120) NOT NULL, 
       DateOfBirth date NOT NULL,
       RaceID INT NOT NULL,
       InstitutionID INT NOT NULL,
       Department VARCHAR(50) NOT NULL,
       CONSTRAINT PK_Students PRIMARY KEY (StudentID),
       CONSTRAINT FK_Students_Race FOREIGN KEY (RaceID) REFERENCES Races(RaceID),
       CONSTRAINT FK_Students_Institution FOREIGN KEY (InstitutionID) REFERENCES Institutions(InstitutionID)
    )
GO

CREATE TABLE [Qualification] (
    [QalificationID] INT IDENTITY PRIMARY KEY,
    [StudentID] INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL,
    [QualificationName] VARCHAR(255) NOT NULL,
    [QualificationType] VARCHAR(255),
    [Description] VARCHAR(255),
    [StartingDate] DATE,
    [EndingDate] DATE,
    [AverageMark] INT,
    [Deapartname] VARCHAR(120)
    );
GO

CREATE TABLE StudentRequests(
    RequestID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    Motivation VARBINARY NOT NULL,
    Amount MONEY NOT NULL,
    StatusID INT FOREIGN KEY REFERENCES Statuses(StatusID),
    DateOfRequestSent DATE NOT NULL,
    DateOfStatusUpdate DATE,
    InstitutionAdminsID INT FOREIGN KEY REFERENCES InstitutionAdmins(InstitutionAdminID),
    InstitutionID INT FOREIGN KEY REFERENCES InstitutionAdmins(InstitutionAdminID),
    BBDAdminID INT FOREIGN KEY REFERENCES BBDAdmins(BBDAdminID)
)
GO

CREATE TABLE [Documents] (
    [DocumentID] INT PRIMARY KEY IDENTITY(1,1),
    [File] VARBINARY(MAX),
    [AverageMark] INT,
    [UploadDate] DATE,
    [RequestID] INT FOREIGN KEY REFERENCES StudentRequests(RequestID),
    [DocumentTypeID] INT FOREIGN KEY REFERENCES DocumentTypes(DocumentTypeID)
  )
GO
