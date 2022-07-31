use sales 

select * from sales1

DELIMITER $$
create function add_to_col3(a INT)
returns INT 
DETERMINISTIC
BEGIN 
	DECLARE b int ;
	set b = a + 10 ;
	return b ;
end $$

DELIMITER $$
create function final_profits(profit int , discount int )
returns int
Deterministic
Begin 
Declare final_profit int ;
set final_profit = profit - discount ;
return final_profit;
end $$

select profit, discount  , final_profits(profit, discount) from sales1 ; 

DELIMITER $$
create function final_profits_real(profit decimal(20,6) , discount decimal(20,6) , sales decimal(20,6) )
returns int
Deterministic
Begin 
Declare final_profit int ;
set final_profit = profit - sales * discount ;
return final_profit;
end $$

select profit, discount  ,sales ,  final_profits_real(profit, discount,sales) from sales1 ; 

select add_to_col3(15)

select * from sales1

select quantity , add_to_col3(quantity ) from sales1




DELIMITER $$
create function int_to_str(a INT)
returns varchar
DETERMINISTIC
BEGIN 
	DECLARE b varchar ;
	set b = a ;
    return b 
end $$


DELIMITER &&
create function int_to_str (a int)
returns varchar(30)
DETERMINISTIC
begin
declare b varchar(30);
set b = a;
return b;
end&&

select int_to_str(45) 

select * from sales1 

select quantity, int_to_str(quantity) from sales1 ; 

select max(sales) , min(sales) from sales1 


1  - 100 - super affordable product 
100-300 - affordable 
300 - 600 - moderate price 
600 + - expensive 


DELIMITER &&
create function mark_sales2(sales int ) 
returns varchar(30)
DETERMINISTIC
begin 
declare flag_sales varchar(30); 
if sales  <= 100  then 
	set flag_sales = "super affordable product" ;
elseif sales > 100 and sales < 300 then 
	set flag_sales = "affordable" ;
elseif sales >300 and sales < 600 then 
	set flag_sales = "moderate price" ;
else 
	set flag_sales = "expensive" ;
end if ;
return flag_sales;
end &&


select mark_sales2(100)

select sales , mark_sales2(sales ) from sales1 ; 



create table loop_table(val int)


Delimiter $$
create procedure insert_data()
Begin
set @var  = 10 ;
generate_data : loop
insert into loop_table values (@var);
set @var = @var + 1  ;
if @var  = 100 then 
	leave generate_data;
end if ;
end loop generate_data;
End $$

call insert_data()

select * from loop_table



Task 
	1 . Create a loop for a table to insert a record into a tale for two columns in first coumn you have to inset a data ranging from 1 to 100 and in second column you hvae to inset a square of the first column 
	2 . create a user defined function to find out a date differences in number of days 
    3 . create a UDF to find out a log base 10 of any given number 
    4 . create a UDF which will be able to check a total number of records avaible in your table 
    5 . create a procedure to find out  5th highest profit in your sales table you dont have to use rank and windowing function 
    
