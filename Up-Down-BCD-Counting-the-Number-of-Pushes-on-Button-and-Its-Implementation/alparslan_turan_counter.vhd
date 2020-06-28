----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:26:15 04/13/2018 
-- Design Name: 
-- Module Name:    alparslan_turan_counter - Behavioral 
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
--Synthesizable 2-Digit, parallel loadable up/down BCD Count by pressing push-button switches 
--EE240 class Bogazici University 
--Implemented on Xilinx Spartan VI FPGA chip 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity alparslan_turan_counter is
    Port ( pdata : in  STD_LOGIC_vector (7 downto 0);
           board_clk : in  STD_LOGIC;
           pload : in  STD_LOGIC;
           upcount : in  STD_LOGIC;
           downcount : in  STD_LOGIC;
           SSEG_CA : out  STD_LOGIC_VECTOR (7 downto 0);
           SSEG_AN : out  STD_LOGIC_VECTOR (3 downto 0));
end alparslan_turan_counter;

architecture Behavioral of alparslan_turan_counter is

component frequency_divider is
	Port ( div_in : in  STD_LOGIC;
           div_out : out  STD_LOGIC);
end component;

component debouncer_load is
	Port ( BTNL : in  STD_LOGIC;
           slow_clock : in  STD_LOGIC;
           pload : out  STD_LOGIC);
end component;

component debouncer_upcount is
	Port ( BTNU : in  STD_LOGIC;
           slow_clock : in  STD_LOGIC;
           u_count : out  STD_LOGIC);
end component;

component debouncer_downcount is
	Port ( BTND : in  STD_LOGIC;
           slow_clock : in  STD_LOGIC;
           d_count : out  STD_LOGIC);
end component;

component p_load_updown_counter is
	Port ( SW : in  STD_LOGIC_VECTOR (7 DOWNTO 0);
           pload : in  STD_LOGIC;
           u_count : in  STD_LOGIC;
           d_count : in  STD_LOGIC;
           hdig : inout  STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
           ldig : inout  STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000");
end component;

component BCD_to_seven_segment is
	port ( d: in std_logic_vector(3 downto 0);
			 s: out std_logic_vector ( 7 downto 0));
end component;

component nexys3_sseg_driver is
	port( 
		MY_CLK 	: in  STD_LOGIC;
		DIGIT0  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT1  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT2  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT3  : in  STD_LOGIC_VECTOR (7 downto 0);
		SSEG_CA : out STD_LOGIC_VECTOR (7 downto 0);
		SSEG_AN : out STD_LOGIC_VECTOR (3 downto 0)
	);
end component;
--middle signals that we use in our design process
signal slowed_clk            		: std_logic;
signal p_load, u_count, d_count  : std_logic 						  :='0';
signal hdig 						   : std_logic_vector (3 downto 0) :="0000";
signal ldig 						   : std_logic_vector (3 downto 0) :="0000";
signal highdig 					   : std_logic_vector (7 downto 0) :="11111111";
signal lowdig 						   : std_logic_vector (7 downto 0) :="11111111";

begin

freq 		: frequency_divider     port map (board_clk,slowed_clk);
deb_load : debouncer_load 		   port map (pload,slowed_clk,p_load);
deb_up	: debouncer_upcount     port map (upcount,slowed_clk,u_count);
deb_down	: debouncer_downcount   port map (downcount,slowed_clk,d_count);
counter  : p_load_updown_counter port map (pdata,p_load,u_count,d_count,hdig,ldig);
bcd_7_1  : BCD_to_seven_segment  port map (hdig,highdig);
bcd_7_2  : BCD_to_seven_segment  port map (ldig,lowdig);
nexys    : nexys3_sseg_driver		port map (board_clk,"11111111","11111111",highdig,lowdig,SSEG_CA,SSEG_AN);

end Behavioral;

