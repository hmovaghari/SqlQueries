-- Displaying Information of a Table Field

SELECT	*
FROM	INFORMATION_SCHEMA.COLUMNS
WHERE	TABLE_SCHEMA = 'SchemaName'
		AND
		TABLE_NAME = 'TableName'
		AND
		COLUMN_NAME = 'FieldName'
