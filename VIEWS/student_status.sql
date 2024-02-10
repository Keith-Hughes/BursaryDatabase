CREATE VIEW StudentStatusView AS
SELECT StatusID, StatusName, Amount
FROM Statuses, StudentRequests
