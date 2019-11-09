create table a(id int,f1 int,f2 int);
insert into a(id,f1,f2) values(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,4);

select id,f1,f2 from a order by f2;

select t1.id,t1.f1,t1.f2 from
(select id,f1,f2 from a) t1,(select f2 from a) t2
group by  t1.id,t1.f1,t1.f2 
order by sum(custom_compare(t1.f2,t2.f2))
