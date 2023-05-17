
-- ��������� ���� UCR, DCR, ULC, DLC �� ������� Departments
ALTER TABLE Departments
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- ��������� ���� UCR, DCR, ULC, DLC �� ������� Employees
ALTER TABLE Employees
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- ��������� ���� UCR, DCR, ULC, DLC �� ������� Positions
ALTER TABLE Positions
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- ��������� ���� UCR, DCR, ULC, DLC �� ������� EmployeePositions
ALTER TABLE EmployeePositions
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- ��������� ���� UCR, DCR, ULC, DLC �� ������� Vacations
ALTER TABLE Vacations
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;

-- ��������� ���� UCR, DCR, ULC, DLC �� ������� EmployeeHistory
ALTER TABLE EmployeeHistory
ADD UCR VARCHAR(50),
    DCR DATETIME,
    ULC VARCHAR(50),
    DLC DATETIME;




