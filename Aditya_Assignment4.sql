use Aditya;

create table studies 
(
PNAME char(40),
INSTITUTE char(35) ,
COURSE char(30),
COURSE_FEE bigint
)

create procedure stud
@PNAME char(40),
@Institute char(35),
@COURSE char(30),
@COURSE_FEE bigint
as 
insert into studies values(@PNAME,@Institute,@COURSE,@COURSE_FEE);

execute stud 'ALTAF','COIT','DCA',7200;

insert into studies values
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK',	'PRAGATHI',	'DCAP',	5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000);

select * from studies;


create table SOFTWARE
(
PNAME char(30),
TITLE char(40),
DEVELOPIN char(20),
SCOST float,
DCOST bigint,
SOLD int
)

insert into SOFTWARE values
('MARY','README','CPP',300,1200,84),
('ANAND','PARACHUTES','BASIC',399.95,6000,43),
('ANAND','VIDEO TITLING','PASCAL',7500,16000,9),
('JULIANA','INVENTORY','COBOL',3000,3500,0),
('KAMALA','PAYROLL PKG.','DBASE',9000,20000,7),
('MARY','FINANCIAL ACCT.','ORACLE',18000,85000,4),
('MARY','CODE GENERATOR','C',4500,20000,23),
('PATTRICK','README','CPP',300,1200,84),
('QADIR','BOMBS AWAY','ASSEMBLY',750,3000,11),
('QADIR','VACCINES','C',1900,3100,21),
('RAMESH','HOTEL MGMT','DBASE',13000,35000,4),
('RAMESH','DEAD LEE','PASCAL',599.95,4500,73),
('REMITHA','PC UTILITIES','C',725,5000,51),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500,6000,7),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100,75000,2),
('VIJAYA','TSR EDITOR','C',900,700,6);

select * from SOFTWARE;



create table PROGRAMMER
(PNAME char(30),
 DOB date,
 DOJ date,
 GENDER char(10),
 PROF1 char(30),
 PROF2 char(30),
 SALARY int
 )
 
 
 insert into PROGRAMMER values
('ALTAF','1964-Jul-02','1990-Nov-13','M','CLIPPER','COBOL',2800),	
('JULIANA','1960-Jan-31','1990-Apr-21','F','COBOL','DBASE',3000),	
('KAMALA','1968-Oct-30','1992-Jan-02','F','C','DBASE',2900),	
('MARY','1970-Jun-24','1991-Feb-01','F','CPP','ORACLE',4500),	
('NELSON','1985-Sep-11','1989-Oct-11','M','COBOL','DBASE',2500),	
('PATTRICK','1965-Nov-10','1990-Apr-21','M','PASCAL','CLIPPER',2800),	
('QADIR','1965-Aug-31','1991-Apr-21','M','ASSEMBLY','C',3000),	
('RAMESH','1967-May-03','1991-Feb-28','M','PASCAL','DBASE',3200),	
('REBECCA','1967-Jan-01','1990-Dec-01','F','BASIC','COBOL',2500),	
('REMITHA','1970-Apr-19','1993-Apr-20','F','C','ASSEMBLY',3600),	
('REVATHI','1969-Dec-02','1992-Jan-02','F','PASCAL','BASIC',3700),	
('VIJAYA','1965-Dec-14','1992-May-02','F','FOXPRO','C',3500);	


select * from PROGRAMMER;


-------------------------------------Queries------------------------------------------------

--1.Find out the selling cost AVG for packages developed in Pascal.
select AVG(SCOST)as Average_Selling_Cost from SOFTWARE where DEVELOPIN='Pascal';

--2.Display Names, Ages of all Programmers.
select PNAME,DATEDIFF(year,DOB,getdate())as Age from PROGRAMMER;
 
---3.Display the Names of those who have done the DAP Course.
select Pname from studies where course='DAP';

---4.Display the Names and Date of Births of all Programmers Born in January.
select Pname, DAY(DOB)as Birth_Date from PROGRAMMER where DATENAME(month,DOB)='January';

---5.What is the Highest Number of copies sold by a Package?
select MAX(SOLD)as Highest_no_Of_Copies_sold from SOFTWARE;

---6.Display lowest course Fee.
select min(course_fee)as lowest_course_Fee from studies;

---7.How many programmers done the PGDCA Course?
select count(*)as No_Of_Programmers from studies where course='PGDCA';
select * from studies

---8.How much revenue has been earned thru sales of Packages Developed in C.
select sum(dcost*sold) as Total_Revenue from software where developin='c';

---9.Display the Details of the Software Developed by Ramesh.
select Title, developin,scost,dcost,sold from software where Pname='Ramesh';

---10.How many Programmers Studied at Sabhari?
select count(*) as No_Of_Programmers from studies where institute='sabhari';

---11.	Display details of Packages whose sales crossed the 2000 Mark.
select * from software where (dcost*sold)>2000;

---12.Display the Details of Packages for which Development Cost have been recovered.
select * from software where (scost*sold)>=dcost;

---13.What is the cost of the costliest software development in Basic?
select max(dcost) as Cost from software where developin='Basic';

---14.How many Packages Developed in DBASE?
select count(*) as Total_dbase_Pacakages from software where developin='dbase';

---15.How many programmers studied in Pragathi?
select count(*) as Total_Programmers from studies where institute='Pragathi';

---16.How many Programmers Paid 5000 to 10000 for their course?
select count(Pname) as Total_programmers from studies where course_fee=5000 or course_fee=10000;

---17.What is AVG Course Fee
select avg(course_fee) as Avg_Course_Fee from studies;

---18.Display the details of the Programmers Knowing C.
select * from programmer where prof1='c' or prof2='c';

---19.	How many Programmers know either COBOL or PASCAL.
select count(*) as Total_Programmers from programmer where prof1 in ('cobol','Pascal') or prof2 in ('cobol','pascal');

---20.How many Programmers Don’t know PASCAL and C.
select count(*) as Total_programmers from programmer where prof1 not in('pascal','c') and prof2 not in ('pascal','c');

---21.How old is the Oldest Male Programmer.
select max(datediff(year,dob,getdate())) as Oldest_Age from programmer where gender='M';

---22.What is the AVG age of Female Programmers?
select Avg(datediff(year,dob,getdate())) as Avg_Female_Date from programmer where Gender='F';

--23.Calculate the Experience in Years for each Programmer and
-- Display with their names in Descending order.
select pname, datediff(year,doj,getdate()) as Experience_yrs from programmer order by pname desc;

---24.Who are the Programmers who celebrate their Birthday’s During the Current Month?
select * from programmer where month(dob)= month(getdate());

--25.How many Female Programmers are there?
select count(*)as Female_programmers from programmer where gender='F';

---26.What are the Languages studied by Male Programmers.
select distinct(prof1) as Languages from programmer where gender='m' union select distinct(prof2) from programmer where gender='m'; 

--27.	What is the AVG Salary?

---28.How many people draw salary 2000 to 4000?
select count(*)as no_Of_people from programmer where salary between 2000 and 4000; 

--29.Display the details of those who don’t know Clipper, COBOL or PASCAL.
select * from programmer where prof1 not in ('clipper','cobol','pascal') and prof2 not in ('clipper','cobol','pascal');

--30.Display the Cost of Package Developed By each Programmer.
SELECT PNAME,SUM(DCOST)AS COST_PACKAGE FROM SOFTWARE GROUP BY PNAME;

--31.Display the sales values of the Packages Developed by the each Programmer.
SELECT PNAME,SUM(scost*sold)AS Sales_Value FROM SOFTWARE GROUP BY PNAME;

---32.Display the Number of Packages sold by Each Programmer.
select pname,sum(sold)as No_Of_Packages_Sold from software group by pname;

---33.Display the sales cost of the packages Developed by each Programmer Language wise.
 select developin,sum(scost) as Sales_cost from software group by developin;
 
---34.Display each language name with AVG Development Cost,
-- AVG Selling Cost and AVG Price per Copy.
select developin, avg(dcost) as Avg_Dcost, avg(scost) as Avg_Scost , avg(sold) as Avg_Price_Per_Copy
from software group by developin;

select * from programmer
---35.Display each programmer’s name, costliest and cheapest Packages Developed 
--by him or her.
select pname , max(dcost) as costliest, min(dcost) as cheapest from software group by pname;

--36.Display each institute name with number of Courses, Average Cost per Course.
select * from studies
select institute, count(distinct(course)) as No_Of_Courses , Avg(course_fee) as Avg_Course_Cost
from studies group by institute;

--37.Display each institute Name with Number of Students.
select institute , count(pname) as No_Of_Students from studies group by institute;

--38.Display Names of Male and Female Programmers. Gender also.
select pname,gender from programmer order by gender desc;

select * from programmer
---39.Display the Name of Programmers and Their Packages.
select pname,title from software;

--40.Display the Number of Packages in Each Language Except C and C++.
select developin, count(title) as No_Of_Packages from software where developin 
not in ('c','cpp') group by developin;

---41.Display the Number of Packages in Each Language for which Development Cost is
-- less than 1000.
select developin, count(title) as No_Of_Packages from software where dcost<1000
 group by developin;

---42.Display AVG Difference between SCOST, DCOST for Each Package.
select title as Packages, avg(dcost-scost) as Avg_Diff from software group by title;

---43.Display the total SCOST, DCOST and amount to Be Recovered for each Programmer
-- for Those Whose Cost has not yet been Recovered.
select sum(scost) as Total_Scost, sum(dcost) as Total_Dcost , sum(dcost-(scost*sold))
as Recovered_Amnt from software group by pname having sum(dcost)>sum(scost*sold);

--44.Display Highest, Lowest and Average Salaries for those earning more than 2000.
select max(salary) as Highest, min(salary) as Lowest , Avg(salary)as Average from programmer
 where salary>2000;
 
 select * from programmer
---45.Who is the Highest Paid C Programmers?
select * from programmer where salary=(select max(salary) from programmer where 
prof1='c' or prof2='c');

---46.Who is the Highest Paid Female COBOL Programmer?
select * from programmer where salary=(select max(salary) from programmer where 
prof1='cobol' or prof2='cobol')and  gender='f';

select * from software

---47.Display the names of the highest paid programmers for each Language.
select s.pname , s.developin , p.salary from software as s inner join  programmer as p on s.pname=p.pname 
group by s.pname , s.developin , p.salary having p.salary=(select max(p.salary) programmmer);

---48.Who is the least experienced Programmer.
select * from programmer where datediff(year,doj,getdate())=(select min(datediff(year,doj,getdate())) from programmer);

---49.Who is the most experienced male programmer knowing PASCAL.
select * from programmer where gender='M' and (prof1='Pascal' or prof2='Pascal') and
 datediff(year,doj,getdate())=
(select max(datediff(year,doj,getdate())) from programmer);


---50.Which Language is known by only one Programmer?
select prof1 from programmer group by prof1 having prof1 not in (select prof2 from programmer) and count(prof1)=1 union select
prof2 from programmer group by prof2 having prof2 not in (select prof1 from programmer) and count(prof2)=1;

---51.	Who is the Above Programmer Referred in 50?
select pname from programmer where prof1 in(select prof1 from programmer group by prof1 having prof1 not in (select prof2 from programmer) and count(prof1)=1 union select
prof2 from programmer group by prof2 having prof2 not in (select prof1 from programmer) and count(prof2)=1)
or prof2 in (select prof1 from programmer group by prof1 having prof1 not in (select prof2 from programmer) and count(prof1)=1 union select
prof2 from programmer group by prof2 having prof2 not in (select prof1 from programmer) and count(prof2)=1)
;

---52.Who is the Youngest Programmer knowing DBASE?
select * from programmer where prof1='dbase' or prof2='dbase' and
datediff(year,dob,getdate())=(select min(datediff(year,dob,getdate())) from programmer);

---53.Which Female Programmer earning more than 3000 does not know C, C++,
-- ORACLE or DBASE?
select * from programmer where gender='f' and salary>3000 and
prof1 not in('c','cpp','dbase','oracle') and prof2 not in ('c','cpp','dbase','oracle');

select * from studies
---54.Which Institute has most number of Students?
select institute,count(*)as No_of_Students from studies group by institute order by count(*) desc ;

---55.What is the Costliest course?
select course from studies where course_fee=(select max(course_fee) from studies);

---56.Which course has been done by the most of the Students?
select course ,count(course)as No_of_Students from studies group by course order by count(course) desc;

---57.Which Institute conducts costliest course.
select institute from studies where course_fee=(select max(course_fee) from studies);


---58.Display the name of the Institute and Course, which has below AVG coursefee.
select institute, course from studies where course_fee<(select avg(course_fee) from studies);

---59.Display the names of the courses whose fees are within 1000 (+ or -) of the
-- Average Fee.
select course from studies where course_fee<(select AVG(course_fee)+1000 from studies)
and course_fee>(select AVG(course_fee)-1000 from studies);


---60.Which package has the Highest Developmentcost?
select title from SOFTWARE where DCOST=(select max(DCOST) from SOFTWARE);


----61.Which course has below AVG number ofStudents?
select course, count(*) as no_of_students from studies group by course
 having count(*)<(select COUNT(*) from studies);
 
---62.Which Package has the lowest selling cost?
select distinct(title) as package from SOFTWARE where SCOST=(select MIN(SCOST) from SOFTWARE);


---63.Who Developed the Package that has sold the least number of copies?
select pname from SOFTWARE where SOLD=(select MIN(SOLD) from SOFTWARE);


---64.Which language has used to develop the package, which has the highest sales
-- amount?
select developin from SOFTWARE where SCOST=(select MAX(SCOST) from SOFTWARE);


---65.How many copies of package that has the least difference between development
-- and selling cost were sold.
select sold from SOFTWARE where (DCOST-SCOST)=(select MIN(DCOST-SCOST) from SOFTWARE);

---66.Which is the costliest package developed in PASCAL.
select title from SOFTWARE where DCOST=(select MAX(DCOST) from SOFTWARE where DEVELOPIN='pascal');

---67.Which language was used to develop the most number of Packages.
select developin, COUNT(title) AS No_Of_Pacakages from SOFTWARE GROUP by DEVELOPIN 
order by COUNT(title) desc;

select * from SOFTWARE
---68.Which programmer has developed the highest number of Packages?
select pname , count(title) as NO_OF_PACAKAGES from SOFTWARE group by PNAME 
order by COUNT(title) desc; 
 
 
---69.Who is the Author of the Costliest Package?
select pname,title from SOFTWARE where DCOST=(select MAX(DCOST) from SOFTWARE);


---70.Display the names of the packages, which have sold less than the AVG number
-- of copies.
select title from SOFTWARE where SOLD < (select AVG(SOLD) from SOFTWARE);

--71.Who are the authors of the Packages, which have recovered more than double 
--the Development cost?
select pname as AUTHORS from SOFTWARE where (SCOST*SOLD)> 2*DCOST;

select * from SOFTWARE
---72.Display the programmer Name and the cheapest packages developed by them
-- in each language.
select pname,title from SOFTWARE where 
Dcost in (select MIN(Dcost)from SOFTWARE GROUP by developin);


---73.Display the language used by each programmer to develop the
-- Highest Selling and Lowest-selling package.
select pname, developin from SOFTWARE where sold IN (select MAX(sold) from PROGRAMMER GROUP by pname)
union
select pname, developin from SOFTWARE where sold IN (select Min(sold) from PROGRAMMER GROUP by pname)
;

---74.Who is the youngest male Programmer born in 1965?
select pname,dob from PROGRAMMER where DATEDIFF(YEAR,DOB,GETDATE())=
(select min(datediff(year,dob,getdate())) from programmer) and gender='m' ;

---75.Who is the oldest Female Programmer who joined in 1992?
select pname,datediff(year,dob,getdate())as Age from PROGRAMMER where year(DOJ)='1992'
and gender ='f';

---76.In which year was the most number of Programmers born.
select YEAR(dob)as Year,COUNT(pname)as NO_Of_Programmers from PROGRAMMER GROUP by YEAR(dob)
order by count(pname) desc;

---77.In which month did most number of programmers join?
select DATENAME(mm,doj) AS Joining_Month , COUNT(pname) as No_Of_Programmers
from PROGRAMMER GROUp by DATENAME(mm,doj) order by  COUNT(pname) desc;

---78.In which language are most of the programmers proficient.
select developin as langauage , COUNT(pname) As No_Of_Programmers from software
group by developin order by  COUNT(pname) desc;

SELECT prof1,prof2,COUNT(pname)AS PROGR FROM PROGRAMMER GROUP BY prof1,prof2
 ORDER BY PROGR DESC
 
---79.Who are the male programmers earning below the AVG salary of Female Programmers?
select pname,salary from programmer where salary<(select AVG(salary) from programmer where gender='f')and gender='m';


---80.Who are the Female Programmers earning more than the Highest Paid?
select pname from PROGRAMMER where SALARY>(select MAX(SALARY) from PROGRAMMER where gender='m') and gender='f';

---81.Which language has been stated as the proficiency by most of the Programmers?
select * from programmer

---82.Display the details of those who are drawing the same salary.
select p.pname,s.pname as same_sal from PROGRAMMER P 
inner join PROGRAMMER S on p.salary=s.salary
and s.pname<>p.pname; 

--83.Dsplay the details of the Software Developed by the Male Programmers Earning
-- More than 3000/-.
select * from SOFTWARE s
 join PROGRAMMER p 
on p.pname=s.pname
where p.GENDER='M' and p.SALARY>3000;

--84.Display the details of the packages developed in Pascal by the Female Programmers.
select * from SOFTWARE s 
join PROGRAMMER p 
on p.pname = s.pname 
where s.DEVELOPIN='Pascal' and p.GENDER='f';

--85.Display the details of the Programmers who joined before 1990.
select * from PROGRAMMER 
where YEAR(DOJ)<1990;

--86.Display the details of the Software Developed in C By female programmers of 
--Pragathi.
select * from SOFTWARE s 
join PROGRAMMER p 
on p.pname = s.pname 
join studies st on  st.PNAME=p.PNAME
where s.DEVELOPIN='C' and p.GENDER='f'
and st.institute='pragathi';


--87.Display the number of packages, No. of Copies Sold and sales value of each 
--programmer institute wise.

select st.institute,count(s.Title)as No_Of_packages,count(s.sold)No_of_copies,
sum(s.scost*s.sold) as sales
 from SOFTWARE s 
 join studies st on st.pname = s.pname 
 group by st.institute;
 
--88.Display the details of the software developed in DBASE by Male Programmers,
-- who belong to the institute in which most number of Programmers studied.

select * from software s
join programmer p on p.pname=s.pname
join studies st on st.pname=s.pname
where s.developin='Dbase'
and p.gender='m'
and st.institute =(select institute from(
select institute,
RANK() over(order by COUNT(*) desc)as Most_Prgm_studies
from studies  GROUP by institute)x
where x.Most_Prgm_studies=1);


--89.Display the details of the software Developed by the male programmers Born 
--before 1965 and female programmers born after 1975.
select * from PROGRAMMER p  
join SOFTWARE s
on s.PNAME=p.PNAME
where p.GENDER='m' and YEAR(p.DOB)<'1965'; 

--90.Display the details of the software that has developed in the language which is
-- neither the first nor the second proficiency of the programmers.
select * from SOFTWARE s 
join PROGRAMMER p on
p.PNAME=s.PNAME 
where s.DEVELOPIN<>p.PROF1 and s.DEVELOPIN<>p.PROF2;

---91.Display the details of the software developed by the male students of Sabhari.
select * from SOFTWARE s 
join PROGRAMMER p on p.PNAME=s.PNAME
join studies st on st.PNAME=s.PNAME
where p.GENDER='m' and st.institute='sabhari';

--92.Display the names of the programmers who have not developed any packages.
select p.pname from PROGRAMMER p 
where not exists (select 1 from SOFTWARE s
                   where s.PNAME = p.PNAME );

--93.What is the total cost of the Software developed by the programmers of Apple?
select sum(s.dcost)as Total_Cost from SOFTWARE s ,
studies st where st.PNAME=s.PNAME
and st.institute='Apple';

---94.Who are the programmers who joined on the same day?
select s.pname AS Prog_name , p.pname As Prog_name_same_day 
from PROGRAMMER s,PROGRAMMER p 
where  p.DOJ=s.DOJ and  p.pname<>s.pname;

select * from PROGRAMMER
--95.Who are the programmers who have the same Prof2?
select p.pname as Name1, s.pname as Name2 from PROGRAMMER p,
PROGRAMMER s where p.PROF2=s.PROF2 and p.PNAME<>s.PNAME;

--96.Display the total sales value of the software, institute wise.
select st.institute, SUM(s.scost*s.sold) AS Total_sales from
studies st, SOFTWARE s
where st.PNAME=s.PNAME 
GROUP by st.institute order by(SUM(s.scost*s.sold)) desc ;

select * from studies
--97.In which institute does the person who developed the costliest package studied.
select st.institute from studies st,
software s where s.pname=st.pname
group by st.institute,s.dcost 
having s.dcost=
(select MAX(dcost) from SOFTWARE);


--98.Which language listed in prof1, prof2 has not been used to develop any package.
select PROF1 from PROGRAMMER 
where (PROF1)not IN (select developin from SOFTWARE)
union
select PROF2 from PROGRAMMER 
where (PROF2)not IN (select developin from SOFTWARE);


---99.How much does the person who developed the highest selling package earn
-- and what course did HE/SHE undergo.

select p.salary, st.course from PROGRAMMER p join
studies st on st.pname=p.PNAME join SOFTWARE s on s.PNAME=p.PNAME
where p.pname=(
select pname from SOFTWARE 
where SCOST=(select MAX(scost) from SOFTWARE))
group by p.SALARY,st.course;


select * from SOFTWARE
--100.What is the AVG salary for those whose software sales is more than 50,000/-.
select AVG(p.salary)as Average_Salary from PROGRAMMER p,
SOFTWARE s 
where s.PNAME=p.PNAME and (s.SCOST*s.SOLD)>50000;


---101.How many packages were developed by students, who studied in institute that 
--charge the lowest course fee?
select COUNT(title) as No_of_Pacakges from 
SOFTWARE where PNAME  in (select pname from studies 
where course_fee=(select MIN(course_fee) from studies)
group by pname);


--102.How many packages were developed by the person who developed the cheapest
--package, where did HE/SHE study?
select s.pname,COUNT(s.Title) as NO_Of_Pacakges, st.institute from SOFTWARE s join
studies st on st.pname=s.pname where 
s.DCOST=(select MIN(dcost) from SOFTWARE) group by s.PNAME,st.institute;


---103.How many packages were developed by the female programmers earning more than the
-- highest paid male programmer?
select s.pname,COUNT(s.title)as No_Of_Pacakges from SOFTWARE s join 
PROGRAMMER p on p.PNAME=s.PNAME 
where p.GENDER='F' and p.SALARY>(select MAX(salary) from PROGRAMMER where GENDER='M')
group by s.pname;


---104. How many packages are developed by the most experienced programmer form BDPS.
select p.pname,COUNT(s.title) as No_Of_packages from PROGRAMMER p, SOFTWARE s,
studies st
where s.PNAME=p.PNAME and st.pname=p.PNAME
and st.institute='bdps' and DOJ=(select MIN(doj) from PROGRAMMER p, SOFTWARE s
where p.PNAME=s.PNAME)
group by p.PNAME;




--Q.105.List the programmers (form the software table) and the institutes they
-- studied,including those WHO DIDN'T develop any package.
select pname , institute from studies st
where pname not in (select PNAME from SOFTWARE);


--Q.106.List each PROF with the number of Programmers having that PROF and the
-- number of the packages in that PROF.



----107. List the programmer names (from the programmer table) and
-- No. Of Packages each has developed.
select p.pname, COUNT(s.title) as No_Of_Packages_Developed 
from PROGRAMMER p, SOFTWARE s
where p.PNAME=s.PNAME
group by p.PNAME order by COUNT(s.title) desc;