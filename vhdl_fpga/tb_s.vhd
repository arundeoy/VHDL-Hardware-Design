library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_counters is
end tb_counters;

architecture Behavioral of tb_counters is

component UPDOWN_COUNTER 
    Port ( clk: in std_logic;
           reset: in std_logic; 
           counter: out std_logic_vector(4 downto 0); 
	   counter1: out std_logic_vector(4 downto 0)
     );
end component;
signal reset,clk: std_logic;
signal counter:std_logic_vector(4 downto 0);
signal counter1:std_logic_vector(4 downto 0);

begin
dut: UPDOWN_COUNTER port map (clk => clk, reset=>reset, counter => counter, counter1 => counter1);
   -- Clock process definitions
clock_process :process
begin
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
end process;


-- Stimulus process
stim_proc: process
begin        

     reset <= '1';
    wait for 20 ns;    
    reset <= '0';
  wait for 300 ns;    
   wait;
end process;
end Behavioral;
