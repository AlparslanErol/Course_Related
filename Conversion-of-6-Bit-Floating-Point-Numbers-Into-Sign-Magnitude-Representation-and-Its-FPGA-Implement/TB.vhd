
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB IS
END TB;
 
ARCHITECTURE behavior OF TB IS 
 
   
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

   -- Clock process definitions
   MY_CLK_process :process
   begin
		MY_CLK <= '0';
		wait for MY_CLK_period/2;
		MY_CLK <= '1';
		wait for MY_CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     FP <="111010";
      wait for 100 ns;
     FP <="100010";
      wait for 100 ns;	
  	 FP <="000010";
      wait for 100 ns;

      wait for MY_CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
