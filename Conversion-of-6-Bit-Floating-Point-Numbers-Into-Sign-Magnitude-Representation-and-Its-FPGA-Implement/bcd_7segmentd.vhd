
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bcd_7segmentd is
    Port ( lowin : in  STD_LOGIC_VECTOR (3 downto 0);
           highin : in  STD_LOGIC_VECTOR (3 downto 0);
           lowout : out  STD_LOGIC_VECTOR (7 downto 0);
           highout : out  STD_LOGIC_VECTOR (7 downto 0));
end bcd_7segmentd;

architecture Dataflow of bcd_7segmentd is

begin
		with lowin select
		lowout <= "11000000" when "0000",
					 "11111001" when "0001",
					 "10100100" when "0010",
					 "10110000" when "0011",
					 "10011001" when "0100",
					 "10010010" when "0101",
					 "10000010" when "0110",
					 "11111000" when "0111",
					 "10000000" when "1000",	
					 "10010000" when "1001",
					 "11111111" when others;
		with highin select
		highout <= "11000000" when "0000",
		           "11111001" when "0001",
					  "10100100" when "0010",
					  "10110000" when "0011",
					  "10011001" when "0100",
					  "10010010" when "0101",
					  "10000010" when "0110",
					  "11111000" when "0111",
					  "10000000" when "1000",
					  "10010000" when "1001",
					  "11111111" when others;

end Dataflow;
					  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.vcomponents.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity negative_sign is
		port ( si: in std_logic;
				 so: out std_logic_vector ( 7 downto 0) );
end negative_sign;


architecture dataflow of negative_sign is


begin
      with si select
           so <="10111111" when '1',
                "11111111" when others;
					 
end dataflow;


