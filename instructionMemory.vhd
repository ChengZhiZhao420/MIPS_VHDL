-- Steven Lam
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instructionMemory is
    port(pc : in std_logic_vector (31 downto 0);
    ir : out std_logic_vector (31 downto 0)
);

end instructionMemory;


architecture bhv of instructionMemory is

    -- array for instruction memory type of RAM_16_x_32 bytes
type Ram_mem is array (0 to 15) of std_logic_vector(31 downto 0);
signal index : integer;
signal dataIM : Ram_mem := (
x"01",
x"28",
x"50",
x"24",-------and $t2, $t1, $t0

x"01"
x"8b",
x"68",
x"25",--------or $t5, $t4, $t3

x"01",
x"28",
x"50",
x"20",-------add $t2, $t1, $t0

x"01" 
x"49",
x"40",
x"2a",--------slt $t0, $t2, $t1

x"8E",
x"11",
x"00",
x"01",-------lw $17, 1($16)

x"01",
x"28",
x"50",
x"22",--------sub $t5, $t1, $t0

x"11",
x"09",
x"01",
x"00",--------Beq $8, $9, 256

x"AE",
x"30",
x"00",
x"16",--------sw $16, 22($17)

x"01",
x"4B",
x"48",
x"25",--------or $9, $10, $11

x"21",
x"49",
x"00",
x"0C",--------addi $t1, $t2, 12

x "01",
x "49",
x "40",
x "2a",--------slt $t0, $t2, $t1

x"12",
x"11",
x"ff",
x"fb",--------branchequal $s0, $s1, $L1   
 
x"00",
x"00",
x"00",
x"00",--------

x"00",
x"00",
x"00",
x"00",--------

x"00",
x"00",
x"00",
x"00",--------

x"00",
x"00",
x"00",
x"00"--------


);
signal count : integer := 0;
begin
    process(pc)
    begin
        
    
         
         ir <= instructionMem(( to_integer(unsigned(pc));
         if(count > 3) then 
                  count <=0;

        end if;
        
        if(count = 0) then
            ir(31 downto 24) <= data(index);    
            elsif(count = 0) then
            ir(23 downto 16) <= data(index);
            elsif(count = 2) then
            ir(15 downto 8) <= data(index);
            elsif(count = 3) then
            ir(7 downto 0) <= data(index);
            end if;

        count <= count + 1;
        pc <= std_logic_vector(unsigned(pc) + 1);

        end if;

    end process;

end bhv;
