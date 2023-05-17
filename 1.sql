-- Check if the users already exist in the current database
IF NOT EXISTS (SELECT * FROM sys.sysusers WHERE name = 'user1')
BEGIN
    USE [department_1];
    CREATE USER user1 FOR LOGIN user1;
    GRANT SELECT ON Employees TO user1;
END;

IF NOT EXISTS (SELECT * FROM sys.sysusers WHERE name = 'user2')
BEGIN
    USE [department_1];
    CREATE USER user2 FOR LOGIN user2;
    GRANT INSERT, UPDATE, DELETE ON Departments TO user2;
END;

IF NOT EXISTS (SELECT * FROM sys.sysusers WHERE name = 'user3')
BEGIN
    USE [department_1];
    CREATE USER user3 FOR LOGIN user3;
    GRANT UPDATE ON EmployeePositions TO user3;
END;

IF NOT EXISTS (SELECT * FROM sys.sysusers WHERE name = 'user4')
BEGIN
    USE [department_1];
    CREATE USER user4 FOR LOGIN user4;
    GRANT DELETE ON Vacations TO user4;
END;
