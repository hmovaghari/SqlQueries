-- Adding a Not Null field to a populated table

IF NOT EXISTS(SELECT [name] FROM sys.columns WHERE [name] = 'FieldName' AND object_id = object_id(N'SchemaName.TableName'))
begin
ALTER		TABLE	SchemaName.TableName
ADD			[FieldName]						TINYINT NOT NULL
CONSTRAINT	DF_SchemaName_TableName_FieldName	DEFAULT 1
WITH VALUES
END
GO
