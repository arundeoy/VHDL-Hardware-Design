
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
Port ( clk : in std_logic;
cnt_up : out std_logic_vector(4 downto 0);
cnt_down : out std_logic_vector(4 downto 0)
);
end counter;

architecture Behavioral of counter is
subtype count is unsigned (4 downto 0);
subtype output is std_logic_vector (4 downto 0);
signal count_next : count := (others => '0');
signal count_up_next : count;
signal count_down_next : count;
begin 
process(clk)
begin
    if rising_edge(clk) then
        if count_next < 31 then
            count_next <= count_next + 1;
        else
            count_next <= to_unsigned(0, 5);
        end if;
        count_up_next <= count_next;
        count_down_next <= 31 - count_next;
    end if;
end process;

cnt_up <= output(count_up_next);
cnt_down <= output(count_down_next);
end Behavioral;

