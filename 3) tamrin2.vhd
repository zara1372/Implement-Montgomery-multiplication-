
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tamrin2 is
			port(
				I		:	in		std_logic_vector(4 downto 0);
				output	:	out	std_logic
			);
end tamrin2;

architecture Behavioral of tamrin2 is

	COMPONENT adder
	PORT(
		input : IN std_logic;
		sum : IN std_logic_vector(2 downto 0);          
		outp : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

signal t0 : std_logic_vector(2 downto 0);
signal t1 : std_logic_vector(2 downto 0);
signal t2 : std_logic_vector(2 downto 0);
signal t3 : std_logic_vector(2 downto 0);
signal t4 : std_logic_vector(2 downto 0);

begin
	s0: adder PORT MAP(input =>i(0) ,sum =>"000" ,outp =>t0);
	s1: adder PORT MAP(input =>i(1) ,sum =>t0 ,outp =>t1);
	s2: adder PORT MAP(input =>i(2) ,sum =>t1 ,outp =>t2);
	s3: adder PORT MAP(input =>i(3) ,sum =>t2 ,outp =>t3);
	s4: adder PORT MAP(input =>i(4) ,sum =>t3 ,outp =>t4);
	
	output <= 	'1' when t4>"010" else
					'0';

end Behavioral;

