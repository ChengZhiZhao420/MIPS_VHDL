library ieee;
use ieee.std_logic_1164.all;

entity tb_aluCU is
end tb_aluCU;

architecture behav of tb_aluCU is
	signal tb_op : std_logic_vector(1 downto 0) := (others => '0'); --inputs
	signal tb_func : std_logic_vector(5 downto 0) := (others => '0');

	signal tb_control : std_logic_vector(3 downto 0);  -- output

begin   -- unit under test
	uu_test : entity work.alu_control_unit(behavioral)
		port map ( op => tb_op,
		funct => tb_funct,
		control => tb_control
		);

	stimu : process   -- stimulus process
    
	begin   -- R-type instructions
		tb_op <= "10";
		tb_funct <= "100000"; -- add
		wait for 20 ns;
	  tb_op <= "10";
	  tb_funct <= "100010"; -- sub
	  wait for 20 ns;
	  tb_op <= "10";
	  tb_funct <= "101010"; -- set on less than
  	wait for 20 ns;
    tb_op <= "10";
	  tb_funct <= "100100"; -- and
	  wait for 20 ns;
	  tb_op <= "10";
	  tb_funct <= "100101"; -- or
	  wait for 20 ns;
    tb_op <= "10";
	  tb_funct <= "100110"; -- xor
	  wait for 20 ns;
      
    tb_op <= "00";    -- load 
	  tb_funct <= "xxxxxx"; 
	  wait for 20 ns;

	  tb_op <= "00";    -- store
	  tb_funct <= "xxxxxx"; 
	  wait for 20 ns;

	  tb_op <= "00";    -- beq
	  tb_funct <= "xxxxxx"; 
    wait for 20 ns;
	
		assert false
		report "end"
		severity failure;
	end process;
end behav;
