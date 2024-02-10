CREATE PROCEDURE CreateBursaryAllocationTable

AS

CREATE TABLE BursaryAllocations(
    BursaryAllocationID INT IDENTITY(1,1) PRIMARY KEY,
    InstitutionID INT FOREIGN KEY REFERENCES Institutions(InstitutionID),
    AllocationAmount MONEY NOT NULL,
    AllocationUsed MONEY NOT NULL DEFAULT 0,
    DateOfAllocation DATE DEFAULT GETDATE()
)