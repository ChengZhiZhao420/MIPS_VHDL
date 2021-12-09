library ieee;
use ieee.std_logic_1164.all;

entity MIPS is
	port(clk, reset :in std_logic);
end MIPS;

architecture behavior of MIPS is
signal memR, temp1, temp2, RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite:std_logic;
signal ir, instruction, read_data_1, read_data_2, read2, write_data, readData, temp, temp3:std_logic_vector(31 downto 0);
signal read_reg_1, read_reg_2, write_reg :std_logic_vector(4 downto 0);
signal control : std_logic_vector (3 downto 0);
signal ALUOp :std_logic_vector(0 to 1);
signal alu_result : std_logic_vector(31 downto 0);
begin
	memR <= '1';
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
	write_reg <= ir(20 downto 16) when RegDst = '0' else ir(15 downto 11) when RegDst = '1' else "-----";
	write_data <= alu_result when MemtoReg = '0' else readData;

	registerFile: entity work.registerFile port map(	
		clk => clk,
		readR1 => ir(25 downto 21),
		readR2 => ir(20 downto 16),
		ReadData1 => read_data_1,
		ReadData2 => read_data_2,
		writeR => write_reg,
		RegWrite => RegWrite,
		writeData => write_data
	);

	
	ALU_contorl: entity work.alu_control port map(
		op => ALUOp,
		clk => clk,
		funct => ir(5 downto 0),
		control => control);

	read2 <= read_data_2 when ALUSrc = '0' else  x"0000" & ir(15 downto 0);
		
	ALU: entity work.alu port map(
		clk => clk,
		a => read_data_1,
		b => read2,
		alu_control => control,
		alu_result => alu_result);

	temp1 <= '0' when alu_result(1) = 'U' else '0' when alu_result(1) = 'X' else MemRead;
	temp2 <= '0' when alu_result(1) = 'U' else '0' when alu_result(1) = 'X' else MemWrite;
	temp3 <= alu_result;
	Data_memory: entity work.data_memory port map(
		address => temp3,
		memR => temp1,
		memW => temp2,
		writeData => read_data_2,
		clk => clk,
		readData => readData);
	
end behavior;
