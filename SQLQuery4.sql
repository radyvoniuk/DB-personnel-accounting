CREATE PROCEDURE CalculateSalaryFundForDepartment
    @DepartmentID INT,
    @Month INT,
    @Year INT
AS
BEGIN
    DECLARE @DepartmentName VARCHAR(255);
    DECLARE @StartDate DATE;
    DECLARE @EndDate DATE;
    DECLARE @TotalSalary DECIMAL(10, 2);

    SET @DepartmentName = (SELECT name FROM department WHERE id = @DepartmentID);
    SET @StartDate = DATEFROMPARTS(@Year, @Month, 1);
    SET @EndDate = DATEADD(DAY, -1, DATEADD(MONTH, 1, @StartDate));

    SELECT @TotalSalary = SUM(salary)
    FROM employee
    WHERE id IN (
        SELECT employee_id
        FROM employee_position_history
        WHERE position IN (
            SELECT DISTINCT position
            FROM employee_position_history
            WHERE start_date <= @EndDate
                AND (end_date IS NULL OR end_date >= @StartDate)
                AND employee_id IN (
                    SELECT id
                    FROM employee
                    WHERE id = @DepartmentID
                )
        )
    );

    PRINT 'Salary Fund for Department ' + @DepartmentName + ' in ' + CONVERT(VARCHAR(7), @StartDate, 120) + ': ' + CONVERT(VARCHAR(20), @TotalSalary);
END;

