
library ieee;
use ieee.std_logic_1164.all;
entity adder4bit is
port(
	a,b: in std_logic_vector(3 downto 0);
     	s : out std_logic_vector(3 downto 0);
	cout : out std_logic);

end adder4bit;

architecture behavioral of adder4bit is

component F_a 
	port(a,b,cin :in std_logic;
    	 s,cout : out std_logic);

end component;

	signal c : std_logic_vector(2 downto 0);

begin
	u1 : F_a port map(a=>a(0),b=>b(0),cin=>'0',s=>s(0),cout=>c(0));
	u2 : F_a port map(a=>a(1),b=>b(1),cin=>c(0),s=>s(1),cout=>c(1));
	u3 : F_a port map(a=>a(2),b=>b(2),cin=>c(1),s=>s(2),cout=>c(2));
	u4 : F_a port map(a=>a(3),b=>b(3),cin=>c(2),s=>s(3),cout=>cout);

end behavioral ;