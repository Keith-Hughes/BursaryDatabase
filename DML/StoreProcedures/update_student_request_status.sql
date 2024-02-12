CREATE PROCEDURE UpdateStudentRequestStatus @Status VARCHAR(10), @RequestID INT, @BBDAdminID INT
AS
DECLARE @StatusID INT= (SELECT StatusID FROM Statuses WHERE StatusName = @Status)
UPDATE StudentRequests

SET StatusID = @StatusID, BBDAdminID = @BBDAdminID
WHERE RequestID = @RequestID

IF @StatusID = 2
    DECLARE @Amount MONEY = (SELECT Amount FROM StudentRequest WHERE RequestID = @RequestID)
    DECLARE @StudentID INT = (SELECT StudentID FROM StudentRequest WHERE RequestID = @RequestID)
    EXEC UpdateBursaryAllocations @Amount, @StudentID

GO