CREATE VIEW StudentStatusView AS
SELECT StatusID, StatusName, Amount, FirstName, LastName, InstitutionID
FROM Statuses, StudentRequests, Students, Institutions
WHERE InstitutionID = @InstitutionID
