-- ��������� �����
CREATE ROLE HR_Manager;
CREATE ROLE Finance_Manager;
CREATE ROLE Marketing_Manager;

-- ������� ������� �����
GRANT SELECT, INSERT, UPDATE, DELETE ON Departments TO HR_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO HR_Manager;

GRANT SELECT, INSERT, UPDATE, DELETE ON Departments TO Finance_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO Finance_Manager;

GRANT SELECT, INSERT, UPDATE, DELETE ON Departments TO Marketing_Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO Marketing_Manager;

-- ������� ����� ������������
EXEC sp_addrolemember 'HR_Manager', 'user1';
EXEC sp_addrolemember 'Finance_Manager', 'user2';
EXEC sp_addrolemember 'Marketing_Manager', 'user3';
