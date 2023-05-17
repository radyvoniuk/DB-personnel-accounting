IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'HR_Manager' AND type = 'R')
BEGIN
    EXEC('ALTER ROLE HR_Manager DROP MEMBER user1');
    DROP ROLE HR_Manager;
END

IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'Finance_Manager' AND type = 'R')
BEGIN
    EXEC('ALTER ROLE Finance_Manager DROP MEMBER user2');
    DROP ROLE Finance_Manager;
END

IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'Marketing_Manager' AND type = 'R')
BEGIN
    EXEC('ALTER ROLE Marketing_Manager DROP MEMBER user3');
    DROP ROLE Marketing_Manager;
END

IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'user1')
BEGIN
    DROP LOGIN [user1];
END

IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'user2')
BEGIN
    DROP LOGIN [user2];
END

IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'user3')
BEGIN
    DROP LOGIN [user3];
END

IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'user4')
BEGIN
    DROP LOGIN [user4];
END
