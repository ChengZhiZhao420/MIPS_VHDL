--ChengZhi Zhao
library ieee;
use ieee.std_logic_1164.all;

entity tb_adder is
end tb_adder;

architecture tb of tb_adder is
	signal clk :std_logic;
	signal programCounterIn :std_logic_vector(0 to 7);
	signal programCounterOut :std_logic_vector(0 to 7);
	constant clk_per :time := 10ns;
begin
	UUT: entity work.adder port map(
	programCounterIn => programCounterIn,
	programCounterOut => programCounterOut,
	clk => clk);
	process
	begin
		clk <= '0';
		programCounterIn <= "00000000";
		wait for clk_per;
		
		clk <= '1';
		wait for clk_per;
		assert(programCounterOut <= "00000100")
		report "Test failed for program counter input" severity error;

		clk <= '0';
		programCounterIn <= "00000001";
		wait for clk_per;
		
		clk <= '1';
		wait for clk_per;
		assert(programCounterOut <= "00000101")
		report "Test failed for program counter input" severity error;

		clk <= '0';
		programCounterIn <= "00000010";
		wait for clk_per;
		
		clk <= '1';
		wait for clk_per;
		assert(programCounterOut <= "00000110")
		report "Test failed for program counter input" severity error;
		wait;
	end process;
end tb;