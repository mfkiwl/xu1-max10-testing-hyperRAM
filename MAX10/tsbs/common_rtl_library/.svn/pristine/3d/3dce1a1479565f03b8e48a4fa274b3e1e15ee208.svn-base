	component CycloneV_System is
		port (
			aligner_ctrl_aligner_ena   : in  std_logic                    := 'X';             -- aligner_ena
			aligner_ctrl_aligner_shift : in  std_logic                    := 'X';             -- aligner_shift
			aligner_ctrl_aligner_oos   : out std_logic;                                       -- aligner_oos
			clk_clk                    : in  std_logic                    := 'X';             -- clk
			lvds_rx_lvds               : in  std_logic_vector(1 downto 0) := (others => 'X'); -- lvds
			lvds_tx_lvds               : out std_logic_vector(1 downto 0);                    -- lvds
			reset_reset_n              : in  std_logic                    := 'X';             -- reset_n
			tg_reset_n                 : in  std_logic                    := 'X';             -- reset_n
			txclk_out_clk              : out std_logic                                        -- clk
		);
	end component CycloneV_System;

	u0 : component CycloneV_System
		port map (
			aligner_ctrl_aligner_ena   => CONNECTED_TO_aligner_ctrl_aligner_ena,   -- aligner_ctrl.aligner_ena
			aligner_ctrl_aligner_shift => CONNECTED_TO_aligner_ctrl_aligner_shift, --             .aligner_shift
			aligner_ctrl_aligner_oos   => CONNECTED_TO_aligner_ctrl_aligner_oos,   --             .aligner_oos
			clk_clk                    => CONNECTED_TO_clk_clk,                    --          clk.clk
			lvds_rx_lvds               => CONNECTED_TO_lvds_rx_lvds,               --      lvds_rx.lvds
			lvds_tx_lvds               => CONNECTED_TO_lvds_tx_lvds,               --      lvds_tx.lvds
			reset_reset_n              => CONNECTED_TO_reset_reset_n,              --        reset.reset_n
			tg_reset_n                 => CONNECTED_TO_tg_reset_n,                 --           tg.reset_n
			txclk_out_clk              => CONNECTED_TO_txclk_out_clk               --    txclk_out.clk
		);

