-- Contador de 0 a N bits
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contadorNbits is
    generic( N: integer := 8); --conteo de N bits
    port(
        clk_100MHz_contador : in std_logic; --cuenta los pulsos de reloj
        reset: in std_logic;    
        count_enable: in std_logic;    --count enable
        terminal_count: out std_logic;    --teminal count
        counter_out: out std_logic_vector (N - 1 downto 0);
        counter_out_int: out integer
    );
end contadorNbits;

architecture Behavioral of contadorNbits is
    -- temporal . contador de N=3 bits cuenta desde 0 hasta el numero 7(2^^3=8-1)
    -- Numero max al que cuenta
    -- para llegar al 9 necesitas N=4 bits
    signal temp_count : integer range 0 to 2**N - 1; 

begin
    process (clk_100MHz_contador, reset, count_enable) begin

        if (reset = '1') then 
            temp_count <= 0;
        elsif clk_100MHz_contador'event and clk_100MHz_contador='1' and count_enable = '1' then  
            --ciclo de reloj y cuenta habilitada
            temp_count <= temp_count + 1; -- aumenta el contador
        end if;
        
    end process;
        
    -- Se termina la cuenta al llegar el valor de la cuenta (temp_count) sea igual al Numero maximo
    terminal_count <= '1' when temp_count = 2**N - 1 else '0'; -- IF fuera de un process (logica combinacional)


    -- pasamos la cuenta de numero entero a un vector 
    -- to_unsigned es para quitarle el signo al numero
    -- to_unsigned (variable a convertir, largo del vector) 
    -- counter_out 'length -- nos dice el largo de counter_out
    counter_out <= std_logic_vector(to_unsigned (temp_count, counter_out 'length));

    counter_out_int <= temp_count;


end Behavioral;