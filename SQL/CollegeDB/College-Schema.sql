# create schema CollegeDB;

drop table if exists College;
drop table if exists Student;
drop table if exists Apply;

create table collegedb.College(cName varchar(10), state varchar(10), enrollment int);
create table collegedb.Student(sID int, sName text, GPA real, sizeHS int);
create table collegedb.Apply(sID int, cName text, major text, decision text);
