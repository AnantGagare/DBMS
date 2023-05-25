
/* cursor program ti increment rating  of boat sailors*/

delimiter //
create procedure proc_increment1()
begin
	declare vfinished int default 0;
	declare si int;
	declare n varchar(25);
	declare sr int(2);
	
declare emp_cursor cursor for select * from sailors;
declare continue handler for not found set vfinished=1;

open emp_cursor;
getdata:loop
     fetch  emp_cursor into si,n,sr;
     if vfinished=1 then
     leave getdata;
     end if;
    update sailors set srating=srating+2 ;
    end loop getdata;
    close emp_cursor;
    end //
delimiter ;

/*
ysql> select * from sailors;
+------+--------+---------+
| sid  | sname  | srating |
+------+--------+---------+
|    1 | Anant   |      14 |
|    2 | abhi   |      19 |
+------+--------+---------+
2 rows in set (0.00 sec)

mysql> call porc_increment1();
ERROR 1305 (42000): PROCEDURE HRS.porc_increment1 does not exist
mysql> call proc_increment1();
Query OK, 0 rows affected (0.14 sec)

mysql> select * from sailors;
+------+--------+---------+
| sid  | sname  | srating |
+------+--------+---------+
|    1 | Anant  |      16 |
|    2 | abhi   |      21 |
+------+--------+---------+
2 rows in set (0.00 sec)

*/

Delimiter //
create trigger del_record
after delete on info
for each row
begin
call store_record();
end //
Delimiter ;

Delimiter //
create procedure store_record()
begin
declare vfinshined int default 0;
declare i int;
declare n varchar(10);
declare s float;
declare st_cursor cursor for select * from info;
declare continue handler for not found set vfinshined=1;
open st_cursor;
setdata:loop
     fetch st_cursor into i,n,s;
     if vfinshined=1 then
	 leave setdata;
	 end if;
     insert into dump_info values(i,n,s);
     end loop setdata;
     close st_cursor;
end //
delimiter ;

/*
  mysql> select * from info;
+-----+----------+---------+
| eid | ename    | esal    |
+-----+----------+---------+
|   1 | Anant    |  345.34 |
|   2 | Chetan   | 2323.43 |
|   3 | Om       | 3445.45 |
|   4 | Kaushal  |     456 |
|   5 | yash     | 2334.53 |
|   6 | manoj    |    2345 |
|   7 | tushar   |     345 |
|   8 | abhi     | 2345.65 |
|   9 | shunbham |    1094 |
|  10 | shoam    |    4594 |
+-----+----------+---------+
10 rows in set (0.00 sec)

mysql> create table dump_info(eid int(2),ename varchar(10),esal float);
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> select * from dump_info;
Empty set (0.00 sec)

mysql> delete from info;
Query OK, 9 rows affected (0.00 sec)

mysql> select * from dump_info;
+------+----------+---------+
| eid  | ename    | esal    |
+------+----------+---------+
|    1 | Anant    |  345.34 |
|    2 | Chetan   | 2323.43 |
|    3 | Om       | 3445.45 |
|    4 | kaushal  |     456 |
|    5 | ysah     | 2334.53 |
|    6 | manoj    |    2345 |
|    7 | tushar   |     345 |
|    8 | abhi     | 2345.65 |
|    9 | shunbham |    1094 |
+------+----------+---------+
9 rows in set (0.00 sec)

mysql> select * from info;
Empty set (0.00 sec)
*/
