INSERT INTO StudentRequests (RequestID, StudentID, Motivation, Amount, RequestStatus, Approved, DateOfRequestSent, DateOfStatusUpdate, InstitutionAdminsID, InstitutionID, BBDAdminID) VALUES
(1, 1, 'I need financial assistance to pay for my tuition fees and books', 10000.00, 'Pending', NULL, '2024-01-10', NULL, 1, 1, NULL),
(2, 2, 'I want to attend a conference in Cape Town related to my field of study', 5000.00, 'Approved', 1, '2024-01-15', '2024-01-20', 2, 2, 1),
(3, 3, 'I have a medical emergency and I need to cover the hospital bills', 8000.00, 'Rejected', 0, '2024-01-18', '2024-01-22', 3, 3, 2),
(4, 4, 'I have been accepted to do an exchange program in Germany and I need funds for travel and accommodation', 15000.00, 'Pending', NULL, '2024-01-25', NULL, 4, 4, NULL),
(5, 5, 'I have a research project that requires some equipment and materials that are not available at my institution', 7000.00, 'Approved', 1, '2024-01-30', '2024-02-05', 5, 5, 3),
(6, 6, 'I have been invited to present my paper at an international symposium and I need support for registration and visa fees', 6000.00, 'Rejected', 0, '2024-02-02', '2024-02-07', 6, 6, 4),
(7, 7, 'I have a family crisis and I need to help my parents with some expenses', 9000.00, 'Pending', NULL, '2024-02-08', NULL, 7, 7, NULL),
(8, 8, 'I want to enroll in an online course that will enhance my skills and employability', 4000.00, 'Approved', 1, '2024-02-12', '2024-02-17', 8, 8, 5),
(9, 9, 'I need to buy a new laptop for my studies as my old one broke down', 10000.00, 'Pending', NULL, '2024-02-15', NULL, 9, 9, NULL),
(10, 10, 'I want to participate in a volunteer program in Mozambique and I need help with the travel costs', 8000.00, 'Approved', 1, '2024-02-20', '2024-02-25', 10, 10, 6);
