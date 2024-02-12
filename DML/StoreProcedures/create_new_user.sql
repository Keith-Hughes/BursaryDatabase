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
