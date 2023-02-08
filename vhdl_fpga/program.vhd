library ieee;
use ieee.std_logic_1164.all;

entity program_1 is
  port(
    a : in std_logic;
    b : in std_logic;
    y : out std_logic
  );
end program_1;

architecture Behavioral of program_1 is
begin
  y <= a and b;
end Behavioral;