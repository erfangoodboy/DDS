library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T is
   port (T,Reset,CLK,CLK_enable: in std_logic;
	 Q: out std_logic);
end T;
 
architecture Behavioral of T is	 

begin
    process (Reset,CLK) 
    variable  temp: std_logic;
    begin
        if (rising_edge(CLK)) then 
            if Reset='1' then   
                temp := '0';  		
            elsif CLK_enable ='1' then
                temp := T xor temp;
            end if;
        end if; 
    Q <= temp;	   
    end process;
end Behavioral;