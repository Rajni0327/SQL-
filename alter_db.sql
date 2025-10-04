
--CREATING A TABLE 

CREATE TABLE students (
student_id SERIAL PRIMARY KEY ,
name VARCHAR (100),
age BIGINT
);


INSERT INTO students (name , age )
VALUES ('Akarsh' , 23),
		('Samriti',25);


-- ADD a new column 

ALTER TABLE students 
ADD COLUMN Email VARCHAR(100) DEFAULT 'not provided';



-- DELETE a column 

ALTER TABLE students 
DROP COLUMN Email ;



--RENAME a column

ALTER TABLE students 
RENAME COLUMN name TO full_name ;



--CHANGE DATATPE of a column 

ALTER TABLE students 
ALTER COLUMN age TYPE smallint ; 


-- 
-- SET a DEFAULt value 
ALTER TABLE students 
ALTER COLUMN age SET DEFAULT 18;



-- Remove default column
ALTER TABLE students 
ALTER COLUMN age DROP DEFAULT ;



-- ADD a CONSTRAINT

ALTER TABLE students 
ADD CONSTRAINT age_check CHECK(age >= 0 ) ;  --when you add constraint while making the table , it automatically ads age_chek , but if you're adding it later you have give age_check
 


-- DROP a CONSTRAINT 

ALTER TABLE students 
DROP CONSTRAINT age_check ;



-- RENAME the table 

ALTER TABLE students 
RENAME to school_students ;














SELECT * FROM  students ;











