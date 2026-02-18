----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:38:57 11/29/2019 
-- Design Name: 
-- Module Name:    tamrin3 - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tamrin3 is
		
		port(	clk_100MHZ	:		in		std_logic;
				x				:		in		std_logic;
				output		:		out	std_logic);
end tamrin3;

architecture Behavioral of tamrin3 is

	signal compare	:	std_logic_vector(6 downto 0):= "1100100";
	signal temp		:	std_logic_vector(6 downto 0):= "0000000";
	signal busy		:	std_logic:='0';
begin

	process(x,clk_100MHZ)
	begin
	
	if x'event and x='1' then
		busy <='1';
	end if;
	
	if clk_100MHZ'event and clk_100MHZ='1' then
		if busy='1' then
			if temp < compare then
				temp <=temp+1;
				output<='1';
				else
				temp<="0000000";
				busy<='0';
				output<='0';
			end if;
		end if;
		end if;
	end process;

end Behavioral;
