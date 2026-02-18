library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tamrin5 is
	port(
			A,B		:		in		std_logic;
			C,D,E		:		out	std_logic	
				);

end tamrin5;

architecture Behavioral of tamrin5 is

begin
	
	C <= 	'0' when A='0' and B='0' else
			'1' when A='0' and B='1' else
			'0' when A='1' and B='0' else
			'0' when A='1' and B='1' ;
	
	D <= 	'1' when A='0' and B='0' else
			'1' when A='0' and B='1' else
			'1' when A='1' and B='0' else
			'0' when A='1' and B='1' ;
	
	E <= 	'0' when A='0' and B='0' else
			'1' when A='0' and B='1' else
			'0' when A='1' and B='0' else
			'1' when A='1' and B='1' ;
					
	
end Behavioral;

