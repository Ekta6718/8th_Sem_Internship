select * from orders;
--we can change the particular coloumn's name/table or their datatype by alter command
--it is a ddl command  'alter'
--changing datatype of existing col
--while changing take care that datatype should be compatible means if col alresdy have data or not 
--then its should be changed in such a manner that it should not affect 

alter table amazon_orders alter column order_date datetime;

select * from amazon_orders;
--alter will always add coloumns to end if you want to add in middle you need to change the main table 
alter table amazon_orders add username varchar(20);

--null doesn't mean it is 0 it means at that particular time you dont know the value so it give it a null 
--to drop the coloumn using alter helps to drop a specific col
alter table amazon_orders drop column username ;

--varchar can accomodate anything it takes string so numbers alphabet anything which falls in string 

--adding constraints
drop table abc;
create table abc
( 
   order_id int,--null constraint--unique constraint
   names varchar(20),
   order_date date,
   product_name varchar(20),
   total_price decimal(6,2),
   payment_method varchar(20) check (payment_method in('upi','credit card')),--check constraint
   category varchar(20) default 'mans wear'
   --u an gie primary key at the end
   primary key(order_id,names)--primary key is a constraint and unique +not null
   --we can have only one primary key in table but unique key can be multiples
);
--you cannot use default with single statements you hae to use it with multiple statements
--insert into abc values(2,'2020-12-01','milk',40,'upi')
--above will throw an error 
insert into abc (order_id,names,order_date,product_name,payment_method)
values(1,'p1','2020-12-01','milk','upi'),
       (2,'p2','2020-12-02','biscuits','credit card');

 select * from abc;

 --delete with filter command i.e where 
 delete from abc where order_id =1;

 --update 
 update abc
 set total_price=10;