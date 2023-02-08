

library ieee;
use ieee.std_logic_1164.all;

entity SyncAdder_tb is
end SyncAdder_tb;

architecture Behavioral of SyncAdder_tb is
    signal clk : std_logic := '0';
    signal a, b : std_logic_vector (3 downto 0);
    signal sum : std_logic_vector (3 downto 0);

begin

    DUT: entity work.SyncAdder
        Port Map (
            clk => clk,
            a => a,
            b => b,
            sum => sum
        );

    ClkGen: process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    Stimulus: process
    begin
        a <= "0000";
        b <= "0001";
        wait for 10 ns;
        a <= "0001";
        b <= "0010";
        wait for 10 ns;
        a <= "0010";
        b <= "0100";
        wait for 10 ns;
        wait;
    end process;
end Behavioral;

