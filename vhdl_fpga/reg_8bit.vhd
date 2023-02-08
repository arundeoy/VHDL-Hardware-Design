library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_Right_Register is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           load : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end Shift_Right_Register;

architecture Behavioral of Shift_Right_Register is
    signal reg_array : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
begin
    -- Memory cell (register)
    process (clk)
    begin
        if (rising_edge(clk)) then
            if (clear = '1') then
                reg_array <= (others => '0');
            elsif (load = '1') then
                reg_array <= data_in;
            else
                reg_array <= reg_array(6 downto 0) & '0';
            end if;
        end if;
    end process;
    
    -- Next state logic
    data_out <= reg_array;
end Behavioral;

