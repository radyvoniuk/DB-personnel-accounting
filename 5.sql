-- Відкликання привілеїв у користувача "user1", які були призначені через роль "HR_Manager"
REVOKE SELECT, INSERT, UPDATE, DELETE ON Departments FROM user1;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Employees FROM user1;

-- Переконання у збереженні здатності користувача "user1" користуватися привілеєм через роль "HR_Manager"
SELECT * FROM Departments; -- Виконати запит для перевірки доступу до таблиці "Departments"
SELECT * FROM Employees; -- Виконати запит для перевірки доступу до таблиці "Employees"
