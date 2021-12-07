library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- mux for 5-bit inputs for register file
entity muxRF is 
	Port(
		muxControl : in std_logic;
		muxIN_1 : in std_logic_vector(4 downto 0);
		muxIN_2 : in std_logic_vector(4 downto 0);
		muxOUT : out std_logic_vector(4 downto 0)
	);
end muxRF;

architecture bhv of muxRF is
begin
	
	muxOUT <= muxIN_1 when muxControl = '0' 
	else muxIN_2;

end bhv;
