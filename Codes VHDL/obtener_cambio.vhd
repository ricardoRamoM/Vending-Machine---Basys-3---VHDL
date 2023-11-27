-- Obtener valor del cambio
-- Se puede agregar la signal de dispensar para confirmar que ya se debe de restar
library ieee;
use ieee.std_logic_1164.all;

entity obtener_cambio is
Port ( 
    Confirmar : in std_logic;
    dineroAcumulado : in integer;
    precioProducto : in integer;
    valor_del_cambio : out integer
);
end obtener_cambio;

architecture Behavioral of obtener_cambio is

begin
    process(Confirmar)
    begin
    
    if (Confirmar = '1') then
	       valor_del_cambio <= dineroAcumulado - precioProducto;
    end if;
    
    end process;
end Behavioral;
