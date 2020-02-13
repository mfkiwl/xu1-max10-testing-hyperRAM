	component basic_processor_support is
		port (
			peripheral_clk_clk            : in  std_logic                     := 'X';             -- clk
			hires_timer_irq_irq           : out std_logic;                                        -- irq
			pio_button_export             : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			pio_button_irq_irq            : out std_logic;                                        -- irq
			pio_dips_export               : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			pio_leds_export               : out std_logic_vector(8 downto 0);                     -- export
			reset_peripheral_clk_reset_n  : in  std_logic                     := 'X';             -- reset_n
			jtag_uart_irq_irq             : out std_logic;                                        -- irq
			timer_irq_irq                 : out std_logic;                                        -- irq
			nios_clk_clk                  : in  std_logic                     := 'X';             -- clk
			reset_nios_clk_reset_n        : in  std_logic                     := 'X';             -- reset_n
			avalon_mm_slave_waitrequest   : out std_logic;                                        -- waitrequest
			avalon_mm_slave_readdata      : out std_logic_vector(31 downto 0);                    -- readdata
			avalon_mm_slave_readdatavalid : out std_logic;                                        -- readdatavalid
			avalon_mm_slave_burstcount    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- burstcount
			avalon_mm_slave_writedata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avalon_mm_slave_address       : in  std_logic_vector(6 downto 0)  := (others => 'X'); -- address
			avalon_mm_slave_write         : in  std_logic                     := 'X';             -- write
			avalon_mm_slave_read          : in  std_logic                     := 'X';             -- read
			avalon_mm_slave_byteenable    : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			avalon_mm_slave_debugaccess   : in  std_logic                     := 'X'              -- debugaccess
		);
	end component basic_processor_support;

	u0 : component basic_processor_support
		port map (
			peripheral_clk_clk            => CONNECTED_TO_peripheral_clk_clk,            --       peripheral_clk.clk
			hires_timer_irq_irq           => CONNECTED_TO_hires_timer_irq_irq,           --      hires_timer_irq.irq
			pio_button_export             => CONNECTED_TO_pio_button_export,             --           pio_button.export
			pio_button_irq_irq            => CONNECTED_TO_pio_button_irq_irq,            --       pio_button_irq.irq
			pio_dips_export               => CONNECTED_TO_pio_dips_export,               --             pio_dips.export
			pio_leds_export               => CONNECTED_TO_pio_leds_export,               --             pio_leds.export
			reset_peripheral_clk_reset_n  => CONNECTED_TO_reset_peripheral_clk_reset_n,  -- reset_peripheral_clk.reset_n
			jtag_uart_irq_irq             => CONNECTED_TO_jtag_uart_irq_irq,             --        jtag_uart_irq.irq
			timer_irq_irq                 => CONNECTED_TO_timer_irq_irq,                 --            timer_irq.irq
			nios_clk_clk                  => CONNECTED_TO_nios_clk_clk,                  --             nios_clk.clk
			reset_nios_clk_reset_n        => CONNECTED_TO_reset_nios_clk_reset_n,        --       reset_nios_clk.reset_n
			avalon_mm_slave_waitrequest   => CONNECTED_TO_avalon_mm_slave_waitrequest,   --      avalon_mm_slave.waitrequest
			avalon_mm_slave_readdata      => CONNECTED_TO_avalon_mm_slave_readdata,      --                     .readdata
			avalon_mm_slave_readdatavalid => CONNECTED_TO_avalon_mm_slave_readdatavalid, --                     .readdatavalid
			avalon_mm_slave_burstcount    => CONNECTED_TO_avalon_mm_slave_burstcount,    --                     .burstcount
			avalon_mm_slave_writedata     => CONNECTED_TO_avalon_mm_slave_writedata,     --                     .writedata
			avalon_mm_slave_address       => CONNECTED_TO_avalon_mm_slave_address,       --                     .address
			avalon_mm_slave_write         => CONNECTED_TO_avalon_mm_slave_write,         --                     .write
			avalon_mm_slave_read          => CONNECTED_TO_avalon_mm_slave_read,          --                     .read
			avalon_mm_slave_byteenable    => CONNECTED_TO_avalon_mm_slave_byteenable,    --                     .byteenable
			avalon_mm_slave_debugaccess   => CONNECTED_TO_avalon_mm_slave_debugaccess    --                     .debugaccess
		);

