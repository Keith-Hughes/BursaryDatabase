USE BursaryDB
GO

CREATE PROCEDURE CreateInstitutionTable
AS
BEGIN
    CREATE TABLE Institution (
       InstitutionID INT IDENTITY(1,1) NOT NULL,
       InstitutionName	VARCHAR(120) NOT NULL,	
       Email VARCHAR(120) NOT NULL, 
       InstitutionType VARCHAR(100) NOT NULL,
       CONSTRAINT PK_Institution PRIMARY KEY (InstitutionID)
    );
END;

EXEC dbo.CreateInstitutionTable