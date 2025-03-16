--SQLQuery1 - CheckScheldule
USE VPD_311_Import;
GO

CREATE FUNCTION CheckScheldule (@date DATE) RETURNS BIT
BEGIN
	IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [date] = @date) RETURN 0;
	RETURN 1;
END