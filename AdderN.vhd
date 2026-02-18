library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adderN_bit is
		generic(N:integer:=8);
		port(
			A		:		in		std_logic_vector(N-1 downto 0);
			B		:		in		std_logic_vector(N-1 downto 0);
			S		:		out		std_logic_vector(N-1 downto 0);
			Cout		:		out		std_logic
		);
end adderN_bit;


architecture Behavioral of adderN_bit is



component FULLADD is
		
		port(
			a		:		in		std_logic;
			b		:		in		std_logic;
			c_in		:		in		std_logic;
			s		:		out		std_logic;
			cout		:		out		std_logic
		);
end component;



 signal C : std_logic_vector(n-1 downto 0);

begin

  GEN_ADD: for I in 0 to N-1 generate

    LOWER_BIT: if I=0 generate
      U0: FULLADD port map
         (A(I),B(I),'0',S(I),C(I));
    end generate LOWER_BIT;

    UPPER_BITS: if I>0 generate
      UX: FULLADD port map
         (A(I),B(I),C(I-1),S(I),C(I));
    end generate UPPER_BITS;

  end generate GEN_ADD;

  Cout <= C(n-1);


end Behavioral;
