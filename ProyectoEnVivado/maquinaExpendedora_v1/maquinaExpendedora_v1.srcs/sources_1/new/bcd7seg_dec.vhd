-- Decimal a display 7 segmentos de las decenas
library ieee;
use ieee.std_logic_1164.all;

entity bcd7seg_dec is
Port ( 
        decenas: integer range 0 to 9;
        segmentos_dec : out std_logic_vector (6 downto 0)
);
end bcd7seg_dec;

architecture Behavioral of bcd7seg_dec is
begin
    process (decenas)
        variable segmentos : std_logic_vector (6 downto 0);
        begin
        case decenas is 
        --Patron de Anodo comun de 7 segmentos
                            --g f e d c b a
            when 0 => segmentos := "1000000";
            when 1 => segmentos := "1111001";
            when 2 => segmentos := "0100100";
            when 3 => segmentos := "0110000";
            when 4 => segmentos := "0011001";
            when 5 => segmentos := "0010010";
            when 6 => segmentos := "0000010";
            when 7 => segmentos := "1111000";
            when 8 => segmentos := "0000000";
            when 9 => segmentos := "0010000";
            when others => segmentos := "1111111";
        end case;
       
        --Bits de arreglo a las terminales de salida
        segmentos_dec(0) <= segmentos (0);
        segmentos_dec(1) <= segmentos (1);
        segmentos_dec(2) <= segmentos (2);
        segmentos_dec(3) <= segmentos (3);
        segmentos_dec(4) <= segmentos (4);
        segmentos_dec(5) <= segmentos (5);
        segmentos_dec(6) <= segmentos (6);
    end process;
end Behavioral;
