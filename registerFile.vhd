--ChengZhi Zhao
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registerFile is
	port(readR1 , readR2, writeR :in std_logic_vector(4 downto 0);
	writeData :in std_logic_vector(31 downto 0);
	RegWrite, clk :in std_logic;
	ReadData1, ReadData2 :out std_logic_vector(31 downto 0));
end registerFile;

architecture behavior of registerFile is
type registerMemory is array(0 to 103) of std_logic_vector(7 downto 0);
signal registerArray : registerMemory :=(
		x"00",
		x"00",
		x"00",
		x"00", --$zero
		x"FF",
		x"12",
		x"21",
		x"11", --$at
		x"AB",
		x"C2",
		x"22",
		x"22", --$v0
		x"33",
		x"3B",
		x"C3",
		x"33", --$v1
		x"4D",
		x"C2",
		x"44",
		x"44", --$a0
		x"34",
		x"25",
		x"53",
		x"55", --$a1
		x"60",
		x"00",
		x"00",
		x"06", --$a2
		x"00",
		x"00",
		x"00",
		x"07", --$a3
		x"80",
		x"00",
		x"88",
		x"88", --$t0
		x"00",
		x"00",
		x"00",
		x"01", --$t1
		x"00",
		x"00",
		x"00",
		x"07", --$t2
		x"00",
		x"00",
		x"00",
		x"0A", --$t3
		x"00",
		x"00",
		x"00",
		x"09", --$t4
		x"00",
		x"00",
		x"00",
		x"10", --$t5
		x"00",
		x"00",
		x"00",
		x"0F", --$t6
		x"00",
		x"00",
		x"00",
		x"18", --$t7
		x"00",
		x"00",
		x"00",
		x"05", --$s0
		x"00",
		x"00",
		x"00",
		x"01", --$s1
		x"00",
		x"00",
		x"00",
		x"03", --$s2
		x"00",
		x"00",
		x"00",
		x"33", --$s3
		x"00",
		x"00",
		x"00",
		x"52", --$s4
		x"00",
		x"00",
		x"00",
		x"55", --$s5
		x"00",
		x"00",
		x"00",
		x"86", --$s6
		x"00",
		x"00",
		x"00",
		x"F7", --$s7
		x"00",
		x"00",
		x"00",
		x"88", --$t8
		x"00",
		x"00",
		x"00",
		x"2F" --$t9
	);
signal count, count1 :integer:= 0;
signal index1, index2,index3 :integer;
begin
	process(clk)
	begin
		if(count > 3) then	
			count <= 0;
		end if;
		
		if(count1 > 3) then	
			count <= 0;
		end if;

		index1 <= ((to_integer(unsigned(readR1)) * 4));
		index2 <= ((to_integer(unsigned(readR2)) * 4));
		index3 <= ((to_integer(unsigned(writeR)) * 4));
		if(rising_edge(clk)) then	

			if(RegWrite = '1' and writeData(1) /= 'U') then
				if(count1 = 0) then
					registerArray(index3 + count1) <= writeData(31 downto 24);
					
				elsif(count1 = 1) then
					registerArray(index3 + count1) <= writeData(23 downto 16);
				
				elsif(count1 = 2) then
					registerArray(index3 + count1) <= writeData(15 downto 8);
					
				elsif(count1 = 3) then
					registerArray(index3 + count1) <= writeData(7 downto 0);
					
				end if;
				count1 <= count1 + 1;
			end if;
			if(count = 0) then
				readData1(31 downto 24) <= registerArray(index1 + count);
				readData2(31 downto 24) <= registerArray(index2 + count);

			elsif(count = 1) then
				readData1(23 downto 16) <= registerArray(index1 + count);
				readData2(23 downto 16) <= registerArray(index2 + count);

			elsif(count = 2) then
				readData1(15 downto 8) <= registerArray(index1 + count);
				readData2(15 downto 8) <= registerArray(index2 + count);

			elsif(count = 3) then
				readData1(7 downto 0) <= registerArray(index1 + count);
				readData2(7 downto 0) <= registerArray(index2 + count);

			end if;
			count <= count + 1;
		end if;
	end process;
end behavior;
