-- Testbench de Main
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main_tb is
end main_tb;

architecture behavior of main_tb is
    -- Señales de entrada
    signal clk100Mhz_tb : std_logic := '0';
    signal UP_IN_tb, DOP_IN_tb, CP_IN_tb, DP_IN_tb, RST_IN_tb, CONF_COMPRA_IN_tb : std_logic := '0';
    signal PRODUCT_IN_tb : std_logic_vector(4 downto 0) := "00000";
    
    -- Otras señales necesarias para el Testbench
    signal seg_display_tb : std_logic_vector(6 downto 0);
    signal select_display_tb : std_logic_vector(3 downto 0);
    signal LEDS_tb : STD_LOGIC_VECTOR (15 downto 0);
    
    -- Instancia del componente principal
    component main
        Port ( 
                clk100Mhz : in std_logic;
                UP_IN : in std_logic;
                DOP_IN : in std_logic;
                CP_IN : in std_logic;
                DP_IN : in std_logic;
                RST_IN : in std_logic;
                CONF_COMPRA_IN : in std_logic;
                PRODUCT_IN : in std_logic_vector (4 downto 0);
                seg_display : out std_logic_vector(6 downto 0);
                select_display : out std_logic_vector(3 downto 0);
                LEDS : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

begin
    -- Instanciar el componente principal
    uut: main port map (
        clk100Mhz => clk100Mhz_tb,
        UP_IN => UP_IN_tb,
        DOP_IN => DOP_IN_tb,
        CP_IN => CP_IN_tb,
        DP_IN => DP_IN_tb,
        RST_IN => RST_IN_tb,
        CONF_COMPRA_IN => CONF_COMPRA_IN_tb,
        PRODUCT_IN => PRODUCT_IN_tb,
        seg_display => seg_display_tb,
        select_display => select_display_tb,
        LEDS => LEDS_tb
    );

    -- Proceso para generar el reloj
    Clk : process
    begin
        wait for 1 ns; -- Ajustar según la frecuencia deseada
        clk100Mhz_tb <= not clk100Mhz_tb;
    end process;

    -- Proceso de prueba (Ejemplo: Ingresar una moneda, escoger un producto y confirmar la compra)
    process
    begin
        UP_IN_tb <= '1';
        wait for 5 ns;
        UP_IN_tb <= '0';
        wait for 5 ns;
        DOP_IN_tb <= '1';
        wait for 5 ns;
        DOP_IN_tb <= '0';
        wait for 5 ns;
        CP_IN_tb <= '1';
        wait for 5 ns;
        CP_IN_tb <= '0';
        wait for 5 ns;
        DP_IN_tb <= '1';
        wait for 5 ns;
        DP_IN_tb <= '0';
        wait for 5 ns;
        PRODUCT_IN_tb <= "00010";
        wait for 20 ns;
       	CONF_COMPRA_IN_tb <= '1';
        wait for 10 ns;
        UP_IN_tb <= '0';
        wait for 5 ns;
        UP_IN_tb <= '0';
        wait for 5 ns;
        DOP_IN_tb <= '1';
        wait for 5 ns;
        DOP_IN_tb <= '0';
        wait for 5 ns;
        CP_IN_tb <= '1';
        wait for 5 ns;
        CP_IN_tb <= '0';
        wait for 5 ns;
        DP_IN_tb <= '0';
        wait for 5 ns;
        DP_IN_tb <= '0';
        wait for 5 ns;
        PRODUCT_IN_tb <= "00001";
        wait for 20 ns;
       	CONF_COMPRA_IN_tb <= '0';
        wait for 10 ns;
        UP_IN_tb <= '1';
        wait for 5 ns;
        UP_IN_tb <= '0';
        wait for 5 ns;
        DOP_IN_tb <= '1';
        wait for 5 ns;
        DOP_IN_tb <= '0';
        wait for 5 ns;
        DOP_IN_tb <= '1';
        wait for 5 ns;
        DOP_IN_tb <= '0';
        wait for 5 ns;
        CP_IN_tb <= '0';
        wait for 5 ns;
        CP_IN_tb <= '0';
        wait for 5 ns;
        DP_IN_tb <= '0';
        wait for 5 ns;
        DP_IN_tb <= '0';
        wait for 5 ns;
        PRODUCT_IN_tb <= "10000";
        wait for 20 ns;
       	CONF_COMPRA_IN_tb <= '0';
        wait for 10 ns;
        UP_IN_tb <= '1';
        wait for 5 ns;
        UP_IN_tb <= '0';
        wait for 5 ns;
        DOP_IN_tb <= '1';
        wait for 5 ns;
        DOP_IN_tb <= '0';
        wait for 5 ns;
        CP_IN_tb <= '0';
        wait for 5 ns;
        CP_IN_tb <= '0';
        wait for 5 ns;
        DP_IN_tb <= '0';
        wait for 5 ns;
        DP_IN_tb <= '0';
        wait for 5 ns;
        PRODUCT_IN_tb <= "10000";
        wait for 20 ns;
       	CONF_COMPRA_IN_tb <= '1';
        wait for 10 ns;
        UP_IN_tb <= '1';
        wait for 5 ns;
        UP_IN_tb <= '0';
        wait for 5 ns;
        DOP_IN_tb <= '1';
        wait for 5 ns;
        DOP_IN_tb <= '0';
        wait for 5 ns;
        CP_IN_tb <= '0';
        wait for 5 ns;
        CP_IN_tb <= '0';
        wait for 5 ns;
        DP_IN_tb <= '0';
        wait for 5 ns;
        DP_IN_tb <= '0';
        wait for 5 ns;
        PRODUCT_IN_tb <= "10110";
        wait for 20 ns;
       	CONF_COMPRA_IN_tb <= '1';
        wait for 10 ns;
        
        -- Run Time: 1000 ns
	
        
    end process;

    -- Agregar más procesos de estimulación según sea necesario

end behavior;
