-- Steven Lam
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instructionMemory is
	port(pc : in std_logic_vector (31 downto 0);
	ir : out std_logic_vector (31 downto 0)
);

end instructionMemory;

signal addr: std_logic_vector (7 downto 0);
architecture bhv of instructionMemory is

	-- array for instruction memory type of RAM_17_x_32 bytes
type Ram_mem is array (0 to 16) of std_logic_vector(31 downto 0);

signal IM : Ram_mem := (

x"01285024",-------and $t2, $t1, $t0
x"018b6825",--------or $t5, $t4, $t3
x"01285020",-------add $t2, $t1, $t0
x"0149402a",--------slt $t0, $t2, $t1
x"8E110001",--------lw $17, 1($16)
x"01285022",--------sub $t5, $t1, $t0
x"11090100",--------beq $8, $9, 256
x"AE300016",--------sw $16, 22($17)
x"014B4825",--------or $9, $10, $11
x"2149000C",--------addi $t1, $t2, 12
x"0149402a",--------slt $t0, $t2, $t1
x"1211fffb",--------branchequal $s0, $s1, $L1	
x"00000000",
x"00000000",
x"00000000",
x"00000000",
x"00000000",

);


	begin 
		signal instructionMem : Ram_mem := 

	process(pc)
	begin
	
			addr <= pc(7 downto 0);

			ir <= instructionMem(( to_integer(unsigned(addr))/4)
			(31 downto 0);
		
	end process;

end bhv;
