drop table if exists College;
drop table if exists Student;
drop table if exists Apply;

create table College(cName varchar(10), state varchar(10), enrollment int);
create table Student(sID int, sName text, GPA real, sizeHS int);
create table Apply(sID int, cName text, major text, decision text);
