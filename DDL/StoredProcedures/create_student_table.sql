USE BursaryDB
GO

CREATE PROCEDURE CreateStudentsTable
AS
BEGIN
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
       CONSTRAINT FK_Students_Institution FOREIGN KEY (InstitutionID) REFERENCES Institution(InstitutionID)
    );
END;

