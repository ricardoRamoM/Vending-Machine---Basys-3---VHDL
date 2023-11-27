-- Testbench de Boton o switch antirrebote
library ieee;
use ieee.std_logic_1164.all;

entity tb_of_debouncer is
end entity;

architecture tb of tb_of_debouncer is
component debouncer is
    Port ( 
        clk_100MHz : in std_logic;
        btn_in : in std_logic;
        btn_out : out std_logic;
        btn_pulsed : out std_logic
    );
end component;

signal clk_100MHz_IN, btn_in_IN : std_logic;
signal btn_out_OUT, btn_pulsed_OUT : std_logic;


begin

UUT: debouncer port map(
	clk_100MHz => clk_100MHz_IN,
	btn_in => btn_in_IN,
    btn_out => btn_out_OUT,
    btn_pulsed => btn_pulsed_OUT

);

clk : process
begin
clk_100MHz_IN <= '1';
wait for 10 ns;
clk_100MHz_IN <= '1';
wait for 10 ns;
end process;

stimulation_signals : process
begin
	btn_in_IN <= '1';
wait for 100 ns;
	btn_in_IN <= '1';
wait for 500 ns;
	btn_in_IN <= '1';
wait for 5 ns;
	btn_in_IN <= '1';
wait for 150 ns;
	btn_in_IN <= '1';
wait for 10 ns;
	btn_in_IN <= '0';
wait for 5 ns;
	btn_in_IN <= '1';
wait for 5 ns;
	btn_in_IN <= '1';
wait for 150 ns;
	btn_in_IN <= '1';
wait for 10 ns;
	btn_in_IN <= '1';
wait for 5 ns;
	btn_in_IN <= '1';
wait for 5 ns;
	btn_in_IN <= '1';
wait for 150 ns;
	btn_in_IN <= '1';
wait for 10 ns;
	btn_in_IN <= '0';
wait for 5 ns;
--Run Time: 10ms

end process;

end architecture;