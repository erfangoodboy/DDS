library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
 
entity Fifo_control is
 port (clk, reset: in std_logic;
 wr,rd:in std_logic;
 full, empty: out std_logic;
 w_address,r_address: out std_logic_vector (2 downto 0)
 );
end Fifo_control;

architecture Behrvioal of Fifo_control is
signal w_ptr_reg, w_ptr_next: std_logic_vector(3 downto 0);
signal r_ptr_reg, r_ptr_next: std_logic_vector(3 downto 0);
signal full_flag, empty_flag: std_logic;
	begin
-- register
	process(clk, reset)
		begin
		if (reset = '1') then
			w_ptr_reg <= (others => '0');
			r_ptr_reg <= (others => '0');
		elsif (clk'event and clk = '1') then
			w_ptr_reg <= w_ptr_next;
			r_ptr_reg <= r_ptr_next;
		end if;
	end process;

	w_ptr_next <= w_ptr_reg + 1 when
	wr='1' and full_flag='0'
	else
	w_ptr_reg;


	full_flag <='1' when
	r_ptr_reg(3) /= w_ptr_reg(3) and
	r_ptr_reg(2 downto 0) =
	w_ptr_reg(2 downto 0)
	else
	'0';
	w_address <= std_logic_vector(w_ptr_reg(2 downto 0));
	full <= full_flag;
	r_ptr_next <=
	r_ptr_reg + 1 when
	rd='1' and empty_flag='0'
	else
	r_ptr_reg;

	empty_flag <= '1' when
	r_ptr_reg = w_ptr_reg
	else
	'0';
	r_address <= std_logic_vector(r_ptr_reg(2 downto 0));
	empty <= empty_flag;
end Behrvioal;
