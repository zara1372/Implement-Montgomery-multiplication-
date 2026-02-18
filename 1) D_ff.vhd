----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:20 11/22/2019 
-- Design Name: 
-- Module Name:    D_ff - Behavioral 
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

entity D_ff is

		port(
				I	:		in		std_logic_vector(15 downto 0);
				clk	:		in		std_logic;
				rst	:		in		std_logic;
				O	:		out	        std_logic_vector(15 downto 0)
		);


end D_ff;

architecture Behavioral of D_ff is

begin

	process(clk)
	begin
	if clk'event and clk='1' then
		if rst = '0' then
			O<=I;
		else
			O<=(others=>'0');
		end if;
	end if;
		
	end process;

end Behavioral;

