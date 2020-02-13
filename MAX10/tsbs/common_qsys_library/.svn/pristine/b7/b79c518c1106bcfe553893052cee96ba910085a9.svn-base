	component udp_streamer_subsystem_1_channel is
		port (
			clk_100_clk                                : in  std_logic                     := 'X';             -- clk
			dc_fifo_0_in_clk_clk                       : in  std_logic                     := 'X';             -- clk
			external_avalon_st_packet_in_data          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			external_avalon_st_packet_in_valid         : in  std_logic                     := 'X';             -- valid
			external_avalon_st_packet_in_ready         : out std_logic;                                        -- ready
			external_avalon_st_packet_in_startofpacket : in  std_logic                     := 'X';             -- startofpacket
			external_avalon_st_packet_in_endofpacket   : in  std_logic                     := 'X';             -- endofpacket
			external_avalon_st_packet_in_empty         : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- empty
			external_packet_clk_clk                    : in  std_logic                     := 'X';             -- clk
			external_packet_reset_reset_n              : in  std_logic                     := 'X';             -- reset_n
			nios_bridge_s0_100_mhz_waitrequest         : out std_logic;                                        -- waitrequest
			nios_bridge_s0_100_mhz_readdata            : out std_logic_vector(31 downto 0);                    -- readdata
			nios_bridge_s0_100_mhz_readdatavalid       : out std_logic;                                        -- readdatavalid
			nios_bridge_s0_100_mhz_burstcount          : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- burstcount
			nios_bridge_s0_100_mhz_writedata           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			nios_bridge_s0_100_mhz_address             : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- address
			nios_bridge_s0_100_mhz_write               : in  std_logic                     := 'X';             -- write
			nios_bridge_s0_100_mhz_read                : in  std_logic                     := 'X';             -- read
			nios_bridge_s0_100_mhz_byteenable          : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			nios_bridge_s0_100_mhz_debugaccess         : in  std_logic                     := 'X';             -- debugaccess
			out_to_tse_mac_data                        : out std_logic_vector(31 downto 0);                    -- data
			out_to_tse_mac_valid                       : out std_logic;                                        -- valid
			out_to_tse_mac_ready                       : in  std_logic                     := 'X';             -- ready
			out_to_tse_mac_startofpacket               : out std_logic;                                        -- startofpacket
			out_to_tse_mac_endofpacket                 : out std_logic;                                        -- endofpacket
			out_to_tse_mac_empty                       : out std_logic_vector(1 downto 0);                     -- empty
			out_to_tse_mac_error                       : out std_logic;                                        -- error
			reset_100_reset_n                          : in  std_logic                     := 'X';             -- reset_n
			udp_inserter_0_snk_data                    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			udp_inserter_0_snk_valid                   : in  std_logic                     := 'X';             -- valid
			udp_inserter_0_snk_ready                   : out std_logic;                                        -- ready
			udp_inserter_0_snk_startofpacket           : in  std_logic                     := 'X';             -- startofpacket
			udp_inserter_0_snk_endofpacket             : in  std_logic                     := 'X';             -- endofpacket
			udp_inserter_0_snk_empty                   : in  std_logic_vector(1 downto 0)  := (others => 'X')  -- empty
		);
	end component udp_streamer_subsystem_1_channel;

	u0 : component udp_streamer_subsystem_1_channel
		port map (
			clk_100_clk                                => CONNECTED_TO_clk_100_clk,                                --                      clk_100.clk
			dc_fifo_0_in_clk_clk                       => CONNECTED_TO_dc_fifo_0_in_clk_clk,                       --             dc_fifo_0_in_clk.clk
			external_avalon_st_packet_in_data          => CONNECTED_TO_external_avalon_st_packet_in_data,          -- external_avalon_st_packet_in.data
			external_avalon_st_packet_in_valid         => CONNECTED_TO_external_avalon_st_packet_in_valid,         --                             .valid
			external_avalon_st_packet_in_ready         => CONNECTED_TO_external_avalon_st_packet_in_ready,         --                             .ready
			external_avalon_st_packet_in_startofpacket => CONNECTED_TO_external_avalon_st_packet_in_startofpacket, --                             .startofpacket
			external_avalon_st_packet_in_endofpacket   => CONNECTED_TO_external_avalon_st_packet_in_endofpacket,   --                             .endofpacket
			external_avalon_st_packet_in_empty         => CONNECTED_TO_external_avalon_st_packet_in_empty,         --                             .empty
			external_packet_clk_clk                    => CONNECTED_TO_external_packet_clk_clk,                    --          external_packet_clk.clk
			external_packet_reset_reset_n              => CONNECTED_TO_external_packet_reset_reset_n,              --        external_packet_reset.reset_n
			nios_bridge_s0_100_mhz_waitrequest         => CONNECTED_TO_nios_bridge_s0_100_mhz_waitrequest,         --       nios_bridge_s0_100_mhz.waitrequest
			nios_bridge_s0_100_mhz_readdata            => CONNECTED_TO_nios_bridge_s0_100_mhz_readdata,            --                             .readdata
			nios_bridge_s0_100_mhz_readdatavalid       => CONNECTED_TO_nios_bridge_s0_100_mhz_readdatavalid,       --                             .readdatavalid
			nios_bridge_s0_100_mhz_burstcount          => CONNECTED_TO_nios_bridge_s0_100_mhz_burstcount,          --                             .burstcount
			nios_bridge_s0_100_mhz_writedata           => CONNECTED_TO_nios_bridge_s0_100_mhz_writedata,           --                             .writedata
			nios_bridge_s0_100_mhz_address             => CONNECTED_TO_nios_bridge_s0_100_mhz_address,             --                             .address
			nios_bridge_s0_100_mhz_write               => CONNECTED_TO_nios_bridge_s0_100_mhz_write,               --                             .write
			nios_bridge_s0_100_mhz_read                => CONNECTED_TO_nios_bridge_s0_100_mhz_read,                --                             .read
			nios_bridge_s0_100_mhz_byteenable          => CONNECTED_TO_nios_bridge_s0_100_mhz_byteenable,          --                             .byteenable
			nios_bridge_s0_100_mhz_debugaccess         => CONNECTED_TO_nios_bridge_s0_100_mhz_debugaccess,         --                             .debugaccess
			out_to_tse_mac_data                        => CONNECTED_TO_out_to_tse_mac_data,                        --               out_to_tse_mac.data
			out_to_tse_mac_valid                       => CONNECTED_TO_out_to_tse_mac_valid,                       --                             .valid
			out_to_tse_mac_ready                       => CONNECTED_TO_out_to_tse_mac_ready,                       --                             .ready
			out_to_tse_mac_startofpacket               => CONNECTED_TO_out_to_tse_mac_startofpacket,               --                             .startofpacket
			out_to_tse_mac_endofpacket                 => CONNECTED_TO_out_to_tse_mac_endofpacket,                 --                             .endofpacket
			out_to_tse_mac_empty                       => CONNECTED_TO_out_to_tse_mac_empty,                       --                             .empty
			out_to_tse_mac_error                       => CONNECTED_TO_out_to_tse_mac_error,                       --                             .error
			reset_100_reset_n                          => CONNECTED_TO_reset_100_reset_n,                          --                    reset_100.reset_n
			udp_inserter_0_snk_data                    => CONNECTED_TO_udp_inserter_0_snk_data,                    --           udp_inserter_0_snk.data
			udp_inserter_0_snk_valid                   => CONNECTED_TO_udp_inserter_0_snk_valid,                   --                             .valid
			udp_inserter_0_snk_ready                   => CONNECTED_TO_udp_inserter_0_snk_ready,                   --                             .ready
			udp_inserter_0_snk_startofpacket           => CONNECTED_TO_udp_inserter_0_snk_startofpacket,           --                             .startofpacket
			udp_inserter_0_snk_endofpacket             => CONNECTED_TO_udp_inserter_0_snk_endofpacket,             --                             .endofpacket
			udp_inserter_0_snk_empty                   => CONNECTED_TO_udp_inserter_0_snk_empty                    --                             .empty
		);

