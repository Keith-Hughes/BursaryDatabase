CREATE VIEW [All pending students] AS

SELECT InstitutionName, InstitutionType, Amount
FROM Institutions, StudentRequests, Statuses

WHERE StatusName = 'Pending'