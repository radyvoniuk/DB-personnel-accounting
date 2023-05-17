SELECT * FROM sys.database_principals;
SELECT name FROM sys.database_principals WHERE type IN ('U', 'S') AND name = 'user1';
