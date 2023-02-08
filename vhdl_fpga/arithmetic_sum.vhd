library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity assign_sum_output is
    port (
        a, b, c, d, e : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(5 downto 0)
    );
end entity assign_sum_output;

architecture behavioral of assign_sum_output is
    signal sum : unsigned (5 downto 0);
begin
    sum <= std_logic_vector(unsigned(a) + unsigned(b) + unsigned(c) + unsigned(d) + unsigned(e));
    output <= std_logic_vector(sum);
end architecture behavioral;
