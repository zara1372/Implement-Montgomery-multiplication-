library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
entity adder is
	port(
			input	:	in		std_logic;
			sum	:	in		std_logic_vector(2 downto 0);
			outp	:	out	std_logic_vector(2 downto 0)
			);

end adder;

architecture Behavioral of adder is

begin
	outp<= sum when input='0' else
			sum+1 when input = '1' else
			"000";

end Behavioral;

