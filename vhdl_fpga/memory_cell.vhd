library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memory_cell is
    Port ( clk : in  STD_LOGIC;
           btn4 : in  STD_LOGIC;
           btn3 : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (7 downto 0);
           lcd : out  STD_LOGIC_VECTOR (23 downto 0));
end memory_cell;

architecture Behavioral of memory_cell is
    type state_type is (state1, state2);
    signal current_state, next_state : state_type;
    signal mem : std_logic := '0';

begin
    process(clk)
    begin
        if (clk'event and clk = '1') then
            current_state <= next_state;
            if (current_state = state1) then
                if (btn4 = '1') then
                    mem <= not mem;
                end if;
            end if;
        end if;
    end process;

    process(current_state, btn3)
    begin
        case current_state is
            when state1 =>
                if (btn3 = '1') then
                    mem <= '0';
                    next_state <= state2;
                else
                    next_state <= state1;
                end if;
            when state2 =>
                next_state <= state1;
        end case;
    end process;

    lcd(23 downto 20) <= sw when mem = '0' else std_logic_vector(to_unsigned(to_integer(unsigned(sw)), 4));
    lcd(19 downto 10) <= (others => '0');
end Behavioral;

