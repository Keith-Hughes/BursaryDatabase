
INSERT INTO [dbo].[Roles] ([RoleName])
VALUES ('Admin'), ('InstitutionAdmin');
GO

INSERT INTO [dbo].[Races] ([RaceName])
VALUES ('Asian'), ('Black/African'), ('White'), ('Indian')
GO

INSERT INTO [dbo].[DocumentTypes] ([DocumentType])
VALUES ('Transcript'), ('ID Document'), ('CV');
GO

INSERT INTO [dbo].[Statuses] ([StatusName])
VALUES ('Pending'), ('Approved'), ('Rejected');
GO