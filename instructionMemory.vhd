--Group members--
--Dharam Kathiriya
--idenia ayala
--Chengzhi Zhao
--Steven Lam

library ieee;
use ieee.std_logic_1164.all;	  
use ieee.numeric_std.all;

entity memory is
	port(pc :buffer std_logic_vector(0 to 7):= "00000000"; 
	memR, clk :in std_logic;
	count :buffer integer:= 0;
	
	ir :out std_logic_vector(31 downto 0));
end memory;

architecture behavior of memory is	
type memory is array (0 to 31) of std_logic_vector(0 to 7); 
signal index : integer;
signal data : memory:=(
x"01",
x"28",
x"50",
x"20",-------add $t2, $t1, $t0
x"01",
x"28",
x"50",
x"24",-------and $t2, $t1, $t0
x"8E",
x"11",
x"00",
x"01",-------lw $17, 1($16)
x"01",
x"28",
x"50",
x"22",--------sub $t5, $t1, $t0
x"11",
x"09",
x"01",
x"00",--------Beq $8, $9, 256
x"AE",
x"30",
x"00",
x"16",--------sw $16, 22($17)
x"01",
x"4B",
x"48",
x"25",--------or $9, $10, $11
x"21",
x"49",
x"00",
x"0C"--------addi $t1, $t2, 12
);

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
			pc <= std_logic_vector(unsigned(pc) +1);
			count <= count + 1;
		end if;
		
	end process;
end behavior;
