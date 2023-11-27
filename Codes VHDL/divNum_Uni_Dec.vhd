-- Dividir numero en decenas y unidades y mostrarlo en dos displays de 7 segmentos
library ieee;
use ieee.std_logic_1164.all;

entity divNum_Uni_Dec is
Port ( 
        Numero : in integer range 0 to 99;
        segmentos_uni_out : out std_logic_vector (6 downto 0);
        segmentos_dec_out : out std_logic_vector (6 downto 0)
);
end divNum_Uni_Dec;

architecture Behavioral of divNum_Uni_Dec is
-----------------------------------------------------------------------------------
signal sign_Uninades : integer range 0 to 9;
signal sign_Decenas : integer range 0 to 9;

component bcd7seg_uni is
    port (
        unidades: integer range 0 to 9;
        segmentos_uni : out std_logic_vector (6 downto 0)
    );
end component;

component bcd7seg_dec is
    port ( 
        decenas: integer range 0 to 9;
        segmentos_dec : out std_logic_vector (6 downto 0)
    );
end component;
-----------------------------------------------------------------------------------
begin    
    process (Numero)
    begin
        if Numero = 0 then 
            sign_Uninades <= 0;
            sign_Decenas <= 0;
        else 
            sign_Uninades <= Numero mod 10;
            sign_Decenas <= (Numero mod 100) / 10;
        end if;
    end process;

    obtener_unidades : bcd7seg_uni port map(
        unidades => sign_Uninades,
        segmentos_uni => segmentos_uni_out
    );
    
    obtener_decenas : bcd7seg_dec port map(
        decenas => sign_Decenas,
        segmentos_dec => segmentos_dec_out
    );

end Behavioral;