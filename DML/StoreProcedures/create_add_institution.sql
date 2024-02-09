CREATE PROCEDURE CreateAddInstitution @InstitutionID INT, @InstitutionName VARCHAR(120), @Email VARCHAR(254), @InstitutionType VARCHAR(120)
AS

INSERT INTO InstitutionAdmins(InstitutionID, InstitutionName, Email, InstitutionType)
VALUES (@InstitutionID, @InstitutionName, @Email, @InstitutionType)

GO