USE VPD_311_Import
GO


SELECT 
		[����������� ��������] = direction_name,
		[���������� �����] = [���������� ����],
		[���������� ���������] = [���������� ���������]

FROM Directions,
(SELECT 
		direction,
		[���������� ����]		= COUNT(group_id)
FROM Groups, Directions
WHERE direction = direction_id
GROUP BY direction) AS G,
(SELECT 
		direction,
		[���������� ���������] = COUNT(stud_id)
FROM Groups,Directions,Students
WHERE direction = direction_id AND group_id = [group] 
GROUP BY direction) AS S
WHERE G.direction=direction_id AND S.direction = direction_id;

