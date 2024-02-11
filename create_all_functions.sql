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
GO

CREATE FUNCTION ValidateAge
(
    @StudentID INT
)
RETURNS BIT
AS 

BEGIN 
DECLARE @ValidatedStudentAge BIT

    -- Assuming you have a Students table with a DateOfBirth column
    SELECT @ValidatedStudentAge = 
        CASE 
            WHEN (DATEDIFF(MONTH, (SELECT DateOfBirth FROM Students WHERE StudentId = @StudentId), GETDATE())/12) <= 35 
            THEN 1  -- Age is valid (35 years or younger)
            ELSE 0  -- Age is not valid
        END

    RETURN @ValidatedStudentAge

END

GO