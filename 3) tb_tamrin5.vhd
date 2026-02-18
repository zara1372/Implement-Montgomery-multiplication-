--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:00:51 11/29/2019
-- Design Name:   
-- Module Name:   C:/Users/hossein/Desktop/New folder/tamrin2/tb_tamrin5.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_tamrin5 IS
END tb_tamrin5;
 
ARCHITECTURE behavior OF tb_tamrin5 IS  
    
	 COMPONENT tamrin5
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : OUT  std_logic;
         D : OUT  std_logic;
         E : OUT  std_logic
        );
    END COMPONENT;

   signal C : std_logic;
   signal D : std_logic;
   signal E : std_logic;

	signal A_o,B_o : std_logic;
	signal err_out	:std_logic;
	
	procedure create_input(
		number:	in		integer;
		A_out	:	out 	std_logic;
		B_out	:	out	std_logic)
		is
		begin
			if number = 0 then
				A_out:='0';
				B_out:='0';
				else if number = 1 then
					A_out:='0';
					B_out:='1';
						else if number = 2 then
							A_out:='1';
							B_out:='0';
								else if number = 3 then
									A_out:='1';
									B_out:='1';
								end if;
						end if;
				end if;
			end if;
	end create_input;
		
	procedure expect_output(
		A	:		in std_logic;
		B	:		in std_logic;
		C	:		in std_logic;
		D	:		in std_logic;
		E	:		in std_logic;
		error :		out std_logic)
		
		is 
		variable err:std_logic:='1';
		begin
		--------  test C --------
		err:='1';
		if a='0' and b='0' and C='0' and D='1' and E='0' then
			err:='0';
		end if;
		
		if a='0' and b='1' and C='1' and D='1' and E='1' then
			err:='0';
		end if;
		if a='1' and b='0' and C='0' and D='1' and E='0' then
			err:='0';
		end if;
		if a='1' and b='1' and C='0' and D='0' and E='1' then
			err:='0';
		end if;
		
		error:=err;
	end expect_output;
	
BEGIN
 
   uut: tamrin5 PORT MAP (
          A => A_o,
          B => B_o,
          C => C,
          D => D,
          E => E
        ); 

   -- Stimulus process
   stim_proc: process
	variable A_o1,B_o1 : std_logic;
	variable err	:	std_logic;
	variable i :integer :=0;
   begin		
	
		for i in 0 to 3 loop
		wait for 50 ns;
		create_input(i,A_o1,B_o1);
		A_o<=A_o1;
		B_o<=B_o1;
		wait for 1 ns;
		expect_output(A_o1,B_o1,C,D,E,err);
		err_out<=err;
		end loop;
      wait;

   end process;

END;
