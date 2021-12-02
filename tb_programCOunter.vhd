--ChengZhi Zhao
library ieee;
use ieee.std_logic_1164.all;

entity tb_programCounter is
end tb_programCounter;

architecture tb of tb_programCounter is
	signal programCountIn : std_logic_vector(0 to 7);
	signal programCountOut : std_logic_vector(0 to 7);
	signal clk : std_logic;

	constant clk_per :time := 10ns;
begin
	UUT: entity work.programCount port map(
		programCountIn => programCountIn,
		programCountOut => programCountOut,
		clk => clk);
	process
	begin
		clk <= '0';
		programCountIn <= "00000000";
		wait for clk_per;
		
		clk <= '1';
		wait for clk_per;
		assert(programCountOut <= "00000000")
		report "Test failed for program counter input" severity error;

		clk <= '0';
		programCountIn <= "00000001";
		wait for clk_per;
		
		clk <= '1';
		wait for clk_per;
		assert(programCountOut <= "00000001")
		report "Test failed for program counter input" severity error;

		clk <= '0';
		programCountIn <= "00000010";
		wait for clk_per;
		
		clk <= '1';
		wait for clk_per;
		assert(programCountOut <= "00000010")
		report "Test failed for program counter input" severity error;
		wait;
	end process;
end tb;