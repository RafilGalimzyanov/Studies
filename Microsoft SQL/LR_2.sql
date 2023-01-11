CREATE TABLE Workers
(
	person_number INT UNIQUE,
	surname VARCHAR(20) NOT NULL,
	position VARCHAR(30) NOT NULL,
	experience FLOAT DEFAULT 0,
	PRIMARY KEY(person_number)
);

CREATE TABLE Projects
(
	project_code INT UNIQUE,
	title VARCHAR(30) NOT NULL,
	"start date" DATE,
	price FLOAT CHECK(price > 0),
	PRIMARY KEY(project_code)
);

CREATE TABLE Participations
(
	worker INT NOT NULL,
	project INT FOREIGN KEY REFERENCES Projects(project_code),
	duration INT CHECK(duration >0),
	work_price INT NOT NULL
);

INSERT INTO Workers (person_number, surname, position, experience)
VALUES 
(1, '�����������', '��������', 20),
(2, '������', '�����������', 5),
(3, '�������', '�����������', 3),
(4, '�������', '�����������', 2),
(5, '�����������', '�����������', 1),
(6, '������', '�����������', 1),
(7, '������', '�������', 2),
(8, '�������', '�������', 6),
(9, '��������', '�������', 4),
(10, '���������', '�������', 5),
(11, '����������', '�������', 5),
(12, '��������', '�������', 3),
(13, '���������', '�������������', 3),
(14, '������������', '�������������', 3),
(15, '�����������', '�������������', 6),
(16, '�������', '�������������', 7),
(17, '�������', '�����������', 8),
(18, '�������', '�����������', 4),
(19, '�������', '�����������', 2),
(20, '�������', '�����������', 7);

INSERT INTO Projects
VALUES
(1, '��������-���', '2023-01-01', '30000'),
(2, '����� ���', '2022-01-16', '100000'),
(3, '����', '2019-11-06', '200000'),
(4, '�����', '2018-06-01', '600000'),
(5, '�� 1', '2013-01-01', '900000'),
(6, '�� 2', '2015-01-01', '800000'),
(7, '�� 3', '2016-01-01', '800000'),
(8, '���� �������������� ������', '2018-01-01', '100000'),
(9, '��� ���', '2013-01-01', '30000'),
(10, '��������������� ��', '2015-01-01', '100000'),
(11, '����������� ��', '2016-01-01', '900000'),
(12, '��������� �������', '2017-01-01', '50000'),
(13, '��������������', '2018-01-01', '50000'),
(14, '����� ��������������', '2019-01-01', '60000'),
(15, '��������� ������� ��', '2020-01-01', '70000'),
(16, '������� ��', '2021-01-01', '70000'),
(17, '������������', '2022-01-01', '100000'),
(18, '�������� ������', '2022-01-01', '1000000'),
(19, '���������', '2014-01-01', '1000000'),
(20, '�������� ���������', '2019-01-01', '200000');

INSERT INTO Participations
VALUES
(1, 20, 10, 20000),
(1, 19, 8, 15000),
(1, 16, 20, 40000),
(2, 18, 13, 20000),
(2, 17, 40, 30000),
(3, 17, 50, 20000),
(3, 16, 20, 15000),
(4, 15, 22, 18000),
(4, 14, 15, 19000),
(5, 14, 16, 20000),
(6, 13, 12, 25000),
(7, 12, 8, 16000),
(8, 11, 8, 19000),
(9, 10, 18, 20000),
(10, 9, 11, 30000),
(10, 8, 9, 12000),
(11, 8, 10, 40000),
(12, 7, 13, 40000),
(13, 6, 13, 40000),
(14, 6, 14, 40000),
(15, 5, 18, 370000),
(16, 4, 16, 34000),
(17, 4, 11, 32000),
(18, 3, 7, 32000),
(19, 2, 19, 80000),
(20, 1, 17, 60000);

--LR 2

SELECT *
FROM Projects;

SELECT *
FROM Workers WHERE person_number IN (2, 8); 

SELECT *
FROM Workers WHERE experience > 5 AND experience <10;

SELECT MAX(experience) as "������������ ����"
FROM Workers;

SELECT *
FROM Workers ORDER BY experience;

SELECT Projects.title, Workers.surname, Participations.duration, Participations.work_price
FROM Projects, Workers, Participations WHERE Participations.worker = Workers.person_number
AND Participations.project = Projects.project_code;

SELECT Projects.title, Workers.surname, Participations.duration, Participations.work_price, (Workers.experience*Participations.work_price)/100 AS '�������� �� ����'
FROM Projects, Workers, Participations WHERE Participations.worker = Workers.person_number
AND Participations.project = Projects.project_code;

SELECT *
FROM Projects WHERE project_code IN (1, 4);

SELECT title, COUNT(*) AS '���������� �����������'
FROM Projects, Participations WHERE project = project_code
GROUP BY title;

SELECT TOP(1) COUNT(*)  AS '������������ ���������� ����������� � �������'
FROM Projects, Participations WHERE project = project_code
GROUP BY title
ORDER BY COUNT(*) DESC;

SELECT TOP(6) title  AS '������������ ���������� ����������� � �������'
FROM Projects, Participations WHERE project = project_code
GROUP BY title
ORDER BY COUNT(*) DESC;

SELECT TOP(1) Workers.surname, (Workers.experience*Participations.work_price)/100 AS '�������� �� ����'
FROM Projects, Workers, Participations 
WHERE Participations.worker = Workers.person_number
AND Participations.project = Projects.project_code
ORDER BY '�������� �� ����' DESC;

SELECT TOP(1) *
FROM Projects
ORDER BY price DESC;
