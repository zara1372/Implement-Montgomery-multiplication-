
library ieee;
use ieee.std_logic_1164.all;
entity and_comp is
port( 	a : in std_logic_vector(3 downto 0);
	b : in std_logic;
	o : out std_logic_vector(3 downto 0));

end and_comp;
architecture behavioral of and_comp is

begin
	o(0) <= a(0) and b;
	o(1) <= a(1) and b;
	o(2) <= a(2) and b;
	o(3) <= a(3) and b;
	

end behavioral ;