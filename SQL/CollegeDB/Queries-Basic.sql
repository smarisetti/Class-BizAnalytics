# Querying all data in a table
select * from student;
select * from college;
select * from apply;

# Querying the structure of the table
describe student;
describe college;
describe apply;

# Simple Query
# Find student ID, student name and student's GPA 
# whose GPA is greater than 3.6

select 	sid, sname
from 	student
where 	gpa > 3.6;

# Let us do a 'cross product' of college and student
# Let us see how the output looks like

select	*
from	student, apply
where	student.sid = apply.sid;

# Simple Joinsapply
# What colleges and majors did each of the student apply to?
select sname, student.sid, apply.major, cName
from student, apply
where student.sid = apply.sid;

# Using aliases for tables
select sname, s.sid, major, cName
from student s, apply a
where s.sid = a.sid;

# Find student and the major the student applied for
select sname, major
from student, apply
where student.sid =  apply.sid;

# Distinct values
select  distinct sname, major
from student, apply
where student.sid = apply.sid;

select sname, sid, gpa
from student
where sname like "C%";