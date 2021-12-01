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
type memory is array (0 to 19) of std_logic_vector(0 to 7);
signal base_key :integer:= 500;
signal dataMemory : memory:=(
x"21",
x"0A",
x"BF",
x"2A",
x"04",
x"23",
x"78",
x"0F",
x"FF",
x"22",
x"33",
x"44",
x"52",
x"F1",
x"52",
x"52",
x"52",
x"52",
x"52",
x"52"
);
signal count:integer:= 0;
begin
	process(clk)
	begin
		if(count > 3) then	
			count <= 0;
		end if;
		if(rising_edge(clk) and memW = '1') then
			if(count = 0) then
				dataMemory(to_integer(unsigned(address)) - base_key + count) <= writeData(31 downto 24);
			elsif(count = 1) then
				dataMemory(to_integer(unsigned(address)) - base_key + count) <= writeData(23 downto 16);
			elsif(count = 2) then
				dataMemory(to_integer(unsigned(address)) - base_key + count) <= writeData(15 downto 8);
			else
				dataMemory(to_integer(unsigned(address)) - base_key + count) <= writeData(7 downto 0);
			end if;
			count <= count + 1;
		elsif(rising_edge(clk) and memR = '1') then
			if(count = 0) then
				readData(31 downto 24) <= dataMemory(to_integer(unsigned(address)) - base_key + count);
			elsif(count = 1) then
				readData(23 downto 16) <= dataMemory(to_integer(unsigned(address)) - base_key + count);
			elsif(count = 2) then
				readData(15 downto 8) <= dataMemory(to_integer(unsigned(address)) - base_key + count); 
			else
				readData(7 downto 0) <= dataMemory(to_integer(unsigned(address)) - base_key + count);
			end if;
			count <= count + 1;
		end if;
	end process;
end behavior;