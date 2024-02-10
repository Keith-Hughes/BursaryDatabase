CREATE PROCEDURE CreateStudentRequest 
@FirstName VARCHAR(120), 
@LastName VARCHAR(120), 
@DateOfBirth DATE, 
@Amount MONEY, 
@StatusName VARCHAR(10), 
@InstitutionID INT, 
@InstitutionAdminsID INT,
@BBDAdminID INT = NuLL,
@StatusID INT= 1,
@Movtivation VARBINARY(MAX),
@Race VARCHAR(20)

AS

BEGIN TRANSACTION InsertStudentRequest;
BEGIN TRY
INSERT INTO Students(
    InstitutionID,
    FirstName,
    LastName,
    DateOfBirth,
    Department,
    RaceID

)
VALUES (
    @InstitutionID,
    @FirstName,
    @LastName,
    @DateOfBirth,
    (SELECT DepartmentName FROM InstutionAdmins
    WHERE InstitutionID=@InstitutionID),
    (SELECT RaceID FROM Races
    WHERE Race=@Race)
);


INSERT INTO StudentRequests(
    StudentID,
    Motivation,
    Amount,
    DateOfRequestSent,
    DateOfStatusUpdate,
    StatusID,
    InstitutionAdminsID,
    InstitutionID
)
VALUES(
    (SELECT StudentID
FROM Students
WHERE StudentID = (SELECT MAX(StudentID) FROM Students)),
    @Motivation,
    @Amount,
    CONVERT(DATE, GETDATE()),
    CONVERT(DATE, GETDATE()),
    @StatusID,
    @InstitutionAdminsID,
    @InstitutionID

);
COMMIT;
END TRY
BEGIN CATCH
ROLLBACK;
END CATCH
