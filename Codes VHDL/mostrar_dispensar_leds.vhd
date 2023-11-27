-- Codigo para encender leds para mostrar producto entregado
-- Una mejora es agregar la entrada de entregar producto para solo encenderlo cuando 
--   si se llegue al precio para dar un producto  
library ieee;
use ieee.std_logic_1164.all;

entity mostrar_dispensar_leds is
Port ( 
    clk : in std_logic;
    reset : in std_logic;
    Dispensar_IN : in std_logic;
    Confirmar_compra_IN : in std_logic; 
    LEDS : out std_logic_vector (15 downto 0)
);
end mostrar_dispensar_leds;

architecture Behavioral of mostrar_dispensar_leds is

signal signal_state: integer := 0;
signal signal_clk_in: std_logic := '0';
signal numeroCuenta: integer := 0;

signal signal_empezarCuenta : std_logic;
signal signal_terminarCuenta : std_logic := '0';

begin

signal_clk_in <= clk and Dispensar_IN;

process (signal_clk_in, reset)
begin
    if (reset = '1') then
        signal_state <= 0;
        signal_terminarCuenta <= '0';
        numeroCuenta <= 0;
    elsif ( Confirmar_compra_IN = '0') then
        signal_state <= 0;
        numeroCuenta <= 0;
    elsif (signal_clk_in'event and signal_clk_in='1') and Confirmar_compra_IN = '1' then
            if (signal_state < 18) then
                signal_state <= signal_state + 1;
                signal_terminarCuenta <= '0';            
            elsif (signal_state >= 18) and Confirmar_compra_IN = '1' then
                signal_terminarCuenta <= '1';
                numeroCuenta <= numeroCuenta + 1;
            elsif Confirmar_compra_IN = '0' then
                signal_state <= 0;
            end if;
            
    end if;
end process;

process (signal_state,signal_terminarCuenta,numeroCuenta)
begin
if (signal_terminarCuenta = '0' and numeroCuenta < 1) then
    case signal_state is 
    when 17 => LEDS <= "0000000000000000" ;
    when 16 => LEDS <= "0000000000000001" ;
    when 15 => LEDS <= "0000000000000011" ;
    when 14 => LEDS <= "0000000000000111" ;
    when 13 => LEDS <= "0000000000001111" ;
    when 12 => LEDS <= "0000000000011111" ;
    when 11 => LEDS <= "0000000000111111" ;
    when 10 => LEDS <= "0000000001111111" ;
    when 9 => LEDS <= "0000000011111111" ;
    when 8 => LEDS <= "0000000111111111" ;
    when 7 => LEDS <= "0000001111111111" ;
    when 6 => LEDS <= "0000011111111111" ;
    when 5 => LEDS <= "0000111111111111" ;
    when 4 => LEDS <= "0001111111111111" ;
    when 3 => LEDS <= "0011111111111111" ;
    when 2 => LEDS <= "0111111111111111" ;
    when 1 => LEDS <= "1111111111111111" ;
    when 0 => LEDS <= "0000000000000000"; 
    when others => LEDS <= "0000000000000000";
    end case;
else 
    LEDS <= "0000000000000000";
end if;
end process;

end Behavioral;