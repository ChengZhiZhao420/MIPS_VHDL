--Idenia Ayala
library ieee;
use ieee.std_logic_1164.all;

entity alu_control is 
	port ( op : in std_logic_vector(1 downto 0);
	funct : in std_logic_vector(5 downto 0);
	clk : in std_logic;
	control : out std_logic_vector (3 downto 0)
	);
end alu_control;

architecture behav of alu_control is 
begin
	process(clk)
	begin
	if(rising_edge(clk)) then
		control(3) <= '0'; 
		control(2) <= op(0) or (op(1) and funct(1)); 
		control(1) <= not op(1) or not funct(2); 
		control(0) <= (funct(3) or funct(0)) and op(1);
	end if;
	end process;
end behav;
