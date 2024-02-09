
 CREATE PROCEDURE [createDocumentstTable]      
AS
    CREATE TABLE [DocumentTypes] (
    [DocumentTypeID] INT IDENTITY PRIMARY KEY,
    [DocumentType] VARCHAR(20)
    );


    CREATE TABLE [Documents] (
    [DocumentID] INT PRIMARY IDENTITY,
    [File] BINARY(MAX),
    [AverageMark] INT,
    [Year] DATE,
    [RequestID] INT FOREIGN KEY REFERENCES(StudentRequests.RequestID),
    [DocumentTypeID] INT FOREIGN KEY REFERENCES(DocumentTypes.DocumentTypeID)

    );
GO
