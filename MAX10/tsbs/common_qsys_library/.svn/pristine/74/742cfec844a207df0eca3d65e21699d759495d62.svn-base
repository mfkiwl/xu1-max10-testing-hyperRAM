	component arria10_altddio_1bit is
		port (
			dataout  : out std_logic_vector(0 downto 0);                    -- export
			ck       : in  std_logic                    := 'X';             -- export
			datain_h : in  std_logic_vector(0 downto 0) := (others => 'X'); -- fragment
			datain_l : in  std_logic_vector(0 downto 0) := (others => 'X')  -- fragment
		);
	end component arria10_altddio_1bit;

	u0 : component arria10_altddio_1bit
		port map (
			dataout  => CONNECTED_TO_dataout,  --  pad_out.export
			ck       => CONNECTED_TO_ck,       --       ck.export
			datain_h => CONNECTED_TO_datain_h, -- datain_h.fragment
			datain_l => CONNECTED_TO_datain_l  -- datain_l.fragment
		);

