--У цьому запиті ми використовуємо функцію COUNT(*) для підрахунку загальної кількості працівників на кожній посаді, а також використовуємо оператор GROUP BY для групування результатів за полем "position".
SELECT position, COUNT(*) AS total_employees
FROM employee
GROUP BY position;


--У цьому запиті використовується підзапит, щоб знайти середню зарплату всіх співробітників, а потім вибрати всіх співробітників, зарплати яких більше за середню
SELECT last_name, first_name, position, salary
FROM employee
WHERE salary > (
  SELECT AVG(salary)
  FROM employee
)
ORDER BY salary DESC;



UPDATE employee
SET salary = 55000, vacation_days = 25
WHERE id = 1031;

UPDATE employee
SET position = 'Developer', vacation_days = 12
WHERE id = 1046;
SELECT * FROM employee;

SELECT *
FROM employee
WHERE position IN (
    SELECT position
    FROM employee_position_history
    WHERE employee_id = 1048
);


UPDATE employee
SET salary = salary * 1.1
FROM employee
JOIN department ON employee.position LIKE '%HR Specialist%' AND department.id = 2
JOIN head_of_department ON head_of_department.department_id = department.id AND head_of_department.head_id = employee.id


SELECT * FROM employee

INSERT INTO employee (id, last_name, first_name, middle_name, passport_data, birth_date, birth_place, address, position, salary, employment_date, years_of_service, vacation_days)
VALUES (1045, 'Smith', 'John', 'William', 'MB127986', '1990-01-01', 'New York', '1st Avenue, 10', 'Manager', 37000.00, '2015-01-01', 6, 20),
       (1046, 'Johnson', 'Anne', '', 'CU976654', '1985-05-15', 'Chicago', '2nd Avenue, 20', 'Sales Representative', 32000.00, '2017-03-01', 4, 15),
       (1047, 'Garcia', 'Carlos', '', 'PF127889', '1993-11-30', 'Los Angeles', '3rd Avenue, 30', 'Software Developer', 46000.00, '2020-01-01', 1, 25);
SELECT * FROM employee;


DELETE FROM vacation;
SELECT * FROM vacation;


DELETE FROM employee
WHERE id= 1049;


SELECT * FROM employee;




