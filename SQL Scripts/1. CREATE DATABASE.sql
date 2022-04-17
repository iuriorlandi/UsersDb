IF NOT EXISTS(
SELECT * FROM sys.databases
WHERE name = 'UsersDb')
	CREATE DATABASE [UsersDb];