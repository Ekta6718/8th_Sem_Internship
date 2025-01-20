--self join

select e1.emp_id,e1.emp_name,e2.emp_name as manager_name
from employee as e1
inner join employee as e2 
on e1.manager_id=e2.emp_id;

--print eployees name whose salary is greater than manager''s salary
select e1.emp_id,e1.emp_name
from employee as e1
inner join employee as e2 
on e1.manager_id=e2.emp_id
where e1.salary>e2.salary;

--string funtions 
--string agg is used to combine string you have to give two parameters one coloumn name and one by which you want to separate 
--aggregation functions which we were using were only for numbers except min and max which were used for 
--string also below are string funtions which are also used for aggregating strings their by only used with group by clause

--string_agg

select dept_id,STRING_AGG(emp_name,',') as list_of_employees
from employee
group by dept_id;


--if you want to sort data obtained after string_agg you have to use within group  order by col name 
select dept_id,STRING_AGG(emp_name,',') within group(order by emp_name)  as list_of_employees
from employee
group by dept_id;
-
--date functions 

--datepart is used to give only particular part of the coloumn you have to give two parmaeter one 
--what you want and other from which col u want 
--it should be in date time datatype
select order_id,order_date,datepart(year,order_Date) as year_col
from orders 

select order_id,order_date,datepart(month,order_Date) as year_col
from orders 

--datename is used to get the month in the datetime col 
select order_id,order_date,datepart(week,order_Date) as year_col,
datename(month,Order_Date) as month_name,
datename(year,Order_Date) as year_new,
datename(weekday,Order_Date) as week_name
from orders 

--adding something to date we have dateadd function

select order_id,order_date,
dateadd(day,5,order_date) as new_order_date,
dateadd(week,5,order_date) as new_order_week_date,
dateadd(day,-5,order_date) as new_order__date
from Orders;


--to find the diffrence between 

select order_id,order_date,ship_Date,
datediff(day,Order_Date,Ship_Date) as diff_date_days
from orders

/*,datepart(yy,order_date) as year_of_order_date
,datepart(month,order_date) as month_of_order_date
,datepart(week,order_date) as week_of_order_date
,DATENAME(month,order_date) as month_name
,DATENAME(weekday,order_date) as week_name*/
*/

--if profit >100
--then'low profit'
--else if profit>100
--then 'profit''
--else
--'end'
--but we dont have if else in sequel we have case statement
--instead of if we have whem 
--case statements are executed from top to bottom so if first condition is satisfied then it wont execute 
--next statement
--whatever you put in where clause can be used here
select order_id,profit,
case
when profit <100 then 'low profit'
when profit <250 then 'medium profit'
when profit<400 then 'high profit'
else 'very high profit'
end as profit_category
from orders

alter table  employee add dob date;
update employee set dob = dateadd(year,-1*emp_age,getdate())

--assingment 6
1)
select e1.emp_name,e2.emp_name as manager_name,DATEDIFF(day,e1.dob,e2.dob) as diff_of_age
from employee e1
inner join employee e2
on e1.manager_id=e2.emp_id
where e1.dob < e2.dob ;

--solution query 
select e1.emp_name,e2.emp_name as manager_name , DATEDIFF(day,e1.dob,e2.dob) as diff_in_age
from employee e1
inner join employee e2 on e1.manager_id=e2.emp_id
where DATEPART(year,e1.dob)< DATEPART(year,e2.dob)
;

2)
select  Sub_Category
from orders as o
left join returns as r
on o.Order_ID=r.Order_id
where r.Order_id is null and DATEPART(MONTH,Order_Date)=11  
group by Sub_Category;

 3)
select  order_id
from orders
group by Order_ID
having count(Order_ID)=1;

4)
select e2.emp_name as manager_name,STRING_AGG( e1.emp_name,',') within group(order by e1.salary desc) as list_of_emp_manager
from employee e1
inner join employee e2
on e1.manager_id=e2.emp_id 
group by e2.emp_name;

--solution query
select e2.emp_name as manager_name , string_agg(e1.emp_name,',') as emp_list
from employee e1
inner join employee e2 on e1.manager_id=e2.emp_id
group by e2.emp_name;


5)
select order_id,order_date,ship_date,datediff(day,Order_Date,Ship_Date) -2*DATEDIFF(week,Order_Date,Ship_Date) as no_of_buisness_days 
from orders;

6)
select category,sum(sales) as total_sales ,
sum( case 
when r.order_id is not null
then sales
end) as returned_sales
from Orders as o
left join returns as r
on o.Order_ID=r.Order_id
group by Category;

7)
select category,
sum(case
when order_date between '2019-01-01' and '2019-12-31'
then sales
end) as total_sales_2019,
sum(case
when order_date between '2020-01-01' and '2020-12-31'
then sales
end) as total_sales_2020
from orders
group by Category;

--solution query
select category,sum(case when datepart(year,order_date)=2019 then sales end) as total_sales_2019
,sum(case when datepart(year,order_date)=2020 then sales end) as total_sales_2020
from orders 
group by category

8)
select top 5 city ,avg(datediff(day,order_date,ship_date)) as avg_days
from orders
where Region='west'
group by City
order by avg_days desc;

9)
select e1.emp_name,e2.emp_name as manager_name,e3.emp_name as senior_manager
from employee e1
inner join employee e2 on e1.manager_id=e2.emp_id
inner join employee e3 on e2.manager_id=e3.emp_id;


