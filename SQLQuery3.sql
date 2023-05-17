-- Тригер для таблиці Departments
CREATE TRIGGER trg_Departments_UpdateUserAndDate
ON Departments
AFTER INSERT, UPDATE
AS
BEGIN
    -- Оновлення поля UCR (ім'я користувача, що створив запис)
    UPDATE Departments
    SET UCR = SUSER_SNAME()
    WHERE DepartmentID IN (SELECT DepartmentID FROM inserted);

    -- Оновлення поля DCR (дата та час створення запису)
    UPDATE Departments
    SET DCR = GETDATE()
    WHERE DepartmentID IN (SELECT DepartmentID FROM inserted);

    -- Оновлення поля ULC (ім'я користувача, що останнім змінив запис)
    UPDATE Departments
    SET ULC = SUSER_SNAME()
    WHERE DepartmentID IN (SELECT DepartmentID FROM inserted);

    -- Оновлення поля DLC (дата та час останньої модифікації запису)
    UPDATE Departments
    SET DLC = GETDATE()
    WHERE DepartmentID IN (SELECT DepartmentID FROM inserted);
END;
GO