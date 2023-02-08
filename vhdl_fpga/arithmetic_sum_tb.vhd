
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arithmetic_sum_tb is
end entity;

architecture behavioral of arithmetic_sum_tb is
    signal a, b, c, d : std_logic := '0';
    signal sum : unsigned (2 downto 0);
begin
    DUT: entity work.arithmetic_sum
        port map (a => a, b => b, c => c, d => d, sum => sum);

    -- Test case 1
    a <= '0';
    b <= '0';
    c <= '0';
    d <= '0';
    wait for 10 ns;
    assert (sum = 0) report "Test case 1 failed" severity error;

    -- Test case 2
    a <= '1';
    b <= '1';
    c <= '1';
    d <= '1';
    wait for 10 ns;
    assert (sum = 4) report "Test case 2 failed" severity error;

    -- Add more test cases as needed

end architecture;
