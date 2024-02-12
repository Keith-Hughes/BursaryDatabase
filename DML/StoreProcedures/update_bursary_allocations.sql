CREATE PROCEDURE UpdateBursaryAllocations @Amount MONEY, @StudentID INT
AS
UPDATE BursaryAllocations
SET AllocationUsed = AllocationUsed + @Amount
WHERE BursaryAllocationID = [dbo].[GetAllocationFromRequest](@StudentID)
