--Step 1 Cleaning the Data 
--1 Which column has the most NULL values? How many cells in that column are empty?

select 
sum(case when PassengerId is null then 1 else 0 END) Null_PassengerId_Count, 
sum(case when Survived is null then 1 else 0 END) Null_Survived_Count, 
sum(CASE WHEN Pclass is null THEN 1 ELSE 0 END) Null_Pclass_Count,
sum(CASE WHEN Name is null THEN 1 ELSE 0 END) Null_Name_Count,
sum(CASE WHEN Sex is null THEN 1 ELSE 0  END) Null_Sex_Count,
sum(CASE WHEN Age is null THEN 1 ELSE 0 END) Null_Age_Count, 
sum(CASE WHEN Sibsp is null THEN 1 ELSE  0 END) Null_Sibsp_Count, 
sum(CASE WHEN Parch is null THEN 1 ELSE  0 END) Null_Parch_Count, 
sum(CASE WHEN Ticket is null THEN 1 ELSE  0 END) Null_Ticket_Count, 
sum(CASE WHEN Fare is null THEN 1 ELSE  0 END) Null_Fare_Count,
sum(CASE WHEN Cabin is null THEN 1 ELSE  0 END) Null_Cabin_Count,
sum(CASE WHEN Embarked is null THEN 1 ELSE  0 END) Null_Embarked_Count
from titanic
--Based on 

--2 Delete all rows where Embarked is empty
DELETE FROM titanic where Embarked is null 
	--Check to see the Null columns were deleted 
	select count(*) from titanic 
	--889 

--3 Fill all empty cabins with ¯\(ツ)/¯
update titanic set cabin = '¯\(ツ)/¯' where cabin is NULL
	--Check to see whether cabins were updated 
	select count(*) from titanic where cabin = '¯\(ツ)/¯'
	--This returns 687 cabins with that shape 

 --Step 2: Feature extraction 
--1. There are two columns that pertain to how many family members are on the boat for a given person. Create a new column called FamilyCount which will be the sum of those two columns.
alter table titanic add column FamilyCount INT; 
update Titanic set FamilyCount = Sibsp + Parch; 

--2. Reverends have a special title in their name. Create a column called IsReverend: 1 if they're a preacher, 0 if they're not.
alter table titanic add column IsReverend INT;
--select * from titanic where name like '%Rev.%';
update titanic
set IsReverend = CASE WHEN Name like '%Rev.%' THEN 1 ELSE 0 END  
	--Check to see the groupings of colums in the newly added column 
	select IsReverend, count(*) from titanic 
	group by IsReverend 

--3. Create 3 columns: Embarked_C, Embarked_Q and Embarked_S. These columns will have 1's and 0's that correspond to the C, Q and S values in the Embarked column
alter table titanic add column Embarked_C INT;
alter table titanic add column Embarked_Q INT;
alter table titanic add column Embarked_S INT;

Update titanic set Embarked_C = CASE WHEN Embarked = 'C' THEN 1 ELSE 0 END 
Update titanic set Embarked_Q = CASE WHEN Embarked = 'Q' THEN 1 ELSE 0 END 
Update titanic set Embarked_S = CASE WHEN Embarked = 'S' THEN 1 ELSE 0 END 

--4. Do the same thing for Sex
alter table titanic add column Sex_Male INT;
alter table titanic add column Sex_Female INT;

Update titanic set Sex_Male = CASE WHEN Sex = 'male' THEN 1 ELSE 0 END 
Update titanic set Sex_Female = CASE WHEN Sex = 'female' THEN 1 ELSE 0 END 

--Step 3: Exploratory analysis

--3. Which gender fared the worst? What was their survivale rate? Answer this using the Sex dummy variables that you created in step 2.
SELECT cast (SUM(Survived) as float) / COUNT(*) FROM titanic WHERE Sex_Female = 1;  -- 0.74 
SELECT cast (SUM(Survived) as float) / COUNT(*) FROM titanic WHERE Sex_Male = 1;   --0.18 
--Based on the results it looks like the survival rate for males was worse than that of females 

SELECT AVG(Survived) FROM titanic WHERE Sex = 'female'
SELECT AVG(Survived) FROM titanic WHERE Sex = 'male'
--The results should be the same as above 

--4. What was the survival rate for each Pclass?
select Pclass, avg(Survived) 
from titanic 
group by Pclass

--5. Did any reverends survive? How many?
select * from titanic
where IsReverend = 1 and Survived = 1
	-- None of the Reverends Survived 

--6. What is the survival rate for cabins marked ¯\(ツ)/¯
select AVG(Survived) from titanic where cabin = '¯\(ツ)/¯'
 --0.299 ~~ 0.30 

--7. What is the survival rate for people whose Age is misisng?
select AVG(Survived) from titanic where AGE IS NULL 
--0.293

--8.What is the survival rate for each port of embarkation?
select  Embarked, AVG(Survived) 
from titanic 
group by Embarked 
--C: 0.55
--Q: 0.38
--S: 0.33

--9.What is the survival rate for children (under 12) in each Pclass?
select  Pclass, AVG(Survived) 
from titanic 
where age < 12 
group by Pclass
--1: 1 
--2: 1 
--3: 0.4615

--10 Did the captain of the ship survive? Is he on the list?
select * from titanic where name like '%Capt%';
--The Survived flag is 0. Hence the captain did not survive 

--11. --Of all the people that died, who had the most expensive ticket? How much did it cost?
select Max(CAST(Fare as Float)) 
from titanic 
where Survived = 0 

--Alternate Approach 

select (CAST(Fare as Float)) as C_Fare
from titanic 
where Survived = 0 
order by C_Fare DESC  LIMIT 1 

--The most expensive ticket among all people who died is $263

-- 12. Does having family on the boat help or hurt your chances of survival?
alter table titanic add column Family_Details TEXT;
Update titanic set Family_Details = CASE WHEN FamilyCount = 0 THEN 'Solo Traveller' ELSE 'With Family' END 

select Family_Details, AVG(Survived)
from titanic
group by Family_Details	

--Solo Traveller: 0.30 
--With Family: 0.50 
