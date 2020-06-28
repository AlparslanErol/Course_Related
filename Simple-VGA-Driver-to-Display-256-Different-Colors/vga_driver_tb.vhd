LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY vga_driver_tb IS
END vga_driver_tb;
 
ARCHITECTURE behavior OF vga_driver_tb IS 

 
    COMPONENT ee240_vgadriver
    PORT(
         nreset : IN  std_logic;
         board_clk : IN  std_logic;
         vsync : OUT  std_logic;
         hsync : OUT  std_logic;
         red : OUT  std_logic_vector(2 downto 0);
         green : OUT  std_logic_vector(2 downto 0);
         blue : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal nreset : std_logic := '0';
   signal board_clk : std_logic := '0';

 	--Outputs
   signal vsync : std_logic;
   signal hsync : std_logic;
   signal red : std_logic_vector(2 downto 0);
   signal green : std_logic_vector(2 downto 0);
   signal blue : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant board_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ee240_vgadriver PORT MAP (
          nreset => nreset,
          board_clk => board_clk,
          vsync => vsync,
          hsync => hsync,
          red => red,
          green => green,
          blue => blue
        );

   -- Clock process definitions
   board_clk_process :process
   begin
		board_clk <= '0';
		wait for board_clk_period/2;
		board_clk <= '1';
		wait for board_clk_period/2;
   end process;

END;
