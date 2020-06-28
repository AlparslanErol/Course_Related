library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;

entity input is
    port (clk_slow    : in    std_logic;
          reset       : in    std_logic;
          clk_paddle  : in    std_logic;
          game_over   : in    std_logic;
          left        : in    std_logic;
          right       : in    std_logic;
          paddle_x    : inout std_logic_vector(9 downto 0);
          start       : out   std_logic);
end entity input;

architecture behavioral of input is

begin
    user_command : process (clk_slow, reset, game_over, clk_paddle)
    begin
        if (reset = '1' or game_over = '1') then
				start   <= '0';
            paddle_x <= "0111010000";    -- 464
        elsif (rising_edge(clk_slow) and clk_paddle = '1') then
			  if (clk_paddle = '1' and right = '1' and ((paddle_x + to_stdlogicvector(to_bitvector(PAD_WIDTH) srl 1)) < ("1011110000"))) then
                paddle_x <= paddle_x + 1;
                paddle_x <= paddle_x + 1;
                start   <= '1';
					 
            elsif (clk_paddle = '1' and left = '1' and ((paddle_x - to_stdlogicvector(to_bitvector(PAD_WIDTH) srl 1)) > ("10110000"))) then
                paddle_x <= paddle_x - 1; 
                paddle_x <= paddle_x - 1;
                start   <= '1';
            end if;
        end if;
    end process user_command;
    
end architecture behavioral;
