library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity barrelShifter is
port (
        w : in unsigned(3 downto 0);  -- bit input 
        s : in unsigned(1 downto 0) ;   --  select input
		  y : out unsigned(3 downto 0) -- output shfit
    );
end barrelShifter;
architecture Behavioral of barrelShifter is

begin
process (s,w)
BEGIN
case  s is
when "00" => y <= w ;
when "01" => y <= w(0) & w(3 downto 1) ;
when "10" => y <= w(1 downto 0) & w(3 downto 2);
when others => y <= w(2 downto 0) & w(3);

end case;

end process;

end Behavioral;