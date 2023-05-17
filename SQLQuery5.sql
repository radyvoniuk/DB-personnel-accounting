CREATE PROCEDURE CalculateSalaryFundForAllDepartments
    @Month INT,
    @Year INT
AS
BEGIN
    DECLARE @DepartmentID_All INT;
    DECLARE @DepartmentName_All VARCHAR(50);

    DECLARE department_cursor CURSOR FOR
    SELECT id, name
    FROM department;

    OPEN department_cursor;
    FETCH NEXT FROM department_cursor INTO @DepartmentID_All, @DepartmentName_All;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC CalculateSalariesFundForDepartment @DepartmentID_All, @Month, @Year;

        FETCH NEXT FROM department_cursor INTO @DepartmentID_All, @DepartmentName_All;
    END;

    CLOSE department_cursor;
    DEALLOCATE department_cursor;
END;


