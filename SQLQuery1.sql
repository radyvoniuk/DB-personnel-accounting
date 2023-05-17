
-- Додавання полів UCR, DCR, ULC, DLC до таблиці Departments
ALTER TABLE Departments
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- Додавання полів UCR, DCR, ULC, DLC до таблиці Employees
ALTER TABLE Employees
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- Додавання полів UCR, DCR, ULC, DLC до таблиці Positions
ALTER TABLE Positions
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- Додавання полів UCR, DCR, ULC, DLC до таблиці EmployeePositions
ALTER TABLE EmployeePositions
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- Додавання полів UCR, DCR, ULC, DLC до таблиці Vacations
ALTER TABLE Vacations
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- Додавання полів UCR, DCR, ULC, DLC до таблиці EmployeeHistory
ALTER TABLE EmployeeHistory
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;




