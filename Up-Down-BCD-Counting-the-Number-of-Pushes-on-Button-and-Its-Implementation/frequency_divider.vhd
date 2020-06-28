----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:24 04/12/2018 
-- Design Name: 
-- Module Name:    frequency_divider - Behavioral 
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
use IEEE.numeric_std.ALL;

entity frequency_divider is
    Port ( div_in : in  STD_LOGIC;
           div_out : out  STD_LOGIC);
end frequency_divider;

architecture Behavioral of frequency_divider is

signal count: integer:=1;
signal temporal : std_logic := '0';
begin

process(div_in)

begin

if(div_in'event and div_in='1') then
count <=count+1;

if (count = 1000000) then
temporal <= NOT temporal;
count <= 1;

end if;
end if;
div_out <= temporal;

end process;

end Behavioral;

