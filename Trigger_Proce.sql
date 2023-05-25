/*We can create trigger as well as Procedure function*/
delimiter $$
create trigger ins_t
before insert on student_books
for each row
begin 
insert into book_fine(rno,bid,status)values(new.rno,new.bid,'I');
end $$
delimiter ;  

/*
mysql> select * from student_books;
+------+------+------------+------------+
| rno  | bid  | doi        | dor        |
+------+------+------------+------------+
|    1 |  101 | 2023-01-10 | 2023-02-10 |
|    2 |  202 | 2023-07-09 | 2023-08-09 |
|    3 |  103 | 2023-01-02 | 2023-01-09 |
+------+------+------------+------------+
3 rows in set (0.00 sec)

mysql> select * from book_fine;
+------+------+--------+------+------+
| rno  | bid  | status | amt  | mark |
+------+------+--------+------+------+
|    1 |  101 | R      |  155 | NULL |
|    2 |  202 | R      |  155 | NULL |
|    3 |  103 | R      |    0 | NULL |
+------+------+--------+------+------+
3 rows in set (0.00 sec)

mysql> insert into student_books(rno,bid,doi) values(4,104,'2023-06-10');
Query OK, 1 row affected (0.07 sec)

mysql> select * from book_fine;
+------+------+--------+------+------+
| rno  | bid  | status | amt  | mark |
+------+------+--------+------+------+
|    1 |  101 | R      |  155 | NULL |
|    2 |  202 | R      |  155 | NULL |
|    3 |  103 | R      |    0 | NULL |
|    4 |  104 | I      | NULL | NULL |
+------+------+--------+------+------+
4 rows in set (0.00 sec)

mysql> select * from book_fine;
+------+------+--------+------+------+
| rno  | bid  | status | amt  | mark |
+------+------+--------+------+------+
|    1 |  101 | R      |  155 | NULL |
|    2 |  202 | R      |  155 | NULL |
|    3 |  103 | R      |    0 | NULL |
|    4 |  104 | I      | NULL | NULL |
+------+------+--------+------+------+
4 rows in set (0.00 sec)

*/               
Delimiter //
create procedure fine_s0(in rn int,in b int,in dr date) 
begin
declare i date;
declare temp int;
update student_books set dor=dr 
where rno=rn and bid=b;
select doi into i from student_books where rno=rn and bid=b;
set temp=datediff(dr,i);
if (temp>=15 and temp<=30) then
update books_fine set amt=5*temp,status='r' where rno=rn and bid=b;
elseif temp>=30 and temp<=50 then
update books_fine set amt=10*temp,status='r' where rno=rn and bid=b;
elseif temp>50 then
update books_fine set amt=20*temp,status='r' where rno=rn and bid=b;
end if;
end //
delimiter ;

/*
 mysql> select * from books_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    1 |  101 | R      |    0 |
|    2 |  102 | R      |  170 |
|    3 |  103 | R      |  195 |
|    4 |  104 | I      |    0 |
|    5 |  105 | I      |    0 |
+------+------+--------+------+
5 rows in set (0.00 sec)

mysql> call fine_s0(5,105,'2023-06-30');
Query OK, 1 row affected (0.00 sec)

mysql> select * from books_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    1 |  101 | R      |    0 |
|    2 |  102 | R      |  170 |
|    3 |  103 | R      |  195 |
|    4 |  104 | I      |    0 |
|    5 |  105 | R      |  155 |
+------+------+--------+------+
5 rows in set (0.00 sec)

mysql> call fine_s0(4,104,'2023-06-30');
Query OK, 1 row affected (0.00 sec)

mysql> select * from books_fine;
+------+------+--------+------+
| rno  | bid  | status | amt  |
+------+------+--------+------+
|    1 |  101 | R      |    0 |
|    2 |  102 | R      |  170 |
|    3 |  103 | R      |  195 |
|    4 |  104 | R      |  490 |
|    5 |  105 | R      |  155 |
+------+------+--------+------+
5 rows in set (0.00 sec)
 
*/
