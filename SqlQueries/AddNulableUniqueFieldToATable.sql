-- Add nullable unique field to a table
-- UNIQUE With Allow Null

-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (SELECT [name] FROM sys.databases WHERE name = N'DatabaseName')
    CREATE  DATABASE    DatabaseName
GO

USE DatabaseName
GO

IF NOT EXISTS (SELECT [name] FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestUnique]') AND type in (N'U'))
    CREATE  TABLE   TestUnique
    (
        ID      INT				NOT NULL	IDENTITY    CONSTRAINT PK_DatabaseName_TestUnique_ID    PRIMARY KEY,
        UChar   VARCHAR(100)		NULL
    )
GO

IF NOT EXISTS (SELECT i.[name] FROM sys.indexes AS i JOIN sys.objects AS o ON i.object_id = o.object_id WHERE i.[name] = 'UQ_DatabaseName_TestUnique_UID' AND o.object_id = OBJECT_ID(N'[dbo].[TestUnique]'))
	CREATE  UNIQUE  INDEX   UQ_DatabaseName_TestUnique_UID
	ON      TestUnique([UChar])
	WHERE   UChar   IS  NOT NULL
GO
