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

select add_to_col3(15)

select * from sales1

select quantity , add_to_col3(quantity ) from sales1
