----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:37:47 04/12/2018 
-- Design Name: 
-- Module Name:    debouncer - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity debouncer_load is
    Port ( BTNL : in  STD_LOGIC;
           slow_clock : in  STD_LOGIC;
           pload : out  STD_LOGIC);
end debouncer_load;

architecture Behavioral of debouncer_load is

component FDCE
	port (Q : out STD_LOGIC;
			C : in STD_LOGIC;
			CE : in STD_LOGIC;
			CLR : in STD_LOGIC;
			D :in STD_LOGIC );
end component;

signal q0,q1,q2,q3 : std_logic;


begin


ff1 : FDCE PORT MAP (q0,slow_clock,'1','0',BTNL);
ff2 : FDCE PORT MAP (q1,slow_clock,'1','0',q0);
ff3 : FDCE PORT MAP (q2,slow_clock,'1','0',q1);
ff4 : FDCE PORT MAP (q3,slow_clock,'1','0',q2);

process (slow_clock) 
begin

pload <= (q0 and q1 and q2 and q3 and not(BTNL)) ;
end process;

end Behavioral;






