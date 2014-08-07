# Join Operators

# Natural Join
select	distinct sname, major
from	student, apply
where	student.sid = apply.sid;

# Inner join or Theta join
select 	distinct sname, major
from 	student INNER JOIN apply
ON 		student.sid = apply.sid;

select 	sname, cname
from	student RIGHT OUTER JOIN apply
ON 	student.sid = apply.sid