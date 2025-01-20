--string funtions
--len gives you length of string including spaces
--left and right string funtions are used to print strings with gien limit
--substring has 3 parameters first coloumn name, from where it should start,how much length you should take
--charindex gives index of the specified character , 0 means character not present 
--conacte to join strings
--replace 3 parameters col name what to replace 3 rd with whom to replace
--transalate does one to one mapping like in below wherever it will see c it will replace with p but if it would be replace 
--it would check where whole ca is their and change it to pb
--reverse is used to revese the whole thing 
--trim is used to remove starting and ending space but not between space 
select order_id,customer_name,
trim(customer_name ) as trimmed,
trim(' Ekta Sharma' ) as new_trimmed,
REVERSE(customer_name) as rev,
REPLACE(order_id,'CA','PB') as new_order_id,
REPLACE(Customer_Name,' ','') as new_customer_name,
translate(Customer_Name,'CA','PB') as translated_order_id,
len(customer_name) as name_length,
left(customer_name,4) as name_4,
right(customer_name,4) as name_5,
SUBSTRING(customer_name,4,5) as name_45,
CHARINDEX('g',Customer_Name) as index_nummber,
CONCAT(order_id,' ',Customer_Name) as concated ,
Order_ID+Customer_Name as direct
from orders; 

SELECT * FROM ORDERS;

SELECT * FROM 


--null handling functions

--isnull is used to change value to null to what you want to give 
--it has 2 parameters one col name, 2 what you want to write
--coalesce is similar to isnull but we can give multiple arguments and it will check if city is null then goes to state
--if state is not null it will give value of state if state null then check next and goes on till end from left to right 
--coalesce works with all datatype
select order_id,city,ISNULL(city,'un') as null_replaced,
coalesce(city,state,region,'unk') as checked
from orders
where city is null;


--cast is used to change datatype ,col name as dt
--round to roundoff ,col name, how mant places to roundoff
select top 5 order_id,sales,cast(sales as int) as change_dt,
round(sales,1) as rounded
from Orders;


--set queries/operators
--union all,union 
--in join and union their is diffrenece in join we use common col with same data and then join the col with the first table which are not prsent
--while in union we add the two tables directly without commom col 

create table orders_west
(
order_id int,
region varchar(10),
sales int
);


create table orders_east
(
order_id int,
region varchar(10),
sales int
);

insert into orders_west values(1,'west',100),(2,'west',200);
insert into orders_east values(3,'east',100),(4,'east',300);
insert into orders_west values(3,'east',100)
insert into orders_west values(1,'west',100)

delete from orders_west;
--to do unionall no of col in both ths tables must be same and datatypes should be compatible
select * from orders_west
union all
select * from orders_east;

--union will only give distinct records irrespective of tables
select * from orders_west
union 
select * from orders_east;

--intersect to give the common records and removing duplicates as well
select * from orders_west
intersect
select * from orders_east;

--minus/except is used to find record which is only present in first table but wont show the common records of both table
--union all will give you duplicates rest all set operator will remove duplicates for you 
select * from orders_west
--except
select * from orders_east;
--you can apply this set operators on same table itself 
--null can also be considered in intersect

--assingment 7

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

1)
with all_teams as 
(select * from orders 
case 


select * from icc_world_cup;

alter table icc_world_cup
drop column no_of_matches_played;


