CREATE PROCEDURE CreateUsersTable
AS
CREATE TABLE Users(
    UserID INT IDENTITY(1,1) PRIMARY KEY, 
    FirstName VARCHAR(MAX), 
    LastName VARCHAR(MAX), 
    Username VARCHAR(50), 
    Password CHAR(64), 
    Email VARCHAR(254), 
    Address VARCHAR(100), 
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID)
    )
GO