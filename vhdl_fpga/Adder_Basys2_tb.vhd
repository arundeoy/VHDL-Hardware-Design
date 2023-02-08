library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_adder is
end tb_adder;

architecture behavior of tb_adder is

-- Component Declaration for the Unit Under Test (UUT)
component adder is
  port (
    clk : in  std_logic;
    SW  : in  std_logic_vector(7 downto 0);
    LED : out std_logic_vector(7 downto 0);
    LCD : out std_logic_vector(3 downto 0)
  );
end component;

-- Inputs
signal clk : std_logic := '0';
signal SW  : std_logic_vector(7 downto 0) := (others => '0');

-- Outputs
signal LED : std_logic_vector(7 downto 0);
signal LCD : std_logic_vector(3 downto 0);

-- Clock Period Definition
constant clk_period : time := 1 sec / 2;

begin

-- Instantiate the Unit Under Test (UUT)
uut: adder port map (
  clk => clk,
  SW  => SW,
  LED => LED,
  LCD => LCD
);

-- Clock Process Definition
clk_process : process
begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
end process;

-- Stimulus Process
stim_proc: process
begin
  -- Initialize Inputs
  SW <= "00000000";
  wait for clk_period;

  -- Apply a Test Input
  SW <= "00010001";
  wait for clk_period;

  -- Apply a Test Input
  SW <= "01010101";
  wait for clk_period;

  -- Apply a Test Input
  SW <= "11111111";
  wait for clk_period;

  -- Hold Outputs
  wait;
end process;

end behavior;

