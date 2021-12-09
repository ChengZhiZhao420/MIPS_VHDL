--Idenia Ayala
library ieee;
use ieee.std_logic_1164.all;

entity ALU_control_unit is 
	port ( op : in std_logic_vector(1 downto 0);
	funct : in std_logic_vector(5 downto 0);
	control : out std_logic_vector (3 downto 0)
	);
end ALU_control_unit;

architecture behav of ALU_control_unit is 
begin
	process(op, funct)
	begin
		case op is
			when "00" => 	--add
			control <= "0000";
			when "01" => 	--sub
			control <= "0001";
			when "10" => 	--set on less than
			control => <= "0111";
			when "11" => 
				case funct is 	-- r-type instructions
					when "100000" => --20h
						control <= "0000"; -- add
					when "100010" => -- 22h
						control <= "0001"; -- sub
					when "100100" =>
						control <= "0010"; -- and
					when "100101" =>
						control <= "0011"; -- or
					when "100110" =>
						control <= "0100"; -- xor
					when "000000" =>
						control <= "0101"; -- sll
					when "000010" => 
                                		control <= "0110"; -- srl
                           		when "101010" => 
                                		control <= "0111"; -- slt
					when others => null;
		end case;
	end process;
end behav;
