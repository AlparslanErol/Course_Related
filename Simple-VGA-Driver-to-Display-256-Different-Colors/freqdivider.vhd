library IEEE;
use IEEE.STD_LOGIC_1164.ALL;use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;
use UNISIM.vcomponents.all;
entity freqdivider is
       port( c_in: in std_logic; 
				 c_out: out std_logic;
             reset:  in std_logic);
fend freqdivider;
architecture behavioral of freqdivider is
		signal temp : std_logic := '0';     
		signal count: integer range 0 to 10 := 0;
 begin
 process (c_in,reset) 
 
 begin
      if reset='1' then
      count<=0;
		temp <= '0';
      elsif rising_edge(c_in) then
			if count = 1 then
			count <= 0;
			temp <= not temp;
			else 
			count <= count + 1;
			end if;
     end if;
		c_out <= temp;

end process;

   end behavioral;