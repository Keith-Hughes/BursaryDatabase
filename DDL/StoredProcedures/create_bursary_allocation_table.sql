CREATE TABLE BursaryAllocations (
  BursaryAllocationID INT NOT NULL,
  InstitutionID INT NOT NULL,
  AllocationAmount MONEY NOT NULL,
  AllocationUsed MONEY NOT NULL,
  DateOfAllocation DATE NOT NULL,
  PRIMARY KEY ([BursaryAllocationID]),
  CONSTRAINT FK_BursaryAllocations_Institution FOREIGN KEY (InstitutionID) REFERENCES Institution(InstitutionID)
);