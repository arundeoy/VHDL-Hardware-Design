library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity flipflop_tb is
end;

architecture bench of flipflop_tb is

  component flipflop
      port (
          Clk, BTN0, BTN1 : in std_logic;
          DIn : in std_logic_vector(7 downto 0);
  	SW : in std_logic_vector(7 downto 0);
          Result : out std_logic_vector(7 downto 0)
      );
  end component;

  signal Clk, BTN0, BTN1: std_logic;
  signal DIn: std_logic_vector(7 downto 0);
  signal SW: std_logic_vector(7 downto 0);
  signal Result: std_logic_vector(7 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: flipflop port map ( Clk    => Clk,
                           BTN0   => BTN0,
                           BTN1   => BTN1,
                           DIn    => DIn,
                           SW     => SW,
                           Result => Result );

  stimulus: process
  begin
    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      Clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
