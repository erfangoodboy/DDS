library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_counter is
generic (N : integer := 4);
port (
  clk: in  std_logic;
  reset: in  std_logic;
  sync_reset: in  std_logic;
  enable : in  std_logic;
  bcd_output : out std_logic_vector(N-1 downto 0));
end bcd_counter;

architecture counter of bcd_counter is
signal counter : unsigned(N-1 downto 0);
constant max_number : natural := 2 ** (N - 1) + 1;

begin

p_count : process(clk,reset)
begin
  if(reset='1') then
    counter <= (others => '0');
  elsif(rising_edge(clk)) then
    if(sync_reset='1') then
      counter <= (others => '0');
    elsif(enable='1') then
      if(counter = max_number ) then
        counter <= (others => '0');
      else
        counter <= counter + 1;
      end if;
    end if;
  end if;
end process p_count;

bcd_output  <= std_logic_vector(counter);

end counter;