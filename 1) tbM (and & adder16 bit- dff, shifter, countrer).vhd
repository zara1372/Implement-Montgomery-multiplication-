--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:37:38 11/26/2019
-- Design Name:   
-- Module Name:   C:/Users/hossein/Desktop/New folder/project/tbM.vhd
-- Project Name:  project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbM IS
END tbM;
 
ARCHITECTURE behavior OF tbM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         clk : IN  std_logic;
   --    rst : IN  std_logic;
         input_A : IN  std_logic_vector(15 downto 0);
         input_B : IN  std_logic_vector(15 downto 0);
         input_C : IN  std_logic_vector(15 downto 0);
         input_x : IN  std_logic_vector(15 downto 0);
         input_y : IN  std_logic_vector(15 downto 0);
         q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
 --signal rst : std_logic := '0';
   signal input_A : std_logic_vector(15 downto 0) := (others => '0');
   signal input_B : std_logic_vector(15 downto 0) := (others => '0');
   signal input_C : std_logic_vector(15 downto 0) := (others => '0');
   signal input_x : std_logic_vector(15 downto 0) := (others => '0');
   signal input_y : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal outp : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          clk => clk,
         -- rst => rst,
          input_A => input_A,
          input_B => input_B,
          input_C => input_C,
          input_x => input_x,
          input_y => input_y,
          q => outp
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		
	--	rst <='0', '1' after 100 ns,'0' after 120 ns;
		input_A <= (others=>'1'), "0000000011111111" after 20 ns;
		input_B <= (others=>'1'), "0000000001111111" after 30 ns;
		input_C <= (others=>'1'), "0000000000111111" after 40 ns;
		input_x <= (others=>'1'), "0000000000011111" after 50 ns;
		input_y <= (others=>'1'), "0000000000001111" after 60 ns;
                
					 
		-- hold reset state for 100 ns.
      --wait for 100 ns;	

      --wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
