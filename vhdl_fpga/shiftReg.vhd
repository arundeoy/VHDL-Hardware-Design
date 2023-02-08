library ieee; 
use ieee.std_logic_1164.all; 
 
entity shiftReg is 
	port(
		Clk, SIn, SLoad, SClear : in std_logic;
		DIn : in std_logic_vector(7 downto 0);
		SOut : out std_logic_vector(7 downto 0)
	);
end shiftReg;

architecture arch of shiftReg is

	signal temp : std_logic_vector(7 downto 0);

   begin
	process(Clk, SLoad, SClear)
	begin
		if (SClear='1') then
			temp <= (others => '0');
		elsif (Clk'event and Clk='1') then
			if(SLoad='1') then
				temp <= DIn;
			else 
				temp <= Sin & temp(7 downto 1);
			end if;
		end if;
	end process;
   SOut <= temp;
end arch;

