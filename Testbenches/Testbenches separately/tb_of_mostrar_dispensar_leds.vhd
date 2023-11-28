-- Testbench de Codigo para encender leds para mostrar producto entregado
library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;

entity tb_of_mostrar_dispensar_leds is 
end entity;

architecture tb of tb_of_mostrar_dispensar_leds is
component mostrar_dispensar_leds is
Port ( 
    clk : in std_logic;
    reset : in std_logic;
    Dispensar_IN : in std_logic;
    Confirmar_compra_IN : in std_logic; 
    LEDS : out std_logic_vector (15 downto 0)
);
end component;

signal clk_IN, rst_IN, Dispensar_IN_IN, Confirmar_compra_IN_IN : std_logic;
signal LEDS_OUT : std_logic_vector (15 downto 0);

begin

UUT: mostrar_dispensar_leds port map( 
    clk => clk_IN,
    reset => rst_IN,
    Dispensar_IN => Dispensar_IN_IN,
    Confirmar_compra_IN => Confirmar_compra_IN_IN,
    LEDS => LEDS_OUT
);

Clk : process
begin
clk_IN <= '0';
wait for 1 ns;
clk_IN <= '1';
wait for 1 ns;
end process;

stimulation_signals : process
begin
	Dispensar_IN_IN <= '1';
	Confirmar_compra_IN_IN <= '1';
    rst_IN <= '0';
	wait for 5 ns;
    Dispensar_IN_IN <= '1';
	Confirmar_compra_IN_IN <= '1';
    rst_IN <= '0';
	wait for 20ns;
    Dispensar_IN_IN <= '1';
	Confirmar_compra_IN_IN <= '1';
    rst_IN <= '0';
	wait for 5 ns;
    Dispensar_IN_IN <= '0';
	Confirmar_compra_IN_IN <= '0';
    rst_IN <= '0';
	wait for 15 ns;
    Dispensar_IN_IN <= '1';
	Confirmar_compra_IN_IN <= '1';
    rst_IN <= '0';
	wait for 5 ns;
    Dispensar_IN_IN <= '1';
	Confirmar_compra_IN_IN <= '1';
    rst_IN <= '0';
	wait for 10 ns;
    Dispensar_IN_IN <= '0';
	Confirmar_compra_IN_IN <= '1';
    rst_IN <= '0';
	wait for 5 ns;
    Dispensar_IN_IN <= '0';
	Confirmar_compra_IN_IN <= '1';
    rst_IN <= '0';
	wait for 15 ns;
    Dispensar_IN_IN <= '1';
	Confirmar_compra_IN_IN <= '0';
    rst_IN <= '0';
	wait for 5 ns;
    Dispensar_IN_IN <= '0';
	Confirmar_compra_IN_IN <= '1';
    rst_IN <= '0';
	wait for 10 ns;
	
    -- Run Time: 500 ns
	

end process;

end tb;