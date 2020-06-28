-- Synthesizable Simple VGA Driver to Display All Possible Colors 
-- EE240 class Bogazici University  
-- Implemented on Xilinx Spartan VI FPGA chip  
 
LIBRARY ieee ; 
USE ieee.std_logic_1164.all ; 
USE ieee.std_logic_signed.all ;  
USE ieee.std_logic_arith.all ; 
USE ieee.std_logic_unsigned.all; 
 
entity ee240_vgadriver is              
port (nreset: in std_logic;                 
      board_clk: in std_logic;                 
      vsync: out std_logic;                  
	   hsync: out std_logic;                  
	   red: out std_logic_vector(2 downto 0);                
	   green: out std_logic_vector(2 downto 0);                
	   blue: out std_logic_vector(1 downto 0));
end ee240_vgadriver;

architecture arch_vga_driver of ee240_vgadriver is

component freqdivider
    port (c_in : in  STD_LOGIC;
          c_out : out  STD_LOGIC;
       	 reset : in std_logic);
end component;

component vertical_sync
	port(clk : in std_logic;
		  reset : in std_logic;
		  ver_sync : out std_logic);
end component;

component horizontal_sync
	port(clk : in std_logic;
		  reset : in std_logic; 
		  hor_sync : out std_logic);
end component;

component color_generator
      port(clock: in std_logic;
			  reset: in std_logic;
			  red: out std_logic_vector(2 downto 0);
			  green: out std_logic_vector(2 downto 0);
           blue: out std_logic_vector(1 downto 0));
end component;

signal slow_clock: std_logic := '0';

begin

Frequency_Divider 			: freqdivider			PORT MAP(board_clk, slow_clock, nreset);
Vertical_Sync_Generator 	: vertical_sync	   PORT MAP(slow_clock, nreset, vsync);
Horizontal_Sync_Generator  : horizontal_sync		PORT MAP(slow_clock, nreset, hsync);
Color_Gen		 				: color_generator 	PORT MAP(slow_clock, nreset, red, green, blue);
 
end arch_vga_driver; 