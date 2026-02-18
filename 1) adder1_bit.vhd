----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:06:38 11/22/2019 
-- Design Name: 
-- Module Name:    adder1_bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder1_bit is
		
		port(
			a		:		in		std_logic;
			b		:		in		std_logic;
			c_in		:		in		std_logic;
			s		:		out		std_logic;
			cout		:		out		std_logic
		);
end adder1_bit;

architecture Behavioral of adder1_bit is

begin

	s <= a xor b xor c_in;
	cout <= (a and b) or (b and c_in) or (a and c_in);

end Behavioral;

