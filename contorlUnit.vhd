--idenia ayala
--Chengzhi Zhao

library ieee;
use ieee.std_logic_1164.all;

entity controlUnit is
	port(instr :in std_logic_vector(0 to 5);
	clk, reset :in std_logic;
	RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite :out std_logic;
	ALUOp :out std_logic_vector(1 downto 0));
end controlUnit; 

architecture bhv of controlUnit is 
signal count :integer :=0;
begin
	process(clk, reset)
	begin
		if(count > 3) then
			count <= 0;
		end if;

		if(reset = '1') then
			RegDst <= '0';
			Jump <= '0';
			Branch <= '0';
			MemRead <= '0';
			MemtoReg <= '0';
			MemWrite <= '0';
			ALUSrc <= '0';
			RegWrite <= '0';
			ALUOp <= "00";
		elsif(rising_edge(clk) and reset = '0') then
				-------case 1 R-types instruction
				if(instr = "000000") then
					RegDst <= '1';
					RegWrite <= '1';
					ALUSrc <= '0';
					MemtoReg <= '0';
					ALUOp <= "10";
					Jump <= '-'; 
					Branch <= '-';
					if(count = 3) then
						Memwrite <= '0';
						MemRead <= '0';
					end if;
				
				------case 2 Load word 
				elsif(instr = "100011") then
					RegDst <= '0';
					RegWrite <= '1';
					ALUSrc <= '1';
					MemtoReg <= '1';
					ALUOp <= "00";
					Jump <= '-'; 
					Branch <= '-';
					if(count = 3) then
						Memwrite <= '0';
						MemRead <= '1';
					end if;
				------case 3 Store word
				elsif(instr = "101011") then	
					RegDst <= '-';
					RegWrite <= '0';
					ALUSrc <= '1';
					MemtoReg <= '-';
					ALUOp <= "00";
					Jump <= '-'; 
					Branch <= '-'; 
					if(count = 3) then
						Memwrite <= '1';
						MemRead <= '0';
					end if;
				
				------case 4 Branch equal
				elsif(instr = "000100") then
					
					RegDst <= '-';
					RegWrite <= '0';
					ALUSrc <= '0';
					MemtoReg <= '-';
					ALUOp <= "01";
					Jump <= '1'; 
					Branch <= '1';
					if(count = 3) then
						Memwrite <= '0';
						MemRead <= '0';
					end if;
					
				------case 5 Jump
				elsif(instr = "000010") then
					
					RegDst <= '-';
					RegWrite <= '0';
					ALUSrc <= '0';
					MemtoReg <= '-';
					ALUOp <= "11";
					Jump <= '1'; 
					Branch <= '0';
					if(count = 3) then
						Memwrite <= '0';
						MemRead <= '0';
					end if;
				
				end if;
			count <= count + 1;
			end if;
		end process;
		
end bhv;
				
			
