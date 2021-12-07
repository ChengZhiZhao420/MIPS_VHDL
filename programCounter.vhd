--ChengZhi Zhao
library ieee;
use ieee.std_logic_1164.all;

entity programCount is 
	port(programCountIn :in std_logic_vector(0 to 7):= "00000000";
	clk :in std_logic;
	programCountOut :out std_logic_vector(0 to 7));
end programCount;

architecture behavior of programCount is
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			programCountOut <= programCountIn;
		end if;
	end process;
end behavior;
