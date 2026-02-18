----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:29:03 11/22/2019 
-- Design Name: 
-- Module Name:    and16_bit - Behavioral 
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

entity and16_bit is
		port(a,b :		in		std_logic_vector(15 downto 0);
		     o	 :		out	std_logic_vector(15 downto 0)
				);
		
end and16_bit;

architecture Behavioral of and16_bit is

begin

	U:for i in 0 to 15 generate
      begin
         o(i)<= a(i) and b(i);
   end generate;

end Behavioral;

