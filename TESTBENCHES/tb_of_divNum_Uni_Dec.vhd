-- Testbench de Dividir numero en decenas y unidades y mostrarlo en dos displays de 7 segmentos
library ieee;
use ieee.std_logic_1164.all;


entity tb_of_divNum_Uni_Dec is 
end entity;

architecture tb of tb_of_divNum_Uni_Dec is
component divNum_Uni_Dec is
Port ( 
        Numero : in integer range 0 to 99;
        segmentos_uni_out : out std_logic_vector (6 downto 0);
        segmentos_dec_out : out std_logic_vector (6 downto 0)
);
end component;

signal Numero_IN : integer;
signal segmentos_uni_out_OUT : std_logic_vector (6 downto 0);
signal segmentos_dec_out_OUT : std_logic_vector (6 downto 0);

begin

UUT: divNum_Uni_Dec port map( 
    Numero => Numero_IN,
   	segmentos_uni_out => segmentos_uni_out_OUT,
    segmentos_dec_out => segmentos_dec_out_OUT
);

stimulation_signals : process
begin
	Numero_IN <= 19;
	wait for 5 ns;
	Numero_IN <= 55;
	wait for 20ns;
	Numero_IN <= 12;
	wait for 5 ns;
	Numero_IN <= 9;
	wait for 15 ns;
	Numero_IN <= 8;
	wait for 5 ns;
	Numero_IN <= 11;
	wait for 10 ns;
	Numero_IN <= 24;
	wait for 5 ns;
	Numero_IN <= 71;
	wait for 15 ns;
	Numero_IN <= 10;
	wait for 5 ns;
	Numero_IN <= 4;
	wait for 10 ns;
	
    -- Run Time: 200 ns

end process;

end tb;