--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:42:00 05/31/2018
-- Design Name:   
-- Module Name:   C:/Users/Windows 8/Desktop/EE240PRE/tbasdasd.vhd
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
 
ENTITY tbasdasd IS
END tbasdasd;
 
ARCHITECTURE behavior OF tbasdasd IS 
 
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
