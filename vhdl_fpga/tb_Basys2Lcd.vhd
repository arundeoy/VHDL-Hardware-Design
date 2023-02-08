library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Basys2.ALL;

entity tb_Basys2Lcd is
end tb_Basys2Lcd;

architecture behaviour of tb_Basys2Lcd is

component Basys2Lcd is
	Port (
		clk : in std_logic;
		digits : in LcdDigits;
		seg : out std_logic_vector (6 downto 0);
		an : out std_logic_vector (3 downto 0);
		dp : out std_logic
	);
end component;

	signal clk, dp: std_logic;
	signal seg : std_logic_vector (6 downto 0);
	signal an : std_logic_vector (3 downto 0);
	signal digits : LcdDigits;

begin

	dut1 : Basys2Lcd port map ( clk=>clk, digits=>digits, seg=>seg, an=>an, dp=>dp );

	clock_gen: process
	begin
		clk <= '0';
	wait for 50 ns;
		clk <= '1';
	wait for 50 ns;
	end process;

	io_gen: process
	begin
		digits(0) <= "10000001";
		digits(1) <= "11001000";
		digits(2) <= "00000000";
		digits(3) <= "10001111";
	wait for 5000 ns;
		digits(2) <= "11001010";
	wait for 5000 ns;
	assert false report "severe failure" severity failure;
end process;
end behaviour;