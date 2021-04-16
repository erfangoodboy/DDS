library ieee;
use ieee.std_logic_1164.all;
entity JK is
port(
    J,K: in std_logic;
    Q,NQ: buffer std_logic
);
end JK;
architecture flipflop of JK is
begin
    process (J,K)
    begin
    if J ='0' and K='0' then 
        Q <= Q;
        NQ <= NOT Q;
        end if;
    if J ='0' and K='1' then 
        Q <= '0';
        NQ <= '1';
        end if;
    if J ='1' and K='0' then 
        Q <= '1';
        NQ <= '0';
        end if;
    if J ='1' and K='1' then 
        Q <= NOT Q;
      NQ <= NOT NQ;
        end if;

    end process; 
end flipflop;