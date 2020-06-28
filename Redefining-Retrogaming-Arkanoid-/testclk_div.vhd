--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:59:17 05/30/2018
-- Design Name:   
-- Module Name:   C:/Users/Windows 8/Desktop/EE240PRE/testclk_div.vhd
-- Project Name:  EE240PRE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clk_divider
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testclk_div IS
END testclk_div;
 
ARCHITECTURE behavior OF testclk_div IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clk_divider
    PORT(
         clk_in : IN  std_logic;
         reset : IN  std_logic;
         clk_ball : OUT  std_logic;
         clk_slow : OUT  std_logic;
         clk_paddle : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal clk_ball : std_logic;
   signal clk_slow : std_logic;
   signal clk_paddle : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
   constant clk_ball_period : time := 10 ns;
   constant clk_slow_period : time := 10 ns;
   constant clk_paddle_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clk_divider PORT MAP (
          clk_in => clk_in,
          reset => reset,
          clk_ball => clk_ball,
          clk_slow => clk_slow,
          clk_paddle => clk_paddle
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 
   clk_ball_process :process
   begin
		clk_ball <= '0';
		wait for clk_ball_period/2;
		clk_ball <= '1';
		wait for clk_ball_period/2;
   end process;
 
   clk_slow_process :process
   begin
		clk_slow <= '0';
		wait for clk_slow_period/2;
		clk_slow <= '1';
		wait for clk_slow_period/2;
   end process;
 
   clk_paddle_process :process
   begin
		clk_paddle <= '0';
		wait for clk_paddle_period/2;
		clk_paddle <= '1';
		wait for clk_paddle_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_in_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
