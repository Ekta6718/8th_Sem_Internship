--while setting value to null in update statement u can use = but 
--with where clause u cannot use null u have to use is null

--update Orders
--set city=null;
--filtering null values 
--null cannot be compared but can be set thats why whiel setting null value it worked 
--while comparing in where statement in wont work 
select * from orders
where city is null  ;

select * from orders
where city is not null ;

--aggregation fumnctions
--count,sum,avg,min,max
--generally aggeregate functions are used with group by

select Region,count(*) as totalrows,
sum(sales) as total_sales,
max(profit) as maxi,
min(profit) as mini,
avg(sales) as saless
from orders
group by Region;

--below query will throw an error as db will get confuse as we have 1 region for each 
--region we have diffrent values so with group by we use aggregated values otherwise it 
--will throw an error 
select region,category,sum(profit)
from orders 
group by Region;

--u can filter coloumns with having but that would be costly so always filter coloumns with where 
--then group them together having is used to filter aggregated data 

select sub_category,sum(sales) as total_sales
from Orders
where region='south'
group by sub_category
having sum(sales)>10000;
--order of execution behind in db is from,where,group by,having,select,orderby,top
--instead of count(*),their can be witten count(1) or anything inside the brackets but at the end it will count 
--no. of rows only
--count function doesnot count null values

--assingent 4

1)
update orders
set city=null
where Order_ID in ('CA-2020-161389' ,'US-2021-156909');

select city from Orders
where Order_ID='US-2021-156909';

2)
select * from Orders
where city is null;

3)
select category,sum(profit) as total_profit,
min(order_date) as first_orderdate,
max(order_date) as latest_orderdate
from orders
group by category;

4)
select sub_category
from Orders
group by Sub_Category
having avg(profit)> max(profit)/2;

5)
create table exams
( 
   student_id int,
   subject varchar(20), 
   marks int
  );


insert into exams(student_id,subject,marks)
values(1,'Chemistry',91),
(1,'Physics',91),
(1,'Maths',92),
(2,'Chemistry',80),
(2,'Physics',90),
(3,'Chemistry',80),
(3,'Maths',80),
(4,'Chemistry',71),
(4,'Physics',54),
(5,'Chemistry',79);

select * from exams;

select student_id 
from exams
where subject in('physics','chemistry')
group by student_id
having max(marks)=sum(marks)/2;

--or 
select student_id,marks
from exams
where subject in('physics','chemistry')
group by student_id,marks
having count(*)=2;

6)
select category,count(distinct Product_ID) as total_products
from Orders
group by Category;

select * from orders
7)
select top 5 sub_category,sum(quantity) as total_quantity
from Orders
where Region='west'
group by Sub_Category
order by total_quantity desc;

8)
select region,ship_mode,sum(sales) as total_sales
from orders 
where Order_Date between '2020-010-01' and '2020-12-31'
group by Region,Ship_Mode;

9)select * from orders where Region='south';

select * from employee;









