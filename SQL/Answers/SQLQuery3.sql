--to get the distint records 
select distinct Ship_Mode from orders;
select distinct Ship_Mode,Segment from orders;
--if we will use * then it will check that whole 2 row are same or not 
--use can use where clause to filter the data\

select top 5* from Orders where Order_Date < '2020-12-08'
order by Order_Date desc;

--you can use between to give certain range 
select top 5 * from Orders
where Order_Date between '2020-01-01' and '2020-12-31';

--you can use in which is similar to or 

select top 5* from orders 
where Ship_Mode in ('first class','same day');

select top 5* from orders 
where Ship_Mode not in ('first class','same day');
--it will execute according to the ascii value with first letter if same then next letter is checked 
select top 5* from orders 
where Ship_Mode >'first class';

--cast is a function which is used to convert datetime to date 

select cast(order_date as date) from orders;

select order_date from orders;

-- if you want to add the new col which will perform the operation you can simply write comma and gon ahead
select Profit,sales,profit/sales as ratio
from orders;

--you can also use built in functions for fetching the current date and time 

select profit,getdate() as curr_date
from orders;

--pattern matching using like operartor --wildcard operator
--% means any numbers of character
-- _ means a single character
select order_date,customer_name
from orders
where Customer_Name like 'C%';

--by default mysql is case insentitive but if ur data is case sensitive
--you can simply use upper function which will convert everthing to upper case 
select upper(customer_name)
from orders
where upper(customer_name) like 'A%A';
--2 nd charecter should be c and then anything
select order_date,customer_name
from orders
where Customer_Name like '__C%';

--% means 0 or more charecter while _ means 1 charecter

--[abl] means that from where bracket starts it can either have a or b or l any of one then it will fetch records
select order_date,customer_name
from orders
where Customer_Name like 'C[al]%';

--^ means negation second charecter should not be a or l remaining will be fetched
select order_date,customer_name
from orders
where Customer_Name like 'C[^al]%';

--[a-c] it can fetch anything which range between a to c 
select order_date,customer_name
from orders
where Customer_Name like 'C[a-v]%';

--assingments of day 3
select * from orders;
1)
select * from Orders
where Customer_Name like '_a_d%';

2)
select * from orders
where Order_Date between '2020-12-01' and '2020-12-31';

3)
select * from orders
where Ship_Mode not in('standard class','first class') and Ship_Date >'2020-11-30';

4)
select * from orders
where Customer_Name not like 'a%n';

--ama je records a thi start thai ne bija thi end e nai ae ane je n thi end thai but bija thi chalu thai e bhi nai ave  
select * from orders
where Customer_Name like '[^a]%[^n]';

5)
select * from orders
where profit <0;

6)
select * from orders 
where quantity<3 or profit =0;

7)
select * from orders
where Region='south' and Discount >0;

8)
select top 5* from orders
where Category='furniture'
order by sales desc;

9)
select * from orders
where Category in('technology','furniture') and Order_Date between '2020-01-01' and '2020-12-31';

10)
select * from orders 
where Order_Date between '2020-01-01' and '2020-12-31' and Ship_Date between '2021-01-01' and '2021-12-31';




