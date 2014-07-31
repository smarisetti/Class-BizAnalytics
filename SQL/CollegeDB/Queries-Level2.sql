# Tables Variables 
select s.sid, sname, gpa, a.cname, enrollment
from 	student s, college c, apply a
where	a.sid = s.sid and a.cname = c.cname;

# Get pairs of students who have same GPA
select 	s1.sid, s1.sname, s1.gpa, s2.sid, s2.sname, s2.gpa
from	student s1, student s2
where 	s1.gpa = s2.gpa; # and s1.sid <> s2.sid; or 
# and s1.sid < s2.sid;

# -------------
# Set Operators

select 	cname from college
union
select	sname from student;

# union operator eliminates duplicates
# If you want the duplicates
select 	cname as name from college
union all
select	sname as name from student
order by name;

# List students who applied to CS and EE
select 	sid from Apply where major = 'CS'
intersect
select	sid from Apply where major = 'EE';

select	distinct a1.sid
from apply a1, apply a2
where a1.sid = a2.sid and a1.major = 'CS' and a2.major = 'EE';

# List students who applied for CS but not EE
# Minus or Except operator

select sid from Apply where major = 'CS'
except
select sid from apply where major = 'EE';

select	distinct a1.sid
from apply a1, apply a2
where a1.sid = a2.sid and a1.major = 'CS' and a2.major <> 'EE';