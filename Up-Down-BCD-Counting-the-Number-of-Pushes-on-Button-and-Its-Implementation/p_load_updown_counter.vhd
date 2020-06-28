----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:10:53 04/12/2018 
-- Design Name: 
-- Module Name:    p_load_updown_counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity p_load_updown_counter is
    Port ( SW : in  STD_LOGIC_VECTOR (7 DOWNTO 0);
           pload : in  STD_LOGIC;
           u_count : in  STD_LOGIC;
           d_count : in  STD_LOGIC;
           hdig : inout  STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
           ldig : inout  STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000");
end p_load_updown_counter;

architecture Behavioral of p_load_updown_counter is

begin

process(pload,u_count,d_count)
variable I : integer;
begin

if (pload = '1') then
	for I in 0 to 3 loop
		hdig(I) <= SW(4+I);
		ldig(I) <= SW(I);
	END LOOP;
	
elsif (d_count = '1') then
		if(ldig = 0) then -- first we need to decrement ldig
				ldig <= "1001";	-- if it's value is 0 ldig = '9';
				if(hdig = "0000") then	-- after decrement, if hdig'll become 0 
					hdig <= "1001";		-- hdig = '9';
				else	
					hdig <= hdig - 1; -- if not, just decrement hdig 1.
				end if;
		else
			ldig <= ldig - 1; --if these cases do not occur, then just decrement ldig 1.
		end if;  
elsif (u_count = '1') then 
		if(ldig = "1001") then -- first we need to increment ldig
				ldig <= "0000";	-- if it's value is 9 ldig = '0';
				if(hdig = "1001") then	-- after increment, if hdig'll become 9 
					hdig <= "0000";		-- hdig = '0';
				else	
					hdig <= hdig + 1; -- if not, just increment hdig 1.
				end if;
		else	
			ldig <= ldig + 1; --if these cases dont occur, then just increment ldig 1.
		end if;
else
	hdig <= hdig;
	ldig <= ldig;
 
end if;
end process;
end Behavioral;


