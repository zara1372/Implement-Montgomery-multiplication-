
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity FULLADD is
		
		port(
			a		:		in		std_logic;
			b		:		in		std_logic;
			c_in		:		in		std_logic;
			s		:		out		std_logic;
			cout		:		out		std_logic
		);
end FULLADD;

architecture Behavioral of FULLADD is

begin

	s <= a xor b xor c_in;
	cout <= (a and b) or (b and c_in) or (a and c_in);

end Behavioral;
