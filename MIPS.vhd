library ieee;
use ieee.std_logic_1164.all;

entity MIPS is
	port(clk, reset :in std_logic);
end MIPS;

architecture behavior of MIPS is
signal memR, RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite :std_logic;
signal programCountIn, programCountOut :std_logic_vector(0 to 7);
signal ir, read_data_1, read_data_2, write_data :std_logic_vector(31 downto 0);
signal read_reg_1, read_reg_2, write_reg :std_logic_vector(4 downto 0);	
signal ALUOp :std_logic_vector(0 to 1);

begin
	memR <= '1';
	
	programCounter: entity work.programCount port map(
		programCountIn => programCountIn,
		programCountOut => programCountOut,
		clk => clk
	);
	
	InstructionMemory: entity work.memory port map(
		clk => clk,
		ir => ir,
		memR => memR 
	);
	
	controlUnit: entity work.controlUnit port map(
		clk => clk,
		instr => ir(31 downto 26),
		RegDst => RegDst,
		Jump => Jump,
		Branch => Branch,
		MemRead => MemRead,
		MemtoReg => MemtoReg,
		MemWrite => MemWrite,
		ALUSrc => ALUSrc,
		RegWrite => RegWrite,
		ALUOp => ALUOp,
		reset => reset
	); 
	
	process
	begin
		if(RegDst = '0') then
			read_reg_2 <= ir(20 downto 16);
		else
			read_reg_2 <= "00000"; 
			write_reg <= ir(15 downto 11);
		end if;
		wait;
	end process;
		
	registerFile: entity work.registerFile port map(	
		read_reg_1 => ir(25 downto 21),
		read_reg_2 => read_reg_2,
		read_data_1 => read_data_1,
		read_data_2 => read_data_2,
		write_reg => write_reg,
		reg_write => RegWrite,
		write_data => write_data
	);
		
end behavior;