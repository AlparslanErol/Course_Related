
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity float_binary is
    Port ( M : in  STD_LOGIC_VECTOR (2 downto 0);
           E : in  STD_LOGIC_VECTOR (1 downto 0);
           R : out  STD_LOGIC_VECTOR (5 downto 0));
end float_binary;

architecture Dataflow of float_binary is
		signal a, b : std_logic_vector (5 downto 0) ;

begin
		a(0)<=M(0);
		a(1)<=M(1);
		a(2)<=M(2);
		a(3)<='0';
		a(4)<='0';
		a(5)<='0';
		
		with E select
		
		b<=a when "00",
		a(a'left - 1 downto 0) & '0' 		when "01",
		a(a'left - 2 downto 0) & "00"		when "10",
		a(a'left - 3 downto 0) & "000" 	when others;
		R(0)<=b(0);
		R(1)<=b(1);
		R(2)<=b(2);
		R(3)<=b(3);
		R(4)<=b(4);
		R(5)<=b(5);




end Dataflow;


