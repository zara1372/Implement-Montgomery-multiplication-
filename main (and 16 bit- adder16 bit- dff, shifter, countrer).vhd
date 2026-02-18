----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:37:13 11/22/2019 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
	port(
			clk  :  in std_logic;
		--	rst  :  in std_logic;
			input_A	:	in std_logic_vector(15 downto 0);
			input_B	:	in std_logic_vector(15 downto 0);
			input_C	:	in std_logic_vector(15 downto 0);
			input_x	:	in std_logic_vector(15 downto 0);
			input_y	:	in std_logic_vector(15 downto 0);
			q	:	out std_logic_vector(15 downto 0)
	);
end main;

architecture Behavioral of main is

COMPONENT reg
	PORT(
		I   : IN std_logic_vector(15 downto 0);
		ans : IN std_logic_vector(15 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		O   : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

COMPONENT and16_bit
	PORT(
		a : IN std_logic_vector(15 downto 0);
		b : IN std_logic_vector(15 downto 0);          
		o : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

COMPONENT adder16_bit
	PORT(
		a : IN std_logic_vector(15 downto 0);
		b : IN std_logic_vector(15 downto 0);          
		s : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

COMPONENT D_ff
	PORT(
		I   : IN std_logic_vector(15 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		O   : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
		COMPONENT shifter
	PORT(
		a : IN std_logic_vector(15 downto 0);          
		o : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	COMPONENT counter
	PORT(
		clk : IN std_logic;          
		o : OUT std_logic
		);
	END COMPONENT;
	
signal out_A : std_logic_vector(15 downto 0);
signal out_B : std_logic_vector(15 downto 0);
signal out_C : std_logic_vector(15 downto 0);
signal out_x : std_logic_vector(15 downto 0);
signal out_y : std_logic_vector(15 downto 0);
signal out_and_1 : std_logic_vector(15 downto 0);
signal out_and_2 : std_logic_vector(15 downto 0);
signal out_adder_1 : std_logic_vector(15 downto 0);
signal out_adder_2 : std_logic_vector(15 downto 0);
signal out_shifter : std_logic_vector(15 downto 0);
signal rst : std_logic;
signal rst1 : std_logic;

begin

---------------------- reg definition ---------------------
	A_reg: reg PORT MAP(I =>input_A ,ans =>out_shifter ,O =>out_A ,clk =>clk ,rst =>rst);
	B_reg: reg PORT MAP(I =>input_B ,ans =>"0000000000000000" ,O =>out_B,clk => clk,rst =>rst);
	C_reg: reg PORT MAP(I =>input_C ,ans =>"0000000000000000",O =>out_C,clk =>clk ,rst =>rst);


--------------------------- AND ---------------------------	
	X_D_FF: D_ff PORT MAP(I =>input_x ,clk =>clk ,rst =>rst ,O =>out_x );
	Y_D_FF: D_ff PORT MAP(I =>input_y ,clk =>clk ,rst =>rst ,O =>out_y );
	and_1: and16_bit PORT MAP(a =>out_B ,b =>out_x ,o =>out_and_1 );
	and_2: and16_bit PORT MAP(a =>out_C ,b =>out_y ,o =>out_and_2 );
--------------------------- ADDER --------------------------
	adder_1: adder16_bit PORT MAP(a =>out_A ,b =>out_and_1 ,s => out_adder_1);
	adder_2: adder16_bit PORT MAP(a =>out_and_2 ,b =>out_adder_1 ,s =>out_adder_2 );
	u_shft: shifter PORT MAP(a =>out_adder_2 ,o =>out_shifter);
	u_counter: counter PORT MAP(clk => clk,o => rst);
	q<=out_shifter;
end Behavioral;

