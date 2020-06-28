
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity binary_bcd is
    PORT(h3,h2,h1,h0,l3,l2,l1,l0: out std_logic;
		   R5, R4, R3, R2, R1, R0:  in std_logic);

end binary_bcd;

architecture Dataflow of binary_bcd is
             component Add_3 
				 port ( input : in STD_LOGIC_VECTOR (3 downto 0);
				        output : out STD_LOGIC_VECTOR (3 downto 0) );
				 end component;
				 
				 signal a,b,c,d,e,f : STD_LOGIC_VECTOR (3 downto 0);

begin

				h3 <= '0' ;
				h2 <= b(3);
				h1 <= d(3);
				h0 <= f(3);
				l3 <= f(2);
				l2 <= f(1);
				l1 <= f(0);
				l0 <= R0;
				a(3) <= '0' ;
				a(2) <= R5;
				a(1) <= R4;
				a(0) <= R3;
				c(3) <= b(2);
				c(2) <= b(1);
				c(1) <= b(0);
				c(0) <= R2;
				e(3) <= d(2);
				e(2) <= d(1);
				e(1) <= d(0);
				e(0) <= R1;
				
				x0: Add_3 port map (a,b);
				x1: Add_3 port map (c,d);
				x2: Add_3 port map (e,f);
				
end Dataflow;

