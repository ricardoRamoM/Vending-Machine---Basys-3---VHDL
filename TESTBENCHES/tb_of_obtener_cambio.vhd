-- Testbench de Obtener valor del cambio
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_of_obtener_cambio is 
end entity;

architecture tb of tb_of_obtener_cambio is

component obtener_cambio is
Port ( 
    Confirmar : in std_logic;
    dineroAcumulado : in integer;
    precioProducto : in integer;
    valor_del_cambio : out integer
);
end component;

signal Confirmar_IN : std_logic;
signal dineroAcumulado_IN, precioProducto_IN : integer;
signal valor_del_cambio_OUT : integer;

begin

UUT: obtener_cambio port map( 
    Confirmar => Confirmar_IN,
   	dineroAcumulado => dineroAcumulado_IN,
    precioProducto => precioProducto_IN,
    valor_del_cambio => valor_del_cambio_OUT
);

stimulation_signals : process
begin
	Confirmar_IN <= '1';
	dineroAcumulado_IN <= 9;
    precioProducto_IN <= 5;
	wait for 5 ns;
    Confirmar_IN <= '1';
	dineroAcumulado_IN <= 8;
    precioProducto_IN <= 5;
	wait for 20ns;
    Confirmar_IN <= '1';
	dineroAcumulado_IN <= 7;
    precioProducto_IN <= 5;
	wait for 5 ns;
    Confirmar_IN <= '0';
	dineroAcumulado_IN <= 6;
    precioProducto_IN <= 5;
	wait for 15 ns;
    Confirmar_IN <= '1';
	dineroAcumulado_IN <= 5;
    precioProducto_IN <= 5;
	wait for 5 ns;
    Confirmar_IN <= '1';
	dineroAcumulado_IN <= 4;
    precioProducto_IN <= 5;
	wait for 10 ns;
    Confirmar_IN <= '0';
	dineroAcumulado_IN <= 3;
    precioProducto_IN <= 5;
	wait for 5 ns;
    Confirmar_IN <= '0';
	dineroAcumulado_IN <= 2;
    precioProducto_IN <= 5;
	wait for 15 ns;
    Confirmar_IN <= '1';
	dineroAcumulado_IN <= 1;
    precioProducto_IN <= 5;
	wait for 5 ns;
    Confirmar_IN <= '0';
	dineroAcumulado_IN <= 0;
    precioProducto_IN <= 5;
	wait for 10 ns;
	
    -- Run Time: 300 ns
	
end process;

end tb;