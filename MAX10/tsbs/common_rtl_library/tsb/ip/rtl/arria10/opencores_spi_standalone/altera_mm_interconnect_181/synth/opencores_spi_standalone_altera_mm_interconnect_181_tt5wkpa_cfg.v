config opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa_cfg;
		design opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.simple_master_connection_without_burst_0_m0_translator use opencores_spi_standalone_altera_merlin_master_translator_181.altera_merlin_master_translator;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_avalon_slave_0_translator use opencores_spi_standalone_altera_merlin_slave_translator_181.altera_merlin_slave_translator;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_sdio_helper_s1_translator use opencores_spi_standalone_altera_merlin_slave_translator_181.altera_merlin_slave_translator;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_manual_reset_s1_translator use opencores_spi_standalone_altera_merlin_slave_translator_181.altera_merlin_slave_translator;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_currently_active_s1_translator use opencores_spi_standalone_altera_merlin_slave_translator_181.altera_merlin_slave_translator;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_debug_tag_word_s1_translator use opencores_spi_standalone_altera_merlin_slave_translator_181.altera_merlin_slave_translator;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_aux_control_out_s1_translator use opencores_spi_standalone_altera_merlin_slave_translator_181.altera_merlin_slave_translator;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_aux_control_in_s1_translator use opencores_spi_standalone_altera_merlin_slave_translator_181.altera_merlin_slave_translator;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.simple_master_connection_without_burst_0_m0_agent use opencores_spi_standalone_altera_merlin_master_agent_181.altera_merlin_master_agent;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_avalon_slave_0_agent use opencores_spi_standalone_altera_merlin_slave_agent_181.altera_merlin_slave_agent;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_avalon_slave_0_agent_rsp_fifo use opencores_spi_standalone_altera_avalon_sc_fifo_181.altera_avalon_sc_fifo;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_sdio_helper_s1_agent use opencores_spi_standalone_altera_merlin_slave_agent_181.altera_merlin_slave_agent;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_sdio_helper_s1_agent_rsp_fifo use opencores_spi_standalone_altera_avalon_sc_fifo_181.altera_avalon_sc_fifo;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_manual_reset_s1_agent use opencores_spi_standalone_altera_merlin_slave_agent_181.altera_merlin_slave_agent;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_manual_reset_s1_agent_rsp_fifo use opencores_spi_standalone_altera_avalon_sc_fifo_181.altera_avalon_sc_fifo;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_currently_active_s1_agent use opencores_spi_standalone_altera_merlin_slave_agent_181.altera_merlin_slave_agent;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_currently_active_s1_agent_rsp_fifo use opencores_spi_standalone_altera_avalon_sc_fifo_181.altera_avalon_sc_fifo;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_debug_tag_word_s1_agent use opencores_spi_standalone_altera_merlin_slave_agent_181.altera_merlin_slave_agent;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_debug_tag_word_s1_agent_rsp_fifo use opencores_spi_standalone_altera_avalon_sc_fifo_181.altera_avalon_sc_fifo;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_aux_control_out_s1_agent use opencores_spi_standalone_altera_merlin_slave_agent_181.altera_merlin_slave_agent;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_aux_control_out_s1_agent_rsp_fifo use opencores_spi_standalone_altera_avalon_sc_fifo_181.altera_avalon_sc_fifo;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_aux_control_in_s1_agent use opencores_spi_standalone_altera_merlin_slave_agent_181.altera_merlin_slave_agent;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_aux_control_in_s1_agent_rsp_fifo use opencores_spi_standalone_altera_avalon_sc_fifo_181.altera_avalon_sc_fifo;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.router use opencores_spi_standalone_altera_merlin_router_181.opencores_spi_standalone_altera_merlin_router_181_dj5fney;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.router_001 use opencores_spi_standalone_altera_merlin_router_181.opencores_spi_standalone_altera_merlin_router_181_blcvsvy;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.router_002 use opencores_spi_standalone_altera_merlin_router_181.opencores_spi_standalone_altera_merlin_router_181_blcvsvy;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.router_003 use opencores_spi_standalone_altera_merlin_router_181.opencores_spi_standalone_altera_merlin_router_181_blcvsvy;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.router_004 use opencores_spi_standalone_altera_merlin_router_181.opencores_spi_standalone_altera_merlin_router_181_blcvsvy;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.router_005 use opencores_spi_standalone_altera_merlin_router_181.opencores_spi_standalone_altera_merlin_router_181_blcvsvy;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.router_006 use opencores_spi_standalone_altera_merlin_router_181.opencores_spi_standalone_altera_merlin_router_181_blcvsvy;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.router_007 use opencores_spi_standalone_altera_merlin_router_181.opencores_spi_standalone_altera_merlin_router_181_blcvsvy;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.opencores_spi_avalon_slave_0_burst_adapter use opencores_spi_standalone_altera_merlin_burst_adapter_181.altera_merlin_burst_adapter;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.cmd_demux use opencores_spi_standalone_altera_merlin_demultiplexer_181.opencores_spi_standalone_altera_merlin_demultiplexer_181_3wh45wq;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.cmd_mux use opencores_spi_standalone_altera_merlin_multiplexer_181.opencores_spi_standalone_altera_merlin_multiplexer_181_n3vffxi;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.cmd_mux_001 use opencores_spi_standalone_altera_merlin_multiplexer_181.opencores_spi_standalone_altera_merlin_multiplexer_181_n3vffxi;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.cmd_mux_002 use opencores_spi_standalone_altera_merlin_multiplexer_181.opencores_spi_standalone_altera_merlin_multiplexer_181_n3vffxi;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.cmd_mux_003 use opencores_spi_standalone_altera_merlin_multiplexer_181.opencores_spi_standalone_altera_merlin_multiplexer_181_n3vffxi;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.cmd_mux_004 use opencores_spi_standalone_altera_merlin_multiplexer_181.opencores_spi_standalone_altera_merlin_multiplexer_181_n3vffxi;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.cmd_mux_005 use opencores_spi_standalone_altera_merlin_multiplexer_181.opencores_spi_standalone_altera_merlin_multiplexer_181_n3vffxi;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.cmd_mux_006 use opencores_spi_standalone_altera_merlin_multiplexer_181.opencores_spi_standalone_altera_merlin_multiplexer_181_n3vffxi;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.rsp_demux use opencores_spi_standalone_altera_merlin_demultiplexer_181.opencores_spi_standalone_altera_merlin_demultiplexer_181_n22n4ua;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.rsp_demux_001 use opencores_spi_standalone_altera_merlin_demultiplexer_181.opencores_spi_standalone_altera_merlin_demultiplexer_181_n22n4ua;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.rsp_demux_002 use opencores_spi_standalone_altera_merlin_demultiplexer_181.opencores_spi_standalone_altera_merlin_demultiplexer_181_n22n4ua;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.rsp_demux_003 use opencores_spi_standalone_altera_merlin_demultiplexer_181.opencores_spi_standalone_altera_merlin_demultiplexer_181_n22n4ua;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.rsp_demux_004 use opencores_spi_standalone_altera_merlin_demultiplexer_181.opencores_spi_standalone_altera_merlin_demultiplexer_181_n22n4ua;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.rsp_demux_005 use opencores_spi_standalone_altera_merlin_demultiplexer_181.opencores_spi_standalone_altera_merlin_demultiplexer_181_n22n4ua;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.rsp_demux_006 use opencores_spi_standalone_altera_merlin_demultiplexer_181.opencores_spi_standalone_altera_merlin_demultiplexer_181_n22n4ua;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.rsp_mux use opencores_spi_standalone_altera_merlin_multiplexer_181.opencores_spi_standalone_altera_merlin_multiplexer_181_hw72j2y;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.avalon_st_adapter use opencores_spi_standalone_altera_avalon_st_adapter_181.opencores_spi_standalone_altera_avalon_st_adapter_181_awjdnay;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.avalon_st_adapter_001 use opencores_spi_standalone_altera_avalon_st_adapter_181.opencores_spi_standalone_altera_avalon_st_adapter_181_awjdnay;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.avalon_st_adapter_002 use opencores_spi_standalone_altera_avalon_st_adapter_181.opencores_spi_standalone_altera_avalon_st_adapter_181_awjdnay;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.avalon_st_adapter_003 use opencores_spi_standalone_altera_avalon_st_adapter_181.opencores_spi_standalone_altera_avalon_st_adapter_181_awjdnay;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.avalon_st_adapter_004 use opencores_spi_standalone_altera_avalon_st_adapter_181.opencores_spi_standalone_altera_avalon_st_adapter_181_awjdnay;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.avalon_st_adapter_005 use opencores_spi_standalone_altera_avalon_st_adapter_181.opencores_spi_standalone_altera_avalon_st_adapter_181_awjdnay;
		instance opencores_spi_standalone_altera_mm_interconnect_181_tt5wkpa.avalon_st_adapter_006 use opencores_spi_standalone_altera_avalon_st_adapter_181.opencores_spi_standalone_altera_avalon_st_adapter_181_awjdnay;
endconfig
