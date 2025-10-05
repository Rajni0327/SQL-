create table students (
student_id serial primary key ,
name varchar(100) not null
);


insert into students (name)
values
('sarthak gupta') ,
('simran vyas') ,
('rishi') ;


select * from students;



create table student_profiles(
student_id int primary key ,
address text,
age int ,
phone varchar (11)
);


insert into student_profiles (student_id , address , age , phone )
values 
(1 , 'delhi' , 23, '1234567890'),
(2, 'raipur' , 22, '1353454890'),
(3, 'jaipur' , 26, '1234734780')
;


alter table student_profiles
add constraint fk_student_id
foreign key (student_id) 
references students(student_id);
	

--one to one relation 

select
s.student_id,
s.name,
sp.address,
sp.age,
sp.phone
from students s 
join student_profiles sp
on s.student_id = sp.student_id;  --joining two tables


 

select * from student_profiles ;
select * from students ;






--one to many relation 


--above students table 

create table marks (
marks_id serial primary key ,
student_id int , 
subjects varchar (50),
marks int,
foreign key (student_id) references students(student_id)
);



insert into marks (student_id, subjects , marks )
values
(1,'english',67),
(1,'maths',45),
(1,'science',92),

(2,'english',80),
(2,'maths',89),
(2,'science',78),

(3,'english',65),
(3,'maths',40),
(3,'science',74)
;



--INNER join 

select s.name , m.subjects , m.marks 
from students s
join marks m
on s.student_id = m.student_id ;




insert into students (name)
values ('harsh patel');



--left join

select s.name ,m.subjects ,m.marks 
from students s 
left join marks m 
on s.student_id = m.student_id ;



insert into marks (student_id , subjects , marks )
values (4,'english', 34);

 

-- right join

select s.name ,m.subjects ,m.marks 
from students s 
right join marks m 
on s.student_id = m.student_id ;




insert into students (name)
values ('suru');


--full join 

select s.name ,m.subjects ,m.marks 
from students s 
full join marks m 
on s.student_id = m.student_id ;




--cross join 

select s.name , m.subjects , m.marks 
from students s
cross join marks m ;







--questions 

-- show each student's name along with their subject 
select s.name , m.subjects 
from students s
join marks m
on s.student_id = m.student_id ;




-- show marks for only simran vyas in all subjects 

select s.name , m.subjects , m.marks 
from students s
join marks m
on s.student_id = m.student_id
where name = 'simran vyas';

-- show only those subjects where marks are above 80

select m.subjects , m.marks from marks m 
join students s 
on m.student_id = s.student_id  
where m.marks > 80 ;

-- sort all students subjects marks in descending order of marks 

select m.subjects , m.marks from marks m 
join students s 
on m.student_id = s.student_id  
order by m.marks desc;


-- show each students average marks 
select s.name, round(avg(m.marks),2) from students s
join marks m
on s.student_id = m.student_id  
group by s.name ;




select * from students ;
select * from marks ;



--many to many relationships 
--same students table 

create table courses (
course_id int primary key ,
course_name varchar(100)
);

insert into courses (course_id , course_name)
values 
(101,'python'),
(102,'SQL'),
(103,'power BI');


create table student_courses (
student_id int ,
course_id int ,
primary key (student_id , course_id ),  -- composit primary key 
foreign key (student_id) references students(student_id),
foreign key (course_id) references courses(course_id)
);


INSERT INTO student_courses (student_id, course_id) VALUES
(1, 101),   -- srathak - python 
(1, 102),   -- sarthak - sql
(2, 101),   -- simran - python
(2, 103),   -- simran - power bi
(3, 102);   -- rishi - sql



--show the list of students with the courses they are enrolled in 

select s.name,c.course_name
from student_courses sc 
join students s on sc.student_id = s.student_id
join courses c on sc.course_id = c.course_id ;


-- find all the courses taken by tghe students names 'simran'

select c.course_name
from student_courses sc 
join students s on sc.student_id = s.student_id
join courses c on sc.course_id = c.course_id 
where s.name = 'simran vyas';




select * from student_courses;
select * from courses ;
select * from students ;









