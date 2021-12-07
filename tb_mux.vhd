library ieee;
use ieee.std_logic_1164.all;

entity tb_mux is
end tb_mux;

architecture tb of tb_mux is
	-- inputs
	signal muxControl : std_logic;
	signal muxIN_1 : std_logic_vector(31 downto 0);
	signal muxIN_2 : std_logic_vector(31 downto 0);

	-- outputs
	signal muxOUT : std_logic_vector(31 downto 0);

	-- clock period
	constant clk_per : time := 10 ns;

begin 
	uut : entity work.mux
	port map(
		muxControl => muxControl,
		muxIN_1 => muxIN_1,
		muxIN_2 => muxIN_2,
		muxOUT => muxOUT
	);
	process
	begin
		-- test cases: inpits are 5-bits for register file
		muxIN_1 <= x"0A0A0A0A";
		muxIN_2 <= x"BBBBBBBB";
		muxControl <= '1';

		-- check if 2nd input is stored in muxOUT
		assert (muxOUT <= x"BBBBBBBB") 
		report "Test failed for second input" severity error;
		wait for clk_per;
		muxControl <= '0';

		-- check if 1st input is stored in muxIN 
		assert (muxOUT <= x"0A0A0A0A") 
		report "Test failed for first input" severity error;
		wait for clk_per;

		
		muxIN_1 <= x"11111111";
		muxIN_2 <= x"10101010";
		muxControl <= '0';
		
		-- check if 1st input is stored in muxIN 
		assert (muxOUT <= x"11111111") 
		report "Test failed for first input" severity error;
		wait for clk_per;
		muxControl <= '1';

		-- check if 2nd input is stored in muxOUT
		assert (muxOUT <= x"10101010") 
		report "Test failed for second input" severity error;
		wait for clk_per;

	end process;
end tb;
	
		

