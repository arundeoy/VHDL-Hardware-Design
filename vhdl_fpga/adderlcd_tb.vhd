library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adderlcd_tb is
end Adderlcd_tb;

architecture Behavioral of Adderlcd_tb is
  component Adderlcd is
    Port ( clk : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (7 downto 0);
           LCD : out  STD_LOGIC_VECTOR (17 downto 0));
  end component;

  signal clk : STD_LOGIC := '0';
  signal SW : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
  signal LCD : STD_LOGIC_VECTOR (17 downto 0);

begin

  DUT: Adderlcd
    port map (
      clk => clk,
      SW => SW,
      LCD => LCD
    );

  clk_process : process
  begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
  end process;

  test_process : process
  begin
    SW <= "10101010";
    wait for 100 ns;
    SW <= "11001100";
    wait for 100 ns;
    wait;
  end process;

end Behavioral;

