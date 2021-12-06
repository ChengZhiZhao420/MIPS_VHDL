library ieee;
use ieee.std_logic_1164.all;

architecture behav of tb_alu is
	--inputs
	signal tb_a : std_logic_vector(31 downto 0) := (others => '0');
	signal tb_b : std_logic_vector(31 downto 0) := (others => '0');
	signal tb_control : std_logic_vector(3 downto 0) := (others => '0');
	--outputs
	signal tb_result : std_logic_vector(31 downto 0);
	signal tb_zero : std_logic;

begin
	uu_test : entity work.ALU(behavioral)
		port map( a => tb_a,
		b => tb_b,
		control => tb_control,
		result => tb_result,
		zero => tb_zero
		);
-- stimulus
stim : process
begin
	tb_a <= x"00000003";
	tb_b <= x"FFFFFFFF";
	tb_control <= "0000"; -- add
	wait for 50ns;
	tb_control <= "0001"; -- sub
	wait for 50ns;
	tb_control <= "0010"; -- and
	wait for 50ns;
	tb_control <= "0011"; -- or
	wait for 50ns;
	tb_control <= "0100"; -- xor
	wait for 50ns;
	tb_control <= "0101"; -- set on less than
	wait for 50ns;

	assert false
	report "end"
	severity failure;
end process;
end;
