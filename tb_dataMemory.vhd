--ChengZhi Zhao
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dataMemory_tb is
end dataMemory_tb;

architecture tb of dataMemory_tb is
	signal address_tb :std_logic_vector(0 to 31);
	signal writeData_tb :std_logic_vector(31 downto 0);
	signal memR_tb :std_logic; 
	signal memW_tb :std_logic; 
	signal clk_tb :std_logic;
	signal readData_tb :std_logic_vector(31 downto 0);

	constant clk_per :time := 10ns;
begin
	UUT: entity work.data_memory port map(
		address => address_tb,
		writeData => writeData_tb,
		memR => memR_tb,
		memW => memW_tb,
		clk => clk_tb,
		readData => readData_tb
	);

	process
	begin
		-----------write Data------
		memW_tb <= '1';
		clk_tb <= '0';
		address_tb <= "00000000000000000000000111110100";---500
		writeData_tb <= x"FF23C042";
		wait for clk_per;

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';
	
		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';
		memW_tb <= '0';
		memR_tb <= '1';
		--------------------------

		--------Read Data-----
		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		assert(readData_tb = x"FF23C042")
		report "test failed for Read data1" severity error;

		------------------------------------------------  
		clk_tb <= '0';
		memW_tb <= '1';
		memR_tb <= '0';
		address_tb <= "00000000000000000000000111111000";---504
		writeData_tb <= x"FF4252BA";
		wait for clk_per;

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';
	
		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';
		memW_tb <= '0';
		memR_tb <= '1';
		--------------------------

		--------Read Data-----
		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		assert(readData_tb = x"FF4252BA")
		report "test failed for Read data2" severity error;
		---------------------------------------------------

		clk_tb <= '0';
		memW_tb <= '1';
		memR_tb <= '0';
		address_tb <= "00000000000000000000000111111100";---508
		writeData_tb <= x"FFB2F2FF";
		wait for clk_per;

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';
	
		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';
		memW_tb <= '0';
		memR_tb <= '1';
		--------------------------

		--------Read Data-----
		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		clk_tb <= '0';

		wait for clk_per;
		clk_tb <= '1';

		wait for clk_per;
		assert(readData_tb = x"FFB2F2FF")
		report "test failed for Read data3" severity error;


		wait;

	end process;
end tb;






