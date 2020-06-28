
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.vcomponents.all;



entity Add_3 is
port(input: in std_logic_vector (3 downto 0);
		  output: out std_logic_vector (3 downto 0)
		  );
end Add_3;


architecture Dataflow of Add_3 is

begin
 with input select
   output <= "1000" when "0101",
             "1001" when "0110",
             "1010" when "0111",
				 "1011" when "1000",
				 "1100" when "1001",
				 input when others;

end Dataflow;


