--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:36:15 05/19/2018
-- Design Name:   
-- Module Name:   C:/Users/mehme/Desktop/gg/EE240PRE/overalltb.vhd
-- Project Name:  EE240PRE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: overall
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
 
ENTITY overalltb IS
END overalltb;
 
ARCHITECTURE behavior OF overalltb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT overall
    PORT(
         clk_sys : IN  std_logic;
         reset : IN  std_logic;
         BTNL : IN  std_logic;
         BTNR : IN  std_logic;
         vsynch : OUT  std_logic;
         hsynch : OUT  std_logic;
         blue : OUT  std_logic;
         red : OUT  std_logic;
         green : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_sys : std_logic := '0';
   signal reset : std_logic := '0';
   signal BTNL : std_logic := '0';
   signal BTNR : std_logic := '0';

 	--Outputs
   signal vsynch : std_logic;
   signal hsynch : std_logic;
   signal blue : std_logic;
   signal red : std_logic;
   signal green : std_logic;

   -- Clock period definitions
   constant clk_sys_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: overall PORT MAP (
          clk_sys => clk_sys,
          reset => reset,
          BTNL => BTNL,
          BTNR => BTNR,
          vsynch => vsynch,
          hsynch => hsynch,
          blue => blue,
          red => red,
          green => green
        );

   -- Clock process definitions
   clk_sys_process :process
   begin
		clk_sys <= '0';
		wait for clk_sys_period/2;
		clk_sys <= '1';
		wait for clk_sys_period/2;
   end process;
 
	reset_process: process
	begin
		reset <= '1';
		wait for 50 ns;
		reset <= '0';
		wait;
		end process;
		
	input_process: process
	begin
		BTNL <= '1';
		wait for 10 ms;
		BTNL <= '0';
		wait for 1 ms;
		BTNL <= '1';
		wait;



		
		
		end process;
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_sys_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
