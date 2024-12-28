library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.PacketType.all;

entity PacketProcessor is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- The master will start generating data from the C_M_START_DATA_VALUE value
		C_M_START_DATA_VALUE	: std_logic_vector	:= x"00000000";
		-- The master requires a target slave base address.
		-- The master will initiate read and write transactions on the slave with base address specified here as a parameter.
		C_M_TARGET_SLAVE_BASE_ADDR	: std_logic_vector	:= x"00000000";
		-- Width of M_AXI address bus. 
		-- The master generates the read and write addresses of width specified as C_M_AXI_ADDR_WIDTH.
		C_M_AXI_ADDR_WIDTH	: integer range 8 to 32 := 32;
		-- Width of M_AXI data bus. 
		-- The master issues write data and accept read data where the width of the data bus is C_M_AXI_DATA_WIDTH
		C_M_AXI_DATA_WIDTH	: integer range 16 to 1024 := 32
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line

		-- AXI clock signal
		M_AXI_ACLK	: in std_logic;
		-- AXI active low reset signal
		M_AXI_ARESETN	: in std_logic;
		-- Master Interface Write Address Channel ports. Write address (issued by master)
		M_AXI_AWADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
		-- Write channel Protection type.
		-- This signal indicates the privilege and security level of the transaction,
		-- and whether the transaction is a data access or an instruction access.
		M_AXI_AWPROT	: out std_logic_vector(2 downto 0) := (others => '0');
		-- Write address valid. 
		-- This signal indicates that the master signaling valid write address and control information.
		M_AXI_AWVALID	: out std_logic := '0';
		-- Write address ready. 
		-- This signal indicates that the slave is ready to accept an address and associated control signals.
		M_AXI_AWREADY	: in std_logic;
		-- Master Interface Write Data Channel ports. Write data (issued by master)
		M_AXI_WDATA	: out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		-- Write strobes. 
		-- This signal indicates which byte lanes hold valid data.
		-- There is one write strobe bit for each eight bits of the write data bus.
		M_AXI_WSTRB	: out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0) := (others => '1');
		-- Write valid. This signal indicates that valid write data and strobes are available.
		M_AXI_WVALID	: out std_logic := '0';
		-- Write ready. This signal indicates that the slave can accept the write data.
		M_AXI_WREADY	: in std_logic;
		-- Master Interface Write Response Channel ports. 
		-- This signal indicates the status of the write transaction.
		M_AXI_BRESP	: in std_logic_vector(1 downto 0);
		-- Write response valid. 
		-- This signal indicates that the channel is signaling a valid write response
		M_AXI_BVALID	: in std_logic;
		-- Response ready. This signal indicates that the master can accept a write response.
		M_AXI_BREADY	: out std_logic := '0';
		-- Master Interface Read Address Channel ports. Read address (issued by master)
		M_AXI_ARADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
		-- Protection type. 
		-- This signal indicates the privilege and security level of the transaction, 
		-- and whether the transaction is a data access or an instruction access.
		M_AXI_ARPROT	: out std_logic_vector(2 downto 0) := (others => '0');
		-- Read address valid. 
		-- This signal indicates that the channel is signaling valid read address and control information.
		M_AXI_ARVALID	: out std_logic := '0';
		-- Read address ready. 
		-- This signal indicates that the slave is ready to accept an address and associated control signals.
		M_AXI_ARREADY	: in std_logic;
		-- Master Interface Read Data Channel ports. Read data (issued by slave)
		M_AXI_RDATA	: in std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
		-- Read response. This signal indicates the status of the read transfer.
		M_AXI_RRESP	: in std_logic_vector(1 downto 0);
		-- Read valid. This signal indicates that the channel is signaling the required read data.
		M_AXI_RVALID	: in std_logic;
		-- Read ready. This signal indicates that the master can accept the read data and response information.
		M_AXI_RREADY	: out std_logic := '0';

		FIFO_OUT_VALID_PACKETS_FULL : in std_logic;
		FIFO_OUT_VALID_PACKETS_WR_DATA : out STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0) := (others => '0');
		FIFO_OUT_VALID_PACKETS_WR_EN : out std_logic := '0';

		FIFO_IN_RETURN_PACKETS_EMPTY : in std_logic;
		FIFO_IN_RETURN_PACKETS_RD_DATA : in STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0);
		FIFO_IN_RETURN_PACKETS_RD_EN : out std_logic := '0';

		-- Debug signals
		DBG_PACKETSTATE : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_INCPACKETBUFFER : out STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0) := (others => '0')
		);
end PacketProcessor;

architecture implementation of PacketProcessor is

	ATTRIBUTE X_INTERFACE_INFO : STRING;

	ATTRIBUTE X_INTERFACE_INFO of FIFO_IN_RETURN_PACKETS_RD_DATA: SIGNAL is "xilinx.com:interface:fifo_read:1.0 FIFO_IN_RETURN_PACKETS RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of FIFO_IN_RETURN_PACKETS_RD_EN: SIGNAL is "xilinx.com:interface:fifo_read:1.0 FIFO_IN_RETURN_PACKETS RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of FIFO_IN_RETURN_PACKETS_EMPTY: SIGNAL is "xilinx.com:interface:fifo_read:1.0 FIFO_IN_RETURN_PACKETS EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of FIFO_OUT_VALID_PACKETS_WR_DATA: SIGNAL is "xilinx.com:interface:fifo_write:1.0 FIFO_OUT_VALID_PACKETS WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of FIFO_OUT_VALID_PACKETS_WR_EN: SIGNAL is "xilinx.com:interface:fifo_write:1.0 FIFO_OUT_VALID_PACKETS WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of FIFO_OUT_VALID_PACKETS_FULL: SIGNAL is "xilinx.com:interface:fifo_write:1.0 FIFO_OUT_VALID_PACKETS FULL";

	-- Example State machine to initialize counter, initialize write transactions, 
	-- initialize read transactions and comparison of read data with the 
	-- written data words.
	type packetProcessorState is ( PACKETPROC_INITSTATE, -- 0
								PACKETPROC_CHECK_RETURN_QUEUE, -- 1

								PACKETPROC_RETQUEUE_CALCCHECKSUM, -- 2
								PACKETPROC_RETQUEUE_CHECK_UART_READY, -- 3
								PACKETPROC_RETQUEUE_UART_SEND, -- 4

								PACKETPROC_RECV_CHECK_UART_READY, -- 5
								PACKETPROC_RECV_UART_RECV, -- 6
								PACKETPROC_RECV_UART_VALIDATE_PACKET, -- 7
								PACKETPROC_RECV_SEND_VALIDATED_PACKET -- 8
								);

	constant UART_STATUS_RX_FIFO_VALID_DATA : unsigned := X"00000001";
	constant UART_STATUS_RX_FIFO_IS_FULL : unsigned := X"00000002";
	constant UART_STATUS_TX_FIFO_IS_EMPTY : unsigned := X"00000004";
	constant UART_STATUS_TX_FIFO_IS_FULL : unsigned := X"00000008";

	signal mst_packet_state : packetProcessorState := PACKETPROC_INITSTATE;
	signal has_new_read_data : std_logic := '0';
	signal writer_has_consumed_data : std_logic := '0';
	signal partialPacketBuffer : packetBytesArray := (others => (others => '0') );
	signal lastReadData : STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
	signal writerDataCopy : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal lastReadStatusReg : STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
	signal sendSizeBytes : unsigned(7 downto 0) := (others => '0');

	-- AXI4LITE signals
	--write address valid
	signal axi_awvalid	: std_logic := '0';
	--write data valid
	signal axi_wvalid	: std_logic := '0';
	--read address valid
	signal axi_arvalid	: std_logic := '0';
	--read data acceptance
	signal axi_rready	: std_logic := '0';
	--write response acceptance
	signal axi_bready	: std_logic := '0';
	--write address
	signal axi_awaddr	: std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0) := x"00000000";
	--write data
	signal axi_wdata	: std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0) := x"00000000";
	--read addresss
	signal axi_araddr	: std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0) := x"00000000";
	--Asserts when there is a write response error
	signal write_resp_error	: std_logic := '0';
	--Asserts when there is a read response error
	signal read_resp_error	: std_logic := '0';
	--A pulse to initiate a write transaction
	signal start_single_write	: std_logic := '0';
	--A pulse to initiate a read transaction
	signal start_single_read	: std_logic := '0';
	--Asserts when a single beat write transaction is issued and remains asserted till the completion of write trasaction.
	signal write_issued	: std_logic := '0';
	--Asserts when a single beat read transaction is issued and remains asserted till the completion of read trasaction.
	signal read_issued	: std_logic := '0';
	--Flag marks the completion of comparison of the read data with the expected read data
	signal compare_done	: std_logic := '0';
	--This flag is asserted when there is a mismatch of the read data with the expected read data.
	signal read_mismatch	: std_logic := '0';


	-- Output validated packets FIFO signals
	signal validated_packet_data : STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0) := (others => '0');
	signal validated_packet_wr_en : std_logic := '0';

	-- Output for return packet FIFO signal
	signal return_packet_rd_en : std_logic := '0';

begin
	-- I/O Connections assignments

	--Adding the offset address to the base addr of the slave
	M_AXI_AWADDR	<= axi_awaddr;
	--AXI 4 write data
	M_AXI_WDATA	<= axi_wdata;
	M_AXI_AWPROT	<= "000";
	M_AXI_AWVALID	<= axi_awvalid;
	--Write Data(W)
	M_AXI_WVALID	<= axi_wvalid;
	--Set all byte strobes in this example
	M_AXI_WSTRB	<= "1111";
	--Write Response (B)
	M_AXI_BREADY	<= axi_bready;
	--Read Address (AR)
	M_AXI_ARADDR	<= axi_araddr;
	M_AXI_ARVALID	<= axi_arvalid;
	M_AXI_ARPROT	<= "001";
	--Read and Read Response (R)
	M_AXI_RREADY	<= axi_rready;

	--Flag write errors                                                    
	write_resp_error <= (axi_bready and M_AXI_BVALID and M_AXI_BRESP(1));
                                                                                                                              
	--Flag write errors                                                     
	read_resp_error <= (axi_rready and M_AXI_RVALID and M_AXI_RRESP(1));  

	-- Output validated packets FIFO signals:
	FIFO_OUT_VALID_PACKETS_WR_DATA <= validated_packet_data;
	FIFO_OUT_VALID_PACKETS_WR_EN <= validated_packet_wr_en;

	-- Outputs for incoming return packets FIFO signal:
	FIFO_IN_RETURN_PACKETS_RD_EN <= return_packet_rd_en;

	DBG_PACKETSTATE <= std_logic_vector(to_unsigned(packetProcessorState'pos(mst_packet_state), 8) );
	DBG_INCPACKETBUFFER <= partialPacketBuffer(10) & partialPacketBuffer(9) & partialPacketBuffer(8) & partialPacketBuffer(7) & partialPacketBuffer(6) &
							partialPacketBuffer(5) & partialPacketBuffer(4) & partialPacketBuffer(3) & partialPacketBuffer(2) & partialPacketBuffer(1) & partialPacketBuffer(0);

	----------------------
	--Write Address Channel
	----------------------

	-- The purpose of the write address channel is to request the address and 
	-- command information for the entire transaction.  It is a single beat
	-- of information.

	-- Note for this example the axi_awvalid/axi_wvalid are asserted at the same
	-- time, and then each is deasserted independent from each other.
	-- This is a lower-performance, but simplier control scheme.

	-- AXI VALID signals must be held active until accepted by the partner.

	-- A data transfer is accepted by the slave when a master has
	-- VALID data and the slave acknoledges it is also READY. While the master
	-- is allowed to generated multiple, back-to-back requests by not 
	-- deasserting VALID, this design will add rest cycle for
	-- simplicity.

	-- Since only one outstanding transaction is issued by the user design,
	-- there will not be a collision between a new request and an accepted
	-- request on the same clock cycle.                                                                                                                                            
                                                                 


	------------------------------
	--Write Response (B) Channel
	------------------------------

	--The write response channel provides feedback that the write has committed
	--to memory. BREADY will occur after both the data and the write address
	--has arrived and been accepted by the slave, and can guarantee that no
	--other accesses launched afterwards will be able to be reordered before it.

	--The BRESP bit [1] is used indicate any errors from the interconnect or
	--slave for the entire write burst. This example will capture the error.

	--While not necessary per spec, it is advisable to reset READY signals in
	--case of differing reset latencies between master/slave.

	process(M_AXI_ACLK)                                            
	begin                                                                
		if (rising_edge (M_AXI_ACLK)) then                                 
			if (M_AXI_ARESETN = '0') then                                   
				axi_bready <= '0';                                             
			else                                                             
				if (M_AXI_BVALID = '1' and axi_bready = '0') then              
					-- accept/acknowledge bresp with axi_bready by the master    
					-- when M_AXI_BVALID is asserted by slave                    
					axi_bready <= '1';                                          
				elsif (axi_bready = '1') then                                  
					-- deassert after one clock cycle                            
					axi_bready <= '0';                                           
				end if;                                                        
			end if;                                                          
		end if;                                                            
	end process;

	process(M_AXI_ACLK)
	begin
		if (rising_edge(M_AXI_ACLK) ) then
			if (M_AXI_ARESETN = '0') then
				mst_packet_state <= PACKETPROC_INITSTATE;
			else
				case (mst_packet_state) is
					when PACKETPROC_INITSTATE =>
						return_packet_rd_en <= '0';
						axi_awvalid <= '0';
						axi_wvalid <= '0';
						axi_rready <= '0';
						axi_arvalid <= '0';
						validated_packet_wr_en <= '0';
						mst_packet_state <= PACKETPROC_CHECK_RETURN_QUEUE;

					when PACKETPROC_CHECK_RETURN_QUEUE =>
						if (FIFO_IN_RETURN_PACKETS_EMPTY = '0') then
							return_packet_rd_en <= '1';
							for byte in 0 to PACKET_SIZE_IN_BYTES-1 loop
								partialPacketBuffer(byte) <= FIFO_IN_RETURN_PACKETS_RD_DATA( ( (byte + 1) * 8 - 1) downto (byte * 8) );
							end loop;
							mst_packet_state <= PACKETPROC_RETQUEUE_CALCCHECKSUM;
						else
							return_packet_rd_en <= '0';
							mst_packet_state <= PACKETPROC_RECV_CHECK_UART_READY;
						end if;

					when PACKETPROC_RETQUEUE_CALCCHECKSUM =>
						return_packet_rd_en <= '0'; -- Deassert the FIFO rd_en signal after one clock cycle
						partialPacketBuffer(1) <= std_logic_vector(ComputePacketChecksum(partialPacketBuffer(0), partialPacketBuffer(2), 
							partialPacketBuffer(3) & partialPacketBuffer(4) & partialPacketBuffer(5) & partialPacketBuffer(6), 
							partialPacketBuffer(7) & partialPacketBuffer(8) & partialPacketBuffer(9) & partialPacketBuffer(10) ) );
						sendSizeBytes <= to_unsigned(PACKET_SIZE_IN_BYTES, 8);
						mst_packet_state <= PACKETPROC_RETQUEUE_CHECK_UART_READY;

					when PACKETPROC_RETQUEUE_CHECK_UART_READY =>
						axi_araddr <= x"00000008"; -- Address 0x08 is the status register
						if (M_AXI_RVALID = '1' and axi_rready = '1') then
							lastReadStatusReg <= M_AXI_RDATA;
							axi_rready <= '0';
							axi_arvalid <= '0';
							if ( (unsigned(M_AXI_RDATA) and UART_STATUS_TX_FIFO_IS_FULL) = to_unsigned(0, 8) ) then -- Wait for TX FIFO to not be full before sending more return packet data
								mst_packet_state <= PACKETPROC_RETQUEUE_UART_SEND;
							end if;
						else
							axi_rready <= '1';
							axi_arvalid <= '1';
						end if;

					when PACKETPROC_RETQUEUE_UART_SEND =>
						if (M_AXI_WREADY = '1' and axi_wvalid = '1') then
							axi_awvalid <= '0'; -- Deassert after one clock cycle
							axi_wvalid <= '0';
							if (sendSizeBytes = 1) then
								sendSizeBytes <= to_unsigned(0, 8);
								mst_packet_state <= PACKETPROC_CHECK_RETURN_QUEUE; -- Done sending our return packet! Back to the main loop!
							else
								sendSizeBytes <= sendSizeBytes - 1;
								for byte in 0 to PACKET_SIZE_IN_BYTES-2 loop
									partialPacketBuffer(byte) <= partialPacketBuffer(byte + 1);
								end loop;
								partialPacketBuffer(PACKET_SIZE_IN_BYTES-1) <= (others => '0'); -- Zero out the final byte
								mst_packet_state <= PACKETPROC_RETQUEUE_CHECK_UART_READY;
							end if;
						else
							axi_awaddr <= x"00000004"; -- Address 0x04 is the TX FIFO
							axi_wdata <= "000000000000000000000000" & partialPacketBuffer(0); -- UART ignores the upper 24 bits
							axi_awvalid <= '1';
							axi_wvalid <= '1';
						end if;

					when PACKETPROC_RECV_CHECK_UART_READY =>
						axi_araddr <= x"00000008"; -- Address 0x08 is the status register
						if (M_AXI_RVALID = '1' and axi_rready = '1') then
							lastReadStatusReg <= M_AXI_RDATA;
							axi_rready <= '0';
							axi_arvalid <= '0';
							if ( (unsigned(M_AXI_RDATA) and UART_STATUS_RX_FIFO_VALID_DATA) /= to_unsigned(0, 8) ) then -- Wait for RX FIFO to have data in it before continuing
								mst_packet_state <= PACKETPROC_RECV_UART_RECV;
							else
								mst_packet_state <= PACKETPROC_CHECK_RETURN_QUEUE; -- No data, go back to the main loop!
							end if;
						else
							axi_rready <= '1';
							axi_arvalid <= '1';
						end if;

					when PACKETPROC_RECV_UART_RECV =>
						axi_araddr <= x"00000000"; -- Address 0x00 is the RX FIFO
						if (M_AXI_RVALID = '1' and axi_rready = '1') then
							axi_rready <= '0'; -- Deassert after one clock cycle
							axi_arvalid <= '0';
							for byte in 0 to PACKET_SIZE_IN_BYTES-2 loop
								partialPacketBuffer(byte) <= partialPacketBuffer(byte + 1);
							end loop;
							partialPacketBuffer(PACKET_SIZE_IN_BYTES-1) <= M_AXI_RDATA(7 downto 0); -- Read our new packet data
							mst_packet_state <= PACKETPROC_RECV_UART_VALIDATE_PACKET;
						else
							axi_rready <= '1';
							axi_arvalid <= '1';
						end if;

					when PACKETPROC_RECV_UART_VALIDATE_PACKET =>
						if (IsPacketDataValid(partialPacketBuffer(0), partialPacketBuffer(1), partialPacketBuffer(2), 
							partialPacketBuffer(3) & partialPacketBuffer(4) & partialPacketBuffer(5) & partialPacketBuffer(6), 
							partialPacketBuffer(7) & partialPacketBuffer(8) & partialPacketBuffer(9) & partialPacketBuffer(10) ) = '1') then -- Sweet, a complete and valid packet!

							validated_packet_data <= partialPacketBuffer(10) & partialPacketBuffer(9) & partialPacketBuffer(8) & partialPacketBuffer(7) & partialPacketBuffer(6) &
								partialPacketBuffer(5) & partialPacketBuffer(4) & partialPacketBuffer(3) & partialPacketBuffer(2) & partialPacketBuffer(1) & partialPacketBuffer(0);
							mst_packet_state <= PACKETPROC_RECV_SEND_VALIDATED_PACKET;
						else -- else, we must have an incomplete packet or an invalid packet
							mst_packet_state <= PACKETPROC_CHECK_RETURN_QUEUE; -- Go back to the main update loop
						end if;

					when PACKETPROC_RECV_SEND_VALIDATED_PACKET =>
						if (FIFO_OUT_VALID_PACKETS_FULL = '0') then -- Stall on the output validated packets FIFO being full (this should never happen since it's 512-deep and our UART FIFO is only 16 bytes)
							if (validated_packet_wr_en = '1') then
								validated_packet_data <= (others => '0');
								validated_packet_wr_en <= '0'; -- Deassert after one clock cycle
								mst_packet_state <= PACKETPROC_CHECK_RETURN_QUEUE;
							else
								validated_packet_wr_en <= '1';
							end if;

						end if;
				end case;
			end if;
		end if;
	end process;

end implementation;
