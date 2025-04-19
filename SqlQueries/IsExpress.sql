--PRINT @@VERSION

DECLARE @IsExpress BIT = 0
IF (SELECT CHARINDEX('Express Edition',@@version)) > 0
BEGIN
	SET	@IsExpress = 1
END
SELECT	CAST(@IsExpress AS BIT)	AS IsExpress