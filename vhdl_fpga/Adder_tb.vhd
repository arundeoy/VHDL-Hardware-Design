library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_tb is
end Adder_tb;

architecture Behavioral of Adder_tb is

component Adder is
    Port ( clk : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (7 downto 0);
           LED : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal clk : std_logic := '0';
signal SW : std_logic_vector (7 downto 0) := "00000000";
signal LED : std_logic_vector (3 downto 0);

begin

UUT: Adder port map (clk, SW, LED);

CLOCK: process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

STIMULUS: process
begin
    SW <= "00010001";
    wait for 10 ns;
    SW <= "01010101";
    wait for 10 ns;
    SW <= "10101010";
    wait for 10 ns;
    wait;
end process;

end Behavioral;

