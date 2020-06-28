library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;

entity overall is
    port(clk_sys       : in  std_logic;
         reset         : in  std_logic;
         BTNL          : in  std_logic;
         BTNR          : in  std_logic;
         vsynch        : out std_logic;
         hsynch        : out std_logic;
         blue 			  : out std_logic;
         red   		  : out std_logic;
         green			  : out std_logic);
end entity overall;

architecture behavioral of overall is


    component clk_divider is
    Port ( clk_in : in  STD_LOGIC;
	 		  reset: in StD_LoGiC;
           clk_ball : out  STD_LOGIC;
			  clk_slow: out std_logic;
           clk_paddle : out  STD_LOGIC);
		end component;

    component drawing is
    port (clk_slow  : in  std_logic;
          ball_x    : in  std_logic_vector(9 downto 0);      
          ball_y	    : in  std_logic_vector(9 downto 0);
          block_matrix  : in  matrix;
          paddle_x       : in  std_logic_vector(9 downto 0);
		 
          vsynch    : out std_logic;
          hsynch    : out std_logic;
          blue  : out std_logic;
          red   : out std_logic;
          green : out std_logic);
end component;

    component input is
    port (clk_slow    : in    std_logic;
          reset       : in    std_logic;
          clk_paddle  : in    std_logic;
          game_over   : in    std_logic;
          left        : in    std_logic;
          right       : in    std_logic;
          paddle_x    : inout std_logic_vector(9 downto 0);
          start       : out   std_logic);
	end component;

    component ball_blocks is
    port (clk_slow          : in    std_logic;
          reset        : in    std_logic;
          clk_ball     : in    std_logic;
          start        : in    std_logic;
          paddle_x      : in    std_logic_vector(9 downto 0);
          game_over  : inout std_logic;
          ball_x   : inout std_logic_vector(9 downto 0);
          ball_y   : inout std_logic_vector(9 downto 0);
          block_matrix : inout matrix);
	end component;
	
	 signal clk_slow: std_logic;
	 signal paddle_x: std_logic_vector(9 downto 0);
	 signal start: std_logic;
    signal block_matrix : matrix;
	 signal clk_ball: std_logic;
	 signal ball_x: std_logic_vector(9 downto 0);
	 signal ball_y: std_logic_vector(9 downto 0);
	 signal clk_paddle: std_logic;
	 signal game_over: std_logic;
    
begin
   
	clk_division: clk_divider PORT MAP ( clk_sys, reset, clk_ball, clk_slow, clk_paddle);
	inputt: input PORT MAP ( clk_slow, reset, clk_paddle, game_over, BTNL, BTNR, paddle_x, start);
	ball_blockss: ball_blocks PORT MAP ( clk_slow, reset, clk_ball, start, paddle_x, game_over, ball_x, ball_y, block_matrix); 
	drawingg: drawing PORT MAP ( clk_slow, ball_x, ball_y, block_matrix, paddle_x, vsynch, hsynch, blue, red, green);

end architecture behavioral;

