	component altddio_input_5bit is
		port (
			datain    : in  std_logic_vector(4 downto 0) := (others => 'X'); -- export
			ck        : in  std_logic                    := 'X';             -- export
			dataout_h : out std_logic_vector(4 downto 0);                    -- fragment
			dataout_l : out std_logic_vector(4 downto 0)                     -- fragment
		);
	end component altddio_input_5bit;

	u0 : component altddio_input_5bit
		port map (
			datain    => CONNECTED_TO_datain,    --    pad_in.export
			ck        => CONNECTED_TO_ck,        --        ck.export
			dataout_h => CONNECTED_TO_dataout_h, -- dataout_h.fragment
			dataout_l => CONNECTED_TO_dataout_l  -- dataout_l.fragment
		);

