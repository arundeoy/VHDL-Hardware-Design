library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    port (
        clk: in std_logic;
        SW: in std_logic_vector(7 downto 0);
        LED: out std_logic_vector(7 downto 0);
        LCD: out std_logic_vector(15 downto 0)
    );
end entity;

architecture behavioral of adder is
    signal sum: unsigned(7 downto 0);
begin
    -- process to perform the addition and update the sum value
    process (SW)
    begin
        sum <= unsigned(SW(7 downto 4)) + unsigned(SW(3 downto 0));
    end process;

    -- process to convert the sum value to decimal and drive the LCD outputs
    process (clk)
begin
    if rising_edge(clk) then
        LED <= SW;
	LCD(15 downto 12) <= std_logic_vector(to_unsigned(unsigned(sum), 4));

           LCD(11 downto 8) <= std_logic_vector(to_unsigned(unsigned(sum(3 downto 0)), 4));

        end if;
    end process;
end architecture;

