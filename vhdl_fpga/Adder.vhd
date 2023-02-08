library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder is
    Port ( clk : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (7 downto 0);
           LED : out  STD_LOGIC_VECTOR (3 downto 0));
end Adder;

architecture Behavioral of Adder is

begin
    process (clk)
    begin
        if rising_edge(clk) then
            LED <= std_logic_vector(unsigned(SW(7 downto 4)) + unsigned(SW(3 downto 0)));

        end if;
    end process;
end Behavioral;

