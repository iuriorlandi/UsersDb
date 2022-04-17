USE UsersDb
GO

BEGIN TRAN
IF NOT EXISTS(
SELECT 
	[sysobjects].id 
FROM sysobjects
WHERE type = 'U' 
	AND name = 'User'
)
	CREATE TABLE [User](
		[login] VARCHAR(50) NOT NULL,
		[register_date] DATE DEFAULT(CONVERT(DATE, GETDATE())),
		CONSTRAINT [PK_User] PRIMARY KEY([login])
	);
ELSE
	PRINT 'Table already exists'

COMMIT;