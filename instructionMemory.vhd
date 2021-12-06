-- Steven Lam
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instructionMemory is
	port(pc : in std_logic_vector (31 downto 0);
	ir : out std_logic_vector (31 downto 0)
);

end instructionMemory;


architecture bhv of instructionMemory is

	-- array for instruction memory type of RAM_16_x_32 bytes
	type RAM_16_x_32 is array (0 to 15) of std_logic_vector(31 downto 0);


	-- signal index : integer;
	signal instructionMem : RAM_16_x_32 := (
		x"01285024", -- 0x0040 0000: and 	$t2, 	$t1, 	$t0
		x"018b6825", -- 0x0040 0004: or 	$t5, 	$t4, 	$t3
		x"01285020", -- 0x0040 0008: add 	$t2, 	$t1, 	$t0
		x"01285022", -- 0x0040 0004: sub 	$t5, 	$t1, 	$t0
		x"0149402a", -- 0x0040 0010: slt 	$t0, 	$t2, 	$t1
		x"1211fffb", -- 0x0040 0014: branchequal 	$s0, 	$s1, 	$L1		(1210fffb for $s1, $s1)
		x"01285024", -- 0x0040 0018: and 	$t2, 	$t1, 	$t0
		x"018b6825", -- 0x0040 001C: or 	$t5, 	$t4, 	$t3
		x"01285020", -- 0x0040 0020: add 	$t2, 	$t1, 	$t0
		x"01285022", -- 0x0040 0004: sub 	$t5, 	$t1, 	$t0
		x"0149402a", -- 0x0040 0010: slt 	$t0, 	$t2, 	$t1
		x"08100000", 
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000"
	);
process(pc)
begin
	
	-- reset when address is 003FFFFC else if readAddress is 0040 0000 then reset also
	ir <= x"00000000" when pc = x"003FFFFC" else 
		instructionMem(( to_integer(unsigned(pc))/4)(31 downto 0);
		-- if(count > 12) then 
		--	count <=0;
		--if(count = 0) then
			--	instruction(31 downto 24) <= data(instructionMem);	
			--elsif(count = 4) then
				--instruction(23 downto 16) <= data(instructionMem);
			--elsif(count = 8) then
				--instruction(15 downto 8) <= data(instructionMem);
			--elsif(count = 12) then
				--instruction(7 downto 0) <= data(instructionMem);
			--end if;
		--count <= count + 4;
		--read_Addr <= std_logic_vector(unsigned(read_Addr) + 4);
		--end if;
	end process;

end bhv;
