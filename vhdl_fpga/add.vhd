library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity program_add is
  port(
    a : in std_logic_vector(7 downto 0);
    b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0)
  );
end program_add;

architecture Behavioral of program_add is
begin
  y <= std_logic_vector(unsigned(a) + unsigned(b));
end Behavioral;