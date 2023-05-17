-- Вставка нового запису в таблицю Departments
INSERT INTO Departments (DepartmentID, DepartmentName, Abbreviation, Manager)
VALUES (6, 'IT', 'IT', 'Michael Johnson');

-- Оновлення існуючого запису в таблиці Departments
UPDATE Departments
SET Manager = 'Jane Smith'
WHERE DepartmentID = 1;
