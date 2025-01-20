--joins 
select * from returns;

--inner join 
select o.Order_ID,r.return_reason
from orders as o
inner join returns as r
on o.Order_ID=r.order_id;

--gives all the data present in orders table 
select o.*
from orders as o
inner join returns as r
on o.Order_ID=r.order_id;

--gives all the data present in returns table 
select r.*
from orders as o
inner join returns as r
on o.Order_ID=r.order_id;

--left join
select o.Order_ID,r.return_reason
from orders as o
left join returns as r
on o.Order_ID=r.order_id;

--only dispaly those records which are present in left table but not right table 
--or only show those records which are not returned 

select o.Order_ID,r.return_reason
from orders as o
left join returns as r
on o.Order_ID=r.order_id
where r.return_reason is null;

	create table employee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);


insert into employee values(1,'Ankit',100,10000,4,39);
insert into employee values(2,'Mohit',100,15000,5,48);
insert into employee values(3,'Vikas',100,10000,4,37);
insert into employee values(4,'Rohit',100,5000,2,16);
insert into employee values(5,'Mudit',200,12000,6,55);
insert into employee values(6,'Agam',200,12000,2,14);
insert into employee values(7,'Sanjay',200,9000,2,13);
insert into employee values(8,'Ashish',200,5000,2,12);
insert into employee values(9,'Mukesh',300,6000,6,51);
insert into employee values(10,'Rakesh',500,7000,6,50);


create table dept(
    dep_id int,
    dep_name varchar(20)
);
insert into dept values(100,'Analytics');
insert into dept values(200,'IT');
insert into dept values(300,'HR');
insert into dept values(400,'Text Analytics');


select * from dept;
select * from employee;

--cross join 
select * from
employee,dept;	

--it will behave as cross join when u enter true condition   
select * from 
employee
inner join dept on 100=100;

--u dont need right join in real life u need to swap tables in left join

--full outer join means first table will fully join with second table and the col which wont be their will be null
select e.emp_id,e.emp_name,e.dept_id,d.dep_name from 
employee as e
full outer join dept as d
on e.dept_id=d.dep_id;

select * from dept;


create table people
(
manager varchar(20),
region varchar(10)
)

insert into people
values ('Ankit','West')
,('Deepak','East')
,('Vishal','Central')
,('Sanjay','South');

select * from people

select o.order_id,o.product_name,r.return_reason,p.manager
from Orders as o
inner join returns as r on o.Order_ID=r.Order_id
inner join people as p on o.Region=p.region;

--assingent 5

1)
select Region,count(distinct o.order_id) as return_orders
from orders as o
inner join returns as r
on o.Order_ID=r.Order_id
group by Region;

2)
select category,sum(o.Sales) as total_sales
from orders as o
left join returns as r
on o.Order_ID=r.Order_id
where return_reason is null--u can also write order_id is null instead of return_reason
group by Category;

3)
select d.dep_name,avg(e.salary) as avg_salary
from employee as e
inner join dept as d
on e.dept_id=d.dep_id
group by dep_name;

4)
select d.dep_name
from employee as e
inner join dept as d
on e.dept_id=d.dep_id
group by d.dep_name
having count(d.dep_id)=count(distinct e.salary)	;

5)
select sub_category
from orders as o
inner join returns as r
on o.Order_ID=r.Order_id
group by  Sub_Category
having count(distinct return_reason)=3;

6)
select o.City
from orders as o
left join returns as r
on o.Order_ID=r.Order_id
group by City
having count(distinct r.Order_id)=0;

7)

select top 3 Sub_category ,sum(o.sales) as total_sales
from Orders as o
inner join returns as r 
on o.Order_ID=r.Order_id
where o.Region='east'
group by Sub_Category
order by total_sales desc;

8)
--doubt
select d.dep_name
from dept as d
left join employee as e
on e.dept_id=d.dep_id
where e.dept_id is null
group by dep_name;

9)
select e.emp_name
from employee as e
left join dept as d
on e.dept_id=d.dep_id
where d.dep_id is null



	select * from employee;

	select * from dept;



