	component opencores_spi_standalone is
		port (
			avalon_mm_slave_address               : in  std_logic_vector(31 downto 0) := (others => 'X'); -- address
			avalon_mm_slave_read                  : in  std_logic                     := 'X';             -- read
			avalon_mm_slave_readdata              : out std_logic_vector(31 downto 0);                    -- readdata
			avalon_mm_slave_write                 : in  std_logic                     := 'X';             -- write
			avalon_mm_slave_writedata             : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avalon_mm_slave_waitrequest           : out std_logic;                                        -- waitrequest
			clk_clk                               : in  std_logic                     := 'X';             -- clk
			opencores_spi_miso_pad_i              : in  std_logic                     := 'X';             -- miso_pad_i
			opencores_spi_mosi_pad_o              : out std_logic;                                        -- mosi_pad_o
			opencores_spi_sclk_pad_o              : out std_logic;                                        -- sclk_pad_o
			opencores_spi_ss_pad_o                : out std_logic_vector(7 downto 0);                     -- ss_pad_o
			opencores_spi_tx_bit_pos              : out std_logic_vector(7 downto 0);                     -- tx_bit_pos
			opencores_spi_rx_bit_pos              : out std_logic_vector(7 downto 0);                     -- rx_bit_pos
			opencores_spi_cnt                     : out std_logic_vector(7 downto 0);                     -- cnt
			opencores_spi_wb_err_o                : out std_logic;                                        -- wb_err_o
			opencores_spi_wb_cyc_i                : in  std_logic                     := 'X';             -- wb_cyc_i
			opencores_spi_currently_active_export : out std_logic;                                        -- export
			opencores_spi_debug_wb_clk_i          : out std_logic;                                        -- wb_clk_i
			opencores_spi_debug_wb_rst_i          : out std_logic;                                        -- wb_rst_i
			opencores_spi_debug_wb_adr_i          : out std_logic_vector(4 downto 0);                     -- wb_adr_i
			opencores_spi_debug_wb_dat_i          : out std_logic_vector(31 downto 0);                    -- wb_dat_i
			opencores_spi_debug_wb_dat_o          : out std_logic_vector(31 downto 0);                    -- wb_dat_o
			opencores_spi_debug_wb_sel_i          : out std_logic_vector(3 downto 0);                     -- wb_sel_i
			opencores_spi_debug_wb_we_i           : out std_logic;                                        -- wb_we_i
			opencores_spi_debug_wb_stb_i          : out std_logic;                                        -- wb_stb_i
			opencores_spi_debug_wb_cyc_i          : out std_logic;                                        -- wb_cyc_i
			opencores_spi_debug_wb_ack_o          : out std_logic;                                        -- wb_ack_o
			opencores_spi_debug_wb_err_o          : out std_logic;                                        -- wb_err_o
			opencores_spi_debug_wb_int_o          : out std_logic;                                        -- wb_int_o
			opencores_spi_debug_divider           : out std_logic_vector(15 downto 0);                    -- divider
			opencores_spi_debug_ctrl              : out std_logic_vector(13 downto 0);                    -- ctrl
			opencores_spi_debug_ss                : out std_logic_vector(7 downto 0);                     -- ss
			opencores_spi_debug_wb_dat            : out std_logic_vector(31 downto 0);                    -- wb_dat
			opencores_spi_debug_tag_word_in       : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tag_word_in
			opencores_spi_debug_tag_word_out      : out std_logic_vector(7 downto 0);                     -- tag_word_out
			opencores_spi_debug_tag_word_export   : out std_logic_vector(7 downto 0);                     -- export
			opencores_spi_interrupt_sender_irq    : out std_logic;                                        -- irq
			opencores_spi_manual_reset_out_export : out std_logic_vector(7 downto 0);                     -- export
			opencores_spi_sdio_helper_export      : out std_logic_vector(7 downto 0);                     -- export
			reset_reset_n                         : in  std_logic                     := 'X';             -- reset_n
			opencores_spi_aux_control_out_export  : out std_logic_vector(31 downto 0);                    -- export
			opencores_spi_aux_control_in_export   : in  std_logic_vector(31 downto 0) := (others => 'X')  -- export
		);
	end component opencores_spi_standalone;

	u0 : component opencores_spi_standalone
		port map (
			avalon_mm_slave_address               => CONNECTED_TO_avalon_mm_slave_address,               --                avalon_mm_slave.address
			avalon_mm_slave_read                  => CONNECTED_TO_avalon_mm_slave_read,                  --                               .read
			avalon_mm_slave_readdata              => CONNECTED_TO_avalon_mm_slave_readdata,              --                               .readdata
			avalon_mm_slave_write                 => CONNECTED_TO_avalon_mm_slave_write,                 --                               .write
			avalon_mm_slave_writedata             => CONNECTED_TO_avalon_mm_slave_writedata,             --                               .writedata
			avalon_mm_slave_waitrequest           => CONNECTED_TO_avalon_mm_slave_waitrequest,           --                               .waitrequest
			clk_clk                               => CONNECTED_TO_clk_clk,                               --                            clk.clk
			opencores_spi_miso_pad_i              => CONNECTED_TO_opencores_spi_miso_pad_i,              --                  opencores_spi.miso_pad_i
			opencores_spi_mosi_pad_o              => CONNECTED_TO_opencores_spi_mosi_pad_o,              --                               .mosi_pad_o
			opencores_spi_sclk_pad_o              => CONNECTED_TO_opencores_spi_sclk_pad_o,              --                               .sclk_pad_o
			opencores_spi_ss_pad_o                => CONNECTED_TO_opencores_spi_ss_pad_o,                --                               .ss_pad_o
			opencores_spi_tx_bit_pos              => CONNECTED_TO_opencores_spi_tx_bit_pos,              --                               .tx_bit_pos
			opencores_spi_rx_bit_pos              => CONNECTED_TO_opencores_spi_rx_bit_pos,              --                               .rx_bit_pos
			opencores_spi_cnt                     => CONNECTED_TO_opencores_spi_cnt,                     --                               .cnt
			opencores_spi_wb_err_o                => CONNECTED_TO_opencores_spi_wb_err_o,                --                               .wb_err_o
			opencores_spi_wb_cyc_i                => CONNECTED_TO_opencores_spi_wb_cyc_i,                --                               .wb_cyc_i
			opencores_spi_currently_active_export => CONNECTED_TO_opencores_spi_currently_active_export, -- opencores_spi_currently_active.export
			opencores_spi_debug_wb_clk_i          => CONNECTED_TO_opencores_spi_debug_wb_clk_i,          --            opencores_spi_debug.wb_clk_i
			opencores_spi_debug_wb_rst_i          => CONNECTED_TO_opencores_spi_debug_wb_rst_i,          --                               .wb_rst_i
			opencores_spi_debug_wb_adr_i          => CONNECTED_TO_opencores_spi_debug_wb_adr_i,          --                               .wb_adr_i
			opencores_spi_debug_wb_dat_i          => CONNECTED_TO_opencores_spi_debug_wb_dat_i,          --                               .wb_dat_i
			opencores_spi_debug_wb_dat_o          => CONNECTED_TO_opencores_spi_debug_wb_dat_o,          --                               .wb_dat_o
			opencores_spi_debug_wb_sel_i          => CONNECTED_TO_opencores_spi_debug_wb_sel_i,          --                               .wb_sel_i
			opencores_spi_debug_wb_we_i           => CONNECTED_TO_opencores_spi_debug_wb_we_i,           --                               .wb_we_i
			opencores_spi_debug_wb_stb_i          => CONNECTED_TO_opencores_spi_debug_wb_stb_i,          --                               .wb_stb_i
			opencores_spi_debug_wb_cyc_i          => CONNECTED_TO_opencores_spi_debug_wb_cyc_i,          --                               .wb_cyc_i
			opencores_spi_debug_wb_ack_o          => CONNECTED_TO_opencores_spi_debug_wb_ack_o,          --                               .wb_ack_o
			opencores_spi_debug_wb_err_o          => CONNECTED_TO_opencores_spi_debug_wb_err_o,          --                               .wb_err_o
			opencores_spi_debug_wb_int_o          => CONNECTED_TO_opencores_spi_debug_wb_int_o,          --                               .wb_int_o
			opencores_spi_debug_divider           => CONNECTED_TO_opencores_spi_debug_divider,           --                               .divider
			opencores_spi_debug_ctrl              => CONNECTED_TO_opencores_spi_debug_ctrl,              --                               .ctrl
			opencores_spi_debug_ss                => CONNECTED_TO_opencores_spi_debug_ss,                --                               .ss
			opencores_spi_debug_wb_dat            => CONNECTED_TO_opencores_spi_debug_wb_dat,            --                               .wb_dat
			opencores_spi_debug_tag_word_in       => CONNECTED_TO_opencores_spi_debug_tag_word_in,       --                               .tag_word_in
			opencores_spi_debug_tag_word_out      => CONNECTED_TO_opencores_spi_debug_tag_word_out,      --                               .tag_word_out
			opencores_spi_debug_tag_word_export   => CONNECTED_TO_opencores_spi_debug_tag_word_export,   --   opencores_spi_debug_tag_word.export
			opencores_spi_interrupt_sender_irq    => CONNECTED_TO_opencores_spi_interrupt_sender_irq,    -- opencores_spi_interrupt_sender.irq
			opencores_spi_manual_reset_out_export => CONNECTED_TO_opencores_spi_manual_reset_out_export, -- opencores_spi_manual_reset_out.export
			opencores_spi_sdio_helper_export      => CONNECTED_TO_opencores_spi_sdio_helper_export,      --      opencores_spi_sdio_helper.export
			reset_reset_n                         => CONNECTED_TO_reset_reset_n,                         --                          reset.reset_n
			opencores_spi_aux_control_out_export  => CONNECTED_TO_opencores_spi_aux_control_out_export,  --  opencores_spi_aux_control_out.export
			opencores_spi_aux_control_in_export   => CONNECTED_TO_opencores_spi_aux_control_in_export    --   opencores_spi_aux_control_in.export
		);

