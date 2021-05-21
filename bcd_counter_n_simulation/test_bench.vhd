LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_bench IS
END test_bench;

ARCHITECTURE TBarch OF test_bench IS
  COMPONENT bcd_counter IS
    PORT (
		clk: in  std_logic;
		reset: in  std_logic;
		sync_reset: in  std_logic;
		enable : in  std_logic;
		bcd_output : out std_logic_vector(3 downto 0));
  END COMPONENT;

  SIGNAL clk_test, reset_test, enable_test , sync_reset_test , test_out: std_logic;
  SIGNAL bcd_output: std_logic_vector(3 downto 0);

BEGIN
  compToTest: bcd_counter PORT MAP (clk => clk_test,reset =>  reset_test, sync_reset => sync_reset_test , enable => enable_test , bcd_output => bcd_output);
   
  CLOCK_PROCCESS: PROCESS
  BEGIN
    clk_test <= '1';
    WAIT FOR 10 ns;
    clk_test <= '0';
    WAIT FOR 10 ns;
  END PROCESS CLOCK_PROCCESS;
                      
  stim_proc: PROCESS
  BEGIN
	 sync_reset_test <= '0';
    reset_test <= '1';
	 enable_test <= '0';
    WAIT FOR 10 ns;
    reset_test <= '0';
    enable_test <= '1';
    WAIT;
  END PROCESS stim_proc;

END TBarch;