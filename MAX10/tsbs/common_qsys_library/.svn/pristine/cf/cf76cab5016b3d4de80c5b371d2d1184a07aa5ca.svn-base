	component tse_w_sfp_2_ic_sfp is
		port (
			clk_10_clk                                             : in  std_logic                      := 'X';             -- clk
			clk_100_clk                                            : in  std_logic                      := 'X';             -- clk
			clk_125_enet_base_in_clk_clk                           : in  std_logic                      := 'X';             -- clk
			clk_50_clk                                             : in  std_logic                      := 'X';             -- clk
			mm_bridge_0_s0_waitrequest                             : out std_logic;                                         -- waitrequest
			mm_bridge_0_s0_readdata                                : out std_logic_vector(31 downto 0);                     -- readdata
			mm_bridge_0_s0_readdatavalid                           : out std_logic;                                         -- readdatavalid
			mm_bridge_0_s0_burstcount                              : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			mm_bridge_0_s0_writedata                               : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			mm_bridge_0_s0_address                                 : in  std_logic_vector(18 downto 0)  := (others => 'X'); -- address
			mm_bridge_0_s0_write                                   : in  std_logic                      := 'X';             -- write
			mm_bridge_0_s0_read                                    : in  std_logic                      := 'X';             -- read
			mm_bridge_0_s0_byteenable                              : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			mm_bridge_0_s0_debugaccess                             : in  std_logic                      := 'X';             -- debugaccess
			reset_100_reset_n                                      : in  std_logic                      := 'X';             -- reset_n
			reset_50_reset_n                                       : in  std_logic                      := 'X';             -- reset_n
			tse_sgdma_rx_csr_irq_irq                               : out std_logic;                                         -- irq
			tse_sgdma_rx_m_write_waitrequest                       : in  std_logic                      := 'X';             -- waitrequest
			tse_sgdma_rx_m_write_address                           : out std_logic_vector(31 downto 0);                     -- address
			tse_sgdma_rx_m_write_write                             : out std_logic;                                         -- write
			tse_sgdma_rx_m_write_writedata                         : out std_logic_vector(31 downto 0);                     -- writedata
			tse_sgdma_rx_m_write_byteenable                        : out std_logic_vector(3 downto 0);                      -- byteenable
			tse_sgdma_tx_csr_irq_irq                               : out std_logic;                                         -- irq
			tse_sgdma_tx_m_read_readdata                           : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- readdata
			tse_sgdma_tx_m_read_readdatavalid                      : in  std_logic                      := 'X';             -- readdatavalid
			tse_sgdma_tx_m_read_waitrequest                        : in  std_logic                      := 'X';             -- waitrequest
			tse_sgdma_tx_m_read_address                            : out std_logic_vector(31 downto 0);                     -- address
			tse_sgdma_tx_m_read_read                               : out std_logic;                                         -- read
			tse_sgdma_tx_out_data                                  : out std_logic_vector(31 downto 0);                     -- data
			tse_sgdma_tx_out_valid                                 : out std_logic;                                         -- valid
			tse_sgdma_tx_out_ready                                 : in  std_logic                      := 'X';             -- ready
			tse_sgdma_tx_out_endofpacket                           : out std_logic;                                         -- endofpacket
			tse_sgdma_tx_out_startofpacket                         : out std_logic;                                         -- startofpacket
			tse_sgdma_tx_out_empty                                 : out std_logic_vector(1 downto 0);                      -- empty
			tse_tse_mac_mac_mdio_connection_mdc                    : out std_logic;                                         -- mdc
			tse_tse_mac_mac_mdio_connection_mdio_in                : in  std_logic                      := 'X';             -- mdio_in
			tse_tse_mac_mac_mdio_connection_mdio_out               : out std_logic;                                         -- mdio_out
			tse_tse_mac_mac_mdio_connection_mdio_oen               : out std_logic;                                         -- mdio_oen
			tse_tse_mac_mac_misc_connection_ff_tx_crc_fwd          : in  std_logic                      := 'X';             -- ff_tx_crc_fwd
			tse_tse_mac_mac_misc_connection_ff_tx_septy            : out std_logic;                                         -- ff_tx_septy
			tse_tse_mac_mac_misc_connection_tx_ff_uflow            : out std_logic;                                         -- tx_ff_uflow
			tse_tse_mac_mac_misc_connection_ff_tx_a_full           : out std_logic;                                         -- ff_tx_a_full
			tse_tse_mac_mac_misc_connection_ff_tx_a_empty          : out std_logic;                                         -- ff_tx_a_empty
			tse_tse_mac_mac_misc_connection_rx_err_stat            : out std_logic_vector(17 downto 0);                     -- rx_err_stat
			tse_tse_mac_mac_misc_connection_rx_frm_type            : out std_logic_vector(3 downto 0);                      -- rx_frm_type
			tse_tse_mac_mac_misc_connection_ff_rx_dsav             : out std_logic;                                         -- ff_rx_dsav
			tse_tse_mac_mac_misc_connection_ff_rx_a_full           : out std_logic;                                         -- ff_rx_a_full
			tse_tse_mac_mac_misc_connection_ff_rx_a_empty          : out std_logic;                                         -- ff_rx_a_empty
			tse_tse_mac_serdes_control_connection_rx_recovclkout   : out std_logic;                                         -- rx_recovclkout
			tse_tse_mac_serdes_control_connection_reconfig_togxb   : in  std_logic_vector(139 downto 0) := (others => 'X'); -- reconfig_togxb
			tse_tse_mac_serdes_control_connection_reconfig_fromgxb : out std_logic_vector(91 downto 0);                     -- reconfig_fromgxb
			tse_tse_mac_serial_connection_rxp                      : in  std_logic                      := 'X';             -- rxp
			tse_tse_mac_serial_connection_txp                      : out std_logic;                                         -- txp
			tse_tse_mac_status_led_connection_crs                  : out std_logic;                                         -- crs
			tse_tse_mac_status_led_connection_link                 : out std_logic;                                         -- link
			tse_tse_mac_status_led_connection_panel_link           : out std_logic;                                         -- panel_link
			tse_tse_mac_status_led_connection_col                  : out std_logic;                                         -- col
			tse_tse_mac_status_led_connection_an                   : out std_logic;                                         -- an
			tse_tse_mac_status_led_connection_char_err             : out std_logic;                                         -- char_err
			tse_tse_mac_status_led_connection_disp_err             : out std_logic;                                         -- disp_err
			tse_tse_mac_transmit_data                              : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			tse_tse_mac_transmit_endofpacket                       : in  std_logic                      := 'X';             -- endofpacket
			tse_tse_mac_transmit_error                             : in  std_logic                      := 'X';             -- error
			tse_tse_mac_transmit_empty                             : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- empty
			tse_tse_mac_transmit_ready                             : out std_logic;                                         -- ready
			tse_tse_mac_transmit_startofpacket                     : in  std_logic                      := 'X';             -- startofpacket
			tse_tse_mac_transmit_valid                             : in  std_logic                      := 'X'              -- valid
		);
	end component tse_w_sfp_2_ic_sfp;

	u0 : component tse_w_sfp_2_ic_sfp
		port map (
			clk_10_clk                                             => CONNECTED_TO_clk_10_clk,                                             --                                clk_10.clk
			clk_100_clk                                            => CONNECTED_TO_clk_100_clk,                                            --                               clk_100.clk
			clk_125_enet_base_in_clk_clk                           => CONNECTED_TO_clk_125_enet_base_in_clk_clk,                           --              clk_125_enet_base_in_clk.clk
			clk_50_clk                                             => CONNECTED_TO_clk_50_clk,                                             --                                clk_50.clk
			mm_bridge_0_s0_waitrequest                             => CONNECTED_TO_mm_bridge_0_s0_waitrequest,                             --                        mm_bridge_0_s0.waitrequest
			mm_bridge_0_s0_readdata                                => CONNECTED_TO_mm_bridge_0_s0_readdata,                                --                                      .readdata
			mm_bridge_0_s0_readdatavalid                           => CONNECTED_TO_mm_bridge_0_s0_readdatavalid,                           --                                      .readdatavalid
			mm_bridge_0_s0_burstcount                              => CONNECTED_TO_mm_bridge_0_s0_burstcount,                              --                                      .burstcount
			mm_bridge_0_s0_writedata                               => CONNECTED_TO_mm_bridge_0_s0_writedata,                               --                                      .writedata
			mm_bridge_0_s0_address                                 => CONNECTED_TO_mm_bridge_0_s0_address,                                 --                                      .address
			mm_bridge_0_s0_write                                   => CONNECTED_TO_mm_bridge_0_s0_write,                                   --                                      .write
			mm_bridge_0_s0_read                                    => CONNECTED_TO_mm_bridge_0_s0_read,                                    --                                      .read
			mm_bridge_0_s0_byteenable                              => CONNECTED_TO_mm_bridge_0_s0_byteenable,                              --                                      .byteenable
			mm_bridge_0_s0_debugaccess                             => CONNECTED_TO_mm_bridge_0_s0_debugaccess,                             --                                      .debugaccess
			reset_100_reset_n                                      => CONNECTED_TO_reset_100_reset_n,                                      --                             reset_100.reset_n
			reset_50_reset_n                                       => CONNECTED_TO_reset_50_reset_n,                                       --                              reset_50.reset_n
			tse_sgdma_rx_csr_irq_irq                               => CONNECTED_TO_tse_sgdma_rx_csr_irq_irq,                               --                  tse_sgdma_rx_csr_irq.irq
			tse_sgdma_rx_m_write_waitrequest                       => CONNECTED_TO_tse_sgdma_rx_m_write_waitrequest,                       --                  tse_sgdma_rx_m_write.waitrequest
			tse_sgdma_rx_m_write_address                           => CONNECTED_TO_tse_sgdma_rx_m_write_address,                           --                                      .address
			tse_sgdma_rx_m_write_write                             => CONNECTED_TO_tse_sgdma_rx_m_write_write,                             --                                      .write
			tse_sgdma_rx_m_write_writedata                         => CONNECTED_TO_tse_sgdma_rx_m_write_writedata,                         --                                      .writedata
			tse_sgdma_rx_m_write_byteenable                        => CONNECTED_TO_tse_sgdma_rx_m_write_byteenable,                        --                                      .byteenable
			tse_sgdma_tx_csr_irq_irq                               => CONNECTED_TO_tse_sgdma_tx_csr_irq_irq,                               --                  tse_sgdma_tx_csr_irq.irq
			tse_sgdma_tx_m_read_readdata                           => CONNECTED_TO_tse_sgdma_tx_m_read_readdata,                           --                   tse_sgdma_tx_m_read.readdata
			tse_sgdma_tx_m_read_readdatavalid                      => CONNECTED_TO_tse_sgdma_tx_m_read_readdatavalid,                      --                                      .readdatavalid
			tse_sgdma_tx_m_read_waitrequest                        => CONNECTED_TO_tse_sgdma_tx_m_read_waitrequest,                        --                                      .waitrequest
			tse_sgdma_tx_m_read_address                            => CONNECTED_TO_tse_sgdma_tx_m_read_address,                            --                                      .address
			tse_sgdma_tx_m_read_read                               => CONNECTED_TO_tse_sgdma_tx_m_read_read,                               --                                      .read
			tse_sgdma_tx_out_data                                  => CONNECTED_TO_tse_sgdma_tx_out_data,                                  --                      tse_sgdma_tx_out.data
			tse_sgdma_tx_out_valid                                 => CONNECTED_TO_tse_sgdma_tx_out_valid,                                 --                                      .valid
			tse_sgdma_tx_out_ready                                 => CONNECTED_TO_tse_sgdma_tx_out_ready,                                 --                                      .ready
			tse_sgdma_tx_out_endofpacket                           => CONNECTED_TO_tse_sgdma_tx_out_endofpacket,                           --                                      .endofpacket
			tse_sgdma_tx_out_startofpacket                         => CONNECTED_TO_tse_sgdma_tx_out_startofpacket,                         --                                      .startofpacket
			tse_sgdma_tx_out_empty                                 => CONNECTED_TO_tse_sgdma_tx_out_empty,                                 --                                      .empty
			tse_tse_mac_mac_mdio_connection_mdc                    => CONNECTED_TO_tse_tse_mac_mac_mdio_connection_mdc,                    --       tse_tse_mac_mac_mdio_connection.mdc
			tse_tse_mac_mac_mdio_connection_mdio_in                => CONNECTED_TO_tse_tse_mac_mac_mdio_connection_mdio_in,                --                                      .mdio_in
			tse_tse_mac_mac_mdio_connection_mdio_out               => CONNECTED_TO_tse_tse_mac_mac_mdio_connection_mdio_out,               --                                      .mdio_out
			tse_tse_mac_mac_mdio_connection_mdio_oen               => CONNECTED_TO_tse_tse_mac_mac_mdio_connection_mdio_oen,               --                                      .mdio_oen
			tse_tse_mac_mac_misc_connection_ff_tx_crc_fwd          => CONNECTED_TO_tse_tse_mac_mac_misc_connection_ff_tx_crc_fwd,          --       tse_tse_mac_mac_misc_connection.ff_tx_crc_fwd
			tse_tse_mac_mac_misc_connection_ff_tx_septy            => CONNECTED_TO_tse_tse_mac_mac_misc_connection_ff_tx_septy,            --                                      .ff_tx_septy
			tse_tse_mac_mac_misc_connection_tx_ff_uflow            => CONNECTED_TO_tse_tse_mac_mac_misc_connection_tx_ff_uflow,            --                                      .tx_ff_uflow
			tse_tse_mac_mac_misc_connection_ff_tx_a_full           => CONNECTED_TO_tse_tse_mac_mac_misc_connection_ff_tx_a_full,           --                                      .ff_tx_a_full
			tse_tse_mac_mac_misc_connection_ff_tx_a_empty          => CONNECTED_TO_tse_tse_mac_mac_misc_connection_ff_tx_a_empty,          --                                      .ff_tx_a_empty
			tse_tse_mac_mac_misc_connection_rx_err_stat            => CONNECTED_TO_tse_tse_mac_mac_misc_connection_rx_err_stat,            --                                      .rx_err_stat
			tse_tse_mac_mac_misc_connection_rx_frm_type            => CONNECTED_TO_tse_tse_mac_mac_misc_connection_rx_frm_type,            --                                      .rx_frm_type
			tse_tse_mac_mac_misc_connection_ff_rx_dsav             => CONNECTED_TO_tse_tse_mac_mac_misc_connection_ff_rx_dsav,             --                                      .ff_rx_dsav
			tse_tse_mac_mac_misc_connection_ff_rx_a_full           => CONNECTED_TO_tse_tse_mac_mac_misc_connection_ff_rx_a_full,           --                                      .ff_rx_a_full
			tse_tse_mac_mac_misc_connection_ff_rx_a_empty          => CONNECTED_TO_tse_tse_mac_mac_misc_connection_ff_rx_a_empty,          --                                      .ff_rx_a_empty
			tse_tse_mac_serdes_control_connection_rx_recovclkout   => CONNECTED_TO_tse_tse_mac_serdes_control_connection_rx_recovclkout,   -- tse_tse_mac_serdes_control_connection.rx_recovclkout
			tse_tse_mac_serdes_control_connection_reconfig_togxb   => CONNECTED_TO_tse_tse_mac_serdes_control_connection_reconfig_togxb,   --                                      .reconfig_togxb
			tse_tse_mac_serdes_control_connection_reconfig_fromgxb => CONNECTED_TO_tse_tse_mac_serdes_control_connection_reconfig_fromgxb, --                                      .reconfig_fromgxb
			tse_tse_mac_serial_connection_rxp                      => CONNECTED_TO_tse_tse_mac_serial_connection_rxp,                      --         tse_tse_mac_serial_connection.rxp
			tse_tse_mac_serial_connection_txp                      => CONNECTED_TO_tse_tse_mac_serial_connection_txp,                      --                                      .txp
			tse_tse_mac_status_led_connection_crs                  => CONNECTED_TO_tse_tse_mac_status_led_connection_crs,                  --     tse_tse_mac_status_led_connection.crs
			tse_tse_mac_status_led_connection_link                 => CONNECTED_TO_tse_tse_mac_status_led_connection_link,                 --                                      .link
			tse_tse_mac_status_led_connection_panel_link           => CONNECTED_TO_tse_tse_mac_status_led_connection_panel_link,           --                                      .panel_link
			tse_tse_mac_status_led_connection_col                  => CONNECTED_TO_tse_tse_mac_status_led_connection_col,                  --                                      .col
			tse_tse_mac_status_led_connection_an                   => CONNECTED_TO_tse_tse_mac_status_led_connection_an,                   --                                      .an
			tse_tse_mac_status_led_connection_char_err             => CONNECTED_TO_tse_tse_mac_status_led_connection_char_err,             --                                      .char_err
			tse_tse_mac_status_led_connection_disp_err             => CONNECTED_TO_tse_tse_mac_status_led_connection_disp_err,             --                                      .disp_err
			tse_tse_mac_transmit_data                              => CONNECTED_TO_tse_tse_mac_transmit_data,                              --                  tse_tse_mac_transmit.data
			tse_tse_mac_transmit_endofpacket                       => CONNECTED_TO_tse_tse_mac_transmit_endofpacket,                       --                                      .endofpacket
			tse_tse_mac_transmit_error                             => CONNECTED_TO_tse_tse_mac_transmit_error,                             --                                      .error
			tse_tse_mac_transmit_empty                             => CONNECTED_TO_tse_tse_mac_transmit_empty,                             --                                      .empty
			tse_tse_mac_transmit_ready                             => CONNECTED_TO_tse_tse_mac_transmit_ready,                             --                                      .ready
			tse_tse_mac_transmit_startofpacket                     => CONNECTED_TO_tse_tse_mac_transmit_startofpacket,                     --                                      .startofpacket
			tse_tse_mac_transmit_valid                             => CONNECTED_TO_tse_tse_mac_transmit_valid                              --                                      .valid
		);

