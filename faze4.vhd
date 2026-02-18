
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
entity montgomeri is

generic ( n: integer :=32);

   port( x,y,m  : in std_logic_vector (15 downto 0);
         clk  : in std_logic;
         en   : in std_logic;
         output : out std_logic_vector (15 downto 0));
end montgomeri; 

architecture behavioral of montgomeri is
    signal   temp1, Sum ,Sum2, qim , xiy,y_in,x_in,m_in : std_logic_vector (n-1 downto 0):=(others=>'0');
    --component adderN_bit is
	 	--generic(N:integer:=8); 
 		--port(
		--	A		:		in		std_logic_vector(N-1 downto 0);
		--	B		:		in		std_logic_vector(N-1 downto 0);
		--	S		:		out		std_logic_vector(N-1 downto 0);
		--	Cout		:		out		std_logic
		--);
    --end component;
    -------------------------------------------
component cs_adder is
   -- generic(number_of_blocks : integer := 8;
    --    number_of_bits : integer := 8);
        generic(number_of_blocks : integer := 2;
        number_of_bits : integer := 8);
    port(
        a    : in  std_logic_vector(number_of_bits*number_of_blocks-1 downto 0);
        b    : in  std_logic_vector(number_of_bits*number_of_blocks-1 downto 0);
        cin  : in  std_logic;
        cout : out std_logic;
        sum  : out std_logic_vector(number_of_bits*number_of_blocks-1 downto 0)
    );
end component;
---------------------------------------------

    begin
    ---------------------------------  -- Adder1:adderN_bit generic map(n) 
      Adder1:cs_adder generic map(n/8,8) 
     ---------------------------------  --port map(qim,xiy,Sum,open);
      port map(qim,xiy,'0',open,Sum);
--------------------------------------- --	Adder2:adderN_bit generic map(n)
 Adder2:cs_adder generic map(n/8,8)
---------------------------------------	--port map(sum,temp1,sum2,open);
	  port map(sum,temp1,'0',open,sum2);
-----------------------------------------------------------------
       process(clk,en)
	     variable counter,i,j: integer:=0;
             variable  tempy , temp2 , qim_var , xiy_var,tempShift ,tempShift2: std_logic_vector (n-1 downto 0):=(others=>'0');
	     variable trmpStd : std_logic_vector (n-1 downto 0):=(others=>'0');
             variable q ,inputMode : std_logic := '0';
       begin
		if(en='1') then
			counter:=0;
			inputMode:='1';
			i:=0;
  		else
			if (clk='0' and clk'event)then

				if(i>0)then
					tempshift2 (n-2 downto 0) := sum2(n-1 downto 1);
    						tempshift2(n-1):='0';
      						temp1 <= tempshift2;
						
				end if;
			
			end if;

			if (clk='1' and clk'event)then
				if(Counter<(n/16) and inputMode='1') then
				        x_in(((counter+1)*16)-1 downto counter*16)<=(x);
					y_in(((counter+1)*16)-1 downto counter*16)<=(y);
					m_in(((counter+1)*16)-1 downto counter*16)<=(m);
					counter:=counter+1;
				elsif(Counter<(n/16) and inputMode='0')then
					output<=(temp1(((counter+1)*16)-1 downto counter*16));
					counter:=counter+1;
				else
					if(i=0)then
						temp1<=(trmpStd);
						tempy:=(y_in);
    						tempShift (n-1 downto 1) := tempy(n-2 downto 0);
    						tempShift(0):='0';
      						tempy := tempshift;
						i:=i+1;
                                                --for i in 0 to n-1 loop        
         				elsif i<n then
						q:=temp1(0);
						for j in 0 to n-1 loop
       							qim_var(j):=(q and m_in(j));
							xiy_var(j):=(x_in(i-1) and tempy(j));
						end loop;
 						qim<=qim_var;
						xiy<=xiy_var;
						
						i:=i+1;
						
					else
						counter:=0;
						inputMode:='0';
					
  					end if;
           				--end loop;

					
        			end if;
				
			end if;
    		end if;
	end process;
   end architecture;