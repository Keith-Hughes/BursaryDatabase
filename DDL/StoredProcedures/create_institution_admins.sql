USE BursaryDB
GO

CREATE PROCEDURE CreateInstitutionAdminsTable
AS
BEGIN
    CREATE TABLE InstitutionAdmins (
       InstitutionAdminID INT IDENTITY(1,1) NOT NULL,
       InstitutionID INT NOT NULL,	
       UserID INT NOT NULL,
       DepartmentName VARCHAR(120) NOT NULL,
       Posittion VARCHAR(100) NOT NULL,
       Email VARCHAR(120) NOT NULL, 
       InstitutionType VARCHAR(100) NOT NULL,
       CONSTRAINT PK_InstitutionAdminID PRIMARY KEY (InstitutionAdminID),
       CONSTRAINT FK_InstitionAdmins_Institutions FOREIGN KEY (InstitutionID) REFERENCES Institutions(InstitutionID),
       CONSTRAINT FK_InstitionAdmins_Users FOREIGN KEY (UserID) REFERENCES Users(UserID)
    );
END;

EXEC dbo.CreateInstitutionAdminsTable