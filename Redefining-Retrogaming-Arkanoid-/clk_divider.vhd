library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.constants.all;

entity clk_divider is
    Port ( clk_in : in  STD_LOGIC;
			  reset: in StD_LoGiC;
			  clk_ball : out  STD_LOGIC;
			  clk_slow: out std_logic;
           clk_paddle : out  STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is
	
	signal cnt : integer range 0 to 650000 := 0;
	signal count: integer:=1;
	signal tmp : std_logic := '0';


begin
	cnt_process1 : process (clk_in)
	begin
		if(rising_edge(clk_in)) then
			if(cnt = 524288) then
				cnt <= 0;
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process;
	
	clk_ball_gen : process(clk_in, cnt)
	begin
			if (cnt = 524287) then
				clk_ball <= '1';
			elsif (cnt = 524288) then
				clk_ball <= '0';
			end if;
	end process;
	
	clk_paddle_gen : process(clk_in, cnt)
	begin
			if (cnt = 0) then
				clk_paddle <= '1';
			elsif (cnt = 1) then
				clk_paddle <= '0';
			elsif (cnt = 131073) then
				clk_paddle <= '1';
			elsif (cnt = 131074) then
				clk_paddle <= '0';
			elsif (cnt = 262146) then
				clk_paddle <= '1';
			elsif (cnt = 262147) then
				clk_paddle <= '0';
			elsif (cnt = 393219) then
				clk_paddle <= '1';
			elsif (cnt = 393220) then
				clk_paddle <= '0';
			elsif (cnt = 524292) then
				clk_paddle <= '1';
			elsif (cnt = 524293) then
				clk_paddle <= '0';
			end if;
	end process;
	
	gg: process(clk_in,reset)
	begin
		if(reset='1') then
			count<=1;
			tmp<='0';
		elsif(clk_in'event and clk_in='1') then
			count <=count+1;
		if (count = 2) then
			tmp <= NOT tmp;
			count <= 1;
		end if;
		end if;
	clk_slow <= tmp;
	end process;
	
	
	

end Behavioral;

