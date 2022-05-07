USE UsersDb
GO

BEGIN TRAN
IF NOT EXISTS(
	SELECT 
		[sysobjects].[id] 
	FROM sysobjects
	WHERE type = 'U' 
		AND name = 'user_password'
)
	CREATE TABLE [user_password](
		[id_user] INT NOT NULL,
		[password] VARCHAR(200) NOT NULL,
		[active] BIT NOT NULL DEFAULT(1),
		[creation_date] DATE DEFAULT(CONVERT(DATE, GETDATE())),
		CONSTRAINT [PK_user_password] PRIMARY KEY([id_user], [password]),
		CONSTRAINT [FK_user_password__user] 
			FOREIGN KEY([id_user]) 
			REFERENCES [user]([id])
			ON DELETE CASCADE
	);
ELSE
	PRINT 'Table already exists'

COMMIT;
