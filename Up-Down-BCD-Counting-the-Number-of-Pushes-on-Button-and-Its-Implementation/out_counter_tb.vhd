--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:29:38 04/13/2018
-- Design Name:   
-- Module Name:   C:/LAB4/LAB6/out_counter_tb.vhd
-- Project Name:  LAB6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alparslan_turan_counter
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
 
ENTITY out_counter_tb IS
END out_counter_tb;
 
ARCHITECTURE behavior OF out_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alparslan_turan_counter
    PORT(
         pdata : IN  std_logic_vector(7 downto 0);
         board_clk : IN  std_logic;
         pload : IN  std_logic;
         upcount : IN  std_logic;
         downcount : IN  std_logic;
         SSEG_CA : OUT  std_logic_vector(7 downto 0);
         SSEG_AN : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pdata : std_logic_vector(7 downto 0) := (others => '0');
   signal board_clk : std_logic := '0';
   signal pload : std_logic := '0';
   signal upcount : std_logic := '0';
   signal downcount : std_logic := '0';

 	--Outputs
   signal SSEG_CA : std_logic_vector(7 downto 0);
   signal SSEG_AN : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant board_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alparslan_turan_counter PORT MAP (
          pdata => pdata,
          board_clk => board_clk,
          pload => pload,
          upcount => upcount,
          downcount => downcount,
          SSEG_CA => SSEG_CA,
          SSEG_AN => SSEG_AN
        );

   -- Clock process definitions
   board_clk_process :process
   begin
		board_clk <= '0';
		wait for board_clk_period/2;
		board_clk <= '1';
		wait for board_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	begin
	
		pdata <= "10010000";
		pload<= '0';
		upcount <= '0';
		downcount <= '0';
		
		wait for 80 ms;
		
		pload<= '1';
		upcount <= '0';
		downcount <= '0';
		
		wait for 80 ms;
		
		pload<= '0';
		upcount <= '1';
		downcount <= '0';
		
		wait for 100 ms;
		
		pload<= '0';
		upcount <= '0';
		downcount <= '0';
		
		wait for 80 ms;
		
		pload<= '0';
		upcount <= '0';
		downcount <= '1';
		
		wait for 80 ms;
		
		pload<= '0';
		upcount <= '0';
		downcount <= '0';
		
		wait for 80 ms;
		
		pload<= '0';
		upcount <= '0';
		downcount <= '1';
		
		wait for 80 ms;
		
		pload<= '0';
		upcount <= '0';
		downcount <= '0';
		wait for 80 ms;
		
		pload<= '0';
		upcount <= '0';
		downcount <= '1';
		wait for 80 ms;
		pload<= '0';
		upcount <= '0';
		downcount <= '0';
		
		wait for 80 ms;
		
		pload<= '0';
		upcount <= '0';
		downcount <= '1';
		wait for 80 ms;
		pload<= '0';
		upcount <= '0';
		downcount <= '0';
		
		wait for 80 ms;
		
		pload<= '0';
		upcount <= '0';
		downcount <= '1';
		wait for 80 ms;
		pload<= '0';
		upcount <= '0';
		downcount <= '0';
		
		wait for 80 ms;
		
		pload<= '0';
		upcount <= '0';
		downcount <= '1';
		wait for 80 ms;
		pload<= '0';
		upcount <= '0';
		downcount <= '0';
		
		wait for 80 ms;
		
		pload<= '0';
		upcount <= '0';
		downcount <= '1';
      wait;
   end process;

END;
