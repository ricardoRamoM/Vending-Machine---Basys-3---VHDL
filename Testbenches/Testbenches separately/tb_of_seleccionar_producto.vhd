-- Testbench de Seleccionar productos
library ieee;
use ieee.std_logic_1164.all;

entity tb_of_seleccionar_producto is
end entity;

architecture tb of tb_of_seleccionar_producto is
component seleccionar_producto is
Port ( 
        clk : in std_logic;
        rst : in std_logic;
        PRODUCT_1 : in std_logic;
        PRODUCT_2 : in std_logic;
        PRODUCT_3 : in std_logic;
        PRODUCT_4 : in std_logic;
        PRODUCT_5 : in std_logic;
        CONFIRMAR_COMPRA : in std_logic;
        producto_selected : out std_logic;
        precio_producto : out integer
);
end component;

signal clk_IN, rst_IN, CONFIRMAR_COMPRA_IN: std_logic;
signal PRODUCT_1_IN, PRODUCT_2_IN, PRODUCT_3_IN, PRODUCT_4_IN, PRODUCT_5_IN : std_logic;
signal producto_selected_OUT : std_logic;
signal precio_producto_OUT : integer;


begin 

UUT : seleccionar_producto port map( 
        clk => clk_IN,
        rst => rst_IN,
        PRODUCT_1 => PRODUCT_1_IN,
        PRODUCT_2 => PRODUCT_2_IN,
        PRODUCT_3 => PRODUCT_3_IN,
        PRODUCT_4 => PRODUCT_4_IN,
        PRODUCT_5 => PRODUCT_5_IN,
        CONFIRMAR_COMPRA => CONFIRMAR_COMPRA_IN,
        producto_selected => producto_selected_OUT,
        precio_producto => precio_producto_OUT
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
	CONFIRMAR_COMPRA_IN <= '1';
	PRODUCT_1_IN <= '1';
	PRODUCT_2_IN <= '1';
	PRODUCT_3_IN <= '1';
	PRODUCT_4_IN <= '0';
	PRODUCT_5_IN <= '0';
    rst_IN <= '0';
	wait for 5 ns;
    CONFIRMAR_COMPRA_IN <= '1';
	PRODUCT_1_IN <= '1';
	PRODUCT_2_IN <= '0';
	PRODUCT_3_IN <= '0';
	PRODUCT_4_IN <= '0';
	PRODUCT_5_IN <= '0';
    rst_IN <= '0';
	wait for 20ns;
    CONFIRMAR_COMPRA_IN <= '1';
	PRODUCT_1_IN <= '0';
	PRODUCT_2_IN <= '1';
	PRODUCT_3_IN <= '0';
	PRODUCT_4_IN <= '0';
	PRODUCT_5_IN <= '0';
    rst_IN <= '0';
	wait for 5 ns;
    CONFIRMAR_COMPRA_IN <= '0';
	PRODUCT_1_IN <= '0';
	PRODUCT_2_IN <= '0';
	PRODUCT_3_IN <= '0';
	PRODUCT_4_IN <= '0';
	PRODUCT_5_IN <= '1';
    rst_IN <= '0';
	wait for 15 ns;
    CONFIRMAR_COMPRA_IN <= '1';
	PRODUCT_1_IN <= '0';
	PRODUCT_2_IN <= '0';
	PRODUCT_3_IN <= '1';
	PRODUCT_4_IN <= '0';
	PRODUCT_5_IN <= '0';
    rst_IN <= '0';
	wait for 5 ns;
    CONFIRMAR_COMPRA_IN <= '1';
	PRODUCT_1_IN <= '0';
	PRODUCT_2_IN <= '0';
	PRODUCT_3_IN <= '0';
	PRODUCT_4_IN <= '1';
	PRODUCT_5_IN <= '0';
    rst_IN <= '0';
	wait for 10 ns;
    CONFIRMAR_COMPRA_IN <= '0';
	PRODUCT_1_IN <= '0';
	PRODUCT_2_IN <= '0';
	PRODUCT_3_IN <= '1';
	PRODUCT_4_IN <= '0';
	PRODUCT_5_IN <= '1';
    rst_IN <= '0';
	wait for 5 ns;
    CONFIRMAR_COMPRA_IN <= '0';
	PRODUCT_1_IN <= '0';
	PRODUCT_2_IN <= '1';
	PRODUCT_3_IN <= '0';
	PRODUCT_4_IN <= '0';
	PRODUCT_5_IN <= '1';
    rst_IN <= '0';
	wait for 15 ns;
    CONFIRMAR_COMPRA_IN <= '1';
	PRODUCT_1_IN <= '1';
	PRODUCT_2_IN <= '0';
	PRODUCT_3_IN <= '0';
	PRODUCT_4_IN <= '0';
	PRODUCT_5_IN <= '1';
	rst_IN <= '0';
	wait for 5 ns;
    CONFIRMAR_COMPRA_IN <= '0';
	PRODUCT_1_IN <= '0';
	PRODUCT_2_IN <= '1';
	PRODUCT_3_IN <= '1';
	PRODUCT_4_IN <= '1';
	PRODUCT_5_IN <= '0';
    rst_IN <= '0';
	wait for 10 ns;
	
    -- Run Time: 100 ns
	

end process;


end tb;