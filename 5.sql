-- ³��������� ������� � ����������� "user1", �� ���� ��������� ����� ���� "HR_Manager"
REVOKE SELECT, INSERT, UPDATE, DELETE ON Departments FROM user1;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Employees FROM user1;

-- ����������� � ��������� �������� ����������� "user1" ������������� ������� ����� ���� "HR_Manager"
SELECT * FROM Departments; -- �������� ����� ��� �������� ������� �� ������� "Departments"
SELECT * FROM Employees; -- �������� ����� ��� �������� ������� �� ������� "Employees"
