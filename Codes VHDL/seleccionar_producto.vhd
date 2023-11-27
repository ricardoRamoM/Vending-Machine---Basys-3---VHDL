-- Seleccionar productos
-- En este caso se puede mejorar que se quede seleccionado el ultimo producto que escojas
-- porque se queda seleccionado el producto 1, 2, 3, 4 y 5 en ese orden independientemente
-- de cual escojas primero 
library ieee;
use ieee.std_logic_1164.all;

entity seleccionar_producto is
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
end seleccionar_producto;

architecture Behavioral of seleccionar_producto is

    signal precioP1: integer:= 1;
    signal precioP2: integer:= 2;
    signal precioP3: integer:= 6;
    signal precioP4: integer:= 11;
    signal precioP5: integer:= 16;

begin
    process(clk)
    begin
	if (clk'event and clk='1') then
		if (PRODUCT_1 = '1') then
            precio_producto <= precioP1;
            producto_selected <= '1';
            
        elsif (PRODUCT_2 = '1') then
            precio_producto <= precioP2;
            producto_selected <= '1';

        elsif (PRODUCT_3 = '1') then
            precio_producto <= precioP3;
            producto_selected <= '1';
            
        elsif (PRODUCT_4 = '1') then
            precio_producto <= precioP4;
            producto_selected <= '1';
            
        elsif (PRODUCT_5 = '1') then
            precio_producto <= precioP5;
            producto_selected <= '1';
            
        elsif (rst = '1' or CONFIRMAR_COMPRA = '1') then
            producto_selected <= '0';
            precio_producto <= 0;
        else
            producto_selected <= '0';
            precio_producto <= 0;
        end if;
        
	end if;
    end process;
end Behavioral;