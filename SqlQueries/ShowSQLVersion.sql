-- Show SQL Version

DECLARE	@ProductVersion		VARCHAR(MAX) = CAST(SERVERPROPERTY('productversion')	AS VARCHAR(MAX))
DECLARE @ProductLevel		VARCHAR(MAX) = CAST(SERVERPROPERTY('ProductLevel')		AS VARCHAR(MAX))
DECLARE @Edition			VARCHAR(MAX) = CAST(SERVERPROPERTY('Edition')			AS VARCHAR(MAX))
DECLARE	@VersionFullINFO	VARCHAR(MAX) = (SELECT @@VERSION)

SELECT	CASE 
		WHEN @ProductVersion LIKE '8%'		THEN 'SQL 2000'
		WHEN @ProductVersion LIKE '9%'		THEN 'SQL 2005'
		WHEN @ProductVersion LIKE '10.0%'	THEN 'SQL 2008'
		WHEN @ProductVersion LIKE '10.5%'	THEN 'SQL 2008 R2'
		WHEN @ProductVersion LIKE '11%'		THEN 'SQL 2012'
		WHEN @ProductVersion LIKE '12%'		THEN 'SQL 2014'
		WHEN @ProductVersion LIKE '13%'		THEN 'SQL 2016'     
		WHEN @ProductVersion LIKE '14%'		THEN 'SQL 2017' 
		WHEN @ProductVersion LIKE '15%'		THEN 'SQL 2019'
		WHEN @ProductVersion LIKE '16%'		THEN 'SQL 2022'
		ELSE 'Unknown'
		END									AS MajorVersion,
		@ProductLevel						AS ProductLevel,
		@Edition							As Edition,
		@ProductVersion						AS ProductVersion,
		@VersionFullINFO					AS VersionFullINFO,
		CASE
		WHEN @Edition LIKE '%Express Edition%'
		THEN CAST(1 AS BIT)
		ELSE CAST(0 AS BIT)
		END									AS IsExpress_Type1,
		CASE
		WHEN @VersionFullINFO LIKE '%Express Edition%'
		THEN CAST(1 AS BIT)
		ELSE CAST(0 AS BIT)
		END									AS IsExpress_Type2
GO
