
library ieee;
use ieee.std_logic_1164.all;
entity mul is
port(a,b : in std_logic_vector(3 downto 0);
	output	: out std_logic_vector(7 downto 0));
end mul;

architecture behavioral of mul is

component and_comp
port( 	a : in std_logic_vector(3 downto 0);
	b : in std_logic;
	o : out std_logic_vector(3 downto 0));
end component;

component adder4bit
port(
	a,b: in std_logic_vector(3 downto 0);
     	s : out std_logic_vector(3 downto 0);
	cout : out std_logic);
end component;

signal s1,s2,s3,s4: std_logic_vector(3 downto 0);
signal add_out1,add_out2,add_out3 : std_logic_vector(3 downto 0);
signal c:std_logic_vector(2 downto 0);
signal t1,t2,t3 : std_logic_vector(3 downto 0);
begin

	stage1 : and_comp port map(a=>a,b=>b(0),o=>s1);
	output(0)<=s1(0);
	stage2 : and_comp port map(a=>a,b=>b(1),o=>s2);
	t1 <= ('0'&s1(3 downto 1));
	add1: adder4bit port map(a=>t1 , b=>s2 ,s=>add_out1 , cout=>c(0));
	output(1)<=add_out1(0);
	stage3 : and_comp port map(a=>a,b=>b(2),o=>s3);
	t2 <= (c(0)&add_out1(3 downto 1));
	add2: adder4bit port map(a=> t2 , b=>s3 ,s=>add_out2 , cout=>c(1) );
	output(2) <= add_out2(0);
	stage4 : and_comp port map(a=>a,b=>b(3),o=>s4);
	t3 <= (c(1)&add_out2(3 downto 1));
	add3: adder4bit port map(a=> t3 , b=>s4 ,s=>add_out3 , cout=>c(2) );
	output(6 downto 3)<= add_out3;
	output(7)<= c(2);
end behavioral ;
