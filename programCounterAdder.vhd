--ChengZhi Zhao
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity adder is
	port(programCounterIn :in std_logic_vector(0 to 7);
	programCounterOut :out std_logic_vector(0 to 7);
	clk :in std_logic);
end adder;

architecture behavior of adder is
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			programCounterOut <= std_logic_vector(unsigned(programCounterIn) + 4);
		end if;
	end process;
end behavior;		
		