library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity binbcd4 is
  port (
    clk : in  STD_LOGIC;
    rst : in  STD_LOGIC;
    bcd : out STD_LOGIC_VECTOR (4 downto 0)
  );
end binbcd4;

architecture binbcd4 of binbcd4 is
  signal binary_count : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        binary_count <= "0000";
      else
        binary_count <= std_logic_vector(unsigned(binary_count) + 1);
      end if;
    end if;
  end process;

  bcd <= "0000" when binary_count = "0000" else
        "0001" when binary_count = "0001" else
        "0010" when binary_count = "0010" else
        "0011" when binary_count = "0011" else
        "0100" when binary_count = "0100" else
        "0101" when binary_count = "0101" else
        "0110" when binary_count = "0110" else
        "0111" when binary_count = "0111" else
        "1000" when binary_count = "1000" else
        "1001" when binary_count = "1001" else
        "1010" when binary_count = "1010" else
        "1011" when binary_count = "1011" else
        "1100" when binary_count = "1100" else
        "1101" when binary_count = "1101" else
        "1110" when binary_count = "1110" else
        "1111";
end binbcd4;

