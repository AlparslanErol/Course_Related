library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity color_generator is
    port(clock: in std_logic;
	     reset: in std_logic;
	     red: out std_logic_vector(2 downto 0);
	     green: out std_logic_vector(2 downto 0);
        blue: out std_logic_vector(1 downto 0));
end color_generator;

architecture behavioral of color_generator is
signal colors :std_logic_vector(7 downto 0):="00000000";
signal counter: integer range 0 to 900 :=0;
signal counter_hor: integer range 0 to 900 :=0;
signal counter_ver: integer range 0 to 1000000 :=0;
signal hor_temp: std_logic:= '0';
signal ver_temp: std_logic  :='0';
begin
process(clock,reset)
begin
      if (reset='1') then
		counter <= 0;
		counter_hor <= 0;
		counter_ver <= 0;
		hor_temp <= '0';
		ver_temp <= '0';
      colors <= "00000000";
		elsif (clock'event) and (clock='1') then
			if (counter_hor >= 0) and (counter_hor < 143) then 
			counter_hor <= counter_hor+1;
			hor_temp <= '0';
			elsif (counter_hor >= 143) and (counter_hor < 782) then		
			counter_hor <= counter_hor+1;
			hor_temp <= '1';
         elsif (counter_hor >= 782) and (counter_hor < 799) then
			counter_hor <= counter_hor+1;
         hor_temp <= '0';
			elsif (counter_hor = 799) then
			counter_hor <= 0;
         hor_temp <= '0';
			end if;
			
			if (counter_ver >= 0) and (counter_ver < 24799) then 
			counter_ver <= counter_ver+1;
			ver_temp <= '0';	
			elsif (counter_ver >= 24799) and (counter_ver < 408798) then		
			counter_ver <= counter_ver+1;
			ver_temp <= '1';
         elsif (counter_ver >= 408798) and (counter_ver < 416799) then
			counter_ver <= counter_ver+1;
         ver_temp <= '0';
			elsif (counter_ver = 416799) then
			counter_ver <= 0;
         ver_temp <= '0';
			end if;
			
			
			if (hor_temp = '1') and (ver_temp = '1') then 
			colors <= colors+1;	
			else 
			colors <= "00000000";
			end if;
			
      end if;
end process;
red<=colors(2 downto 0);
green<=colors(5 downto 3);
blue<=colors(7 downto 6);
end behavioral;

