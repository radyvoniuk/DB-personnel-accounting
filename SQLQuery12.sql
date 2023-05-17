-- Тригер для таблиці Employees
CREATE TRIGGER trg_Employees_UpdateUserAndDate
ON Employees
AFTER INSERT, UPDATE
AS
BEGIN
    -- Оновлення поля UCR (ім'я користувача, що створив запис)
    UPDATE Employees
    SET UCR = SUSER_SNAME()
    WHERE EmployeeID IN (SELECT EmployeeID FROM inserted);

    -- Оновлення поля DCR (дата та час створення запису)
    UPDATE Employees
    SET DCR = GETDATE()
    WHERE EmployeeID IN (SELECT EmployeeID FROM inserted);

    -- Оновлення поля ULC (ім'я користувача, що останнім змінив запис)
    UPDATE Employees
    SET ULC = SUSER_SNAME()
    WHERE EmployeeID IN (SELECT EmployeeID FROM inserted);

    -- Оновлення поля DLC (дата та час останньої модифікації запису)
    UPDATE Employees
    SET DLC = GETDATE()
    WHERE EmployeeID IN (SELECT EmployeeID FROM inserted);
END;
GO