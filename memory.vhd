--Group members--
--Dharam Kathiriya
--idenia ayala
--Chengzhi Zhao
--Steven Lam

library ieee;
use ieee.std_logic_1164.all;	  
use ieee.numeric_std.all;

entity memory is
	port(pc :buffer std_logic_vector(0 to 7):="00000000"; 
	memR, clk :in std_logic;
	
	ir :out std_logic_vector(31 downto 0));
end memory;

architecture behavior of memory is	
type memory is array (0 to 13) of std_logic_vector(0 to 7); 
signal index : integer;
signal data : memory:=(
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
x"F1"
);
signal count :integer:= 0;
begin	 
	process(clk)
	begin	
		index <= to_integer(unsigned(pc));
		if(count > 3) then	
			count <= 0;
		end if;
		
		if(rising_edge(clk) and (memR = '1')) then
			if(count = 0) then
				ir(31 downto 24) <= data(index);	
			elsif(count = 1) then
				ir(23 downto 16) <= data(index);
			elsif(count = 2) then
				ir(15 downto 8) <= data(index);
			elsif(count = 3) then
				ir(7 downto 0) <= data(index);
			end if;
			count <= count + 1;
			pc <= std_logic_vector(unsigned(pc) + 1);
		end if;
		
	end process;
end behavior;
