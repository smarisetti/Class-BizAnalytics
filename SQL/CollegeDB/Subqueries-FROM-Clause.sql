# Query: List students who scaled GPA changed more than 1
SELECT	sid, sname, GPA, GPA*(sizeHS/1000.0) as scaledGPA
FROM	student
WHERE	GPA*(sizeHS/1000.0) - GPA > 1.0 or
		GPA - GPA*(sizeHS/1000.0) > 1.0;

# You see that we are reusing the scaled GPA calculation 
# thrice which is not efficient. See the rewritten query below

SELECT	sid, sname, GPA, GPA*(sizeHS/1000.0) as scaledGPA
FROM	student
WHERE	abs(GPA*(sizeHS/1000.0) - GPA) > 1.0;

# Now you get the same output.
# But the query is still complex. See modified query below.

SELECT	*
FROM	(SELECT	sid, sname, GPA, GPA*(sizeHS/1000.0) as scaledGPA
FROM	student) G
WHERE	abs(G.scaledGPA - GPA) > 1.0

# You get the same output and the query is simpler.
