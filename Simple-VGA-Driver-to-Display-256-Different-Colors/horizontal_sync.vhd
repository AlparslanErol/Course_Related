library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity horizontal_sync is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           hor_sync : out  STD_LOGIC);
end horizontal_sync;

architecture Behavioral of horizontal_sync is
signal count: integer range 0 to 900 :=0;
signal timing : std_logic:='0';
begin
process(clk,reset)
begin
if(reset='1') then
	count<=0;
	timing<='0';
	elsif(clk'event and clk='1') then
			if(count >= 0) and (count < 95) then
			timing <= '0';	
			count<=count+1;
			elsif(count >= 95) and (count < 799) then
			timing <= '1';	
			count<=count+1;
			elsif (count = 799) then
			timing <= '0';
			count <=0;
			end if;
end if;
hor_sync<=timing;
end process;
end Behavioral;

