-- Steven Lam
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_instructionMemory is

end tb_instructionMemory;

architecture behavior of tb_instructionMemory is
	--Inputs
	signal tb_read_Addr : std_logic_vector(31 downto 0) := x"003fffff";
	--Outputs
	signal tb_instruction : std_logic_vector(31 downto 0);
begin

	-- Instantiate the Unit Under Test (UUT)
	U1_Test : entity work.instructionMemory (bhv)
	port map(
			read_Addr => tb_read_Addr,
			instruction => tb_instruction
		);
-- Stimulus process
	process
	begin
	-- read 12 commands
	for I in 0 to 11 loop
		tb_read_Addr <= x"00400000" OR std_logic_vector(to_unsigned(I * 4, 32));
		wait for 25 ns;

	end loop;
	assert false
	report "END"
		severity failure;


	end process;
end;