library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity binbcd4_tb is
end binbcd4_tb;

architecture binbcd4_tb of binbcd4_tb is
  signal clk : STD_LOGIC := '0';
  signal rst : STD_LOGIC := '0';
  signal bcd : STD_LOGIC_VECTOR (4 downto 0);

begin
  DUT: entity work.binbcd4
    port map (
      clk => clk,
      rst => rst,
      bcd => bcd
    );

  CLOCK: process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  STIMULUS: process
  begin
    rst <= '1';
    wait for 10 ns;
    rst <= '0';
    wait for 10 ns;
    for i in 0 to 15 loop
      wait for 10 ns;
    end loop;
    wait;
  end process;
end binbcd4_tb;

