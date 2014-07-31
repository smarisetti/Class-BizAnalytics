# List students, their GPAs, and admission decision
# where they applied for 'CS' major, applied for 'Stanford' and
# whose school size is less than 1000 students

SELECT	sname, GPA, decision
FROM	Student, Apply
WHERE	Student.sID = Apply.sID AND
		sizeHS < 1000 AND
		major = 'CS' AND
		cname = 'Stanford';

# List college who have large enrollment (greater than 20,000)
# for their CS department

select 	distinct college.cname  #use 'distinct' operator to get distinct college names
from 	college, apply
where 	college.cname = apply.cname and
enrollment > 20000 and major = 'CS';

# List students, their GPAs, college they applied and enrollment of those college
select 	student.sid, sname, GPA, apply.cname, enrollment
from 	student, college, apply
where 	apply.sid = student.sid and
		apply.cname = college.cname;

# do you see duplicates of the same student and college name? Why?
# How do you correct your query?

# Say you want to order the above result by the GPA, 
# Showing the student with highest GPA in the beginning.

select	student.sid, sname, GPA, apply.cname, enrollment
from	student, college, apply
where	apply.sid = student.sid and
		apply.cname = college.cname
order by GPA desc;

# LIKE predicate
# when you don't know what exactly you are searching for use LIKE predicate

# Find students who have applied for major that has the word 'bio' 
select 	sid, major
from 	apply
where	major like '%bio%';

# Arithmetic operations
# Find students and their 'scaled GPAs'
# Scaled GPA: boost GPAs of those students from large schools

select	sid, sname, GPA, sizeHS, GPA*(sizeHS/1000.0) AS 'ScaledGPA'
from student;