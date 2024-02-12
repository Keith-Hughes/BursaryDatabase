

INSERT INTO [dbo].[Users] ([FirstName], [LastName], [Username], [Password], [Email], [Address], [RoleID])
VALUES ('John', 'Doe', 'johndoe', 'password123', 'johndoe@example.com', '123 Main St', 1),
       ('Jane', 'Smith', 'janesmith', 'password456', 'janesmith@example.com', '456 Elm St', 3);

INSERT INTO [dbo].[Institutions] ([InstitutionName], [Email], [InstitutionType])
VALUES ('University of XYZ', 'info@universityxyz.edu', 'University'),
       ('ABC College', 'info@abccollege.edu', 'College');


INSERT INTO [dbo].[Students] ([FirstName], [LastName], [DateOfBirth], [RaceID], [InstitutionID], [Department])
VALUES ('Alice', 'Johnson', '2000-05-15', 3, 1, 'Computer Science'),
       ('Bob', 'Smith', '2001-08-20', 2, 2, 'Engineering');

INSERT INTO [dbo].[BursaryAllocations] ([InstitutionID], [AllocationAmount], [AllocationUsed], [DateOfAllocation])
VALUES (1, 5000.00, 2500.00, '2023-01-15'),
       (2, 7500.00, 5000.00, '2023-02-20');



INSERT INTO [dbo].[InstitutionAdmins] ([InstitutionID], [UserID], [DepartmentName], [Position], [Email], [InstitutionType])
VALUES (1, 1, 'Admissions', 'Admissions Officer', 'admissions@universityxyz.edu', 'University'),
       (2, 2, 'Registrations', 'Registrar', 'registrar@abccollege.edu', 'College');


INSERT INTO [dbo].[BBDAdmins] ([UserID])
VALUES (1);

INSERT INTO [dbo].[StudentRequests] ([StudentID], [Motivation], [Amount], [StatusID], [DateOfRequestSent], [InstitutionAdminsID], [BBDAdminID])
VALUES (1, 'I need financial assistance for tuition fees.', 5000.00, 1, '2023-03-10', 1, NULL),
       (2, 'Requesting funds for textbooks and supplies.', 3000.00, 1, '2023-04-05', NULL, 1);

INSERT INTO [dbo].[Qualifications] ([StudentID], [QualificationName], [QualificationType], [Description], [StartingDate], [EndingDate], [AverageMark], [Deapartname])
VALUES (1, 'Bachelor of Science', 'Degree', 'Computer Science', '2020-09-01', '2024-06-30', 85, 'Computer Science'),
       (2, 'Associate Degree in Engineering', 'Diploma', 'Mechanical Engineering', '2019-09-01', '2022-06-30', 78, 'Engineering');

INSERT INTO [dbo].[Bursary] ([BursaryName], [Description], [MaximumFundingPerStudent], [AppliationClosingdate], [YearOfAlllocation])
VALUES ('Merit Bursary', 'Awarded based on academic performance', 10000.00, '2024-03-31', 2024),
       ('Needs-Based Bursary', 'Awarded based on financial need', 7500.00, '2024-04-15', 2024);


INSERT INTO [dbo].[InstitutionAdmins] ([InstitutionID], [UserID], [DepartmentName], [Position], [Email], [InstitutionType])
VALUES (1, 2, 'Financial Aid', 'Financial Aid Officer', 'financialaid@universityxyz.edu', 'University'),
       (2, 1, 'Academic Affairs', 'Academic Dean', 'dean@abccollege.edu', 'College');


INSERT INTO [dbo].[StudentRequests] ([StudentID], [Motivation], [Amount], [StatusID], [DateOfRequestSent], [InstitutionAdminsID], [BBDAdminID])
VALUES (1, 'Requesting assistance with housing costs.', 2000.00, 1, '2024-01-20', 1, NULL),
       (2, 'Seeking funding for a research project.', 4000.00, 1, '2024-02-10', NULL, 1);

INSERT INTO [dbo].[Qualifications] ([StudentID], [QualificationName], [QualificationType], [Description], [StartingDate], [EndingDate], [AverageMark], [Deapartname])
VALUES (1, 'Master of Business Administration', 'Masters', 'Business Administration', '2022-09-01', '2024-06-30', 88, 'Business School'),
       (2, 'Certificate in Project Management', 'Certificate', 'Project Management', '2023-01-01', '2023-12-31', 82, 'Engineering');


INSERT INTO [dbo].[Institutions] ([InstitutionName], [Email], [InstitutionType])
VALUES ('Community College of ABC', 'info@communitycollegeabc.edu', 'Community College'),
       ('Technical Institute XYZ', 'info@techinstitute.xyz', 'Technical Institute');

INSERT INTO [dbo].[BursaryAllocations] ([InstitutionID], [AllocationAmount], [AllocationUsed], [DateOfAllocation])
VALUES (3, 10000.00, 7500.00, '2023-05-20'),
       (4, 8000.00, 6000.00, '2023-06-15');

INSERT INTO [dbo].[BBDAdmins] ([UserID])
VALUES (2), (3);


INSERT INTO [dbo].[InstitutionAdmins] ([InstitutionID], [UserID], [DepartmentName], [Position], [Email], [InstitutionType])
VALUES (3, 3, 'Student Services', 'Student Advisor', 'studentadvisor@communitycollegeabc.edu', 'Community College'),
       (4, 4, 'Admissions', 'Admissions Coordinator', 'admissions@techinstitute.xyz', 'Technical Institute');


INSERT INTO [dbo].[StudentRequests] ([StudentID], [Motivation], [Amount], [StatusID], [DateOfRequestSent], [InstitutionAdminsID], [BBDAdminID])
VALUES (1, 'Need assistance with transportation costs.', 1500.00, 1, '2024-03-05', 2, NULL),
       (2, 'Requesting support for a study abroad program.', 6000.00, 1, '2024-03-15', NULL, 2);

INSERT INTO [dbo].[Qualifications] ([StudentID], [QualificationName], [QualificationType], [Description], [StartingDate], [EndingDate], [AverageMark], [Deapartname])
VALUES (1, 'Associate Degree in Accounting', 'Diploma', 'Accounting', '2021-09-01', '2023-06-30', 82, 'Business School'),
       (2, 'Bachelor of Arts in History', 'Degree', 'History', '2020-09-01', '2024-06-30', 90, 'Information Systems and Technology');

