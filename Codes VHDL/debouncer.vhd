-- Boton o switch antirrebote
library ieee;
use ieee.std_logic_1164.all;

entity debouncer is
    Port ( 
        clk_100MHz : in std_logic;
        btn_in : in std_logic;
        btn_out : out std_logic;
        btn_pulsed : out std_logic
    );
end debouncer;

architecture Behavioral of debouncer is
    signal registro_de_desplazamiento : std_logic_vector(7 downto 0); -- registro de desplazamiento (shift register)registro_de_desplazamiento
    signal tiempo_de_muestreo : std_logic; --tiempo de muestreo  tiempo_de_muestreo

    signal btn_out_reg: std_logic;
    signal ffl, ff2: std_logic; --flip flips
    signal conteo_entero: integer;

    component  contadorNbits is
        generic( N: integer); --conteo de N bits
        port(
            clk_100MHz_contador : in std_logic; --cuenta los pulsos de reloj
            reset: in std_logic;    
            count_enable: in std_logic;    --count enable
            terminal_count: out std_logic;    --teminal count
            counter_out: out std_logic_vector (N - 1 downto 0);
            counter_out_int: out integer
        );
    end component;

begin
    u0: contadorNbits
    generic map (N => 20) --11 para 100 MHz seg el video  --con 13 funcionaba bien
    --20 para switches es lo mejor, aunque subas lento el switch solo lee una vez
    --12 mas o menos estables para botones
    port map (
        clk_100MHz_contador => clk_100MHz, 
        reset => '0', 
        count_enable => '1', 
        terminal_count => tiempo_de_muestreo
    );

    process (tiempo_de_muestreo, btn_in, clk_100MHz, registro_de_desplazamiento) 
    begin
        -- registro se actualiza cada vez que el contador llegue al limite
        if clk_100MHz'event and clk_100MHz = '1' and tiempo_de_muestreo = '1' then 
        --se guarda el mismo registo desplazado y se almacena en el registro el boton de entrada
            registro_de_desplazamiento <= registro_de_desplazamiento (6 downto 0) & btn_in; 
        end if;
        
        --este if comprueba que la señal se estabilizo y ya no hay rebotes, por eso se llena de 1s
        if registro_de_desplazamiento = x"ff" then --registro de desplazamiento esta lleno de 1s
            btn_out_reg <= '1'; --
        else 
            btn_out_reg <= '0'; --
        end if; 
    end process;
    
    btn_out <= btn_out_reg;

    process (clk_100MHz, btn_out_reg)
    begin
        if clk_100MHz'event and clk_100MHz = '1' then 
            ffl <= btn_out_reg;
            ff2 <= ffl;
        end if;
    end process;

    btn_pulsed <= ffl and not (ff2);
     

end Behavioral;