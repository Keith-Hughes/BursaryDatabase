CREATE PROCEDURE AddNewDocument 
@RequestID INT,
@Document VARBINARY(MAX),
@DocumentType VARCHAR(20)
AS
INSERT INTO Documents(
    [File],
    UploadDate,
    DocumentTypeID,
    RequestID
)
VALUES(
    @Document,
    CONVERT(DATE, GETDATE()),
    (SELECT DocumentTypeID FROM DocumentTypes WHERE DocumentType=@DocumentType),
    @RequestID
)
GO

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
@Motivation VARBINARY(MAX),
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
GO

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
        (StudentID, QualificationName, QualificationType, [Description], StartingDate, EndingDate, AverageMark, Deapartname)
    VALUES
        (@StudentID, @QualificationName, @QualificationType, @Description, @StartingDate, @EndingDate, @AverageMark, @Deapartname);

    SET @SuccessMessage = 'Qualification inserted successfully.';
END TRY
BEGIN CATCH
    SET @SuccessMessage = ERROR_MESSAGE();
END CATCH
GO

CREATE PROCEDURE InsertInstitutions @InstitutionName VARCHAR(120), @Email VARCHAR(254), @InstitutionType VARCHAR(120)
AS
INSERT INTO Institutions(InstitutionName, Email, InstitutionType)
VALUES (@InstitutionName, @Email, @InstitutionType)
GO

CREATE PROCEDURE UpdateBursaryAllocations @Amount MONEY, @StudentID INT
AS
UPDATE BursaryAllocations
SET AllocationUsed = AllocationUsed + @Amount
WHERE BursaryAllocationID = [dbo].[GetAllocationFromRequest](@StudentID)
GO

CREATE PROCEDURE UpdateStudentRequestStatus @Status VARCHAR(10), @RequestID INT, @BBDAdminID INT
AS
DECLARE @StatusID INT= (SELECT StatusID FROM Statuses WHERE StatusName = @Status)
UPDATE StudentRequests
SET StatusID = @StatusID, BBDAdminID = @BBDAdminID
WHERE RequestID = @RequestID
IF @StatusID = 2
    DECLARE @Amount MONEY = (SELECT Amount FROM StudentRequest WHERE RequestID = @RequestID)
    DECLARE @StudentID INT = (SELECT StudentID FROM StudentRequest WHERE RequestID = @RequestID)
    EXEC UpdateBursaryAllocations @Amount, @StudentID
GO

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
GO

CREATE PROCEDURE InsertNewUser
    (
    @FirstName NVARCHAR(MAX),
    @LastName NVARCHAR(MAX),
    @Username NVARCHAR(50),
    @Password CHAR(64),
    @Email NVARCHAR(254),
    @Address NVARCHAR(100),
    @RoleID INT,
    @InstitutionID INT = NULL,
    @DepartmentName VARCHAR(120) = NULL,
    @Position VARCHAR(100) = NULL
)
AS
BEGIN
    INSERT INTO Users
        (FirstName, LastName, Username, Password, Email, Address, RoleID)
    VALUES
        (@FirstName, @LastName, @Username, @Password, @Email, @Address, @RoleID);

   DECLARE @UserID INT = (SELECT MAX(UserID) FROM Users)
    IF (@RoleID = 2)
    BEGIN
    INSERT INTO InstitutionAdmins
        (InstitutionID, UserID, DepartmentName, Position)
    VALUES
        (@InstitutionID, @UserID, @DepartmentName, @Position);
    END

    IF (@RoleID = 1)
    BEGIN
        INSERT INTO BBDAdmins
        (UserID)
    VALUES
        (@UserID);
    END
END;
GO
