-- ������� ������ ������ � ������� Departments
INSERT INTO Departments (DepartmentID, DepartmentName, Abbreviation, Manager)
VALUES (6, 'IT', 'IT', 'Michael Johnson');

-- ��������� ��������� ������ � ������� Departments
UPDATE Departments
SET Manager = 'Jane Smith'
WHERE DepartmentID = 1;
