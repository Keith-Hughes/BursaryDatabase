CREATE FUNCTION ValidateAge
(
    @StudentID INT
)
RETURNS BOOLEAN
AS 

BEGIN 
    DECLARE @ValidatedStudentAge BOOLEAN

    SELECT @ValidatedStudentAge = DATEDIFF(GETDATE() - DateOfBirth) from Students 

    RETURN @ValidatedStudentAge

END

GO