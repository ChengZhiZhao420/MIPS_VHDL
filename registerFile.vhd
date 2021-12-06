-- Dharam Kathiriya
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registerFile is
	port(	
		reg_write : in std_logic;   -- register write
	 	read_reg_1 : in std_logic_vector(4 downto 0);
		read_reg_2 : in std_logic_vector(4 downto 0);
		write_reg : in std_logic_vector(4 downto 0);
		write_data : in std_logic_vector(31 downto 0);
		read_data_1 : out std_logic_vector(31 downto 0);
		read_data_2 : out std_logic_vector(31 downto 0)
		
	);
end registerFile;

architecture bhv of registerFile is
	-- array for register file type
	type reg_type is array(0 to 31) of std_logic_vector(31 downto 0);	
	-- 32 registers (each register of 4 bytes)
	signal reg_array: reg_type := (
		x"00000000", --$zero
		x"00000001", --$at
		x"00000002", --$v0
		x"00000003", --$v1
		x"00000004", --$a0
		x"00000005", --$a1
		x"00000006", --$a2
		x"00000007", --$a3
		x"00000008", --$t0
		x"00000009", --$t1
		x"0000000A", --$t2
		x"0000000B", --$t3
		x"0000000C", --$t4
		x"0000000D", --$t5
		x"0000000E", --$t6
		x"0000000F", --$t7
		x"00000011", --$s0
		x"00000012", --$s1
		x"00000013", --$s2
		x"00000014", --$s3
		x"00000015", --$s4
		x"00000016", --$s5
		x"00000017", --$s6
		x"00000018", --$s7
		x"00000019", --$t8
		x"0000001A", --$t9
		x"0000001B", --$k0
		x"0000001C", --$k1
		x"0000001D", --$global pointer
		x"0000001E", --$stack pointer
		x"0000001F", --$frame pointer
		x"00000020" --$return address
	);	
begin
	-- execute the code based on the signal from Register Write
	process (reg_write) 
	begin
		-- write data to the register if reg_write is 1
		if (reg_write = '1') then
			reg_array(to_integer(unsigned(write_reg))) <= write_data;
		end if;
	end process;
	-- output data
	read_data_1 <= reg_array(to_integer(unsigned(read_reg_1)));
	read_data_2 <= reg_array(to_integer(unsigned(read_reg_2)));
end bhv;		
      

				
