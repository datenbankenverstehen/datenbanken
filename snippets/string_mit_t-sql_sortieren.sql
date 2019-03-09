/*
Copyright by Datenbanken-verstehen.de
Quelle: http://www.datenbanken-verstehen.de/
*/

DECLARE 
@input varchar(100),
@output varchar(100),
@len smallint

IF OBJECT_ID('tempdb..#Numbers', 'U') IS NOT NULL DROP TABLE tempdb..#Numbers

CREATE TABLE tempdb..#Numbers
(
	Number smallint IDENTITY(1, 1) PRIMARY KEY
)

WHILE 1 = 1
BEGIN
	INSERT INTO tempdb..#Numbers DEFAULT VALUES

	IF @@IDENTITY = 9
	BEGIN
		BREAK
	END
END

SET @input ='EISENBAHN'
SET @output = ''
SET @len = LEN(@input)

SELECT @output = @output +  TMP.VAL
FROM (
	SELECT TOP 9 SUBSTRING(@input, Number, 1) AS Val
	FROM tempdb..#Numbers (NOLOCK)
	WHERE Number <= @len
ORDER BY Val
) TMP

SELECT @output