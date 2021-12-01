library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory_tb is 
end memory_tb;

architecture tb of memory_tb is	
--inputs
	signal pc : std_logic_vector(0 to 7);
	signal memR : std_logic := '0';
	signal clk : std_logic := '0';
	
	--outputs
	signal ir : std_logic_vector(31 downto 0);

	-- clock period def
	constant clk_per :time := 10ns;

begin
	-- instantiate the unit under test
	uu_test: entity work.memory port map (
		memR => memR,
		pc => pc,
		clk => clk,
		ir => ir
	); 
	
	process
	begin
		---------------------------IR[] = Memory[0 => 3]
		memR <= '1';
		wait for clk_per;
		clk <= '1';
		
		wait for clk_per;
	   	clk <= '0';
		   
		wait for clk_per;
	   	clk <= '1';
		
		wait for clk_per;
	   	clk <= '0';
		   
		wait for clk_per;
	   	clk <= '1';
		   
		wait for clk_per;
	   	clk <= '0';
		   
		wait for clk_per;
	   	clk <= '1';
		
		wait for clk_per;
		assert(ir = x"210ABF2A")
		report "test failed for pc = 0-3" severity error;  
		clk <= '0';
		
		---------------------------IR[] = Memory[4 => 7]
		wait for clk_per;
		clk <= '1';
		
		wait for clk_per;
	   	clk <= '0';
		   
		wait for clk_per;
	   	clk <= '1';
		
		wait for clk_per;
	   	clk <= '0';
		   
		wait for clk_per;
	   	clk <= '1';
		   
		wait for clk_per;
	   	clk <= '0';
		   
		wait for clk_per;
	   	clk <= '1';
		   
		wait for clk_per;
		assert(ir = x"0423780F")
		report "test failed for pc = 4-7" severity error;  
		clk <= '0';
		
		---------------------------IR[] = Memory[9 => 12]
		wait for clk_per;
		clk <= '1';
		
		wait for clk_per;
	   	clk <= '0';
		   
		wait for clk_per;
	   	clk <= '1';
		
		wait for clk_per;
	   	clk <= '0';
		   
		wait for clk_per;
	   	clk <= '1';
		   
		wait for clk_per;
	   	clk <= '0';
		   
		wait for clk_per;
	   	clk <= '1';
		   
		wait for clk_per;
		assert(ir = x"FF223344")
		report "test failed for pc = 9-12" severity error;  	
		
		wait; 
	end process;
end tb;
		   
		   
		
		   
		   
