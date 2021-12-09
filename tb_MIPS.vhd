library ieee;
use ieee.std_logic_1164.all;

entity tb_MIPS is
end tb_MIPS;

architecture behavior of tb_MIPS is
SIGNAL tb_clk : std_logic;
SIGNAL tb_reset : std_logic;
CONSTANT clk_period : TIME := 20 ns;
begin

	UUT: entity work.MIPS port map(
		clk => tb_clk,
		reset  => tb_reset);

PROCESS
BEGIN
	tb_reset <= '0';
	tb_clk <= '0';
	WAIT FOR clk_period/2;
	tb_clk <= '1';
	WAIT FOR clk_period/2;
	tb_clk <= '0';
	WAIT FOR clk_period/2;
	tb_clk <= '1';
	WAIT FOR clk_period/2;
	tb_clk <= '0';
	WAIT FOR clk_period/2;
	tb_clk <= '1';
	WAIT FOR clk_period/2;


END PROCESS;


end behavior;
