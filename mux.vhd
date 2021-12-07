library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- mux for 32-bits inputs
entity mux is 
	Port(
		muxControl : in std_logic;
		muxIN_1 : in std_logic_vector(31 downto 0);
		muxIN_2 : in std_logic_vector(31 downto 0);
		muxOUT : out std_logic_vector(31 downto 0)
	);
end mux;

architecture bhv of mux is
begin
	
	muxOUT <= muxIN_1 when muxControl = '0' 
	else muxIN_2;

end bhv;
