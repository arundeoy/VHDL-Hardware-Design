
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adderlcd is
  Port ( clk : in  STD_LOGIC;
         SW : in  STD_LOGIC_VECTOR (7 downto 0);
         LCD : out  STD_LOGIC_VECTOR (17 downto 0));
end Adderlcd;

architecture Behavioral of Adderlcd is
  signal result : unsigned (7 downto 0);
begin
  process (clk)
  begin
    if (clk'event and clk = '1') then
      result <= unsigned(SW(7 downto 4)) + unsigned(SW(3 downto 0));
    end if;
  end process;

  LCD(17 downto 16) <= "00"; -- Display segments 3 and 2
  LCD(15 downto 12) <= std_logic_vector(result(3 downto 0)); -- Display result in hexadecimal form
  LCD(11 downto 8) <= std_logic_vector(result(7 downto 4)); -- Display result in hexadecimal form
  LCD(7 downto 0) <= "00000000";
end Behavioral;
