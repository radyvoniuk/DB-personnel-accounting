-- Тригер для перевірки обмеження "В відділі не можуть працювати однофамільці керівника відділу"
CREATE TRIGGER trg_Employees_CheckManagerRelatives
ON Employees
FOR INSERT
AS
BEGIN
    DECLARE @managerLastName VARCHAR(50);
    SELECT @managerLastName = LastName FROM Employees WHERE EmployeeID = (SELECT DepartmentID FROM Departments WHERE Manager = CONCAT((SELECT FirstName FROM inserted), ' ', (SELECT LastName FROM inserted)));
    IF (SELECT COUNT(*) FROM inserted WHERE LastName = @managerLastName) > 0
    BEGIN
        RAISERROR('Employee cannot be a relative of the department manager.', 16, 1);
        ROLLBACK;
    END;
END;
