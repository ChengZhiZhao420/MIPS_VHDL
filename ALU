--Idenia Ayala
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
	port ( a, b : in std_logic_vector(31 downto 0); --src1, src2
	alu_control : in std_logic_vector(3 downdto 0); -- function select
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
				result <= a and b; -- and
			when "0001" =>
				result <= a or b; -- or
			when "0010" =>
				result <= std_logic_vector(unsigned(a) + unsigned(b)); -- add
			when "0011" =>
				result <= std_logic_vector(unsigned(a) - unsigned(b)); -- sub
			when "0100" =>
				result => a xor b; -- xor
			when "0101" =>
				if (a < b) then
					result <= x"00000001";
				else
					result <= x"00000000";
				end if;
			when others => NULL
				result => x"00000000";
		end case;
	end process;

zero <= '1' when result = x"00000000" else "0";
alu_result <= result;
end behav;

