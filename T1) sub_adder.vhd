library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sub_adder is
	port(
		a	:	in		std_logic_vector(3 downto 0);
		b	:	in		std_logic_vector(3 downto 0);
		control	:	in	std_logic;
		s	:	out	std_logic_vector(3 downto 0);
		carry_out	:	out	std_logic
	);
end sub_adder;

architecture Behavioral of sub_adder is

	component test1
		port(a,b,c	:	in		std_logic;
		s,cout:	out	std_logic);
	end component;
	
	signal t:std_logic_vector(3 downto 0);
	signal c : std_logic_vector(2 downto 0);
	
begin
	
	t(0)<= b(0) xor control;
	t(1)<= b(1) xor control;
	t(2)<= b(2) xor control;
	t(3)<= b(3) xor control;
	
	U1 : test1 port map(a=>a(0),b=>t(0),c=>control,s=>s(0),cout=>c(0));
	U2 : test1 port map(a=>a(1),b=>t(1),c=>c(0),s=>s(1),cout=>c(1));
	U3 : test1 port map(a=>a(2),b=>t(2),c=>c(1),s=>s(2),cout=>c(2));
	U4 : test1 port map(a=>a(3),b=>t(3),c=>c(2),s=>s(3),cout=>carry_out);


end Behavioral;

