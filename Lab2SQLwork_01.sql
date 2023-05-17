SELECT * FROM employee WHERE position = 'Manager' AND salary > 35000;
SELECT * FROM employee WHERE position = 'Manager' OR position = 'Developer';

SELECT first_name, last_name, position, salary, 
       (salary * 0.1) as bonus, 
       (salary * 1.1) as total_salary 
FROM employee
WHERE position = 'Designer' 
      AND birth_date BETWEEN '1989-05-01' AND '1993-09-15';

SELECT e.last_name, e.first_name, d.name
FROM employee e
JOIN head_of_department hd ON e.id = hd.head_id
JOIN department d ON hd.department_id = d.id
WHERE (e.position = 'Manager' AND e.salary > 25000) OR d.count_employees < 5
ORDER BY e.last_name ASC, e.first_name ASC;

SELECT d.name, COUNT(e.head_id) as num_head_employees
FROM department d
LEFT OUTER JOIN head_of_department e ON e.department_id = d.id
GROUP BY d.name;

-- ������� ���������� � ��������� �� 1000 �� 2000
SELECT *
FROM employee
WHERE salary BETWEEN 34000 AND 45500;

-- ������� �����, ����� ���� ������ ����� "�����������"
SELECT *
FROM department
WHERE name LIKE '%HR%';

-- ������� ���������� � ������� "Manager", �� ����� ����� 5 ���� �����,
-- ��� �� ����� ��'���� � �������� "������� ������ ����������"
SELECT *
FROM employee
WHERE position = 'Manager' AND years_of_service > 5
   OR EXISTS (SELECT * FROM employee_position_history WHERE employee_id = employee.id);

-- ������� ����� � ������� ����������� ����� �� 5, ��� � ���� � ���� � ���� ��������� � ������� "Manager"
SELECT *
FROM department
WHERE count_employees < 5 OR id IN (SELECT department_id FROM head_of_department WHERE head_id IN (SELECT id FROM employee WHERE position = 'Manager'));

-- ������� ����������, �� �� ����� ������ � ������� "������� ������ ����������"
SELECT *
FROM employee
WHERE NOT EXISTS (SELECT * FROM employee_position_history WHERE employee_id = employee.id);

-- ������� ����������, �� ����� ����� ���� �����, �� ����-���� ��������� � ������� "Manager"
SELECT *
FROM employee
WHERE salary > ALL (SELECT salary FROM employee WHERE position = 'Designer');

-- ������� ����������, �� ����� ����� ��������, �� ����-���� ��������� � ����� "IT"
SELECT *
FROM employee
WHERE salary < ANY (SELECT salary FROM employee WHERE position = 'Developer');



