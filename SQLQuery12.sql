-- ������ ��� ������� Employees
CREATE TRIGGER trg_Employees_UpdateUserAndDate
ON Employees
AFTER INSERT, UPDATE
AS
BEGIN
    -- ��������� ���� UCR (��'� �����������, �� ������� �����)
    UPDATE Employees
    SET UCR = SUSER_SNAME()
    WHERE EmployeeID IN (SELECT EmployeeID FROM inserted);

    -- ��������� ���� DCR (���� �� ��� ��������� ������)
    UPDATE Employees
    SET DCR = GETDATE()
    WHERE EmployeeID IN (SELECT EmployeeID FROM inserted);

    -- ��������� ���� ULC (��'� �����������, �� ������� ����� �����)
    UPDATE Employees
    SET ULC = SUSER_SNAME()
    WHERE EmployeeID IN (SELECT EmployeeID FROM inserted);

    -- ��������� ���� DLC (���� �� ��� �������� ����������� ������)
    UPDATE Employees
    SET DLC = GETDATE()
    WHERE EmployeeID IN (SELECT EmployeeID FROM inserted);
END;
GO