library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity binbcd4 is
  port ( clk : in  STD_LOGIC;
         rst : in  STD_LOGIC;
         b   : in  STD_LOGIC_VECTOR (3 downto 0);
         p   : out STD_LOGIC_VECTOR (4 downto 0));
end binbcd4;

architecture binbcd4 of binbcd4 is
  signal count : unsigned (3 downto 0) := (others => '0');
  signal sum   : unsigned (3 downto 0);
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '0' then
        count <= count + 1;
      end if;
    end if;
  end process;

  sum <= unsigned(b) + count;
  p <= std_logic_vector(sum);
end binbcd4;

