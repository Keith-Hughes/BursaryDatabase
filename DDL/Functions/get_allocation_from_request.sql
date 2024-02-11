CREATE FUNCTION GetAllocationFromRequest 
(
    @StudentID INT
) 

RETURNS INT
AS
BEGIN

DECLARE @InstitutionID INT
DECLARE @AllocationID INT

SET @InstitutionID = (SELECT InstitutionID FROM Students WHERE StudentID = @StudentID)
SET @AllocationID = (SELECT BursaryAllocationID FROM BursaryAllocations WHERE InstitutionID = @InstitutionID)

RETURN @AllocationID

END





