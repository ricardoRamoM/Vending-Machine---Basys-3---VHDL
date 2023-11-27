-- Maquina de estados para dispensar o no algun producto
library ieee;
use ieee.std_logic_1164.all;

entity estados_dispensador is
Port ( 
        clk: in std_logic;
        rst: in std_logic;
        productoSelected : in std_logic;
        confirmarProductoSelected : in std_logic; -- No se está usando
        precioProducto: in integer;
        dineroRecibido: in integer;
        Dispensar: out std_logic;
        Dar_cambio: out std_logic

);
end estados_dispensador;

architecture Behavioral of estados_dispensador is
    
    signal precio: integer;
    type State_Type is (state_Wait, state_P_Select);
    signal current_state, next_state : State_Type;
    
begin
--------------------------------------------------------------------------------------
STATE_MEMORY : 
    process (clk, rst)
    begin 
        if (rst = '1') then 
            --current_state <= estado inicial
            current_state <= state_Wait; 
        elsif (clk'event and clk='1') then
            current_state <= next_state;
        end if;
    end process;
    
 --------------------------------------------------------------------------------------
NEXT_STATE_LOGIC:
    process (current_state, productoSelected)
    begin
        case (current_state) is
            when state_Wait => if (productoSelected = '1')then
                                next_state <= state_P_Select;
                            else 
                                next_state <= state_Wait;
                            end if;
            when state_P_Select => if (productoSelected = '1')then
                                next_state <= state_P_Select;
                            else 
                                next_state <= state_Wait;
                            end if;
            when others => next_state <= state_Wait;
        end case;
    end process;                            

--------------------------------------------------------------------------------------
OUTPUT_LOGIC: 
    process (current_state, productoSelected)
    begin
        case (current_state) is
            when state_Wait => 
                                Dispensar <= '0';
                                Dar_cambio <= '0';
                                
            when state_P_Select => 
                            if ((dineroRecibido > precioProducto) ) then --and (confirmarProductoSelected ='1')
                                Dispensar <= '1';
                                Dar_cambio <= '1';
                            elsif (dineroRecibido = precioProducto ) then
                                Dispensar <= '1';
                                Dar_cambio <= '0';
                            else 
                                Dispensar <= '0';
                                Dar_cambio <= '0';
                            end if;
            when others =>  
                            Dispensar <= '1';
                           Dar_cambio <= '1';
        end case;
    end process;



end Behavioral;

