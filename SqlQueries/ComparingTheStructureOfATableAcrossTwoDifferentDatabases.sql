-- Comparing the Structure of a Table Across Two Different Databases (for example Source and Targer)

SELECT	CASE
			WHEN Source IS NULL THEN 'Delete from Target'
			WHEN Targer IS NULL THEN 'Add to Target'
			ELSE 'Update Target'
		END	AS 'ToDo',
		*
FROM	(
			SELECt		CASE
							WHEN [Source].TABLE_CATALOG IS NULL THEN [Source].TABLE_CATALOG
							ELSE [Source].TABLE_CATALOG + '.' + [Source].TABLE_SCHEMA + '.' + [Source].TABLE_NAME + '.' + [Source].COLUMN_NAME
						END									AS [Source],
						CASE
							WHEN [Targer].TABLE_CATALOG IS NULL THEN [Targer].TABLE_CATALOG
							ELSE [Targer].TABLE_CATALOG + '.' + [Targer].TABLE_SCHEMA + '.' + [Targer].TABLE_NAME + '.' + [Targer].COLUMN_NAME
						END									AS [Targer],
						[Source].DATA_TYPE					AS Source_DATA_TYPE,
						[Targer].DATA_TYPE					AS Targer_DATA_TYPE,
						[Source].IS_NULLABLE				AS Source_IS_NULLABLE,
						[Targer].IS_NULLABLE				AS Targer_IS_NULLABLE,
						[Source].CHARACTER_MAXIMUM_LENGTH	AS Source_CHARACTER_MAXIMUM_LENGTH,
						[Targer].CHARACTER_MAXIMUM_LENGTH	AS Targer_CHARACTER_MAXIMUM_LENGTH,
						[Source].NUMERIC_PRECISION			AS Source_NUMERIC_PRECISION,
						[Targer].NUMERIC_PRECISION			AS Targer_NUMERIC_PRECISION,
						[Source].NUMERIC_PRECISION_RADIX	AS Source_NUMERIC_PRECISION_RADIX,
						[Targer].NUMERIC_PRECISION_RADIX	AS Targer_NUMERIC_PRECISION_RADIX,
						[Source].NUMERIC_SCALE				AS Source_NUMERIC_SCALE,
						[Targer].NUMERIC_SCALE				AS Targer_NUMERIC_SCALE
			FROM		oma.INFORMATION_SCHEMA.COLUMNS		AS [Source]
			Full JOIN	Nasir4.INFORMATION_SCHEMA.COLUMNS	AS [Targer]
			ON			[Source].TABLE_SCHEMA = [Targer].TABLE_SCHEMA
						AND
						[Source].TABLE_NAME = [Targer].TABLE_NAME
						AND
						[Source].COLUMN_NAME = [Targer].COLUMN_NAME
			WHERE		(
							ISNULL([Source].DATA_TYPE, 0) <> ISNULL([Targer].DATA_TYPE, 0)
							OR
							[Source].IS_NULLABLE <> [Targer].IS_NULLABLE
							OR
							ISNULL([Source].CHARACTER_MAXIMUM_LENGTH, 0) <> ISNULL([Targer].CHARACTER_MAXIMUM_LENGTH, 0)
							OR
							ISNULL([Source].NUMERIC_PRECISION, 0) <> ISNULL([Targer].NUMERIC_PRECISION, 0)
							OR
							ISNULL([Source].NUMERIC_PRECISION_RADIX, 0) <> ISNULL([Targer].NUMERIC_PRECISION_RADIX, 0)
							OR
							ISNULL([Source].NUMERIC_SCALE, 0) <> ISNULL([Targer].NUMERIC_SCALE, 0)
						)
						AND
						([Source].TABLE_SCHEMA IS NULL OR [Source].TABLE_SCHEMA <> 'dbo')
						AND
						([Targer].TABLE_SCHEMA IS NULL OR [Targer].TABLE_SCHEMA <> 'dbo')
						AND
						[Source].TABLE_SCHEMA = 'SchemaName'
						AND
						[Source].TABLE_NAME = 'TableName'
		)t

--SELECT * FROM Nasir4.INFORMATION_SCHEMA.COLUMNS
