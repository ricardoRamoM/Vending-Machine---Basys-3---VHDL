-- Demultiplexor para mostrar numeros en display
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity demux_display is
  Port (
  -- contador 1000 Hz. conteoMax= 100000. T=0.001=1ms . Cada 2 ms  cambia 
        clk1000hz: 	    in std_logic;  
        Confirmar_compra_IN : in std_logic; 
        segmentos_uni_dinero : in std_logic_vector (6 downto 0);
        segmentos_dec_dinero : in std_logic_vector (6 downto 0);
        segmentos_uni_cambio : in std_logic_vector (6 downto 0);
        segmentos_dec_cambio : in std_logic_vector (6 downto 0);
        segmentos_uni_precio : in std_logic_vector (6 downto 0);
        segmentos_dec_precio : in std_logic_vector (6 downto 0);
        segmentos_letra      : in std_logic_vector (6 downto 0);
        display: 	    out std_logic_vector(6 downto 0);
        curr_display:   out std_logic_vector(3 downto 0)
  );
end demux_display;

architecture Behavioral of demux_display is
    signal refresh_state: std_logic_vector(1 downto 0);
    signal display_sel: std_logic_vector(3 downto 0); --selector de 4 bits para cada 1 de los 4 displays

begin
    cambiar_display: process(clk1000hz)
    begin
        if (clk1000hz'event and clk1000hz='1') then  
            refresh_state <= refresh_state + 1;
        end if; 
    end process; 

    mostrar_display: process(refresh_state) 
    begin 
        -- seleccion del display 
        case refresh_state is 
            when "00" => 
                         -- Con 0-ON y con 1-OFF
                display_sel <= "1110"; -- display 0 
            when "01" => 
                display_sel <= "1101"; -- display 1 
            when "10" => 
                display_sel <= "1011"; -- display 2 
            when "11" => 
                display_sel <= "0111"; -- display 3 
            when others => 
                display_sel <= "1111"; 
        end case; 
        curr_display <= display_sel;

        -- mostrar la informacion en cada display
        case display_sel is 
            when "1110" => -- DISPLAY 1 ACTIVO 
		        if (Confirmar_compra_IN = '1')then 
		          display <= segmentos_uni_cambio;
		        else
		          display <= segmentos_uni_dinero;
		        end if;
            when "1101" => -- DISPLAY 2 Activo
		        if ( Confirmar_compra_IN = '1')then 
		          display <= segmentos_dec_cambio;
		        else
		          display <= segmentos_dec_dinero;
		        end if;
            when "1011" => -- DISPLAY 3 Activo
		        if (Confirmar_compra_IN = '0')then  
		          display <= segmentos_uni_precio;
		        elsif ( Confirmar_compra_IN = '1')then 
		          display <= segmentos_letra;
		        else
		          display <= "1111111"; -- 0
		        end if;
            when "0111" => -- DISPLAY 4 Activo
		        if ( Confirmar_compra_IN = '0')then
		          display <= segmentos_dec_precio;
		        elsif ( Confirmar_compra_IN = '1')then 
		          display <= "1111111"; -- apagado
		        else
		          display <= "1111111"; -- apagado
		        end if; 
            when others =>       
                      --g f e d c b a
                display <= "1111111"; -- apagado

	    end case;
	end process;

end Behavioral;