CREATE PROCEDURE InsertNewQualification
(
    @StudentID INT,
    @QualificationName VARCHAR(255),
    @QualificationType VARCHAR(255),
    @Description VARCHAR(255),
    @StartingDate DATE,
    @EndingDate DATE,
    @AverageMark INT,
    @Deapartname VARCHAR(120),
    @SuccessMessage NVARCHAR(MAX) OUTPUT
)
AS
BEGIN TRY
    INSERT INTO Qualification
        (StudentID, QualificationName, QualificationType, Description, StartingDate, EndingDate, AverageMark, Deapartname)
    VALUES
        (@StudentID, @QualificationName, @QualificationType, @Description, @StartingDate, @EndingDate, @AverageMark, @Deapartname);

    SET @SuccessMessage = 'Qualification inserted successfully.';
END TRY
BEGIN CATCH
    SET @SuccessMessage = ERROR_MESSAGE();
END CATCH
GO