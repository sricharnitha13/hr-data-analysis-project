describe hrdataset_v14;
SELECT * FROM hrdataset_v14 LIMIT 10;
SELECT EmpID, COUNT(*) - COUNT(EmpID) AS Missing_Values 
FROM hrdataset_v14;
SELECT 
    'EmpID' AS Column_Name, COUNT(*) - COUNT(EmpID) AS Missing_Values
FROM hrdataset_v14
UNION ALL
SELECT 
    'Salary', COUNT(*) - COUNT(Salary)
FROM hrdataset_v14
UNION ALL
SELECT 
    'Department', COUNT(*) - COUNT(Department)
FROM hrdataset_v14;

-- as there is no missing values 
-- we directly going for cleaning the data
select EmpID,count(*)
from hrdataset_v14
group by EmpID
having count(*) >1;

DELETE e1 FROM hrdataset_v14 e1
INNER JOIN hrdataset_v14 e2 
ON e1.EmpID = e2.EmpID 
WHERE e1.ROWID > e2.ROWID;

ALTER TABLE hrdataset_v14 
MODIFY COLUMN DOB DATE;

ALTER TABLE hrdataset_v14 
MODIFY COLUMN DateofHire DATE;

ALTER TABLE hrdataset_v14 
MODIFY COLUMN DateofTermination DATE;

SET SQL_SAFE_UPDATES = 0;


UPDATE hrdataset_v14 
SET Sex = 'Male' WHERE Sex IN ('M', 'male', 'm');

UPDATE hrdataset_v14 
SET Sex = 'Female' WHERE Sex IN ('F', 'female', 'f');
select * from hrdataset_v14;

SELECT DISTINCT Sex FROM hrdataset_v14;
UPDATE hrdataset_v14 
SET Sex = TRIM(Sex);

-- we r triming because the value is not directly updating before
-- so have to trim and need to update
SELECT DISTINCT Sex FROM hrdataset_v14;
UPDATE hrdataset_v14 
SET Sex = 'Male' 
WHERE Sex IN ('Male ', 'male', 'm');

SELECT DISTINCT EmploymentStatus FROM hrdataset_v14;

UPDATE hrdataset_v14 
SET EmploymentStatus = 'Resigned' 
WHERE EmploymentStatus = 'Voluntarily Terminated';

UPDATE hrdataset_v14 
SET EmploymentStatus = 'Fired' 
WHERE EmploymentStatus = 'Terminated for Cause';

select * from hrdataset_v14 ;

UPDATE hrdataset_v14 
SET Sex = 'Male' 
WHERE Sex IN ('Male ', 'male', 'm');

SELECT * FROM hrdataset_v14 
WHERE STR_TO_DATE(DateofHire, '%m/%d/%Y') > CURDATE();

SELECT * FROM hrdataset_v14 WHERE Salary < 0 OR Salary > 1000000;


SELECT DISTINCT Department FROM hrdataset_v14;

SELECT COUNT(*) AS Total_Employees FROM hrdataset_v14; -- to know number of records

SELECT EmploymentStatus, COUNT(*) AS Employee_Count
FROM hrdataset_v14
GROUP BY EmploymentStatus
ORDER BY Employee_Count DESC;

select department,round(avg(salary),2) as avgsalary
from hrdataset_v14
group by department
order by avgsalary desc;

select empid,department,salary from hrdataset_v14
order by salary desc
limit 5;

select count(*) as lowsalaries from hrdataset_v14
where salary<5000;

select department,count(*) as employeecount
from hrdataset_v14
group by Department
order by employeecount desc;

select department,sex ,count(*) as employeecount
from hrdataset_v14
group by department,sex
order by employeecount;

select round(avg(salary),2) as avgsal
from hrdataset_v14
where EmploymentStatus!='Active';

SELECT Department, COUNT(*) AS Terminated_Count
FROM hrdataset_v14
WHERE EmploymentStatus != 'Active'
GROUP BY Department
ORDER BY Terminated_Count DESC;

SELECT Salary,
    CASE 
        WHEN Salary < 50000 THEN 'Low Salary'
        WHEN Salary BETWEEN 50000 AND 100000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS Salary_Category
FROM hrdataset_v14;

SELECT Department, Salary
FROM hrdataset_v14 e1
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM hrdataset_v14 e2 
    WHERE e1.Department = e2.Department
);

select * from hrdataset_v14;
