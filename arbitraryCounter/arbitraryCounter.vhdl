library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity arbitraryCounter is
 Port ( 
 clk : in STD_LOGIC;
 reset : in STD_LOGIC;
 q : out STD_LOGIC_Vector (2 downto 0) 
 );
end arbitraryCounter;
 
architecture Behavrioal of arbitraryCounter is

	signal r_reg: std_logic_vector (2 downto 0) ;
	signal r_next: std_logic_vector (2 downto 0) ;
 
begin
	process(clk,reset)
	begin
		if(reset = '1') then 
			r_reg <= ( others => '0');
		elsif(clk'event and clk = '1') then
			r_reg <= r_next;
		end if;
	end process;
	r_next <= "011" when r_reg = "000" else
				 "110" when r_reg = "011" else 
				 "101" when r_reg = "110" else
				 "111" when r_reg = "101" else 
				 "000";
	q <= r_reg ; 
	
 
end Behavrioal;
