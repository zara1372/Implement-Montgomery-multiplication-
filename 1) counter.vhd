library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
entity counter is
	port(	clk	:	in    std_logic;
		o	:	out   std_logic);
			
end counter;

architecture Behavioral of counter is
	signal t : integer range 0 to 16 := 0;
begin
	process(clk)

	begin
		
		if clk'event and clk='1' then
			if t < 15 then
				t<=t+1;
				o<='1';
			else
				o<='0';
			end if;
		end if;
	
	end process;
	

end Behavioral;

