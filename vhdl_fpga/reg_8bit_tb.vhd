library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_Right_Register_tb is
end Shift_Right_Register_tb;

architecture Behavioral of Shift_Right_Register_tb is
    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
    signal load : STD_LOGIC := '0';
    signal clear : STD_LOGIC := '0';
    signal data_in : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal data_out : STD_LOGIC_VECTOR (7 downto 0);
    
    component Shift_Right_Register is
        Port ( clk : in  STD_LOGIC;
               rst : in  STD_LOGIC;
               load : in  STD_LOGIC;
               clear : in  STD_LOGIC;
               data_in : in  STD_LOGIC_VECTOR (7 downto 0);
               data_out : out  STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
begin
    DUT : Shift_Right_Register
        Port Map (clk => clk,
                  rst => rst,
                  load => load,
                  clear => clear,
                  data_in => data_in,
                  data_out => data_out);
    
    -- Clock generation process
    clk_process : process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
    -- Test bench stimulus process
    stim_process : process
    begin
        wait for 10 ns;
        data_in <= "10010010";
        wait for 10 ns;
        load <= '1';
        wait for 10 ns;
        load <= '0';
        wait for 10 ns;
        clear <= '1';
        wait for 10 ns;
        clear <= '0';
        wait for 10 ns;
        data_in <= "00010001";
        wait for 10 ns;
        load <= '1';
        wait for 10 ns;
        load <= '0';
        wait until clk = '1';
        wait for 10 ns;
        assert (data_out = "00001000") report "ERROR: Shift right register output incorrect!";
        wait;
    end process;
end Behavioral;

