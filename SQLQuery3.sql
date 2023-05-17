-- ������ ��� ������� Departments
CREATE TRIGGER trg_Departments_UpdateUserAndDate
ON Departments
AFTER INSERT, UPDATE
AS
BEGIN
    -- ��������� ���� UCR (��'� �����������, �� ������� �����)
    UPDATE Departments
    SET UCR = SUSER_SNAME()
    WHERE DepartmentID IN (SELECT DepartmentID FROM inserted);

    -- ��������� ���� DCR (���� �� ��� ��������� ������)
    UPDATE Departments
    SET DCR = GETDATE()
    WHERE DepartmentID IN (SELECT DepartmentID FROM inserted);

    -- ��������� ���� ULC (��'� �����������, �� ������� ����� �����)
    UPDATE Departments
    SET ULC = SUSER_SNAME()
    WHERE DepartmentID IN (SELECT DepartmentID FROM inserted);

    -- ��������� ���� DLC (���� �� ��� �������� ����������� ������)
    UPDATE Departments
    SET DLC = GETDATE()
    WHERE DepartmentID IN (SELECT DepartmentID FROM inserted);
END;
GO