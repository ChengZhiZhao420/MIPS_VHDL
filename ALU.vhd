--Idenia Ayala
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
	port ( a, b : in std_logic_vector(31 downto 0); --src1, src2
	alu_control : in std_logic_vector(3 downto 0); -- function select
	alu_result : out std_logic_vector(31 downto 0); --output result
	zero : out std_logic -- zero flag
	);
end alu;

architecture behav of alu is
	signal result : std_logic_vector (31 downto 0);
begin
	process (a, b, alu_control)
	begin
		case alu_control is
			when "0000" =>
				result <= std_logic_vector(signed(a) + signed(b)); -- add
			when "0001" =>
				result <= std_logic_vector(signed(a) - signed(b)); -- sub
			when "0010" =>
				result <= a and b; -- and
			when "0011" =>
				result <= a or b; -- or
			when "0100" =>
				result <= a xor b; -- xor
			when "0101" =>		-- set on less than
				if (signed(a) < signed(b)) then
					result <= x"00000001";
				else
					result <= x"00000000";
				end if;
			when others => 
				result <= x"00000000";
		end case;

	if(result = x"00000000") then
		zero <= '1';
	else
		zero <= '0';
	end if;
	alu_result <= result;
	end process;
end behav;

