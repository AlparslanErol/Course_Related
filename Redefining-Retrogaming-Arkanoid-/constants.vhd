library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package constants is
   
    constant BLOCK_COL_NUM : integer := 4;
    constant BLOCK_ROW_NUM : integer := 4;


    constant BLOCK_WIDTH  : integer := 20;
    constant BLOCK_HEIGHT : integer := 10;  

    constant EDGE : std_logic_vector(5 downto 0) := "110000";  

    
    constant PAD_WIDTH : std_logic_vector(5 downto 0) := "011110";  

   
    constant BALL_RAD : std_logic_vector(2 downto 0) := "110"; 

  
    constant BLOCKS_Y_START : integer := 100;  
    constant BLOCKS_Y_END  : integer := BLOCKS_Y_START + BLOCK_HEIGHT * BLOCK_ROW_NUM;  
    constant BLOCKS_X_START : integer := 424;  
    constant BLOCKS_X_END  : integer := 504;  

    
    type matrix is array(0 to (BLOCK_COL_NUM - 1), 0 to (BLOCK_ROW_NUM - 1)) of std_logic;
end package constants;

package body constants is
end package body constants;