
library ieee;
use ieee.std_logic_1164.all;
entity F_a is
port(a,b,cin :in std_logic;
     s,cout : out std_logic);
end F_a;
architecture behavioral of F_a is

begin

	s <= a xor b xor cin;
	cout <= (a and b) or (a and cin) or (cin and b);

end behavioralral;