library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;

entity drawing is
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
end entity drawing;


architecture Behavioral of drawing is
	 signal col_cnt : std_logic_vector(11 downto 0) :=  "000000000000";
    signal row_cnt    : std_logic_vector(11 downto 0) := "000000000000";
    
begin

    synch : process (clk_slow)
    begin
        if(rising_edge(clk_slow)) then
            if(row_cnt >= 0 and row_cnt < 2) then
                vsynch <= '0';
            else
                vsynch <= '1';
            end if;
            if(col_cnt >= 0 and col_cnt < 96) then
                hsynch <= '0';
            else
                hsynch <= '1';
            end if;
        end if;
    end process synch;

    pixel_count : process (clk_slow)
    begin
        if(rising_edge(clk_slow)) then
            col_cnt <= col_cnt + 1;
            if(col_cnt = 800) then
                col_cnt <= "000000000000";
                row_cnt    <= row_cnt + 1;
            end if;
            if(row_cnt = 520) then
                row_cnt <= "000000000000";
            end if;
        end if;
    end process pixel_count;

 
    draw : process (clk_slow)
    begin
        if (rising_edge(clk_slow)) then
		   
            if (col_cnt > 160 and col_cnt < 768) and (row_cnt > 47 and row_cnt < 495) then  
                red   <= '0';
                green <= '0';
                blue  <= '0';
            else
                red   <= '0';
                green <= '0';
                blue  <= '1';
            end if;

            if ((row_cnt >= BLOCKS_Y_START) and (row_cnt < BLOCKS_Y_END) and
                (col_cnt >= BLOCKS_X_START) and (col_cnt < BLOCKS_X_END)) then

                for i in 0 to (BLOCK_COL_NUM - 1) loop
                    for j in 0 to (BLOCK_ROW_NUM - 1) loop
                        if ((row_cnt > (BLOCKS_Y_START + i*BLOCK_HEIGHT)) and (row_cnt < (BLOCKS_Y_START + BLOCK_HEIGHT - 1 + i*BLOCK_HEIGHT)) and
                            (col_cnt > (BLOCKS_X_START + j*BLOCK_WIDTH)) and (col_cnt < (BLOCKS_X_START + BLOCK_WIDTH - 1 + j*BLOCK_WIDTH)) and
                            (block_matrix(i, j) = '1')) then
											 red   <= '1';
											 green <= '0';
											 blue  <= '0';						  
                        elsif( ( col_cnt = BLOCKS_X_START + i*BLOCK_WIDTH or col_cnt = BLOCKS_X_START + BLOCK_WIDTH + BLOCK_WIDTH*i ) and
									    (row_cnt = BLOCKS_Y_START + j*BLOCK_HEIGHT or row_cnt = BLOCKS_Y_START + BLOCK_HEIGHT + BLOCK_HEIGHT*j) and
										  block_matrix(i,j) = '1') then
											 red   <= '1';
											 green <= '1';
											 blue  <= '1';
                        end if;
                    end loop;
                end loop;
            end if;

            if (row_cnt >= 420 and row_cnt < 440) then
					 if ( (row_cnt <= 430 and col_cnt > paddle_x - PAD_WIDTH  and col_cnt < paddle_x - PAD_WIDTH  + 5 ) or
							(row_cnt <= 430 and col_cnt < paddle_x + PAD_WIDTH  and col_cnt > paddle_x + PAD_WIDTH  - 5 )) then
								red <= '1';
								green <= '1';
								blue <= '0';
                elsif ( row_cnt <= 435 and 
						   col_cnt >= paddle_x - PAD_WIDTH  and col_cnt <= paddle_x + PAD_WIDTH ) then
							red <= '1';
							green <= '1';
							blue <= '1';
					  elsif ((row_cnt >= 436) and (col_cnt >= (paddle_x - (to_stdlogicvector(to_bitvector(PAD_WIDTH) srl 1))) and
															  col_cnt <= (paddle_x + (to_stdlogicvector(to_bitvector(PAD_WIDTH) srl 1))))) then
                    red   <= '0';
                    green <= '1';
                    blue  <= '0';
						elsif ( col_cnt <= 160 or col_cnt >= 768 ) then
							red <= '0';
							green <= '0';
							blue <= '1';
					  else
							red <= '0';
							green <= '0';
							blue <= '0';
						end if;
					end if;
         
				if (col_cnt > (ball_x - BALL_RAD) and col_cnt < (ball_x + BALL_RAD)) then
                if ( (col_cnt = (ball_x + BALL_RAD - 1) or (col_cnt = (ball_x - BALL_RAD + 1))) and
                    (row_cnt <= (ball_y +1) and row_cnt >= (ball_y - 1))) then
                    red   <= '0';
                    green <= '1';
                    blue  <= '1';
                elsif ((col_cnt = (ball_x + BALL_RAD - 2) or (col_cnt = (ball_x - BALL_RAD + 2))) and
                       (row_cnt <= (ball_y +3) and row_cnt >= (ball_y - 3))) then
                    red   <= '0';
                    green <= '1';
                    blue  <= '1';
                elsif ((col_cnt = (ball_x + BALL_RAD - 3) or (col_cnt = (ball_x - BALL_RAD + 3))) and
                       (row_cnt <= (ball_y +4) and row_cnt >= (ball_y - 4))) then
                    red   <= '0';
                    green <= '1';
                    blue  <= '1';
                elsif ((col_cnt = (ball_x + BALL_RAD - 4) or (col_cnt = (ball_x - BALL_RAD + 4))) and
                       (row_cnt <= (ball_y +4) and row_cnt >= (ball_y - 4))) then
                    red   <= '0';
                    green <= '1';
                    blue  <= '1';
                elsif (col_cnt <= (ball_x + BALL_RAD - 5) and (col_cnt >= (ball_x - BALL_RAD + 5)) and
                       (row_cnt <= (ball_y +5) and row_cnt >= (ball_y - 5))) then
                    red   <= '0';
                    green <= '1';
                    blue  <= '1';
                end if;
            end if;
        end if;
    end process draw;
end architecture behavioral;
