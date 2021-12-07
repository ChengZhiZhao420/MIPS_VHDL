library ieee;
use ieee.std_logic_1164.all;

entity tb_muxRF is
end tb_muxRF;

architecture tb of tb_muxRF is
	-- inputs
	signal muxControl : std_logic;
	signal muxIN_1 : std_logic_vector(4 downto 0);
	signal muxIN_2 : std_logic_vector(4 downto 0);

	-- outputs
	signal muxOUT : std_logic_vector(4 downto 0);

	-- clock period
	constant clk_per : time := 20 ns;

begin 
	uut : entity work.muxRF
	port map(
		muxControl => muxControl,
		muxIN_1 => muxIN_1,
		muxIN_2 => muxIN_2,
		muxOUT => muxOUT
	);
	process
	begin
		-- test cases: inpits are 5-bits for register file
		muxIN_1 <= "00001";
		muxIN_2 <= "00010";
		muxControl <= '1';

		-- check if 2nd input is stored in muxOUT
		assert (muxOUT <= "00010") 
		report "Test failed for second input" severity error;
		wait for clk_per;
		muxControl <= '0';

		-- check if 1st input is stored in muxIN 
		assert (muxOUT <= "00001") 
		report "Test failed for first input" severity error;
		wait for clk_per;

	
		muxIN_1 <= "11111";
		muxIN_2 <= "10101";
		muxControl <= '0';

		assert (muxOUT <= "11111") 
		report "Test failed for first input" severity error;
		wait for clk_per;
		muxControl <= '1';

		assert (muxOUT <= "10101") 
		report "Test failed for second input" severity error;
		wait for clk_per;

	end process;
end tb;
	
		


