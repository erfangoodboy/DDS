library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Up_Down_Counter is
    Port ( 
		CLK,RESET,DIR : in  STD_LOGIC;
      COUNT : inout  STD_LOGIC_VECTOR (3 downto 0)
		);
end Up_Down_Counter;

architecture Behavioral of Up_Down_Counter  is

begin
process (CLK,RESET)
begin

if (RESET = '1')then
	if (DIR = '1')then
		COUNT <= "0000"; -- up counter
	else
		COUNT <= "1111"; -- down counter
	end if;
elsif(rising_edge(CLK))then
	if (DIR='1' and COUNT/="1111")then
		COUNT <= COUNT+1; -- up counter
	elsif (DIR='0' and COUNT/="0000")then
		COUNT <= COUNT-1; -- down counter
	end if;
end if;

end process;
end Behavioral;