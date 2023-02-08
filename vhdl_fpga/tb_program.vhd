library ieee;
use ieee.std_logic_1164.all;

entity tb_program_1 is
end tb_program_1;

architecture Behavioral of tb_program_1 is

component program_1 is
  port(
    a : in std_logic;
    b : in std_logic;
    y : out std_logic
  );
end component;

signal a, b, y : std_logic;

begin

dut1: program_1
  port map(
    a => a,
    b => b,
    y => y
  ); 
  
io_gen: process
  begin
    a <= '0';
    b <= '0';
    wait for 50 ns;
    
    a <= '0';
    b <= '1';
    wait for 50 ns;
    
    a <= '1';
    b <= '0';
    wait for 50 ns;
    
    a <= '1';
    b <= '1';
    wait for 50 ns;
    
    assert false report "End of modelling" severity failure;
    
end process;
end Behavioral;

    