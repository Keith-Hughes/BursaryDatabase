CREATE PROCEDURE CreateStudentStatus @InstitutionID INT
AS

SELECT StatusID, StatusName, Amount, FirstName, LastName, InstitutionID
FROM Statuses, StudentRequests, Students, Institutions
WHERE InstitutionID = @InstitutionID

GO
