----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:41:53 11/22/2019 
-- Design Name: 
-- Module Name:    register - Behavioral 
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

entity reg is
	port(
			I	:		in 	std_logic_vector(15 downto 0);
			ans	:		in 	std_logic_vector(15 downto 0);
			O	:		out 	std_logic_vector(15 downto 0);
			clk	:		in 	std_logic;
			rst	:		in 	std_logic
			);

end reg;

architecture Behavioral of reg is

begin

	process(clk)
	begin
	if (clk'event and clk='1') then  --rising edge clk
		if rst ='0' then		--active low  load parallel input
			O<=I;
		else if rst = '1' then		--answer of sum
			O<=ans;
			end if;
	end if;
end if;
	end process;

end Behavioral;

