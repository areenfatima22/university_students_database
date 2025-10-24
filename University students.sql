SELECT * FROM user_records.university_students_dataset;
use user_records.university_students_dataset;
select count(StudentID) as 'Total students' 
fromuser_records. university_students_dataset;
select count(Name) as'Total students' 
from user_records.university_students_dataset;
# find average age
select avg(Age) as 'Average_age' 
from user_records.university_students_dataset;
# Round off 
select round(Age) as 'Average_age' 
from user_records.university_students_dataset;
# Now find sum 
select sum(Age) as 'Average_age' 
from user_records.university_students_dataset;
# Find minimum age 
select min(Age) as 'min_age' 
from user_records.university_students_dataset;
# To find maximum age
select max(Age) as 'max_age' 
from user_records.university_students_dataset;
select Major from user_records.university_students_dataset;
# to Count one-time use count distinct
select distinct Major from user_records.university_students_dataset;
select count(distinct Major) from user_records.university_students_dataset;
# Also find avg GPA , max and min GPA
select avg(GPA) as 'Average_GPA' 
from user_records.university_students_dataset;
select min(GPA) as 'min_GPA' 
from user_records.university_students_dataset;
select max(GPA) as 'max_GPA' 
from user_records.university_students_dataset;
# show number of male students who got major in mathematics 
select count(Major) from user_records.university_students_dataset
where major = 'Mathematics' and Gender = 'Male';
# Mximun GPA of physics students
select max(GPA) as 'max_GPA' 
from user_records.university_students_dataset
where Major = 'Physics';
# Minimum GPA of engg. female students 
select max(GPA) as 'max_GPA' 
from user_records.university_students_dataset
where Major = 'Engineering'
and Gender ='Female';
# Show maximum gpa of top 5 CS students
select * from user_records.university_students_dataset
where Major = 'Computer Science' 
order by GPA desc limit 5;
select count(*) from user_records.university_students_dataset
group by Major;
select Major ,count(*) from user_records.university_students_dataset
group by Major;
select Age ,count(*) from user_records.university_students_dataset
group by Age;
# Find the age of students using distinct 
select count(distinct Age) from user_records.university_students_dataset;
# Find total number of students group by gender
select Gender, count(*) as total_students
from user_records.university_students_dataset
group by Gender
order by total_students desc;
select Major from user_records.university_students_dataset
group by Major
order by GPA
 limit 5;
 select * from user_records.university_students_dataset
where Major = 'Engineering'
and Age = 25;
# Find average GPA and age of studends by Gender
select avg(GPA) from user_records.university_students_dataset
group by Age, Gender;
# List out females that enrolled after 2018.
select * from user_records.university_students_dataset
where Gender = 'Female'
and EnrollmentDate > '2018-01-01';
select Major ,count(*) from user_records.university_students_dataset
where Gender = 'Female'
and EnrollmentDate > '2018-01-01'
group by Major;
select avg(GPA) from user_records.university_students_dataset
where GPA >3
group by Major,GPA;
# Write a query to show each student’s name, GPA, and use IF() to display “Pass” if GPA ≥ 2.5, otherwise “Fail”.
select *,
if(GPA >= 3.5, 'Pass',
if(GPA >= 3.0, 'Pass',
if(GPA >= 2.5, 'Pass','Fail'))) as 'Grading' from user_records.university_students_dataset;
# 3. CASE – Enrollment Year Category Using CASE, categorize students into batches: Before 2021 → “Old Batch”2021–2023 → “Mid Batch” After 2023 → “New Batch”
select *,
CASE
    when year(EnrollmentDate) < 2021 then 'Old Batch'
    when year(EnrollmentDate) between 2021 and 2023 then 'Mid Batch'
    when year(EnrollmentDate) > 2023 then 'New Batch'
end as Enrollment_Category
from user_records.university_students_dataset;
# Using CASE and aggregation, count how many students fall into GPA categories:
# Excellent (3.5–4.0),Good (3.0–3.49),Average (2.0–2.99),Poor (below 2.0)
select *,
if(GPA >= 3.5, 'Excellent',
if(GPA >= 3.0, 'Good',
if(GPA >= 2.0, 'Average','Poor'))) as 'Grading' from user_records.university_students_dataset;
# IF() – Gender-Based GPA Adjustment, Use IF() to add 0.2 bonus GPA for female students (without modifying original data) and display their adjusted GPA.
# CASE with GROUP BY.
SELECT 
    CASE
        WHEN GPA BETWEEN 3.5 AND 4.0 THEN 'Excellent'
        WHEN GPA BETWEEN 3.0 AND 3.49 THEN 'Good'
        WHEN GPA BETWEEN 2.0 AND 2.99 THEN 'Average'
        ELSE 'Poor'
    END AS GPA_Category,
    COUNT(*) AS Total_Students
FROM user_records.university_students_dataset
GROUP BY GPA_Category;
