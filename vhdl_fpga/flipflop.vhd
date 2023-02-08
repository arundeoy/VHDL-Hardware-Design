
library ieee; 
use ieee.std_logic_1164.all;

entity flipflop is
    port (
        Clk, BTN0, BTN1 : in std_logic;
        DIn : in std_logic_vector(7 downto 0);
	SW : in std_logic_vector(7 downto 0);
        Result : out std_logic_vector(7 downto 0)
    );
end flipflop;

architecture arch of flipflop is

signal temp : std_logic_vector(7 downto 0);

begin
    process(Clk, BTN0, BTN1)
    begin
        if (BTN0 = '1') then
            temp <= (others => '0');
        elsif (BTN1 = '1') then
		temp <= SW;
	elsif (Clk'event and Clk = '1') then 
            temp <= DIn; 
        end if;
    end process;

Result <= temp;

end arch;