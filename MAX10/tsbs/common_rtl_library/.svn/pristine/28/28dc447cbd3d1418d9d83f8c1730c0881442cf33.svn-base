	component spiral_fft_4096_unscaled_stream_32bit is
		port (
			clk_clk             : in  std_logic                     := 'X';             -- clk
			fft_reset_reset     : in  std_logic                     := 'X';             -- reset
			spiral_fft_next     : in  std_logic                     := 'X';             -- next
			spiral_fft_next_out : out std_logic;                                        -- next_out
			spiral_fft_x0       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- x0
			spiral_fft_y0       : out std_logic_vector(31 downto 0);                    -- y0
			spiral_fft_x1       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- x1
			spiral_fft_y1       : out std_logic_vector(31 downto 0);                    -- y1
			spiral_fft_x2       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- x2
			spiral_fft_y2       : out std_logic_vector(31 downto 0);                    -- y2
			spiral_fft_x3       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- x3
			spiral_fft_y3       : out std_logic_vector(31 downto 0);                    -- y3
			spiral_fft_x4       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- x4
			spiral_fft_y4       : out std_logic_vector(31 downto 0);                    -- y4
			spiral_fft_x5       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- x5
			spiral_fft_y5       : out std_logic_vector(31 downto 0);                    -- y5
			spiral_fft_x6       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- x6
			spiral_fft_y6       : out std_logic_vector(31 downto 0);                    -- y6
			spiral_fft_x7       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- x7
			spiral_fft_y7       : out std_logic_vector(31 downto 0)                     -- y7
		);
	end component spiral_fft_4096_unscaled_stream_32bit;

	u0 : component spiral_fft_4096_unscaled_stream_32bit
		port map (
			clk_clk             => CONNECTED_TO_clk_clk,             --        clk.clk
			fft_reset_reset     => CONNECTED_TO_fft_reset_reset,     --  fft_reset.reset
			spiral_fft_next     => CONNECTED_TO_spiral_fft_next,     -- spiral_fft.next
			spiral_fft_next_out => CONNECTED_TO_spiral_fft_next_out, --           .next_out
			spiral_fft_x0       => CONNECTED_TO_spiral_fft_x0,       --           .x0
			spiral_fft_y0       => CONNECTED_TO_spiral_fft_y0,       --           .y0
			spiral_fft_x1       => CONNECTED_TO_spiral_fft_x1,       --           .x1
			spiral_fft_y1       => CONNECTED_TO_spiral_fft_y1,       --           .y1
			spiral_fft_x2       => CONNECTED_TO_spiral_fft_x2,       --           .x2
			spiral_fft_y2       => CONNECTED_TO_spiral_fft_y2,       --           .y2
			spiral_fft_x3       => CONNECTED_TO_spiral_fft_x3,       --           .x3
			spiral_fft_y3       => CONNECTED_TO_spiral_fft_y3,       --           .y3
			spiral_fft_x4       => CONNECTED_TO_spiral_fft_x4,       --           .x4
			spiral_fft_y4       => CONNECTED_TO_spiral_fft_y4,       --           .y4
			spiral_fft_x5       => CONNECTED_TO_spiral_fft_x5,       --           .x5
			spiral_fft_y5       => CONNECTED_TO_spiral_fft_y5,       --           .y5
			spiral_fft_x6       => CONNECTED_TO_spiral_fft_x6,       --           .x6
			spiral_fft_y6       => CONNECTED_TO_spiral_fft_y6,       --           .y6
			spiral_fft_x7       => CONNECTED_TO_spiral_fft_x7,       --           .x7
			spiral_fft_y7       => CONNECTED_TO_spiral_fft_y7        --           .y7
		);

