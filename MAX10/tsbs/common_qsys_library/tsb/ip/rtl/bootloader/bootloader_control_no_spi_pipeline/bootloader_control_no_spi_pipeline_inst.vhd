	component bootloader_control_no_spi_pipeline is
		port (
			avalon_mm_slave_joint_waitrequest        : out std_logic;                                        -- waitrequest
			avalon_mm_slave_joint_readdata           : out std_logic_vector(31 downto 0);                    -- readdata
			avalon_mm_slave_joint_readdatavalid      : out std_logic;                                        -- readdatavalid
			avalon_mm_slave_joint_burstcount         : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- burstcount
			avalon_mm_slave_joint_writedata          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avalon_mm_slave_joint_address            : in  std_logic_vector(15 downto 0) := (others => 'X'); -- address
			avalon_mm_slave_joint_write              : in  std_logic                     := 'X';             -- write
			avalon_mm_slave_joint_read               : in  std_logic                     := 'X';             -- read
			avalon_mm_slave_joint_byteenable         : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			avalon_mm_slave_joint_debugaccess        : in  std_logic                     := 'X';             -- debugaccess
			avalon_mm_slave_private_waitrequest      : out std_logic;                                        -- waitrequest
			avalon_mm_slave_private_readdata         : out std_logic_vector(31 downto 0);                    -- readdata
			avalon_mm_slave_private_readdatavalid    : out std_logic;                                        -- readdatavalid
			avalon_mm_slave_private_burstcount       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- burstcount
			avalon_mm_slave_private_writedata        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avalon_mm_slave_private_address          : in  std_logic_vector(15 downto 0) := (others => 'X'); -- address
			avalon_mm_slave_private_write            : in  std_logic                     := 'X';             -- write
			avalon_mm_slave_private_read             : in  std_logic                     := 'X';             -- read
			avalon_mm_slave_private_byteenable       : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			avalon_mm_slave_private_debugaccess      : in  std_logic                     := 'X';             -- debugaccess
			boot_loader_enable_and_params_pio_export : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			boot_loader_gpio_out_export              : out std_logic_vector(7 downto 0);                     -- export
			boot_loader_main_nios_pc_monitor_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			boot_loader_timer_irq_irq                : out std_logic;                                        -- irq
			clk_50_clk                               : in  std_logic                     := 'X';             -- clk
			jtag_uart_1_irq_irq                      : out std_logic;                                        -- irq
			main_cpu_reset_pio_in_port               : in  std_logic                     := 'X';             -- in_port
			main_cpu_reset_pio_out_port              : out std_logic;                                        -- out_port
			pio_reset_and_bootloader_request_export  : out std_logic_vector(31 downto 0);                    -- export
			reset_50_reset_n                         : in  std_logic                     := 'X'              -- reset_n
		);
	end component bootloader_control_no_spi_pipeline;

	u0 : component bootloader_control_no_spi_pipeline
		port map (
			avalon_mm_slave_joint_waitrequest        => CONNECTED_TO_avalon_mm_slave_joint_waitrequest,        --             avalon_mm_slave_joint.waitrequest
			avalon_mm_slave_joint_readdata           => CONNECTED_TO_avalon_mm_slave_joint_readdata,           --                                  .readdata
			avalon_mm_slave_joint_readdatavalid      => CONNECTED_TO_avalon_mm_slave_joint_readdatavalid,      --                                  .readdatavalid
			avalon_mm_slave_joint_burstcount         => CONNECTED_TO_avalon_mm_slave_joint_burstcount,         --                                  .burstcount
			avalon_mm_slave_joint_writedata          => CONNECTED_TO_avalon_mm_slave_joint_writedata,          --                                  .writedata
			avalon_mm_slave_joint_address            => CONNECTED_TO_avalon_mm_slave_joint_address,            --                                  .address
			avalon_mm_slave_joint_write              => CONNECTED_TO_avalon_mm_slave_joint_write,              --                                  .write
			avalon_mm_slave_joint_read               => CONNECTED_TO_avalon_mm_slave_joint_read,               --                                  .read
			avalon_mm_slave_joint_byteenable         => CONNECTED_TO_avalon_mm_slave_joint_byteenable,         --                                  .byteenable
			avalon_mm_slave_joint_debugaccess        => CONNECTED_TO_avalon_mm_slave_joint_debugaccess,        --                                  .debugaccess
			avalon_mm_slave_private_waitrequest      => CONNECTED_TO_avalon_mm_slave_private_waitrequest,      --           avalon_mm_slave_private.waitrequest
			avalon_mm_slave_private_readdata         => CONNECTED_TO_avalon_mm_slave_private_readdata,         --                                  .readdata
			avalon_mm_slave_private_readdatavalid    => CONNECTED_TO_avalon_mm_slave_private_readdatavalid,    --                                  .readdatavalid
			avalon_mm_slave_private_burstcount       => CONNECTED_TO_avalon_mm_slave_private_burstcount,       --                                  .burstcount
			avalon_mm_slave_private_writedata        => CONNECTED_TO_avalon_mm_slave_private_writedata,        --                                  .writedata
			avalon_mm_slave_private_address          => CONNECTED_TO_avalon_mm_slave_private_address,          --                                  .address
			avalon_mm_slave_private_write            => CONNECTED_TO_avalon_mm_slave_private_write,            --                                  .write
			avalon_mm_slave_private_read             => CONNECTED_TO_avalon_mm_slave_private_read,             --                                  .read
			avalon_mm_slave_private_byteenable       => CONNECTED_TO_avalon_mm_slave_private_byteenable,       --                                  .byteenable
			avalon_mm_slave_private_debugaccess      => CONNECTED_TO_avalon_mm_slave_private_debugaccess,      --                                  .debugaccess
			boot_loader_enable_and_params_pio_export => CONNECTED_TO_boot_loader_enable_and_params_pio_export, -- boot_loader_enable_and_params_pio.export
			boot_loader_gpio_out_export              => CONNECTED_TO_boot_loader_gpio_out_export,              --              boot_loader_gpio_out.export
			boot_loader_main_nios_pc_monitor_export  => CONNECTED_TO_boot_loader_main_nios_pc_monitor_export,  --  boot_loader_main_nios_pc_monitor.export
			boot_loader_timer_irq_irq                => CONNECTED_TO_boot_loader_timer_irq_irq,                --             boot_loader_timer_irq.irq
			clk_50_clk                               => CONNECTED_TO_clk_50_clk,                               --                            clk_50.clk
			jtag_uart_1_irq_irq                      => CONNECTED_TO_jtag_uart_1_irq_irq,                      --                   jtag_uart_1_irq.irq
			main_cpu_reset_pio_in_port               => CONNECTED_TO_main_cpu_reset_pio_in_port,               --                main_cpu_reset_pio.in_port
			main_cpu_reset_pio_out_port              => CONNECTED_TO_main_cpu_reset_pio_out_port,              --                                  .out_port
			pio_reset_and_bootloader_request_export  => CONNECTED_TO_pio_reset_and_bootloader_request_export,  --  pio_reset_and_bootloader_request.export
			reset_50_reset_n                         => CONNECTED_TO_reset_50_reset_n                          --                          reset_50.reset_n
		);

