CREATE PROCEDURE InsertInstitutions @InstitutionName VARCHAR(120), @Email VARCHAR(254), @InstitutionType VARCHAR(120)
AS

INSERT INTO Institutions(InstitutionName, Email, InstitutionType)
VALUES (@InstitutionName, @Email, @InstitutionType)

GO