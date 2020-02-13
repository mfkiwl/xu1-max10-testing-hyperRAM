	component tse_w_sgdma is
		port (
			avalon_slave_waitrequest                      : out std_logic;                                        -- waitrequest
			avalon_slave_readdata                         : out std_logic_vector(31 downto 0);                    -- readdata
			avalon_slave_readdatavalid                    : out std_logic;                                        -- readdatavalid
			avalon_slave_burstcount                       : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- burstcount
			avalon_slave_writedata                        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avalon_slave_address                          : in  std_logic_vector(12 downto 0) := (others => 'X'); -- address
			avalon_slave_write                            : in  std_logic                     := 'X';             -- write
			avalon_slave_read                             : in  std_logic                     := 'X';             -- read
			avalon_slave_byteenable                       : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			avalon_slave_debugaccess                      : in  std_logic                     := 'X';             -- debugaccess
			clk_10_clk                                    : in  std_logic                     := 'X';             -- clk
			clk_100_clk                                   : in  std_logic                     := 'X';             -- clk
			clk_50_clk                                    : in  std_logic                     := 'X';             -- clk
			reset_100_reset_n                             : in  std_logic                     := 'X';             -- reset_n
			reset_50_reset_n                              : in  std_logic                     := 'X';             -- reset_n
			sgdma_rx_csr_irq_irq                          : out std_logic;                                        -- irq
			sgdma_rx_m_write_waitrequest                  : in  std_logic                     := 'X';             -- waitrequest
			sgdma_rx_m_write_address                      : out std_logic_vector(31 downto 0);                    -- address
			sgdma_rx_m_write_write                        : out std_logic;                                        -- write
			sgdma_rx_m_write_writedata                    : out std_logic_vector(31 downto 0);                    -- writedata
			sgdma_rx_m_write_byteenable                   : out std_logic_vector(3 downto 0);                     -- byteenable
			sgdma_tx_csr_irq_irq                          : out std_logic;                                        -- irq
			sgdma_tx_m_read_readdata                      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			sgdma_tx_m_read_readdatavalid                 : in  std_logic                     := 'X';             -- readdatavalid
			sgdma_tx_m_read_waitrequest                   : in  std_logic                     := 'X';             -- waitrequest
			sgdma_tx_m_read_address                       : out std_logic_vector(31 downto 0);                    -- address
			sgdma_tx_m_read_read                          : out std_logic;                                        -- read
			sgdma_tx_out_data                             : out std_logic_vector(31 downto 0);                    -- data
			sgdma_tx_out_valid                            : out std_logic;                                        -- valid
			sgdma_tx_out_ready                            : in  std_logic                     := 'X';             -- ready
			sgdma_tx_out_endofpacket                      : out std_logic;                                        -- endofpacket
			sgdma_tx_out_startofpacket                    : out std_logic;                                        -- startofpacket
			sgdma_tx_out_empty                            : out std_logic_vector(1 downto 0);                     -- empty
			tse_mac_mac_mdio_connection_mdc               : out std_logic;                                        -- mdc
			tse_mac_mac_mdio_connection_mdio_in           : in  std_logic                     := 'X';             -- mdio_in
			tse_mac_mac_mdio_connection_mdio_out          : out std_logic;                                        -- mdio_out
			tse_mac_mac_mdio_connection_mdio_oen          : out std_logic;                                        -- mdio_oen
			tse_mac_mac_misc_connection_xon_gen           : in  std_logic                     := 'X';             -- xon_gen
			tse_mac_mac_misc_connection_xoff_gen          : in  std_logic                     := 'X';             -- xoff_gen
			tse_mac_mac_misc_connection_ff_tx_crc_fwd     : in  std_logic                     := 'X';             -- ff_tx_crc_fwd
			tse_mac_mac_misc_connection_ff_tx_septy       : out std_logic;                                        -- ff_tx_septy
			tse_mac_mac_misc_connection_tx_ff_uflow       : out std_logic;                                        -- tx_ff_uflow
			tse_mac_mac_misc_connection_ff_tx_a_full      : out std_logic;                                        -- ff_tx_a_full
			tse_mac_mac_misc_connection_ff_tx_a_empty     : out std_logic;                                        -- ff_tx_a_empty
			tse_mac_mac_misc_connection_rx_err_stat       : out std_logic_vector(17 downto 0);                    -- rx_err_stat
			tse_mac_mac_misc_connection_rx_frm_type       : out std_logic_vector(3 downto 0);                     -- rx_frm_type
			tse_mac_mac_misc_connection_ff_rx_dsav        : out std_logic;                                        -- ff_rx_dsav
			tse_mac_mac_misc_connection_ff_rx_a_full      : out std_logic;                                        -- ff_rx_a_full
			tse_mac_mac_misc_connection_ff_rx_a_empty     : out std_logic;                                        -- ff_rx_a_empty
			tse_mac_serdes_control_connection_sd_loopback : out std_logic;                                        -- sd_loopback
			tse_mac_serdes_control_connection_powerdown   : out std_logic;                                        -- powerdown
			tse_mac_status_led_connection_crs             : out std_logic;                                        -- crs
			tse_mac_status_led_connection_link            : out std_logic;                                        -- link
			tse_mac_status_led_connection_panel_link      : out std_logic;                                        -- panel_link
			tse_mac_status_led_connection_col             : out std_logic;                                        -- col
			tse_mac_status_led_connection_an              : out std_logic;                                        -- an
			tse_mac_status_led_connection_char_err        : out std_logic;                                        -- char_err
			tse_mac_status_led_connection_disp_err        : out std_logic;                                        -- disp_err
			tse_mac_tbi_connection_rx_clk                 : in  std_logic                     := 'X';             -- rx_clk
			tse_mac_tbi_connection_tx_clk                 : in  std_logic                     := 'X';             -- tx_clk
			tse_mac_tbi_connection_rx_d                   : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- rx_d
			tse_mac_tbi_connection_tx_d                   : out std_logic_vector(9 downto 0);                     -- tx_d
			tse_mac_transmit_data                         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			tse_mac_transmit_endofpacket                  : in  std_logic                     := 'X';             -- endofpacket
			tse_mac_transmit_error                        : in  std_logic                     := 'X';             -- error
			tse_mac_transmit_empty                        : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- empty
			tse_mac_transmit_ready                        : out std_logic;                                        -- ready
			tse_mac_transmit_startofpacket                : in  std_logic                     := 'X';             -- startofpacket
			tse_mac_transmit_valid                        : in  std_logic                     := 'X'              -- valid
		);
	end component tse_w_sgdma;

	u0 : component tse_w_sgdma
		port map (
			avalon_slave_waitrequest                      => CONNECTED_TO_avalon_slave_waitrequest,                      --                      avalon_slave.waitrequest
			avalon_slave_readdata                         => CONNECTED_TO_avalon_slave_readdata,                         --                                  .readdata
			avalon_slave_readdatavalid                    => CONNECTED_TO_avalon_slave_readdatavalid,                    --                                  .readdatavalid
			avalon_slave_burstcount                       => CONNECTED_TO_avalon_slave_burstcount,                       --                                  .burstcount
			avalon_slave_writedata                        => CONNECTED_TO_avalon_slave_writedata,                        --                                  .writedata
			avalon_slave_address                          => CONNECTED_TO_avalon_slave_address,                          --                                  .address
			avalon_slave_write                            => CONNECTED_TO_avalon_slave_write,                            --                                  .write
			avalon_slave_read                             => CONNECTED_TO_avalon_slave_read,                             --                                  .read
			avalon_slave_byteenable                       => CONNECTED_TO_avalon_slave_byteenable,                       --                                  .byteenable
			avalon_slave_debugaccess                      => CONNECTED_TO_avalon_slave_debugaccess,                      --                                  .debugaccess
			clk_10_clk                                    => CONNECTED_TO_clk_10_clk,                                    --                            clk_10.clk
			clk_100_clk                                   => CONNECTED_TO_clk_100_clk,                                   --                           clk_100.clk
			clk_50_clk                                    => CONNECTED_TO_clk_50_clk,                                    --                            clk_50.clk
			reset_100_reset_n                             => CONNECTED_TO_reset_100_reset_n,                             --                         reset_100.reset_n
			reset_50_reset_n                              => CONNECTED_TO_reset_50_reset_n,                              --                          reset_50.reset_n
			sgdma_rx_csr_irq_irq                          => CONNECTED_TO_sgdma_rx_csr_irq_irq,                          --                  sgdma_rx_csr_irq.irq
			sgdma_rx_m_write_waitrequest                  => CONNECTED_TO_sgdma_rx_m_write_waitrequest,                  --                  sgdma_rx_m_write.waitrequest
			sgdma_rx_m_write_address                      => CONNECTED_TO_sgdma_rx_m_write_address,                      --                                  .address
			sgdma_rx_m_write_write                        => CONNECTED_TO_sgdma_rx_m_write_write,                        --                                  .write
			sgdma_rx_m_write_writedata                    => CONNECTED_TO_sgdma_rx_m_write_writedata,                    --                                  .writedata
			sgdma_rx_m_write_byteenable                   => CONNECTED_TO_sgdma_rx_m_write_byteenable,                   --                                  .byteenable
			sgdma_tx_csr_irq_irq                          => CONNECTED_TO_sgdma_tx_csr_irq_irq,                          --                  sgdma_tx_csr_irq.irq
			sgdma_tx_m_read_readdata                      => CONNECTED_TO_sgdma_tx_m_read_readdata,                      --                   sgdma_tx_m_read.readdata
			sgdma_tx_m_read_readdatavalid                 => CONNECTED_TO_sgdma_tx_m_read_readdatavalid,                 --                                  .readdatavalid
			sgdma_tx_m_read_waitrequest                   => CONNECTED_TO_sgdma_tx_m_read_waitrequest,                   --                                  .waitrequest
			sgdma_tx_m_read_address                       => CONNECTED_TO_sgdma_tx_m_read_address,                       --                                  .address
			sgdma_tx_m_read_read                          => CONNECTED_TO_sgdma_tx_m_read_read,                          --                                  .read
			sgdma_tx_out_data                             => CONNECTED_TO_sgdma_tx_out_data,                             --                      sgdma_tx_out.data
			sgdma_tx_out_valid                            => CONNECTED_TO_sgdma_tx_out_valid,                            --                                  .valid
			sgdma_tx_out_ready                            => CONNECTED_TO_sgdma_tx_out_ready,                            --                                  .ready
			sgdma_tx_out_endofpacket                      => CONNECTED_TO_sgdma_tx_out_endofpacket,                      --                                  .endofpacket
			sgdma_tx_out_startofpacket                    => CONNECTED_TO_sgdma_tx_out_startofpacket,                    --                                  .startofpacket
			sgdma_tx_out_empty                            => CONNECTED_TO_sgdma_tx_out_empty,                            --                                  .empty
			tse_mac_mac_mdio_connection_mdc               => CONNECTED_TO_tse_mac_mac_mdio_connection_mdc,               --       tse_mac_mac_mdio_connection.mdc
			tse_mac_mac_mdio_connection_mdio_in           => CONNECTED_TO_tse_mac_mac_mdio_connection_mdio_in,           --                                  .mdio_in
			tse_mac_mac_mdio_connection_mdio_out          => CONNECTED_TO_tse_mac_mac_mdio_connection_mdio_out,          --                                  .mdio_out
			tse_mac_mac_mdio_connection_mdio_oen          => CONNECTED_TO_tse_mac_mac_mdio_connection_mdio_oen,          --                                  .mdio_oen
			tse_mac_mac_misc_connection_xon_gen           => CONNECTED_TO_tse_mac_mac_misc_connection_xon_gen,           --       tse_mac_mac_misc_connection.xon_gen
			tse_mac_mac_misc_connection_xoff_gen          => CONNECTED_TO_tse_mac_mac_misc_connection_xoff_gen,          --                                  .xoff_gen
			tse_mac_mac_misc_connection_ff_tx_crc_fwd     => CONNECTED_TO_tse_mac_mac_misc_connection_ff_tx_crc_fwd,     --                                  .ff_tx_crc_fwd
			tse_mac_mac_misc_connection_ff_tx_septy       => CONNECTED_TO_tse_mac_mac_misc_connection_ff_tx_septy,       --                                  .ff_tx_septy
			tse_mac_mac_misc_connection_tx_ff_uflow       => CONNECTED_TO_tse_mac_mac_misc_connection_tx_ff_uflow,       --                                  .tx_ff_uflow
			tse_mac_mac_misc_connection_ff_tx_a_full      => CONNECTED_TO_tse_mac_mac_misc_connection_ff_tx_a_full,      --                                  .ff_tx_a_full
			tse_mac_mac_misc_connection_ff_tx_a_empty     => CONNECTED_TO_tse_mac_mac_misc_connection_ff_tx_a_empty,     --                                  .ff_tx_a_empty
			tse_mac_mac_misc_connection_rx_err_stat       => CONNECTED_TO_tse_mac_mac_misc_connection_rx_err_stat,       --                                  .rx_err_stat
			tse_mac_mac_misc_connection_rx_frm_type       => CONNECTED_TO_tse_mac_mac_misc_connection_rx_frm_type,       --                                  .rx_frm_type
			tse_mac_mac_misc_connection_ff_rx_dsav        => CONNECTED_TO_tse_mac_mac_misc_connection_ff_rx_dsav,        --                                  .ff_rx_dsav
			tse_mac_mac_misc_connection_ff_rx_a_full      => CONNECTED_TO_tse_mac_mac_misc_connection_ff_rx_a_full,      --                                  .ff_rx_a_full
			tse_mac_mac_misc_connection_ff_rx_a_empty     => CONNECTED_TO_tse_mac_mac_misc_connection_ff_rx_a_empty,     --                                  .ff_rx_a_empty
			tse_mac_serdes_control_connection_sd_loopback => CONNECTED_TO_tse_mac_serdes_control_connection_sd_loopback, -- tse_mac_serdes_control_connection.sd_loopback
			tse_mac_serdes_control_connection_powerdown   => CONNECTED_TO_tse_mac_serdes_control_connection_powerdown,   --                                  .powerdown
			tse_mac_status_led_connection_crs             => CONNECTED_TO_tse_mac_status_led_connection_crs,             --     tse_mac_status_led_connection.crs
			tse_mac_status_led_connection_link            => CONNECTED_TO_tse_mac_status_led_connection_link,            --                                  .link
			tse_mac_status_led_connection_panel_link      => CONNECTED_TO_tse_mac_status_led_connection_panel_link,      --                                  .panel_link
			tse_mac_status_led_connection_col             => CONNECTED_TO_tse_mac_status_led_connection_col,             --                                  .col
			tse_mac_status_led_connection_an              => CONNECTED_TO_tse_mac_status_led_connection_an,              --                                  .an
			tse_mac_status_led_connection_char_err        => CONNECTED_TO_tse_mac_status_led_connection_char_err,        --                                  .char_err
			tse_mac_status_led_connection_disp_err        => CONNECTED_TO_tse_mac_status_led_connection_disp_err,        --                                  .disp_err
			tse_mac_tbi_connection_rx_clk                 => CONNECTED_TO_tse_mac_tbi_connection_rx_clk,                 --            tse_mac_tbi_connection.rx_clk
			tse_mac_tbi_connection_tx_clk                 => CONNECTED_TO_tse_mac_tbi_connection_tx_clk,                 --                                  .tx_clk
			tse_mac_tbi_connection_rx_d                   => CONNECTED_TO_tse_mac_tbi_connection_rx_d,                   --                                  .rx_d
			tse_mac_tbi_connection_tx_d                   => CONNECTED_TO_tse_mac_tbi_connection_tx_d,                   --                                  .tx_d
			tse_mac_transmit_data                         => CONNECTED_TO_tse_mac_transmit_data,                         --                  tse_mac_transmit.data
			tse_mac_transmit_endofpacket                  => CONNECTED_TO_tse_mac_transmit_endofpacket,                  --                                  .endofpacket
			tse_mac_transmit_error                        => CONNECTED_TO_tse_mac_transmit_error,                        --                                  .error
			tse_mac_transmit_empty                        => CONNECTED_TO_tse_mac_transmit_empty,                        --                                  .empty
			tse_mac_transmit_ready                        => CONNECTED_TO_tse_mac_transmit_ready,                        --                                  .ready
			tse_mac_transmit_startofpacket                => CONNECTED_TO_tse_mac_transmit_startofpacket,                --                                  .startofpacket
			tse_mac_transmit_valid                        => CONNECTED_TO_tse_mac_transmit_valid                         --                                  .valid
		);

