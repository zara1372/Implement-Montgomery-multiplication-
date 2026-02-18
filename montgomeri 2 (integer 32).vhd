library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity montgomeri is

generic ( n: integer :=32);

   port( x,y,m  : in std_logic_vector (15 downto 0);
         clk  : in std_logic;
         en   : in std_logic;
         output : out std_logic_vector (15 downto 0));
end montgomeri;

architecture behavioral of montgomeri is

    begin
       process(clk,en)
	     variable counter: integer:=0;
             variable temp1, tempy , temp2 , qim , xiy,y_in,x_in,m_in,tempShift : unsigned (n-1 downto 0);
	     variable trmpStd : std_logic_vector (n-1 downto 0):=(others=>'0');
             variable q ,inputMode                        : std_logic := '0';
	     variable i,j :integer := 0;
       begin
		if(en='1') then
			counter:=0;
			inputMode:='1';
			i:=0;
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
					if(i=0)then
						temp1:=unsigned(trmpStd);
						tempy:=unsigned(y_in);
    						tempShift (n-1 downto 1) := tempy(n-2 downto 0);
    						tempShift(0):='0';
      						tempy := tempshift;
						i:=i+1;
                                                --for i in 0 to n-1 loop        
         				elsif i<n then
						q:=temp1(0);
						for j in 0 to n-1 loop
       							qim(j):=(q and m_in(j));
							xiy(j):=(x_in(i) and tempy(j));
						end loop;
						temp2 := temp1 + qim + xiy;
						tempshift (n-2 downto 0) := temp2(n-1 downto 1);
    						tempshift(n-1):='0';
      						temp1 := tempshift;
						i:=i+1;
					else
						counter:=0;
						inputMode:='0';
						output<=std_logic_vector(temp1(((counter+1)*16)-1 downto counter*16));
  					end if;
           				--end loop;

					
        			end if;
				
			end if;
    		end if;
	end process;
   end architecture;