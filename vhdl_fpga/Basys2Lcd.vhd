----------------------------------------------------------------------------------
-- Company: 		VGTU
-- Engineer: 		Antoniy Yushkevych
-- 
-- Create Date:    19:29:26 09/15/2012 
-- Design Name: 
-- Module Name:    Basys2Lcd - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.Basys2.ALL;

entity Basys2Lcd is   
	Port (  
		  -- taktinis signalas
		  clk :  in  std_logic;
		  -- kokias busenas rodyti kiekvienam skaitmeniui
		  digits : in LcdDigits;
		  seg : out   std_logic_vector (6 downto 0); -- simboliu katodu aktyvavimo signalai 
     		  an  : out   std_logic_vector (3 downto 0); -- anodu aktyvavimo signalai
		  dp  : out   std_logic                      -- tasko katodo aktyvavimo signalas
	  );		  
end Basys2Lcd;

architecture Behavioral of Basys2Lcd is
   constant COUNTER_SIZE : integer := 5;
	signal clkCnt : unsigned (COUNTER_SIZE-1 downto 0) := (others => '0'); 
	alias activeDigit : unsigned (1 downto 0) is clkCnt(COUNTER_SIZE-1 downto COUNTER_SIZE-2);
	--signal activeSeg : unsigned (1 downto 0);  -- aktyvaus segmento numeris
	signal anodes: std_logic_vector (3 downto 0);
	
	-- creating activeDigitInt signal
	subtype digit_index is integer range 0 to 3;
	signal activeDigitInt : digit_index;

	-- creating lcdValue signal
	signal lcdValue : std_logic_vector (3 downto 0);

	-- creating lcdEnabled signal
	signal lcdEnabled : std_logic;

	-- creating blinkCnt signal
	signal blinkCnt : std_logic_vector (3 downto 0) := (others => '0');

	-- creating blinkEnabled
	signal blinkEnabled : std_logic;

 
begin

  clkDivider: process(clk)
  begin
    if clk'event and clk='1' then
      clkCnt <= clkCnt + 1;		
    end if;
  end process;  

  an <= anodes;
  
  -- conditional concurrent signal assignment statement  
  
  lcdValue <= digits(activeDigitInt)(3 downto 0);

  seg <= "1000000" when (lcdValue="0000") else --0
	 "1111001" when (lcdValue="0001") else --1
	 "0100100" when (lcdValue="0010") else --2
	 "0110000" when (lcdValue="0011") else --3
	 "0011001" when (lcdValue="0100") else --4
	 "0010010" when (lcdValue="0101") else --5
	 "0000010" when (lcdValue="0110") else --6
	 "1111000" when (lcdValue="0111") else --7
	 "0000000" when (lcdValue="1000") else --8
	 "0010000" when (lcdValue="1001") else --9
	 "0001000" when (lcdValue="1010") else --A
	 "0000011" when (lcdValue="1011") else --b
	 "1000110" when (lcdValue="1100") else --C
	 "0100001" when (lcdValue="1101") else --d
	 "0000110" when (lcdValue="1110") else --E
	 "0001110";			       --F

  -- concurrent assignment statement
  lcdEnabled <= not digits(activeDigitInt)(7);

  with activeDigit select
	anodes <= ("111" & lcdEnabled)		when"00",
		  ("11" & lcdEnabled & "1")	when"01",
		  ("1" & lcdEnabled & "11")	when"10",
		  (lcdEnabled & "111")		when others; 
  
  -- extract activeDigit value to activeDigitInt
  activeDigitInt <= to_integer(activeDigit);

  -- solve LCD dp control bit from activeDigitInt signal
  dp <= not digits(activeDigitInt)(6);

  -- creating blinkCnt incremented on highest clkCnt rising or falling edge

-- this does not work for some reason
-- Error: No feasible entries for infix operator "+".
-- Error: Type error resolving infix expression "+" as type ieee.std_logic_1164.STD_LOGIC_VECTOR.
--  process(clkCnt(4))
--	begin
--		if (clkCnt(4)='1' or clkCnt(4)='0') then
--		blinkCnt <= blinkCnt + 1;
--		end if;
---  end process;

end Behavioral;

