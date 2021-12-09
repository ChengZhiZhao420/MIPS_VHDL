--ChengZhi Zhao
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memory is
	port(address :in std_logic_vector(0 to 31);
	writeData :in std_logic_vector(31 downto 0);
	memR, memW, clk :in std_logic;
	readData :out std_logic_vector(31 downto 0));
end data_memory;

architecture behavior of data_memory is
type memory is array (0 to 35) of std_logic_vector(31 downto 0);
signal dataMemory : memory:=(
		x"00000000", -- initialize data memory
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000"
);
signal index1 :integer;
begin
	process(clk)
	begin
		
		index1 <= to_integer(unsigned(address));
		if(rising_edge(clk)) then
			if(memW = '1') then
					dataMemory(index1) <= writeData;
					
			elsif(memR = '1') then
					readData <= dataMemory(index1);
			end if;
		end if;
	end process;
end behavior;
