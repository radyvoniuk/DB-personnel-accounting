-- ³��������� ��� � �����������
ALTER ROLE HR_Manager DROP MEMBER user1;


-- �������� �������, ����������� ����������� �����������
SELECT * FROM sys.fn_my_permissions('user1', 'DATABASE');

-- �������� ��������� �������, ������� ����� ����
REVOKE SELECT, INSERT, UPDATE, DELETE ON Departments FROM HR_Manager;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Employees FROM HR_Manager;
SELECT * FROM sys.fn_my_permissions('user1', 'DATABASE');
