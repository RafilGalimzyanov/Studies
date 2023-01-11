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


SELECT *
FROM Participations;

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

--LR3

SELECT *
FROM Workers;

SELECT surname, position
FROM Workers;

SELECT TOP(2) *
FROM Projects;

SELECT surname AS '�������', position AS '���������', experience*12 AS '����, ���.'
FROM Workers;

SELECT AVG(experience) AS '������� ����, ���'
FROM Workers;

SELECT MIN(price) AS '����������� ��������� �������'
FROM Projects;

SELECT MAX(price) AS '������������ ��������� �������'
FROM Projects;

SELECT COUNT(price) AS '���������� ��������'
FROM Projects;

SELECT *
FROM Workers
WHERE experience < 40;

SELECT *
FROM Workers
WHERE experience < 40
AND experience > 20;

SELECT *
FROM Workers
WHERE experience BETWEEN 21 AND 40;

SELECT *
FROM Workers
WHERE surname IN ('������', '�������');

SELECT *
FROM Projects
WHERE title LIKE'�%' OR title LIKE'�%';

SELECT *
FROM Workers
WHERE position = '�����������';

SELECT *
FROM Workers
WHERE experience = '';

SELECT position, COUNT(*)
FROM Workers
GROUP BY position;

SELECT MIN(price) AS '����������� ��������� ������� �� ����� �'
FROM Projects
WHERE title LIKE'�%';

SELECT position
FROM Workers
GROUP BY position
HAVING COUNT(*) = 1;

SELECT position
FROM Workers
WHERE position LIKE'�%' OR position LIKE'�%'
GROUP BY position
HAVING COUNT(*) = 1;

SELECT *
FROM Workers
ORDER BY surname;

SELECT *
FROM Projects
ORDER BY [start date] DESC;

SELECT TOP(3) *
FROM Workers
ORDER BY experience DESC;

SELECT *
FROM Projects
WHERE title LIKE'�%' OR title LIKE'�%';

SELECT person_number, surname, position, experience
FROM Workers
WHERE experience IS NOT NULL
UNION 
SELECT person_number, surname, position, 0
FROM Workers
WHERE experience IS NULL;

SELECT project_code, title, [start date], price*1.1 AS '��������� � ������ �������'
FROM Projects
WHERE price < 100000
UNION
SELECT project_code, title, [start date], price*1.2 AS '��������� � ������ �������'
FROM Projects
WHERE price >= 100000 AND price <= 500000
UNION
SELECT project_code, title, [start date], price*1.3 AS '��������� � ������ �������'
FROM Projects
WHERE price > 500000;

-- LR4

SELECT person_number, surname, position, experience, project
FROM Workers
INNER JOIN Participations
ON worker = person_number;

SELECT title, [start date], surname, price
FROM Projects
INNER JOIN Participations
ON project = project_code
INNER JOIN Workers
ON worker = person_number;

SELECT person_number, surname, position, experience, project_code, price
FROM Workers
LEFT JOIN Participations
ON person_number = worker
LEFT JOIN Projects
ON project_code = project;

SELECT project_code, title, [start date], price, person_number, duration
FROM Projects
LEFT JOIN Participations
ON project_code = project
LEFT JOIN Workers
ON worker = person_number;

SELECT surname, title, duration, price
FROM Projects
LEFT JOIN Participations
ON project_code = project
RIGHT JOIN Workers
ON worker = person_number;

SELECT person_number, surname, position, experience, project_code, price
FROM Workers
LEFT JOIN Participations
ON worker = person_number
LEFT JOIN Projects
ON project_code = project;

SELECT person_number
FROM Workers AS W
JOIN Participations AS P
ON W.person_number = P.worker
WHERE P.project = 1 AND P.project = 3;

SELECT W.surname, Pr.title, 
Pr.price AS '������, ���', Pr.price/70 AS '������, $', Pr.price/80 AS '������, ����'
FROM Workers AS W
LEFT JOIN Participations AS P
ON P.worker = W.person_number
LEFT JOIN Projects AS Pr
ON Pr.project_code = P.project;

SELECT W.surname, COUNT(*) AS '���������� ��������'
FROM Workers AS W
LEFT JOIN Participations AS P
ON P.worker = W.person_number
LEFT JOIN Projects AS Pr
ON Pr.project_code = P.project
GROUP BY surname;

SELECT AVG(Pr.price) AS '������� ��������� �������� �������'
FROM Workers AS W
LEFT JOIN Participations AS P
ON P.worker = W.person_number
LEFT JOIN Projects AS Pr
ON Pr.project_code = P.project
WHERE W.surname = '������';

SELECT * 
FROM Workers AS W
WHERE W.experience > (
SELECT experience
FROM Workers
WHERE surname = '�����������'
);

SELECT *
FROM Projects AS Pr
WHERE Pr.price >= (
SELECT AVG(price)
FROM Projects
);

SELECT W.surname, Pr.title, Pr.price
FROM Workers AS W
LEFT JOIN Participations AS P
ON P.worker = W.person_number
LEFT JOIN Projects AS Pr
ON Pr.project_code = P.project
WHERE Pr.price = (
SELECT MAX(price)
FROM Projects
);

SELECT W.surname
FROM Workers AS W
LEFT JOIN Participations AS P
ON P.worker = W.person_number
LEFT JOIN Projects AS Pr
ON Pr.project_code = P.project
WHERE P.project = 0;

SELECT W.surname
FROM Workers AS W
WHERE W.experience >= ALL (
SELECT experience
FROM Workers
);

SELECT *
FROM Projects AS Pr
WHERE Pr.[start date] > ANY (
SELECT [start date]
FROM Projects
);

SELECT *
FROM Workers AS W
WHERE W.person_number IN (
SELECT worker
FROM Participations
);

SELECT *
FROM Workers AS W
WHERE W.person_number NOT IN (
SELECT worker
FROM Participations
);

SELECT Pr.title
FROM Projects AS Pr
LEFT JOIN Participations AS P
ON P.project = Pr.project_code
LEFT JOIN Workers AS W
ON W.person_number = P.worker
WHERE W.experience > 10;

--LR5

INSERT INTO Projects VALUES(21, '������ ��� ��� �����', '2023-02-01', 450000);

INSERT INTO Workers VALUES(21, '�������', '��������', 1);

CREATE TABLE "��������������� ������������� �������"
(
	project_code INT,
	title VARCHAR(30),
	"start date" DATE,
	price FLOAT,
	PRIMARY KEY(project_code)
);

INSERT INTO "��������������� ������������� �������"
SELECT Pr.project_code, Pr.title, Pr.[start date], Pr.price
FROM Projects AS Pr
LEFT JOIN Participations AS P
ON P.project = Pr.project_code
LEFT JOIN Workers AS W
ON W.person_number = P.worker
WHERE W.surname = '�����������';

SELECT *
FROM "��������������� ������������� �������";

CREATE TABLE "������������"
(
	person_number INT,
	surname VARCHAR(20),
	position VARCHAR(30),
	experience FLOAT,
	PRIMARY KEY(person_number)
);

INSERT INTO "������������"
SELECT W.person_number, W.surname, W.position, W.experience
FROM Workers AS W
LEFT JOIN Participations AS P
ON P.worker = W.person_number
LEFT JOIN Projects AS Pr
ON P.project = Pr.project_code
WHERE Pr.title = '������������';

CREATE TABLE "������ ��������"
(
	project_code INT,
	title VARCHAR(30),
	price FLOAT,
	PRIMARY KEY(project_code)
)

INSERT INTO "������ ��������"
SELECT Pr.project_code, Pr.title, Pr.price
FROM Projects AS Pr;

SELECT *
FROM "������������";

DELETE FROM "������������";

SELECT *
FROM "��������������� ������������� �������";

DELETE FROM "��������������� ������������� �������"
WHERE title = '���������';

DELETE FROM "������ ��������"
WHERE price < 60000 OR price > 100000;

SELECT *
FROM "������ ��������";

UPDATE Workers
SET experience = experience+1;

SELECT*
FROM Workers;

UPDATE Workers
SET position = '�������-�����������'
WHERE position = '�����������';

UPDATE Workers
SET surname = '������������'
WHERE surname = '������������';

UPDATE Projects
SET price = price*1.2
WHERE project_code IN
(
SELECT P.project
FROM Participations AS P
LEFT JOIN Projects AS Pr
ON P.project = Pr.project_code
LEFT JOIN Workers AS W
ON W.person_number = P.worker
WHERE W.experience = (
SELECT MAX(experience)
FROM Workers)
);

SELECT *
FROM Projects;

-- LR6

