library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity four_bit_adder_tb is
end four_bit_adder_tb;

architecture behavioral of four_bit_adder_tb is
    component four_bit_adder is
        Port ( a : in  std_logic_vector(3 downto 0);
               b : in  std_logic_vector(3 downto 0);
               sum : out  std_logic_vector(3 downto 0);
               decimal_sum : out  unsigned(3 downto 0));
    end component;

    signal a : std_logic_vector(3 downto 0) := "0001";
    signal b : std_logic_vector(3 downto 0) := "0001";
    signal sum : std_logic_vector(3 downto 0);
    signal decimal_sum : unsigned(3 downto 0);

begin
    DUT : four_bit_adder
        port map (a => a, b => b, sum => sum, decimal_sum => decimal_sum);

    process
    begin
        wait for 10 ns;
        a <= "0010";
        b <= "0011";
        wait for 10 ns;
        a <= "0100";
        b <= "0001";
        wait for 10 ns;
        a <= "1010";
        b <= "1010";
        wait for 10 ns;
        wait;
    end process;
end behavioral;

