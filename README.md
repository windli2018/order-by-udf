# order-by-udf
How to customize order by mysql udf function?   

There are a few way to customize order in sql. Such as using a dictionary table,  using case when , using IF or Field function. Find more here https://www.designcise.com/web/tutorial/how-to-custom-sort-in-sql-order-by-clause  
But suppose you have a very complex field, it can not be simply ordered, for example, it's encrypted. Here I will demo you a way to sort on such field using mysql udf function.   
You can create an udf function to compare two values. It should return 1 if v1 > v2, return 0 if v1 == v2, return -1 if v1 < v2.  

DEMO:  
```
create table a(id int,f1 int,f2 int);
insert into a(id,f1,f2) values(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,4);

--origin sql
select id,f1,f2 from a order by f2;

--sort by custom_compare
select t1.id,t1.f1,t1.f2 from
(select id,f1,f2 from a) t1,(select f2 from a) t2
group by  t1.id,t1.f1,t1.f2 
order by sum(custom_compare(t1.f2,t2.f2));
```

MySQL UDF:  https://dev.mysql.com/doc/refman/8.0/en/adding-udf.html  