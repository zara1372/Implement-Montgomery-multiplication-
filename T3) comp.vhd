library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity comp is
 generic (w : integer:= 7);
port( a : in bit_vector(w downto 0);
      b : in bit_vector(w downto 0);
      enable: in bit;
      eq,gt,it: out bit
);

end comp;
architecture behavioral of comp is
begin
    eq<='1' when (a=b) and enable='1' else'0';
    gt<='1' when (a>b) and enable='1' else'0';
    it<='1' when (a<b) and enable='1' else'0';
   end behavioral;
