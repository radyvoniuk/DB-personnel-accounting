
CREATE TRIGGER trg_Employees_CheckVacationLimit
ON Vacations
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @totalEmployees INT;
    DECLARE @vacationEmployees INT;

    SELECT @totalEmployees = COUNT(*) FROM Employees WHERE DepartmentID = (SELECT DepartmentID FROM Employees WHERE EmployeeID IN (SELECT EmployeeID FROM inserted));

    SELECT @vacationEmployees = COUNT(*) FROM Vacations
    WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = (SELECT DepartmentID FROM Employees WHERE EmployeeID IN (SELECT EmployeeID FROM inserted)))
    AND StartDate <= (SELECT EndDate FROM inserted) AND EndDate >= (SELECT StartDate FROM inserted);

    IF ((@vacationEmployees + 1) * 100) > (@totalEmployees * 5)
    BEGIN
        RAISERROR ('Department vacation limit exceeded.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
    ELSE
    BEGIN
        INSERT INTO Vacations (EmployeeID, StartDate, EndDate)
        SELECT EmployeeID, StartDate, EndDate FROM inserted;
    END;
END;

