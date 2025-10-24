select * from user_records.university_students_dataset;
use user_records.university_students_dataset;
# 1:Display the names and major of all the students where GPA above 3.2 , age < 21
select * from user_records.university_students_dataset
where GPA > 3.2
and Age < 21;
# 2:List all students enrolled by GPA in descending order and students with same GPA,enter them by age asc.
select * from user_records.university_students_dataset
order by GPA desc , Age asc;
# 3:Find the average GPA of students in each major
select avg(Major) as 'Average_Major'
 from user_records.university_students_dataset;
 # 4:Find the average GPA and no. of students for each major but only intake major where more than 5 students are enrolled.
 select * from user_records.university_students_dataset
 having
 # 5:List all students who enrolled before 2022-01-01 and GPA greater than Avg(GPA) of all students
  select Name,Age,Gender from user_records.university_students_dataset
  where EnrollmentDate < '2022-01-01'
  and GPA > (select avg(GPA) from user_records.university_students_dataset);
# 6:Group students by gender and show total students, average GPA and minimum GPA
select Gender, count(*),avg(GPA),min(GPA)
from user_records.university_students_dataset
group by Gender
having avg(GPA) > 3.0;
# 7:Find all students whose GPA is higher than average GPA of their major.
select Name,GPA,Major
from user_records.university_students_dataset s
where GPA > (select avg(GPA) from user_records.university_students_dataset where Major = s.Major);
#  8:Find the top 3 majors with highest no. of students sorted by count desending.
select Major,count(StudentID) from user_records.university_students_dataset
group by Major
order by count(StudentID) desc
limit 3;
# 9: Display the 5 recently enrolled students(based on EnrollmentDate along with names , majors and GPAs
select * from user_records.university_students_dataset
order by EnrollemntDate desc
limit 5;
# 10. Find the youngest students and display their name , age nad majors.
select Name,Major,Age from user_records.university_students_dataset
where (select min(Age) from user_records.university_students_dataset);
# 11.Use Conditional Statement to show grades of all students according to GPA like gpa > 3.5 will get grade A ,gpa > 3.0 will get grade B ,gpa > 2.5 will get grade C othervise F. 
select *,
if(GPA >= 3.5, 'A',
if(GPA >= 3.0, 'B',
if(GPA >= 2.5, 'C','F'))) as 'Grades' from user_records.university_students_dataset;
# 12. Use CASE statement to show grades of all students according to GPA
select *,
CASE
when GPA >= 3.5 then 'A'
when GPA >= 3.0 then 'B'
when GPA >= 2.5 then 'C'
else 'F'
end as 'Grading'
from user_records.university_students_dataset;
#12(b) CASE – Enrollment Year Category Using CASE, categorize students into batches: Before 2021 → “Old Batch”2021–2023 → “Mid Batch” After 2023 → “New Batch”
select *,
CASE
    when year(EnrollmentDate) < 2021 then 'Old Batch'
    when year(EnrollmentDate) between 2021 and 2023 then 'Mid Batch'
    when year(EnrollmentDate) > 2023 then 'New Batch'
end as Enrollment_Category
from user_records.university_students_dataset;