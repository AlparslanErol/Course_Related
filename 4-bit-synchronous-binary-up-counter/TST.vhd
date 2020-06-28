--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:19:20 03/30/2018
-- Design Name:   
-- Module Name:   C:/Users/Network Lab/Desktop/EE240/LAB4/DESK12/TST.vhd
-- Project Name:  DESK12
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: my_counter4
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
 
ENTITY TST IS
END TST;
 
ARCHITECTURE behavior OF TST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT my_counter4
    PORT(
         wclock : IN  std_logic;
         EN : IN  std_logic;
         CLR : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0);
         CO : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal wclock : std_logic := '0';
   signal EN : std_logic := '1';
   signal CLR : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);
   signal CO : std_logic;

   -- Clock period definitions
   constant wclock_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: my_counter4 PORT MAP (
          wclock => wclock,
          EN => EN,
          CLR => CLR,
          Q => Q,
          CO => CO
        );

   -- Clock process definitions
   wclock_process :process
   begin
		wclock <= '0';
		wait for wclock_period/2;
		wclock <= '1';
		wait for wclock_period/2;
   end process;
 

   -- Stimulus process
    tb : PROCESS BEGIN
en <= '1',
'0' after 800 ns,
'1' after 1000 ns;
clr <= '0',
'1' after 400 ns,
'0' after 800 ns;

 WAIT; -- will wait forever

END PROCESS;


END;
