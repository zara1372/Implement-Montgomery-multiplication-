----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:10:10 11/22/2019 
-- Design Name: 
-- Module Name:    adder16_bit - Behavioral 
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

entity adder16_bit is

		port(
				a		:	in std_logic_vector(15 downto 0);
				b		:	in std_logic_vector(15 downto 0);
				s		:	out std_logic_vector(15 downto 0)
		);
end adder16_bit;

architecture Behavioral of adder16_bit is

COMPONENT adder1_bit
	PORT(
		a : IN std_logic;
		b : IN std_logic;
		c_in : IN std_logic;
		s : OUT std_logic;
		cout : OUT std_logic       
		);
	END COMPONENT;
signal c : std_logic_vector(14 downto 0);
	
begin

U0: adder1_bit PORT MAP(a =>a(0) ,b =>b(0) ,c_in =>'0' ,s =>s(0) ,cout =>c(0) );
U1: adder1_bit PORT MAP(a =>a(1) ,b =>b(1) ,c_in =>c(0) ,s =>s(1) ,cout => c(1));
U2: adder1_bit PORT MAP(a =>a(2) ,b =>b(2) ,c_in =>c(1) ,s =>s(2) ,cout => c(2));
U3: adder1_bit PORT MAP(a =>a(3) ,b =>b(3) ,c_in =>c(2) ,s =>s(3) ,cout => c(3));
U4: adder1_bit PORT MAP(a =>a(4) ,b =>b(4) ,c_in =>c(3) ,s =>s(4) ,cout => c(4));
U5: adder1_bit PORT MAP(a =>a(5) ,b =>b(5) ,c_in =>c(4) ,s =>s(5) ,cout => c(5));
U6: adder1_bit PORT MAP(a =>a(6) ,b =>b(6) ,c_in =>c(5) ,s =>s(6) ,cout => c(6));
U7: adder1_bit PORT MAP(a =>a(7) ,b =>b(7) ,c_in =>c(6) ,s =>s(7) ,cout => c(7));
U8: adder1_bit PORT MAP(a =>a(8) ,b =>b(8) ,c_in =>c(7) ,s =>s(8) ,cout => c(8));
U9: adder1_bit PORT MAP(a =>a(9) ,b =>b(9) ,c_in =>c(8) ,s =>s(9) ,cout => c(9));
U10: adder1_bit PORT MAP(a =>a(10) ,b =>b(10) ,c_in =>c(9) ,s =>s(10) ,cout => c(10));
U11: adder1_bit PORT MAP(a =>a(11) ,b =>b(11) ,c_in =>c(10) ,s =>s(11) ,cout => c(11));
U12: adder1_bit PORT MAP(a =>a(12) ,b =>b(12) ,c_in =>c(11) ,s =>s(12) ,cout => c(12));
U13: adder1_bit PORT MAP(a =>a(13) ,b =>b(13) ,c_in =>c(12) ,s =>s(13) ,cout => c(13));
U14: adder1_bit PORT MAP(a =>a(14) ,b =>b(14) ,c_in =>c(13) ,s =>s(14) ,cout => c(14));
U15: adder1_bit PORT MAP(a =>a(15) ,b =>b(15) ,c_in =>c(14) ,s =>s(15) ,cout => open);

end Behavioral;

