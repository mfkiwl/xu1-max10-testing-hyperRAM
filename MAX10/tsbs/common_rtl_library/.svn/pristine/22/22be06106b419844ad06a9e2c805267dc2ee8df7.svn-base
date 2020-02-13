	component avalon_st_sc_fifo_only is
		port (
			clk_clk                 : in  std_logic                     := 'X';             -- clk
			reset_reset_n           : in  std_logic                     := 'X';             -- reset_n
			almost_empty_data       : out std_logic;                                        -- data
			almost_full_data        : out std_logic;                                        -- data
			out_data_data           : out std_logic_vector(31 downto 0);                    -- data
			out_data_valid          : out std_logic;                                        -- valid
			out_data_ready          : in  std_logic                     := 'X';             -- ready
			out_data_startofpacket  : out std_logic;                                        -- startofpacket
			out_data_endofpacket    : out std_logic;                                        -- endofpacket
			out_data_empty          : out std_logic_vector(1 downto 0);                     -- empty
			in_data_data            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			in_data_valid           : in  std_logic                     := 'X';             -- valid
			in_data_ready           : out std_logic;                                        -- ready
			in_data_startofpacket   : in  std_logic                     := 'X';             -- startofpacket
			in_data_endofpacket     : in  std_logic                     := 'X';             -- endofpacket
			in_data_empty           : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- empty
			avalon_mm_slv_address   : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			avalon_mm_slv_read      : in  std_logic                     := 'X';             -- read
			avalon_mm_slv_write     : in  std_logic                     := 'X';             -- write
			avalon_mm_slv_readdata  : out std_logic_vector(31 downto 0);                    -- readdata
			avalon_mm_slv_writedata : in  std_logic_vector(31 downto 0) := (others => 'X')  -- writedata
		);
	end component avalon_st_sc_fifo_only;

	u0 : component avalon_st_sc_fifo_only
		port map (
			clk_clk                 => CONNECTED_TO_clk_clk,                 --           clk.clk
			reset_reset_n           => CONNECTED_TO_reset_reset_n,           --         reset.reset_n
			almost_empty_data       => CONNECTED_TO_almost_empty_data,       --  almost_empty.data
			almost_full_data        => CONNECTED_TO_almost_full_data,        --   almost_full.data
			out_data_data           => CONNECTED_TO_out_data_data,           --      out_data.data
			out_data_valid          => CONNECTED_TO_out_data_valid,          --              .valid
			out_data_ready          => CONNECTED_TO_out_data_ready,          --              .ready
			out_data_startofpacket  => CONNECTED_TO_out_data_startofpacket,  --              .startofpacket
			out_data_endofpacket    => CONNECTED_TO_out_data_endofpacket,    --              .endofpacket
			out_data_empty          => CONNECTED_TO_out_data_empty,          --              .empty
			in_data_data            => CONNECTED_TO_in_data_data,            --       in_data.data
			in_data_valid           => CONNECTED_TO_in_data_valid,           --              .valid
			in_data_ready           => CONNECTED_TO_in_data_ready,           --              .ready
			in_data_startofpacket   => CONNECTED_TO_in_data_startofpacket,   --              .startofpacket
			in_data_endofpacket     => CONNECTED_TO_in_data_endofpacket,     --              .endofpacket
			in_data_empty           => CONNECTED_TO_in_data_empty,           --              .empty
			avalon_mm_slv_address   => CONNECTED_TO_avalon_mm_slv_address,   -- avalon_mm_slv.address
			avalon_mm_slv_read      => CONNECTED_TO_avalon_mm_slv_read,      --              .read
			avalon_mm_slv_write     => CONNECTED_TO_avalon_mm_slv_write,     --              .write
			avalon_mm_slv_readdata  => CONNECTED_TO_avalon_mm_slv_readdata,  --              .readdata
			avalon_mm_slv_writedata => CONNECTED_TO_avalon_mm_slv_writedata  --              .writedata
		);

