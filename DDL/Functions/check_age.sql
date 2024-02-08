CREATE FUNCTION ValidateAge
(
    @StudentAge INT
)
RETURNS BOOLEAN
AS 
BEGIN 
    DECLARE @ValidatedStudentAge BOOLEAN

    SELECT @ValidatedStudentAge = DATEDIFF(GETDATE() - DateOfBirth) from Students

    RETURN @ValidatedStudentAge

END

GO