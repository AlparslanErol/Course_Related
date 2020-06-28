LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all ;
USE ieee.std_logic_arith.all ;
library UNISIM;
use UNISIM.vcomponents.all;

entity FP_decoder is
 port (
 FP: in std_logic_vector(5 downto 0);
 MY_CLK: in std_logic;
 SSEG_CA: out std_logic_vector(7 downto 0);
 SSEG_AN: out std_logic_vector(3 downto 0));
end;
architecture arch_FP_decoder of FP_decoder is

component binary_bcd
PORT(h3,h2,h1,h0,l3,l2,l1,l0: out std_logic; R5, R4, R3, R2, R1, R0: in std_logic );

end component;

component float_binary
    Port ( M : in  STD_LOGIC_vector (2 downto 0);
	        E : in  STD_LOGIC_vector (1 downto 0);
           R : out  STD_LOGIC_vector (5 downto 0));
end component ;

component negative_sign
port ( si: in std_logic;
       so: out std_logic_vector ( 7 downto 0) );
end component;

component bcd_7segmentd 
Port ( lowin : in  STD_LOGIC_VECTOR (3 downto 0);
           highin : in  STD_LOGIC_VECTOR (3 downto 0);
           lowout : out  STD_LOGIC_VECTOR (7 downto 0);
           highout : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component nexys3_given
    port( 
		MY_CLK 	: in  STD_LOGIC;
		DIGIT0  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT1  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT2  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT3  : in  STD_LOGIC_VECTOR (7 downto 0);
		SSEG_CA : out STD_LOGIC_VECTOR (7 downto 0);
		SSEG_AN : out STD_LOGIC_VECTOR (3 downto 0) );
end component;

signal x: std_logic_vector (5 downto 0);
signal h,l: std_logic_vector (3 downto 0);
signal FP1: std_logic_vector (5 downto 0);
signal negf,highf,lowf: std_logic_vector (7 downto 0);

begin

negatif: negative_sign port map(FP(5),negf);

bcd_7: bcd_7segmentd port map(l,h,highf,lowf);

float_bin: float_binary port map (FP(4)&FP(3)&FP(2),FP(1)&FP(0),x);

nexys: nexys3_given port map (MY_CLK, "11111111",negf,highf,lowf, SSEG_CA, SSEG_AN);

bin_bcd: binary_bcd port map (h(3),h(2),h(1),h(0),l(3),l(2),l(1),l(0),x(5),x(4),x(3),x(2),x(1),x(0));

end arch_FP_decoder; 
