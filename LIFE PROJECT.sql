----SELECT TOP (1000) [Students_regNO]
----      ,[Students_skills]
----      ,[Gender]
----      ,[L#G#A]
----      ,[C#G#P#A]
------  FROM [sharp234].[dbo].[sharp]
--/* USING WHERE STATEMENT TO ANALYSE DATA*/

SELECT *
FROM sharp
WHERE Students_skills = 'DATA ANALYSIS'  AND C#G#P#A > 3
/* THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE OFFERING DATA ANALYSIS*/



--SELECT *
--FROM sharp
--WHERE Students_skills = 'GRAPHIC DESIGN'   AND C#G#P#A > 3
--/* THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE OFFERING GRAPHIC DESIGN*/



SELECT *
FROM sharp
WHERE Students_skills = 'MOBILE DEVELOPMENT'  AND C#G#P#A > 3
--/* THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE OFFERING MOBILE DEVELOPMENT*/



--SELECT *
--FROM sharp
--WHERE Students_skills = 'DATA SCIENCE'  AND C#G#P#A > 3
--/* THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE OFFERING DATA SCIENCE*/




--SELECT *
--FROM sharp
--WHERE Students_skills = 'APPS DEVELOPMENT'  AND C#G#P#A > 3
--/*THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE OFFERING GRAPHIC DESIGN*/



--SELECT *
--FROM sharp
--WHERE Students_skills = 'UI/UX'   AND C#G#P#A > 3
--/*THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE OFFERING UI/UX*/



--SELECT *
--FROM sharp
--WHERE Students_skills = 'ARTIFICIAL INTELLIGENCE'  AND C#G#P#A > 3
--/*THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE OFFERING ARTIFICIAL INTERLLIGENCE*/


SELECT *
FROM sharp
WHERE Students_skills = 'FULL STACK DEVELOPMENT'  AND C#G#P#A > 3
/*THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE FULL STACK DEVELOPMENT*/



--SELECT *
--FROM sharp
--WHERE Students_skills = 'MACHINE LEARNING'  AND C#G#P#A > 3
--/*THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE OFFERING MACHINE LEARNING*/




--SELECT *
--FROM sharp
--WHERE Students_skills = 'BACK END DEVELOPMENT'  AND C#G#P#A > 3
--/*THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE OFFERING  BACK END DEVELOPMENT*/



--SELECT *
--FROM sharp
--WHERE Students_skills = 'FRONT END DEVELOPMENT' AND C#G#P#A > 3
--/*THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE OFFERING  FRONT END DEVELOPMENT*/



SELECT *
FROM sharp
WHERE Students_skills = '3D MODELLING'  
/*THE WHERE STATEMENT IS USE TO ANALYSE THE NUMBER OF STUDENTS THAT ARE OFFERING  3D MODELLING*/


--SELECT DISTINCT(Gender)
--FROM sharp
--/* it will display only MALE/FEMALE because male and female are the only unique one*/

--SELECT COUNT(students_regNO) AS students_regNO
--FROM sharp

SELECT MIN(C#G#P#A)
FROM sharp

--SELECT *
--FROM sharp
--WHERE C#G#P#A > 2.5 AND L#G#A = 'IKOT EKPENE'
--/* IF YOU WISH TO KNOW THE NORMAL OF STUDENTS THAT 2.5 AND ABOVE AND ARE FROM IKOT EKPENE*/


/* CASE STATEMENT IN SQL */

SELECT Students_regNO, Students_skills, Gender, L#G#A, C#G#P#A,
CASE
    WHEN C#G#P#A >= 4.5 THEN 'FIRST CLASS'
	WHEN C#G#P#A >= 3.5 THEN 'SECOND CLASS UPPER'
	WHEN C#G#P#A >= 2.5 THEN 'SECOND CLASS LOWER'
	ELSE 'PASS' 
END level 
FROM sharp

SELECT *
FROM sharp








