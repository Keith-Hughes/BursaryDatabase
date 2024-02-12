CREATE PROCEDURE CreateInstitutionTotalsView 
@InstitutionID INT
AS
BEGIN
DECLARE @SqlStatement NVARCHAR(MAX);

SET @SqlStatement = 'CREATE VIEW TotalsView AS SELECT TotalRequests =COUNT(sr.RequestID),'+
' TotalPending = COUNT(CASE WHEN sr.StatusID = 1 THEN sr.RequestID END),'+
' TotalApproved = COUNT(CASE WHEN sr.StatusID = 2 THEN sr.RequestID END),'+
'TotalDeclined = COUNT(CASE WHEN sr.StatusID = 3 THEN sr.RequestID END),'+
'AllocationUsed = ba.AllocationUsed,'+
'AllocationLeft = ba.AllocationAmount - ba.AllocationUsed'+
' FROM StudentRequests sr '+
'LEFT JOIN BursaryAllocations ba ON sr.InstitutionID = ba.InstitutionID AND ba.DateOfAllocation=MAX(ba.DateOfAllocation)'+
'WHERE sr.InstitutionID ='+ CONVERT(VARCHAR(10), @InstitutionID)
EXECUTE sp_executesql @SqlStatement
END;


--the total student request, total approved, total decline, total funding used and total funding left.