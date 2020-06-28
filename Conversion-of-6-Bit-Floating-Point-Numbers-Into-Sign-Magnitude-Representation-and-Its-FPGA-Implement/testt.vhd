
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY testt IS
END testt;
 
ARCHITECTURE behavior OF testt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FP_decoder
    PORT(
         FP : IN  std_logic_vector(5 downto 0);
         MY_CLK : IN  std_logic;
         SSEG_CA : OUT  std_logic_vector(7 downto 0);
         SSEG_AN : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal FP : std_logic_vector(5 downto 0) := (others => '0');
   signal MY_CLK : std_logic := '0';

 	--Outputs
   signal SSEG_CA : std_logic_vector(7 downto 0);
   signal SSEG_AN : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant MY_CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FP_decoder PORT MAP (
          FP => FP,
          MY_CLK => MY_CLK,
          SSEG_CA => SSEG_CA,
          SSEG_AN => SSEG_AN
        );

  


tb: PROCESS
    BEGIN 
	      MY_CLK <= '0' ;
			wait for 0.001 ns;
			MY_CLK <= '1';
			wait for 0.001 ns;
			
			end process ;
			tbb : process 
			begin 
			FP <= "111001";
			wait;
			