
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity test1 is
	port(a,b,c	:	in		std_logic;
			s,cout:	out	std_logic);
end test1;

architecture Behavioral of test1 is

component H_A
	port(
			a,b	:	in		std_logic;
			s,c	:	out	std_logic);
	end component;
	
	signal s1,c1	:	std_logic;
	signal c2	:		std_logic;

begin

	U1 : H_A port map(a=>a,b=>b,s=>s1,c=>c1);
	U2 : H_A port map(a=>s1,b=>c,s=>s,c=>c2);
	cout<= c1 or c2;
end Behavioral;