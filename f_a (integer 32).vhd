library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity f_a is
	generic (n: integer :=32);
	port(		a , b 	: in unsigned(n-1 downto 0);
				o			: out unsigned(n-1 downto 0));
end f_a;

architecture Behavioral of f_a is

begin

	o<=a + b;

end Behavioral;

