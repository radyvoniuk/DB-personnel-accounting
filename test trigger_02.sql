
-- Вставка даних
INSERT INTO Departments (DepartmentID, DepartmentName, Abbreviation, Manager)
VALUES (4, 'IT Department', 'IT', 'John Doe');

INSERT INTO Employees (EmployeeID, FirstName, LastName, DateOfBirth, PassportData, PlaceOfBirth, Address, Salary, EmploymentYear)
VALUES (7, 'Jane', 'Doe', '1990-01-01', 'AB123456','Los Angeles','321 Violant St', 7000.00, 2017);

-- Повинен виникнути тригер, оскільки спробуємо додати співробітника з тією самою фамілією, що і керівник відділу
INSERT INTO Employees (EmployeeID, FirstName, LastName, DateOfBirth, PassportData, PlaceOfBirth, Address, Salary, EmploymentYear)
VALUES (8, 'John', 'Doe', '1995-05-05', 'CD789012','Chicago','724 Tulip St', 5000.00, 2015);
