-- Dharam Kathiriya
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_registerFile is
end tb_registerFile;

architecture tb of tb_registerFile is
	-- inputs
	signal reg_write : std_logic := '0';
	signal read_reg_1, read_reg_2, write_reg : std_logic_vector(4 downto 0) := (others => '0');
	signal write_data : std_logic_vector(31 downto 0) := (others => '0');

	-- outputs
	signal read_data_1, read_data_2 : std_logic_vector(31 downto 0);

	-- clock period
	constant clk_per : time := 20 ns;
begin
	uut : entity work.registerFile
	port map (
		reg_write => reg_write,
		read_reg_1 => read_reg_1,
		read_reg_2 => read_reg_2,
		write_reg => write_reg,
		write_data => write_data,
		read_data_1 => read_data_1,
		read_data_2 => read_data_2
	);
	process
	begin

		write_reg <= "01001"; -- register t1
		write_data <= x"99999999"; -- set the value for register t1
		wait for clk_per;
		reg_write <= '1'; 	
		wait for clk_per;	
		reg_write <= '0';	
		wait for clk_per;	
		assert(write_data <= x"99999999")
		report "Test Failed for register t1" severity error;

		-- write to registers t2
		write_reg <= "01010"; -- $t2
		write_data <= x"AAAAAAAA"; 
		wait for clk_per;
		reg_write <= '1'; 	
		wait for clk_per;	
		reg_write <= '0';	
		wait for clk_per;
		assert(write_data <= x"AAAAAAAA")
		report "Test Failed for register t2" severity error; 

		-- write to register s0
		write_reg <= "10000"; -- $s0
		write_data <= x"11111111"; 
		wait for clk_per;
		reg_write <= '1'; 	
		wait for clk_per;	
		reg_write <= '0';	
		wait for clk_per;
		assert(write_data <= x"11111111")
		report "Test Failed for register s0" severity error;
		
		
	end process;
end tb;

		
		
	