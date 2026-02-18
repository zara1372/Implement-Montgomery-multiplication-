library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity faze3 is

generic(n: integer :=32);

   port( x,y,m  : in std_logic_vector (15 downto 0);
         clk  : in std_logic;
         en   : in std_logic;
         output : out std_logic_vector (15 downto 0));
			
end faze3;

architecture behavioral of faze3 is

	signal temp1,qim,xiy,temp2	:	unsigned(n-1 downto 0):=(others=>'0');
	signal t1,t2					:	unsigned(n-1 downto 0):=(others=>'0');
    
	 	COMPONENT f_a
	PORT(
		a : IN unsigned(31 downto 0);
		b : IN unsigned(31 downto 0);          
		o : OUT unsigned(31 downto 0)
		);
	END COMPONENT;
	 
	 begin
       process(clk,en)
	     variable counter: integer:=0;
             --variable temp1, tempy , temp2 , qim , xiy,y_in,x_in,m_in,tempShift : unsigned (n-1 downto 0);
             variable tempy ,y_in,x_in,m_in,tempShift : unsigned (n-1 downto 0);
	     variable trmpStd : std_logic_vector (n-1 downto 0):=(others=>'0');
             variable q ,inputMode                        : std_logic := '0';
			variable i : integer range 0 to n-1;
		 begin
		if(en='1') then
			counter:=0;
			inputMode:='1';
  		else
			
			if (clk='1' and clk'event)then
				if(Counter<(n/16) and inputMode='1') then
				        x_in(((counter+1)*16)-1 downto counter*16):=unsigned(x);
					y_in(((counter+1)*16)-1 downto counter*16):=unsigned(y);
					m_in(((counter+1)*16)-1 downto counter*16):=unsigned(m);
					counter:=counter+1;
				elsif(Counter<(n/16) and inputMode='0')then
					output<=std_logic_vector(temp1(((counter+1)*16)-1 downto counter*16));
					counter:=counter+1;
				else
					temp1<=unsigned(trmpStd);
					tempy:=unsigned(y_in);
    					tempShift (n-1 downto 1) := tempy(n-2 downto 0);
    					tempShift(0):='0';
      					tempy := tempshift;        
         					q:=temp1(0);
						for j in 0 to n-1 loop
       							qim(j)<=(q and m_in(j));
							xiy(j)<=(x_in(i) and tempy(j));
						end loop;
						i := i+1;
						temp2 <= t2;
						tempshift (n-2 downto 0) := temp2(n-1 downto 1);
    						tempshift(n-1):='0';
      						temp1 <= tempshift;
					counter:=0;
					inputMode:='0';
        			end if;
			end if;
    		end if;
	end process;
	
	U1: f_a PORT MAP(a =>temp1 ,b =>qim ,o =>t1);
	U2: f_a PORT MAP(a =>t1 ,b =>xiy ,o =>t2);
	
   end architecture;