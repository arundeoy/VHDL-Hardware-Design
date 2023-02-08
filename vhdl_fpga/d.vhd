library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
  
entity UPDOWN_COUNTER is
    Port ( clk: in std_logic; 
           reset: in std_logic; 
         
           counter: out std_logic_vector(4 downto 0); 
	 counter1: out std_logic_vector(4 downto 0)
     );

end UPDOWN_COUNTER;

architecture Behavioral of UPDOWN_COUNTER is
signal counter_down: std_logic_vector(4 downto 0);
signal counter_up: std_logic_vector(4 downto 0);
begin

process(clk)
begin
if(rising_edge(clk)) then
    if(reset='1') then
         counter_up <= "00000";
    else
        counter_up <= counter_up + "00001";
    end if;
 end if;
end process;

 
process(clk)
begin
if(rising_edge(clk)) then
    if(reset='1') then
         counter_down <= "11111";
    else
        counter_down <= counter_down - "00001";
    end if;
 end if;
end process;

 counter <= counter_up;
 counter1 <= counter_down;
end Behavioral;
