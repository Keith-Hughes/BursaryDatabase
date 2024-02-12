CREATE FUNCTION ValidateAge
(
    @StudentID INT
)
RETURNS BOOLEAN
AS 

BEGIN 
    DECLARE @ValidatedStudentAge BOOLEAN

    SELECT @ValidatedStudentAge = DATEDIFF(GETDATE() - (SELECT DateOfBirth FROM Students)) 

    RETURN @ValidatedStudentAge

END

GO