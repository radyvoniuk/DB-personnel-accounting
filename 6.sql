-- Відкликання ролі у користувача
ALTER ROLE HR_Manager DROP MEMBER user1;


-- Перевірка привілеїв, призначених користувачу персонально
SELECT * FROM sys.fn_my_permissions('user1', 'DATABASE');

-- Перевірка відсутності привілеїв, наданих через роль
REVOKE SELECT, INSERT, UPDATE, DELETE ON Departments FROM HR_Manager;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Employees FROM HR_Manager;
SELECT * FROM sys.fn_my_permissions('user1', 'DATABASE');
