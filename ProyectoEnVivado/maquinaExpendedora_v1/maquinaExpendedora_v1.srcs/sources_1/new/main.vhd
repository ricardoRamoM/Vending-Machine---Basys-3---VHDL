-- MAIN Maquina expendedora
library ieee;
use ieee.std_logic_1164.all;

entity main is
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
    
            LEDS : out std_logic_vector (15 downto 0)               
    );
end main;
-------------------------------------------------------ARQUITECTURA-------------------------------------------------------------------------
architecture arq_main of main is
-------------------------------------------------- signals -----------------------------------------

signal sign_clk10hz: std_logic;
signal sign_clk1000hz: std_logic;

signal sign_segmentos_uni_dinero : std_logic_vector (6 downto 0);
signal sign_segmentos_dec_dinero : std_logic_vector (6 downto 0);
signal sign_segmentos_uni_cambio : std_logic_vector (6 downto 0);
signal sign_segmentos_dec_cambio : std_logic_vector (6 downto 0);
signal sign_segmentos_uni_precio : std_logic_vector (6 downto 0);
signal sign_segmentos_dec_precio : std_logic_vector (6 downto 0);
signal sign_segmentos_letra : std_logic_vector (6 downto 0) :=  "1000110";

signal sign_RecibeDinero : std_logic;
signal sign_DineroRecibido : integer range 0 to 99; 
signal sign_CambioDado : integer range 0 to 99; 

signal sign_product_selected : std_logic;
signal sign_product_precio : integer;

signal UP_IN_SIN_REB : std_logic;
signal DOP_IN_SIN_REB : std_logic;
signal CP_IN_SIN_REB : std_logic;
signal DP_IN_SIN_REB : std_logic;
signal RST_IN_SIN_REB : std_logic;
signal CONF_COMPRA_IN_SIN_REB : std_logic;

signal signal_Dispensar_out : std_logic;
signal signal_Dar_cambio_out : std_logic;

-------------------------------------------------components---------------------------------
component div_freq is
    generic( max_conteo : integer);
    -- 100 MHz (clk de fpga) / 10 Hz (freq requerida) = (conteo Maximo)
   
    -- 1 ciclo por segundo 1 Hz --1 hz
    -- 100 MHz / 1 Hz = 100 000 000
    --conteo_max = 100000000;
    
    -- 500 ciclos por seg o 1 ciclo cada 2 ms -- 500 hz
    -- 100 MHz / 500 Hz = 200 000 
    -- conteo max de 200000
  
    -- 4 ciclos por seg o 1 ciclo cada 0.25 s -- 4 hz
    -- 100 MHz / 4 Hz = 25 000 000
    -- conteo max de 25000000
    port (
        clkOriginal : in std_logic;
        reset : in std_logic;
        clkDividido : out std_logic
    );
end component;

component debouncer is
    port ( 
        clk_100MHz : in std_logic; 
        btn_in : in std_logic;
        btn_out : out std_logic;
        btn_pulsed : out std_logic
    );
end component;

component divNum_Uni_Dec is
    port ( 
        Numero : in integer range 0 to 99;
        segmentos_uni_out : out std_logic_vector (6 downto 0);
        segmentos_dec_out : out std_logic_vector (6 downto 0)
    );
end component;

component suma_dinero is
    port(        
        clk_100mhz : in std_logic;
           
        UP_IN : in std_logic;
    	DOP_IN : in std_logic;
        CP_IN : in std_logic;
        DP_IN : in std_logic;
        RST_IN : in std_logic;
        Entregar_dinero: in std_logic;
        
        DineroReci: out integer range 0 to 99;
        RecibeDinero: out std_logic 
    );
end component;



component demux_display is
    port (
        clk1000hz: 	    in std_logic;  
        Confirmar_compra_IN : in std_logic; 
        segmentos_uni_dinero : in std_logic_vector (6 downto 0);
        segmentos_dec_dinero : in std_logic_vector (6 downto 0);
        segmentos_uni_cambio : in std_logic_vector (6 downto 0);
        segmentos_dec_cambio : in std_logic_vector (6 downto 0);
        segmentos_uni_precio : in std_logic_vector (6 downto 0);
        segmentos_dec_precio : in std_logic_vector (6 downto 0);
        segmentos_letra : in std_logic_vector (6 downto 0);
        display: 	    out std_logic_vector(6 downto 0);
        curr_display:   out std_logic_vector(3 downto 0)
    );
end component;

component seleccionar_producto is
    port ( 
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
end component;

component estados_dispensador is
    port ( 
        clk: in std_logic;
        rst: in std_logic;
        productoSelected : in std_logic;
        confirmarProductoSelected : in std_logic;
        precioProducto: in integer;
        dineroRecibido: in integer;
        Dispensar: out std_logic;
        Dar_cambio: out std_logic
    );
end component;

component mostrar_dispensar_leds is
Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    Dispensar_IN : in STD_LOGIC;    
    Confirmar_compra_IN : std_logic; 
    LEDS : out STD_LOGIC_VECTOR (15 downto 0)
);
end component;

component obtener_cambio is
Port ( 
    Confirmar : in std_logic;
    dineroAcumulado : in integer;
    precioProducto : in integer;
    valor_del_cambio : out integer
);
end component;

-------------------------------------------BEGIN ARQUITECTURA---------------------------------------------
begin
    ----------------- Divisores de frecuencia
    clk_10Hz:  div_freq    
    -- contador 10 Hz. conteoMax= 10000000 
                generic map( max_conteo => 10000000)
                port map(
                    clkOriginal => clk100Mhz,
                    reset => RST_IN,
                    clkDividido  => sign_clk10hz
    ); 
    
    clk_1000Hz:  div_freq 
    -- contador 1000 Hz. conteoMax= 100000. T=0.001=1ms . Cada 2 ms  cambia 
                generic map( max_conteo => 100000)
                port map(
                    clkOriginal => clk100Mhz,
                    reset => RST_IN,
                    clkDividido  => sign_clk1000hz
    ); 
    
    ----------------- Botones sin rebote
    UP_btn: debouncer    port map (
            clk_100MHz => clk100Mhz,
            btn_in => UP_IN,
            btn_pulsed => UP_IN_SIN_REB --out
    );
     
    DOP_btn: debouncer    port map (
            clk_100MHz => clk100Mhz,
            btn_in => DOP_IN,
            btn_pulsed => DOP_IN_SIN_REB --out
    );
    CP_btn: debouncer    port map (
            clk_100MHz => clk100Mhz,
            btn_in => CP_IN,
            btn_pulsed => CP_IN_SIN_REB --out
    );
    DP_btn: debouncer    port map (
            clk_100MHz => clk100Mhz,
            btn_in => DP_IN,
            btn_pulsed => DP_IN_SIN_REB --out
    );
    RST_btn: debouncer    port map (
            clk_100MHz => clk100Mhz,
            btn_in => RST_IN,
            btn_pulsed => RST_IN_SIN_REB --out
    );    
    confirmarCompra_btn: debouncer port map (
            clk_100MHz => clk100Mhz,
            btn_in => CONF_COMPRA_IN,
            btn_pulsed => CONF_COMPRA_IN_SIN_REB
    );
    
    ----------------- 
    sumar_monedas: suma_dinero port map(
            clk_100mhz  => clk100Mhz, -- clk
        
            UP_IN => UP_IN_SIN_REB,
    	    DOP_IN => DOP_IN_SIN_REB,
            CP_IN => CP_IN_SIN_REB,
            DP_IN => DP_IN_SIN_REB,
            RST_IN => RST_IN_SIN_REB,            
            Entregar_dinero => CONF_COMPRA_IN, --CONF_COMPRA_IN_SIN_REB
            
            DineroReci => sign_DineroRecibido,
            RecibeDinero => sign_RecibeDinero        
    );
    
    DineroIngresado: divNum_Uni_Dec port map(
                    --muestra en dos displays el Dinero ingresado
                    Numero => sign_DineroRecibido,
                    segmentos_uni_out => sign_segmentos_uni_dinero,
                    segmentos_dec_out => sign_segmentos_dec_dinero                    
    );
    
    select_prod: seleccionar_producto port map ( 
        clk => clk100Mhz,
        rst => RST_IN_SIN_REB,
        PRODUCT_1 => PRODUCT_IN(0),
        PRODUCT_2 => PRODUCT_IN(1),
        PRODUCT_3 => PRODUCT_IN(2),
        PRODUCT_4 => PRODUCT_IN(3),
        PRODUCT_5 => PRODUCT_IN(4),
        CONFIRMAR_COMPRA => CONF_COMPRA_IN,--CONF_COMPRA_IN_SIN_REB
        producto_selected => sign_product_selected,
        precio_producto => sign_product_precio
    );
    precio_productoSel: divNum_Uni_Dec port map(
                    --muestra en dos displays el precio del producto
                    Numero => sign_product_precio,
                    segmentos_uni_out => sign_segmentos_uni_precio,
                    segmentos_dec_out => sign_segmentos_dec_precio                    
    );
    
    disp_producto1: estados_dispensador port map(
       clk => clk100Mhz,
       rst => RST_IN_SIN_REB,
       productoSelected => sign_product_selected,
       confirmarProductoSelected => CONF_COMPRA_IN_SIN_REB,
       precioProducto => sign_product_precio,
       dineroRecibido => sign_DineroRecibido,
       Dispensar => signal_Dispensar_out,
       Dar_cambio => signal_Dar_cambio_out
    );
    dar_cambio : obtener_cambio port map( 
        Confirmar => CONF_COMPRA_IN_SIN_REB,
        dineroAcumulado => sign_DineroRecibido,
        precioProducto => sign_product_precio,
        valor_del_cambio => sign_CambioDado
    );
    
    Cambio_dado: divNum_Uni_Dec port map( 
                    --muestra en dos displays el cambio dado
                    Numero => sign_CambioDado,
                    segmentos_uni_out => sign_segmentos_uni_cambio,
                    segmentos_dec_out => sign_segmentos_dec_cambio                    
    );
    

            
    salida_display: demux_display port map(
                    clk1000hz => sign_clk1000hz,
                    Confirmar_compra_IN => CONF_COMPRA_IN,
                    segmentos_uni_dinero => sign_segmentos_uni_dinero,
                    segmentos_dec_dinero => sign_segmentos_dec_dinero,
                    segmentos_uni_cambio => sign_segmentos_uni_cambio,
                    segmentos_dec_cambio => sign_segmentos_dec_cambio,
                    segmentos_uni_precio => sign_segmentos_uni_precio,
                    segmentos_dec_precio => sign_segmentos_dec_precio,
                    segmentos_letra => sign_segmentos_letra,
                    display => seg_display,
                    curr_display => select_display
    );

    encender_Leds : mostrar_dispensar_leds
            port map (
            --necesita 10hz
                clk => sign_clk10hz,
                reset => RST_IN_SIN_REB,
                Dispensar_IN => signal_Dispensar_out,
                Confirmar_compra_IN => CONF_COMPRA_IN,
                LEDS => LEDS 
            );    

end arq_main;