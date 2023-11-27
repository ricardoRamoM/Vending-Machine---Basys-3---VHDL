-- Testbench de Decimal a display 7 segmentos de las Unidades
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_of_bcd7seg_uni is
end entity;

architecture tb of tb_of_bcd7seg_uni is
component bcd7seg_uni is
Port ( 
        unidades: integer range 0 to 9;
        segmentos_uni : out std_logic_vector (6 downto 0)
);
end component;

signal unidades_IN : integer;
signal segmentos_uni_OUT : std_logic_vector (6 downto 0);

begin

UUT : bcd7seg_uni port map (
	unidades => unidades_IN,
    segmentos_uni => segmentos_uni_OUT
);


stimulation_signals : process
begin

unidades_IN <= 9;
wait for 5 ns;
unidades_IN <= 8;
wait for 20ns;
unidades_IN <= 7;
wait for 5 ns;
unidades_IN <= 6;
wait for 15 ns;
unidades_IN <= 5;
wait for 5 ns;
unidades_IN <= 4;
wait for 10 ns;
unidades_IN <= 3;
wait for 5 ns;
unidades_IN <= 2;
wait for 15 ns;
unidades_IN <= 1;
wait for 5 ns;
unidades_IN <= 0;
wait for 10 ns;
-- Run Time:100 ns

end process;

