USE VPD_311_Import
GO

INSERT Students 
				(last_name, first_name, middle_name,	birth_date,	  [group])
VALUES			('������',  '�����',	 '����������',	'1.01.1990',      11 ),
				('�������', '�������',  '����������',	'2.02.1982',      11 ),
				('�������', '���������','������������',	'3.03.1992',	  11 ),
				('��������','�������',  '������������',	'4.04.1980',	  11 ),
				('�����',   '�������',  '���������',	'5.05.1980',	  11 ),
				('�������', '���������','�������������','6.06.1981',	  11 ),
				('�����',   '�������',  '����������',   '7.07.1993',	  11 ),
				('�����',   '�����',    '�������������','8.08.1980',      11 ),
				('������',  '����',	 '�������',			'9.09.2004',	  11 ),
				('����',	 '�����',	 '������������','10.10.1987',     11 ),
				('����',	 '���������','����������',  '11.11.1982',     11 );

--SELECT * FROM Students