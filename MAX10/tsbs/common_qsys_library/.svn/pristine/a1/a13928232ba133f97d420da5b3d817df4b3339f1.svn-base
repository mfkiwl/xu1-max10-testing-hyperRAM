	component arria_v_sfp is
		port (
			alt_xcvr_reconfig_reconfig_busy_reconfig_busy           : out std_logic;                                         -- reconfig_busy
			alt_xcvr_reconfig_reconfig_from_xcvr_reconfig_from_xcvr : in  std_logic_vector(91 downto 0)  := (others => 'X'); -- reconfig_from_xcvr
			alt_xcvr_reconfig_reconfig_to_xcvr_reconfig_to_xcvr     : out std_logic_vector(139 downto 0);                    -- reconfig_to_xcvr
			alt_xcvr_reconfig_rx_cal_busy_tx_cal_busy               : out std_logic;                                         -- tx_cal_busy
			alt_xcvr_reconfig_tx_cal_busy_tx_cal_busy               : out std_logic;                                         -- tx_cal_busy
			arriav_v_standalone_gigabit_xcvr_tx_ready               : out std_logic;                                         -- tx_ready
			arriav_v_standalone_gigabit_xcvr_rx_ready               : out std_logic;                                         -- rx_ready
			arriav_v_standalone_gigabit_xcvr_pll_ref_clk            : in  std_logic                      := 'X';             -- pll_ref_clk
			arriav_v_standalone_gigabit_xcvr_tx_serial_data         : out std_logic;                                         -- tx_serial_data
			arriav_v_standalone_gigabit_xcvr_tx_forceelecidle       : in  std_logic                      := 'X';             -- tx_forceelecidle
			arriav_v_standalone_gigabit_xcvr_pll_locked             : out std_logic;                                         -- pll_locked
			arriav_v_standalone_gigabit_xcvr_rx_serial_data         : in  std_logic                      := 'X';             -- rx_serial_data
			arriav_v_standalone_gigabit_xcvr_rx_is_lockedtoref      : out std_logic;                                         -- rx_is_lockedtoref
			arriav_v_standalone_gigabit_xcvr_rx_is_lockedtodata     : out std_logic;                                         -- rx_is_lockedtodata
			arriav_v_standalone_gigabit_xcvr_rx_signaldetect        : out std_logic;                                         -- rx_signaldetect
			arriav_v_standalone_gigabit_xcvr_tx_clkout              : out std_logic;                                         -- tx_clkout
			arriav_v_standalone_gigabit_xcvr_rx_clkout              : out std_logic;                                         -- rx_clkout
			arriav_v_standalone_gigabit_xcvr_tx_parallel_data       : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- tx_parallel_data
			arriav_v_standalone_gigabit_xcvr_rx_parallel_data       : out std_logic_vector(9 downto 0);                      -- rx_parallel_data
			arriav_v_standalone_gigabit_xcvr_reconfig_from_xcvr     : out std_logic_vector(91 downto 0);                     -- reconfig_from_xcvr
			arriav_v_standalone_gigabit_xcvr_reconfig_to_xcvr       : in  std_logic_vector(139 downto 0) := (others => 'X'); -- reconfig_to_xcvr
			avalon_slave_waitrequest                                : out std_logic;                                         -- waitrequest
			avalon_slave_readdata                                   : out std_logic_vector(31 downto 0);                     -- readdata
			avalon_slave_readdatavalid                              : out std_logic;                                         -- readdatavalid
			avalon_slave_burstcount                                 : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			avalon_slave_writedata                                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			avalon_slave_address                                    : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- address
			avalon_slave_write                                      : in  std_logic                      := 'X';             -- write
			avalon_slave_read                                       : in  std_logic                      := 'X';             -- read
			avalon_slave_byteenable                                 : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			avalon_slave_debugaccess                                : in  std_logic                      := 'X';             -- debugaccess
			ethernet_clk_125mhz_clk                                 : in  std_logic                      := 'X';             -- clk
			ethernet_clk_125mhz_reset_reset_n                       : in  std_logic                      := 'X'              -- reset_n
		);
	end component arria_v_sfp;

	u0 : component arria_v_sfp
		port map (
			alt_xcvr_reconfig_reconfig_busy_reconfig_busy           => CONNECTED_TO_alt_xcvr_reconfig_reconfig_busy_reconfig_busy,           --      alt_xcvr_reconfig_reconfig_busy.reconfig_busy
			alt_xcvr_reconfig_reconfig_from_xcvr_reconfig_from_xcvr => CONNECTED_TO_alt_xcvr_reconfig_reconfig_from_xcvr_reconfig_from_xcvr, -- alt_xcvr_reconfig_reconfig_from_xcvr.reconfig_from_xcvr
			alt_xcvr_reconfig_reconfig_to_xcvr_reconfig_to_xcvr     => CONNECTED_TO_alt_xcvr_reconfig_reconfig_to_xcvr_reconfig_to_xcvr,     --   alt_xcvr_reconfig_reconfig_to_xcvr.reconfig_to_xcvr
			alt_xcvr_reconfig_rx_cal_busy_tx_cal_busy               => CONNECTED_TO_alt_xcvr_reconfig_rx_cal_busy_tx_cal_busy,               --        alt_xcvr_reconfig_rx_cal_busy.tx_cal_busy
			alt_xcvr_reconfig_tx_cal_busy_tx_cal_busy               => CONNECTED_TO_alt_xcvr_reconfig_tx_cal_busy_tx_cal_busy,               --        alt_xcvr_reconfig_tx_cal_busy.tx_cal_busy
			arriav_v_standalone_gigabit_xcvr_tx_ready               => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_tx_ready,               --     arriav_v_standalone_gigabit_xcvr.tx_ready
			arriav_v_standalone_gigabit_xcvr_rx_ready               => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_rx_ready,               --                                     .rx_ready
			arriav_v_standalone_gigabit_xcvr_pll_ref_clk            => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_pll_ref_clk,            --                                     .pll_ref_clk
			arriav_v_standalone_gigabit_xcvr_tx_serial_data         => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_tx_serial_data,         --                                     .tx_serial_data
			arriav_v_standalone_gigabit_xcvr_tx_forceelecidle       => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_tx_forceelecidle,       --                                     .tx_forceelecidle
			arriav_v_standalone_gigabit_xcvr_pll_locked             => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_pll_locked,             --                                     .pll_locked
			arriav_v_standalone_gigabit_xcvr_rx_serial_data         => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_rx_serial_data,         --                                     .rx_serial_data
			arriav_v_standalone_gigabit_xcvr_rx_is_lockedtoref      => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_rx_is_lockedtoref,      --                                     .rx_is_lockedtoref
			arriav_v_standalone_gigabit_xcvr_rx_is_lockedtodata     => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_rx_is_lockedtodata,     --                                     .rx_is_lockedtodata
			arriav_v_standalone_gigabit_xcvr_rx_signaldetect        => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_rx_signaldetect,        --                                     .rx_signaldetect
			arriav_v_standalone_gigabit_xcvr_tx_clkout              => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_tx_clkout,              --                                     .tx_clkout
			arriav_v_standalone_gigabit_xcvr_rx_clkout              => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_rx_clkout,              --                                     .rx_clkout
			arriav_v_standalone_gigabit_xcvr_tx_parallel_data       => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_tx_parallel_data,       --                                     .tx_parallel_data
			arriav_v_standalone_gigabit_xcvr_rx_parallel_data       => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_rx_parallel_data,       --                                     .rx_parallel_data
			arriav_v_standalone_gigabit_xcvr_reconfig_from_xcvr     => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_reconfig_from_xcvr,     --                                     .reconfig_from_xcvr
			arriav_v_standalone_gigabit_xcvr_reconfig_to_xcvr       => CONNECTED_TO_arriav_v_standalone_gigabit_xcvr_reconfig_to_xcvr,       --                                     .reconfig_to_xcvr
			avalon_slave_waitrequest                                => CONNECTED_TO_avalon_slave_waitrequest,                                --                         avalon_slave.waitrequest
			avalon_slave_readdata                                   => CONNECTED_TO_avalon_slave_readdata,                                   --                                     .readdata
			avalon_slave_readdatavalid                              => CONNECTED_TO_avalon_slave_readdatavalid,                              --                                     .readdatavalid
			avalon_slave_burstcount                                 => CONNECTED_TO_avalon_slave_burstcount,                                 --                                     .burstcount
			avalon_slave_writedata                                  => CONNECTED_TO_avalon_slave_writedata,                                  --                                     .writedata
			avalon_slave_address                                    => CONNECTED_TO_avalon_slave_address,                                    --                                     .address
			avalon_slave_write                                      => CONNECTED_TO_avalon_slave_write,                                      --                                     .write
			avalon_slave_read                                       => CONNECTED_TO_avalon_slave_read,                                       --                                     .read
			avalon_slave_byteenable                                 => CONNECTED_TO_avalon_slave_byteenable,                                 --                                     .byteenable
			avalon_slave_debugaccess                                => CONNECTED_TO_avalon_slave_debugaccess,                                --                                     .debugaccess
			ethernet_clk_125mhz_clk                                 => CONNECTED_TO_ethernet_clk_125mhz_clk,                                 --                  ethernet_clk_125mhz.clk
			ethernet_clk_125mhz_reset_reset_n                       => CONNECTED_TO_ethernet_clk_125mhz_reset_reset_n                        --            ethernet_clk_125mhz_reset.reset_n
		);

