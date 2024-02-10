CREATE PROCEDURE CreateStudentStatusView @InstitutionID INT, @InstitutionName VARCHAR(120)
AS
CREATE VIEW StudentStausView
SELECT StatusID, StatusName
FROM Statuses