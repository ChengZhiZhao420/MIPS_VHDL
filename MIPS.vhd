library ieee;
use ieee.std_logic_1164.all;

entity MIPS is
	port(clk, reset :in std_logic);
end MIPS;

architecture behavior of MIPS is
signal memR, RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite:std_logic;
signal ir, instruction, read_data_1, read_data_2, write_data, readData:std_logic_vector(31 downto 0);
signal read_reg_1, read_reg_2, write_reg :std_logic_vector(4 downto 0);
signal control : std_logic_vector (3 downto 0);
signal ALUOp :std_logic_vector(0 to 1);
signal alu_result : std_logic_vector(31 downto 0);
signal count :integer;
begin
	memR <= '1';
	InstructionMemory: entity work.memory port map(
		clk => clk,
		ir => ir,
		memR => memR ,
		count => count
	);
	instruction <= ir when count = 3;
	
	controlUnit: entity work.controlUnit port map(
		clk => clk,
		instr => instruction(31 downto 26),
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
	write_reg <= instruction(20 downto 16) when RegDst = '0' else instruction(15 downto 11);
	RegWrite <= '0';
	registerFile: entity work.registerFile port map(	
		clk => clk,
		readR1 => instruction(25 downto 21),
		readR2 => instruction(20 downto 16),
		ReadData1 => read_data_1,
		ReadData2 => read_data_2,
		writeR => write_reg,
		RegWrite => RegWrite,
		writeData => write_data
	);

	ALU_contorl: entity work.alu_control port map(
		op => ALUOp,
		funct => ir(31 downto 26),
		control => control);
		
		
	ALU: entity work.alu port map(
		clk => clk,
		a => read_data_1,
		b => read_data_2,
		alu_control => control,
		alu_result => alu_result);
	
end behavior;
