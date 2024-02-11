CREATE PROCEDURE InsertNewStudent
(
    @FirstName NVARCHAR(120) = NULL,
    @LastName NVARCHAR(120) = NULL,
    @DateOfBirth DATE = NULL,
    @RaceID INT = NULL,
    @InstitutionID INT = NULL,
    @Department NVARCHAR(50) = NULL,
    @SuccessMessage NVARCHAR(MAX) OUTPUT
)
AS
BEGIN TRY
DECLARE @NewStudentID INT;
    INSERT INTO Students
        (FirstName, LastName, DateOfBirth, RaceID, InstitutionID, Department)
        OUTPUT inserted.StudentID INTO @NewStudentID
    VALUES
        (@FirstName, @LastName, @DateOfBirth, @RaceID, @InstitutionID, @Department);
DECLARE @OutputMessage NVARCHAR(MAX);
EXEC InsertNewQualification @StudentID =  @NewStudentID, @QualificationName = 'Bachelor of Science', @QualificationType = 'Undergraduate', @Description = 'General description', @StartingDate = '2018-09-01', @EndingDate = '2022-06-30', @AverageMark =  85, @Deapartname = 'Computer Science', @SuccessMessage = @OutputMessage OUTPUT;
PRINT @OutputMessage;


    SET @SuccessMessage = 'Student inserted successfully.';
END TRY
BEGIN CATCH
    SET @SuccessMessage = ERROR_MESSAGE();
END CATCH
GO
