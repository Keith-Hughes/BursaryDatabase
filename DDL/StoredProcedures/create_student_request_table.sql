CREATE PROCEDURE CreateStudentRequestTable
AS
CREATE TABLE StudentRequests(
    RequestID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    Motivation VARBINARY NOT NULL,
    Amount MONEY NOT NULL,
    RequestStatus VARCHAR(20),
    Approved BOOLEAN,
    DateOfRequestSent DATE NOT NULL,
    DateOfStatusUpdate DATE,
    InstitutionAdminsID INT FOREIGN KEY REFERENCES InstitutionAdmins(InstitutionAdminID),
    InstitutionID INT FOREIGN KEY REFERENCES InstitutionAdmins(InstitutionID),
    BBDAdminID INT FOREIGN KEY REFERENCES BBDAdmins(BBDAdminID)
)
GO