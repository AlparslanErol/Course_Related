library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;

entity ball_blocks is
    port (clk_slow          : in    std_logic;
          reset        : in    std_logic;
          clk_ball     : in    std_logic;
          start        : in    std_logic;
          paddle_x      : in    std_logic_vector(9 downto 0);
          game_over  : inout std_logic;
          ball_x   : inout std_logic_vector(9 downto 0);
          ball_y   : inout std_logic_vector(9 downto 0);
          block_matrix : inout matrix);
end entity ball_blocks;

architecture behavioral of ball_blocks is
    signal ball_velocity_x : integer;
    signal ball_velocity_y : integer;
    
begin

    ball_moves : process (clk_slow, reset, game_over, clk_ball, start)
    begin
        if (reset = '1' or game_over = '1') then
            ball_velocity_x <= 3;
            ball_velocity_y <= 3;
            game_over  <= '0';
				ball_x   <= "0111010000";  -- 464
            ball_y   <= "0100001111";  -- 271

            for i in 0 to (BLOCK_COL_NUM - 1) loop
                for j in 0 to (BLOCK_ROW_NUM - 1) loop
                    block_matrix(i, j) <= '1';
                end loop;
            end loop;
            
        elsif (rising_edge(clk_slow) and start = '1' and clk_ball = '1') then
			   ball_y <= ball_y + ball_velocity_y;
            ball_x <= ball_x + ball_velocity_x;

      
            if (((ball_y + BALL_RAD) >= 420 and ball_y + BALL_RAD <= 440) and
                ((ball_x >= (paddle_x - 10 - (to_stdlogicvector(to_bitvector(PAD_WIDTH) srl 1)))) and
                 (ball_x <= (paddle_x + 10 + (to_stdlogicvector(to_bitvector(PAD_WIDTH) srl 1))))) and
                (ball_velocity_y > 0)) then

							if(ball_x > paddle_x - "101" and ball_x < paddle_x + "101") then
								ball_velocity_y <= -1 * ball_velocity_y;
							
							elsif(ball_x > paddle_x - "1100" and ball_x < paddle_x + "1100") then
								ball_velocity_y <= -1 * ball_velocity_y;
								if(ball_velocity_x < 0) then
									ball_velocity_x <= -3;
								else
									ball_velocity_x <= 3;
								end if;
							elsif(ball_x > paddle_x - "10100" and ball_x < paddle_x + "10100") then 
								ball_velocity_y <= -1 * ball_velocity_y;
								if(ball_velocity_x < 0 ) then
									ball_velocity_x <= -3;
								else 
									ball_velocity_x <= 3;
								end if;
							end if;
				 end if;
				
            if (((ball_y + BALL_RAD) >= BLOCKS_Y_START) and
                ((ball_y - BALL_RAD) < BLOCKS_Y_END) and
                ((ball_x + BALL_RAD) >= BLOCKS_X_START) and
                ((ball_x - BALL_RAD) < BLOCKS_X_END)) then

                for i in 0 to (BLOCK_ROW_NUM - 1) loop
                    for j in 0 to (BLOCK_COL_NUM - 1) loop
                        if (((ball_x + BALL_RAD) >= (BLOCKS_X_START + j*BLOCK_WIDTH)) and
                            ((ball_x - BALL_RAD) < (BLOCKS_X_START + BLOCK_WIDTH + j*BLOCK_WIDTH)) and
                            ((ball_y + BALL_RAD) >= (BLOCKS_Y_START + i*BLOCK_HEIGHT)) and
                            ((ball_y - BALL_RAD) < (BLOCKS_Y_START + BLOCK_HEIGHT + i*BLOCK_HEIGHT)) and
                            (block_matrix(i, j) = '1')) then
                            if ((((ball_y + BALL_RAD) >= (BLOCKS_Y_START + i*BLOCK_WIDTH)) and
                                 ((ball_y + BALL_RAD) < (BLOCKS_Y_START + 4 + i*BLOCK_WIDTH))) or 
                                (((ball_y - BALL_RAD) <= (BLOCKS_Y_START + BLOCK_WIDTH + i*BLOCK_WIDTH)) and
                                 ((ball_y - BALL_RAD) > (BLOCKS_Y_START + BLOCK_WIDTH - 4 + i*BLOCK_WIDTH)))) then
                                block_matrix(i, j) <= '0';
										  ball_velocity_y <= -1*ball_velocity_y;
                            else
                                ball_velocity_x <= -1*ball_velocity_x;
										  block_matrix(i, j) <= '0';
                            end if;
                        end if;
                    end loop;
                end loop;
            end if;
          
            if ((ball_x - BALL_RAD) <= ("10100000") and (ball_velocity_x < 0)) then
                ball_velocity_x <= -1*ball_velocity_x;
            end if;


            if ((ball_x + BALL_RAD) >= ("1100000000") and (ball_velocity_x > 0)) then
                ball_velocity_x <= -1*ball_velocity_x;
            end if;


         
            if ((ball_y - BALL_RAD) <= ("101111") and (ball_velocity_y < 0)) then
                ball_velocity_y <= -1*ball_velocity_y;
            end if;

				if((ball_y + BALL_RAD) >= ("111101111") and (ball_velocity_y > 0)) then
					game_over <= '1';
				end if;

        end if;
		
		
    end process ball_moves;

end architecture behavioral;
