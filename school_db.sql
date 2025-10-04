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
	

select * from student_profiles ;
select * from students ;







































