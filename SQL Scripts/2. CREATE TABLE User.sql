USE UsersDb
GO

BEGIN TRAN
IF NOT EXISTS(
	SELECT 
		[sysobjects].[id] 
	FROM sysobjects
	WHERE type = 'U' 
		AND name = 'user'
)
	CREATE TABLE [user](
		[id] INT IDENTITY(1,1),
		[login] VARCHAR(50) UNIQUE NOT NULL,
		[register_date] DATE DEFAULT(CONVERT(DATE, GETDATE())),
		CONSTRAINT [PK_user] 
			PRIMARY KEY([id])
	);
ELSE
	PRINT 'Table already exists'

COMMIT;
