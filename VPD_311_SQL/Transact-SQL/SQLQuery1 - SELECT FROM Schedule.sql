USE VPD_311_Import;
GO


SELECT
		[������]		= group_name,
		[����������]	= discipline_name,
		[�������������] = last_name+' '+first_name+' '+middle_name,
		[����]			= [date],
		[���� ������]	= DATENAME(WEEKDAY,[date]),
		[�����]			= [time],
		[������]		= IIF(spent = 1, N'���������', N'�������������')
FROM Schedule,Groups,Disciplines,Teachers
WHERE [group]			= group_id
AND	  discipline		= discipline_id
AND	  teacher			= teacher_id
ORDER BY [date]
--AND	  group_name=N'PD_321'
;
