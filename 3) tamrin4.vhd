----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:06:49 11/29/2019 
-- Design Name: 
-- Module Name:    tamrin4 - Behavioral 
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

entity tamrin4 is
	port(
			G		:	in		std_logic;
			A,B	:	in 	std_logic;
			Y		:	out	std_logic_vector(3 downto 0));
end tamrin4;

architecture Behavioral of tamrin4 is

begin
	
	Y<= 	"0000" when G='0' else
			"0001" when G='1' and A='0' and B='0' else
			"0010" when G='1' and A='1' and B='0' else
			"0100" when G='1' and A='0' and B='1' else
			"1000" when G='1' and A='1' and B='1' else
			"0000";
end Behavioral;

