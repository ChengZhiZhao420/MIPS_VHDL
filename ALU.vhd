--Idenia Ayala
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port ( a, b : in std_logic_vector(31 downto 0); --src1, src2
	alu_control : in std_logic_vector(3 downto 0); -- function select
	clk : in std_logic;
	alu_result : out std_logic_vector(31 downto 0); --output result
	zero : out std_logic -- zero flag
	);
end ALU;

architecture behav of ALU is
	signal result : std_logic_vector (31 downto 0);
begin
	process (clk)
	begin
		if(rising_edge(clk)) then
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
				--shift left
				when "0101" => result <= std_logic_vector(shift_left(unsigned(a),to_integer(unsigned(b(10 downto 6)))));
				 --shift right 
        		        when "0110" => result <= std_logic_vector(shift_right(unsigned(a),to_integer(unsigned(b(10 downto 6)))));
				-- set on less than
				when "0111" =>		
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
		end if;
	end process;
end behav;
