----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:19:31 04/13/2018 
-- Design Name: 
-- Module Name:    BCD_to_seven_segment - Behavioral 
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

entity BCD_to_seven_segment is 
	port ( d: in std_logic_vector(3 downto 0);
			 s: out std_logic_vector ( 7 downto 0));
	end BCD_to_seven_segment;
	
architecture dataflow of BCD_to_seven_segment is
	
begin

with d select 
s<="11000000" when "0000", --0
	"11111001" when "0001", --1
	"10100100" when "0010", --2
	"10110000" when "0011", --3
	"10011001" when "0100", --4
	"10010010" when "0101", --5
	"10000010" when "0110", --6
	"11111000" when "0111", --7
	"10000000" when "1000", --8
	"10010000" when "1001", --9
	"11111111" when others; --null
end dataflow;


