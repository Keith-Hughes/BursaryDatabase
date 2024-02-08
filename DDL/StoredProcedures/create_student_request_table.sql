CREATE PROCEDURE CreateStudentRequestTable
AS
CREATE TABLE StudentRequests(
    RequestID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES,
    Motivation VARCHAR(MAX),
    Amount MONEY,
    RequestStatus VARCHAR(20)
)