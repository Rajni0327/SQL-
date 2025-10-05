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





select * from students ;
select * from marks ;


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

-- sort all students subjects marks in descending order of marks 

-- show each students average marks 






















