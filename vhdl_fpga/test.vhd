library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity four_bit_adder is
    Port ( a : in  std_logic_vector(3 downto 0);
           b : in  std_logic_vector(3 downto 0);
           sum : out  std_logic_vector(3 downto 0);
           decimal_sum : out  unsigned(3 downto 0));
end four_bit_adder;

architecture behavioral of four_bit_adder is
begin
    sum <= std_logic_vector(unsigned(a) + unsigned(b));
    decimal_sum <= unsigned(a) + unsigned(b);
end behavioral;

