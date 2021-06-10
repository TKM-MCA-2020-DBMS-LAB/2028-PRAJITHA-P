use bank;

delimiter //

create function
account_count(customer_name varchar(20))
returns integer
begin
	declare a_count integer ;
	select count(*) into a_count
	from depositor
	where depositor.cust_name = customer_name;
	return a_count;
end  //
delimiter ;


select account_count("johnson");

select cust_name,account_count(cust_name) AS accounts
from customer;

select cust_name 
from customer
where account_countc(cust_name) > 1;


delimiter // 
create function check_balance(customer_name varchar(20))
returns integer  
begin
declare a_count integer;
declare total_balance NUMERIC (12,2);
select count(*) , sum(balance)
into a_count,total_balance
from depositor NATURAL JOIN account
where depositor.cust_name = customer_name;
end //

delimiter ;

drop function account_count;
drop function check_balance;