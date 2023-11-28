-- Testbench de Maquina de estados para dispensar o no algun producto
library ieee;
use ieee.std_logic_1164.all;

entity tb_of_estados_dispensador is
end entity;

architecture tb of tb_of_estados_dispensador is
component estados_dispensador is
Port ( 
        clk: in std_logic;
        rst: in std_logic;
        productoSelected : in std_logic;
        confirmarProductoSelected : in std_logic;
        
        precioProducto: in integer;
        dineroRecibido: in integer;
        Dispensar: out std_logic;
        Dar_cambio: out std_logic

);
end component;

signal clk_IN, rst_IN, productoSelected_IN : std_logic;
signal confirmarProductoSelected_IN : std_logic := '0';
signal precioProducto_IN : integer;
signal dineroRecibido_IN : integer;

signal Dispensar_OUT, Dar_cambio_OUT : std_logic;

begin

UUT: estados_dispensador 
	port map( 
        clk => clk_IN,
        rst => rst_IN,
        productoSelected => productoSelected_IN,
        confirmarProductoSelected => confirmarProductoSelected_IN,
        precioProducto => precioProducto_IN,
        dineroRecibido => dineroRecibido_IN,
        Dispensar => Dispensar_OUT,
        Dar_cambio => Dar_cambio_OUT
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
	productoSelected_IN <= '1';
	dineroRecibido_IN <= 9;
    precioProducto_IN <= 5;
    rst_IN <= '0';
	wait for 5 ns;
    productoSelected_IN <= '1';
	dineroRecibido_IN <= 8;
    precioProducto_IN <= 5;
    rst_IN <= '0';
	wait for 20ns;
    productoSelected_IN <= '1';
	dineroRecibido_IN <= 7;
    precioProducto_IN <= 5;
    rst_IN <= '0';
	wait for 5 ns;
    productoSelected_IN <= '0';
	dineroRecibido_IN <= 6;
    precioProducto_IN <= 5;
    rst_IN <= '0';
	wait for 15 ns;
    productoSelected_IN <= '1';
	dineroRecibido_IN <= 5;
    precioProducto_IN <= 5;
    rst_IN <= '0';
	wait for 5 ns;
    productoSelected_IN <= '1';
	dineroRecibido_IN <= 4;
    precioProducto_IN <= 5;
    rst_IN <= '0';
	wait for 10 ns;
    productoSelected_IN <= '0';
	dineroRecibido_IN <= 3;
    precioProducto_IN <= 5;
    rst_IN <= '0';
	wait for 5 ns;
    productoSelected_IN <= '0';
	dineroRecibido_IN <= 2;
    precioProducto_IN <= 5;
    rst_IN <= '0';
	wait for 15 ns;
    productoSelected_IN <= '1';
	dineroRecibido_IN <= 1;
    precioProducto_IN <= 5;
    rst_IN <= '0';
	wait for 5 ns;
    productoSelected_IN <= '0';
	dineroRecibido_IN <= 0;
    precioProducto_IN <= 5;
    rst_IN <= '0';
	wait for 10 ns;
	
    -- Run Time: 500 ns
	
end process;

end tb;