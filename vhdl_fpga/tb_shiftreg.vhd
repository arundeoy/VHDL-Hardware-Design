library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity shiftReg_tb is
end;

architecture bench of shiftReg_tb is

  component shiftReg 
  	port(
  		Clk, SIn, SLoad, SClear : in std_logic;
  		DIn : in std_logic_vector(7 downto 0);
  		SOut : out std_logic_vector(7 downto 0)
  	);
  end component;

  signal Clk, SIn, SLoad, SClear: std_logic;
  signal DIn: std_logic_vector(7 downto 0);
  signal SOut: std_logic_vector(7 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: shiftReg port map ( Clk    => Clk,
                           SIn    => SIn,
                           SLoad  => SLoad,
                           SClear => SClear,
                           DIn    => DIn,
                           SOut   => SOut );

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
