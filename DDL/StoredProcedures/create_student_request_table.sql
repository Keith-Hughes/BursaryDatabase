CREATE PROCEDURE CreateStudentRequestTable
AS
CREATE TABLE StudentRequests(
    RequestID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    Motivation VARCHAR(MAX),
    Amount MONEY,
    RequestStatus VARCHAR(20),
    Approved BOOLEAN,
    DateOfRequestSent DATE,
    DateOfStatusUpdate DATE,
    InstitutionAdminsID INT FOREIGN KEY REFERENCES InstitutionAdmins(InstitutionAdminsID),
    InstitutionID INT FOREIGN KEY REFERENCES InstitutionAdmins(InstitutionID),
    BBDAdminID INT FOREIGN KEY REFERENCES BBDAdmins(BBDAdminID)
)
GO