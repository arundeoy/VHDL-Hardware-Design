
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memory_cell_tb is
end memory_cell_tb;

architecture Behavioral of memory_cell_tb is
    signal clk : std_logic := '0';
    signal btn4 : std_logic := '0';
    signal btn3 : std_logic := '0';
    signal sw : std_logic_vector (7 downto 0) := (others => '0');
    signal lcd : std_logic_vector (23 downto 0) := (others => '0');

begin
    -- Instantiate the memory cell
    uut : entity work.memory_cell
        port map (
            clk => clk,
            btn4 => btn4,
            btn3 => btn3,
            sw => sw,
            lcd => lcd
        );

    -- Clock process to generate a clock signal
    clk_process : process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process to drive the inputs
    stim_process : process
    begin
        wait for 100 ns;
        btn4 <= '1';
        wait for 100 ns;
        btn4 <= '0';
        wait for 100 ns;
        btn3 <= '1';
        wait for 100 ns;
        btn3 <= '0';
        wait for 100 ns;
        sw <= "10101010";
        wait for 100 ns;
        sw <= "01010101";
        wait for 100 ns;
        wait;
    end process;
end Behavioral;
