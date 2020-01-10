# 1.Query the existence of 1 course
select * from course where id = 1;

# 2.Query the presence of both 1 and 2 courses
select * from course where id = 1 or id = 2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select student.id, student.name, avg(student_course.score) from student, student_course
where student.id = student_course.studentId
group by student.id
having avg(student_course.score) >= 60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student s1
where s1.id not in 
	(select distinct(s2.id) from student s2, student_course
    where s2.id = student_course.studentId);

# 5.Query all SQL with grades
select * from student, student_course
where student.id = student_course.studentId;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * from student, student_course
where student.id = student_course.studentId and student.Id = 1 and student_course.courseId = 2

# 7.Retrieve 1 student score with less than 60 scores in descending order
select * from 
	(select * from student_course
    group by studentId 
    having score < 60
    limit 1) t1
inner join student_course t2
on t1.studentId = t2.studentId
order by t1.score desc

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select courseId, avg(score) as avg_score from student_course 
group by courseId 
order by avg_score desc, courseId asc

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select s.name, sc.score from student s, course c, student_course sc
where s.id = sc.studentId and c.id = sc.courseId and c.name = "Math" and sc.score < 60


