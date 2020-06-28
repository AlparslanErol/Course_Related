library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.vcomponents.all;

entity my_counter4 is
    Port ( wclock : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           CLR: in STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
           CO : out  STD_LOGIC);
end my_counter4 ;

architecture Structural of my_counter4 is

component FDCE
    port (
          C : in STD_LOGIC;
          CE : in STD_LOGIC;
          CLR : in STD_LOGIC;
          D :in STD_LOGIC;
          Q : out STD_LOGIC);
end component;

component and2
	port ( I0 : in std_logic;
			 I1 : in std_logic;
			 O : out std_logic
	);
end component; 

component xor2
	port ( I0 : in std_logic;
			 I1 : in std_logic;
			 O : out std_logic
	);
end component;

signal a,b,c : STD_LOGIC_VECTOR (3 downto 0);

begin

a0 : and2 port map (EN,a(0),c(0));
a1 : and2 port map (c(0),a(1),c(1));
a2 : and2 port map (c(1),a(2),c(2));
a3 : and2 port map (c(2),a(3),c(3));
b0 : xor2 port map (a(0),EN,b(0));
b1 : xor2 port map (a(1),c(0),b(1));
b2 : xor2 port map (a(2),c(1),b(2));
b3 : xor2 port map (a(3),c(2),b(3));
c0 : fdce port map (wclock,'1',CLR,b(0),a(0));
c1 : fdce port map (wclock,'1',CLR,b(1),a(1));
c2 : fdce port map (wclock,'1',CLR,b(2),a(2));
c3 : fdce port map (wclock,'1',CLR,b(3),a(3));
Q <= a;
CO <=c(3);

end Structural;
