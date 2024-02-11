CREATE PROCEDURE UpdateStudentRequestStatus @Status VARCHAR(10), @RequestID INT, @BBDAdminID INT
AS

UPDATE StudentRequests
SET StatusID = (SELECT StatusID FROM Statuses WHERE StatusName = @Status), BBDAdminID = @BBDAdminID
WHERE RequestID = @RequestID

IF StatusID = 2
    DECLARE @Amount MONEY = (SELECT Amount FROM StudentRequest WHERE RequestID = @RequestID)
    DECLARE @StudentID INT = (SELECT StudentID FROM StudentRequest WHERE RequestID = @RequestID)
    EXEC CreateUpdateAllocations @Amount, @StudentID

GO