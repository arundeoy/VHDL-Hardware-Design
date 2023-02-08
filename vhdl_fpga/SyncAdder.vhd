

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SyncAdder is
    Port ( clk : in  std_logic;
           a : in  std_logic_vector (3 downto 0);
           b : in  std_logic_vector (3 downto 0);
           sum : out  std_logic_vector (3 downto 0));
end SyncAdder;

architecture Behavioral of SyncAdder is
begin
    process (clk)
    begin
        if (clk'event and clk = '1') then
            sum <= std_logic_vector(unsigned(a) + unsigned(b));
        end if;
    end process;
end Behavioral;
