select top 5* from orders;
--creating table in another schema /folder and using dot 
create table sales.test
(id int,
 name varchar(10),
 age int
   );

   insert into sales.test values(1,'ekta',21);
   insert into sales.test values(2,'dhruv',21);

   select * from sales.test;

   create table hr.test
  ( id int,
    name varchar(10),
    age int
   );
   --we can copy whole data of one table to another by using 
   --below commands but only condition is both should have same number of coloumns and rows 
   --structure of both table should be same 
   insert into hr.test
   select * from sales.test;
  



   select * from orders; 
   select * from hr.test;





