library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vertical_sync is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           ver_sync : out  STD_LOGIC);
end vertical_sync;

architecture Behavioral of vertical_sync is
signal count: integer range 0 to 900 :=0;
signal timing : std_logic:='0';
begin
process(clk,reset)
begin
if(reset='1') then
	count<=0;
	timing<='0';
	elsif(clk'event) and (clk='1') then
			if(count >= 0) and (count < 1599) then
			timing <= '0';	
			count<=count+1;
			elsif(count >= 1599) and (count < 416799) then
			timing <= '1';	
			count<=count+1;
			elsif (count = 416799) then
			timing <= '0';
			count <=0;
			end if;
end if;
ver_sync<=timing;
end process;
end Behavioral;

