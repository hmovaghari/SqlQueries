-- Foreign key info

SELECT	*
FROM
(
	SELECT	pks.[name] +	'.' + pk.[name]		AS PK_Table,
			fk.[name]							AS FK_Name,
			refs.[name] +	'.' + ref.[name]	AS Ref_Table
	FROM	sys.foreign_keys	AS fk
	JOIN	sys.tables			AS pk
	ON		fk.parent_object_id = pk.object_id
	JOIN	sys.schemas			AS pks
	ON		pk.schema_id = pks.schema_id
	JOIN	sys.tables			AS ref
	ON		fk.referenced_object_id = ref.object_id
	JOIN	sys.schemas			AS refs
	ON		ref.schema_id = refs.schema_id
)t
WHERE	t.Ref_Table	= 'SchemaName.TableName'
		OR
		t.FK_Name	= 'FK_SchemaName_TableName_FieldName'
