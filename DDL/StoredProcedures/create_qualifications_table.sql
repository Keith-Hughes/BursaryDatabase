   
CREATE PROCEDURE [createQualificationsTable]
AS
   
    CREATE TABLE [Qualification] (
    [QalificationID] INT IDENTITY PRIMARY KEY,
    [StudentID] INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL,
    [QualificationName] VARCHAR(255),
    [QualificationType] VARCHAR(255),
    [Description] VARCHAR(255),
    [StartingDate] DATE,
    [EndingDate] DATE,
    [AverageMark] INT,
    [Deapartname] VARCHAR(120)
    );
GO
