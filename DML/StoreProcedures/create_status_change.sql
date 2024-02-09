CREATE PROCEDURE CreateStatusChange @Status VARCHAR(10), @RequestID INT
AS

UPDATE Statuses
SET StatusName = @Status



GO