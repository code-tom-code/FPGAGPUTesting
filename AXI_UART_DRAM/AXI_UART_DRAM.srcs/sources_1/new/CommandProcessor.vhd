library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.PacketType.all;

entity CommandProcessor is
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
		C_M_AXI_ADDR_WIDTH	: integer	:= 30;
		-- Width of M_AXI data bus. 
    -- The master issues write data and accept read data where the width of the data bus is C_M_AXI_DATA_WIDTH
		C_M_AXI_DATA_WIDTH	: integer	:= 256
	);
    Port ( 
		-- AXI clock signal
		M_AXI_ACLK	: in std_logic;
		-- AXI active low reset signal
		M_AXI_ARESETN	: in std_logic;
		-- Master Interface Write Address Channel ports. Write address (issued by master)
		M_AXI_AWADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
		-- Write channel Protection type.
    -- This signal indicates the privilege and security level of the transaction,
    -- and whether the transaction is a data access or an instruction access.
		M_AXI_AWPROT	: out std_logic_vector(2 downto 0);
		-- Write address valid. 
    -- This signal indicates that the master signaling valid write address and control information.
		M_AXI_AWVALID	: out std_logic;
		-- Write address ready. 
    -- This signal indicates that the slave is ready to accept an address and associated control signals.
		M_AXI_AWREADY	: in std_logic;
		-- Master Interface Write Data Channel ports. Write data (issued by master)
		M_AXI_WDATA	: out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
		-- Write strobes. 
    -- This signal indicates which byte lanes hold valid data.
    -- There is one write strobe bit for each eight bits of the write data bus.
		M_AXI_WSTRB	: out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
		-- Write valid. This signal indicates that valid write data and strobes are available.
		M_AXI_WVALID	: out std_logic;
		-- Write ready. This signal indicates that the slave can accept the write data.
		M_AXI_WREADY	: in std_logic;
		-- Master Interface Write Response Channel ports. 
    -- This signal indicates the status of the write transaction.
		M_AXI_BRESP	: in std_logic_vector(1 downto 0);
		-- Write response valid. 
    -- This signal indicates that the channel is signaling a valid write response
		M_AXI_BVALID	: in std_logic;
		-- Response ready. This signal indicates that the master can accept a write response.
		M_AXI_BREADY	: out std_logic;
		-- Master Interface Read Address Channel ports. Read address (issued by master)
		M_AXI_ARADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
		-- Protection type. 
    -- This signal indicates the privilege and security level of the transaction, 
    -- and whether the transaction is a data access or an instruction access.
		M_AXI_ARPROT	: out std_logic_vector(2 downto 0);
		-- Read address valid. 
    -- This signal indicates that the channel is signaling valid read address and control information.
		M_AXI_ARVALID	: out std_logic;
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
		M_AXI_RREADY	: out std_logic;

		-- AXI4 Full signals that don't exist in AXI4 Lite
		M_AXI_ARBURST : out std_logic_vector(1 downto 0);
		M_AXI_ARCACHE : out std_logic_vector(3 downto 0);
		M_AXI_ARLEN : out std_logic_vector(7 downto 0);
		M_AXI_ARLOCK : out std_logic;
		M_AXI_ARSIZE : out std_logic_vector(2 downto 0);

		M_AXI_AWBURST : out std_logic_vector(1 downto 0);
		M_AXI_AWCACHE : out std_logic_vector(3 downto 0);
		M_AXI_AWLEN : out std_logic_vector(7 downto 0);
		M_AXI_AWLOCK : out std_logic;
		M_AXI_AWSIZE : out std_logic_vector(2 downto 0);

		M_AXI_RLAST : in std_logic;
		M_AXI_WLAST : out std_logic;

		-- Valid packets FIFO inputs:
        validPacketsFIFO_dout : in STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0);
        validPacketsFIFO_empty : in STD_LOGIC;
        validPacketsFIFO_rd_en : out STD_LOGIC;

		-- Return packet FIFO outputs:
		returnPacketsFIFO_full : in STD_LOGIC;
		returnPacketsFIFO_din : out STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0);
		returnPacketsFIFO_wr_en : out STD_LOGIC;

		-- Debug signals
		DBG_CMDPACKETSTATE : out STD_LOGIC_VECTOR(7 downto 0);
		DBG_READERSTATE : out STD_LOGIC_VECTOR(7 downto 0);
		DBG_WRITERSTATE : out STD_LOGIC_VECTOR(7 downto 0);

		DBG_AXI_AWREADY : out std_logic;
		DBG_AXI_WREADY : out std_logic;
		DBG_AXI_AWVALID : out std_logic;
		DBG_AXI_WVALID : out std_logic;

		DBG_LAST_IN_PACKET : out STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0);
		DBG_LAST_OUT_PACKET : out STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0);

		DBG_LAST_READ_DATA : out STD_LOGIC_VECTOR(31 downto 0);

		DBG_LAST_WRITE_ADDR : out STD_LOGIC_VECTOR(31 downto 0);
		DBG_LAST_WRITE_DATA : out STD_LOGIC_VECTOR(31 downto 0)
		);
end CommandProcessor;

architecture Behavioral of CommandProcessor is

	-- Example State machine to initialize counter, initialize write transactions, 
	-- initialize read transactions and comparison of read data with the 
	-- written data words.
	type writerState is ( WRITERINITSTATE, -- 0
	                 WRITER_WAIT_FOR_NEW_DATA, -- 1
					 WRITER_ACK_NEW_DATA, -- 2
	                 WRITER_SEND_DATA_STATE -- 3
					 );
	                 
	type readerState is ( READERINITSTATE, -- 0
	                       READER_WAIT_FOR_MEM_READY, -- 1
	                       READER_WRITE_AND_CHECK_STATUS -- 2
						   );

	type packetState is ( PACKETINITSTATE, -- 0
						READ_NEXT_PACKET_FROM_FIFO, -- 1
						DECODE_NEW_PACKET, -- 2

						DONOTHING_PACKET, -- 3

						WRITEMEM_PACKET, -- 4
						WRITEMEM_WAIT_FOR_WRITE_ACK, -- 5

						READMEM_PACKET, -- 6
						READMEM_WAIT_FOR_READ_DATA, -- 7
						READMEM_PUSH_TO_OUT_FIFO, -- 8
						READMEM_WAIT_FOR_OUT_FIFO_ACK -- 9
						);

	signal mst_write_state  : writerState := WRITERINITSTATE;
	signal mst_read_state  : readerState := READERINITSTATE;
	signal mst_packet_state : packetState := PACKETINITSTATE;
	signal has_new_read_data : std_logic := '0';
	signal writer_has_consumed_data : std_logic := '0';
	signal lastReadData : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

	signal localIncomingPacket : genericPacket; -- Incoming request packet from the CPU to the FPGA
	signal localOutgoingPacket : genericPacket; -- Outgoing response packet to the CPU from the FPGA

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
	signal axi_awaddr	: std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
	--write data
	signal axi_wdata	: std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
	--read addresss
	signal axi_araddr	: std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
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


	signal newWriteEnable : std_logic := '0'; -- Written to by the packet processor process, read from by the AXI write process
	signal newWriteAck : std_logic := '0'; -- Written to by the AXI write process, read by the packet processor process
	signal newWriteAddr : unsigned(29 downto 0) := to_unsigned(0, 30); -- Written to by the packet processor process, read from by the AXI write process
	signal newWriteData : std_logic_vector(31 downto 0) := (others => '0'); -- Written to by the packet processor process, read from by the AXI write process
	signal readyForNewWrite : std_logic := '0'; -- Written to by the AXI write process when it's ready for another new write, read from by the packet processor process

	signal newReadEnable : std_logic := '0'; -- Written to by the packet processor process, read from by the AXI read process
	signal newReadAddr : unsigned(31 downto 0) := to_unsigned(0, 32); -- Written to by the packet processor process, read from by the AXI read process
	signal newReadData : std_logic_vector(31 downto 0) := (others => '0'); -- Written to by the AXI read process, read from by the packet processor process
	signal newReadDataReady : std_logic := '0'; -- Written to by the AXI read process, read from by the packet processor process
	signal readyForNewRead : std_logic := '0'; -- Written to by the AXI read process, read from by the packet processor process

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
	M_AXI_WSTRB	<= (others => '1');
	--Write Response (B)
	M_AXI_BREADY	<= axi_bready;
	--Read Address (AR)
	M_AXI_ARADDR	<= axi_araddr;
	M_AXI_ARVALID	<= axi_arvalid;
	M_AXI_ARPROT	<= "001";
	--Read and Read Response (R)
	M_AXI_RREADY	<= axi_rready;

	-- AXI4 Full constants that don't exist in AXI4 Lite
	M_AXI_ARBURST <= "00"; -- FIXED = 0b00
	M_AXI_ARCACHE <= "0000"; -- Normal Non-cacheable Non-bufferable
	M_AXI_ARLEN <= x"00"; -- Sets a burst length of 1
	M_AXI_ARLOCK <= '0'; -- Never lock
	M_AXI_ARSIZE <= "101"; -- 32 byte transfers for 256 bit wide data (change this to "010" for AXI4Lite which transfers at 32 bits)

	M_AXI_AWBURST <= "00"; -- FIXED = 0b00
	M_AXI_AWCACHE <= "0000"; -- Normal Non-cacheable Non-bufferable
	M_AXI_AWLEN <= x"00"; -- Sets a burst length of 1
	M_AXI_AWLOCK <= '0';
	M_AXI_AWSIZE <= "101"; -- 32 byte transfers for 256 bit wide data (change this to "010" for AXI4Lite which transfers at 32 bits)

	M_AXI_WLAST <= '1'; -- Since we have a burst length of 1, we are always finishing a burst


	--Flag write errors                                                    
	write_resp_error <= (axi_bready and M_AXI_BVALID and M_AXI_BRESP(1));
                                                                                                                            
	--Flag write errors                                                     
	read_resp_error <= (axi_rready and M_AXI_RVALID and M_AXI_RRESP(1));  

	DBG_CMDPACKETSTATE <= std_logic_vector(to_unsigned(packetState'pos(mst_packet_state), 8) );
	DBG_READERSTATE <= std_logic_vector(to_unsigned(readerState'pos(mst_read_state), 8) );
	DBG_WRITERSTATE <= std_logic_vector(to_unsigned(writerState'pos(mst_write_state), 8) );

	DBG_AXI_AWREADY <= M_AXI_AWREADY;
	DBG_AXI_WREADY <= M_AXI_WREADY;
	DBG_AXI_AWVALID <= axi_awvalid;
	DBG_AXI_WVALID <= axi_wvalid;

	DBG_LAST_IN_PACKET <= std_logic_vector(localIncomingPacket.magicByte) & std_logic_vector(localIncomingPacket.checksum) & std_logic_vector(localIncomingPacket.packetTypeByte) & std_logic_vector(localIncomingPacket.payload0) & std_logic_vector(localIncomingPacket.payload1);
	DBG_LAST_OUT_PACKET <= std_logic_vector(localOutgoingPacket.magicByte) & std_logic_vector(localOutgoingPacket.checksum) & std_logic_vector(localOutgoingPacket.packetTypeByte) & std_logic_vector(localOutgoingPacket.payload0) & std_logic_vector(localOutgoingPacket.payload1);

	DBG_LAST_READ_DATA <= newReadData;

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

	-- Packet state machine
	process(M_AXI_ACLK)
	begin
		if (rising_edge(M_AXI_ACLK) ) then
			if (M_AXI_ARESETN = '0' ) then
				mst_packet_state <= PACKETINITSTATE;
			else
				case (mst_packet_state) is
					when PACKETINITSTATE =>
						validPacketsFIFO_rd_en <= '0';
						returnPacketsFIFO_wr_en <= '0';
						returnPacketsFIFO_din <= (others => '0');
						newWriteEnable <= '0';
						newWriteAddr <= (others => '0');
						newWriteData <= (others => '0');
						newReadEnable <= '0';

						localIncomingPacket.magicByte <= X"00";
						localIncomingPacket.checksum <= X"00";
						localIncomingPacket.packetTypeByte <= X"00";
						localIncomingPacket.payload0 <= X"00000000";
						localIncomingPacket.payload1 <= X"00000000";

						localOutgoingPacket.magicByte <= X"00";
						localOutgoingPacket.checksum <= X"00";
						localOutgoingPacket.packetTypeByte <= X"00";
						localOutgoingPacket.payload0 <= X"00000000";
						localOutgoingPacket.payload1 <= X"00000000";

						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

					when READ_NEXT_PACKET_FROM_FIFO =>
						if (validPacketsFIFO_empty = '0') then
							localIncomingPacket.magicByte <= unsigned(validPacketsFIFO_dout(8*1-1 downto 8*0) );
							localIncomingPacket.checksum <= unsigned(validPacketsFIFO_dout(8*2-1 downto 8*1) );
							localIncomingPacket.packetTypeByte <= unsigned(validPacketsFIFO_dout(8*3-1 downto 8*2) );
							localIncomingPacket.payload0 <= unsigned(validPacketsFIFO_dout(8*7-1 downto 8*6) ) & unsigned(validPacketsFIFO_dout(8*6-1 downto 8*5) ) & unsigned(validPacketsFIFO_dout(8*5-1 downto 8*4) ) & unsigned(validPacketsFIFO_dout(8*4-1 downto 8*3) );
							localIncomingPacket.payload1 <= unsigned(validPacketsFIFO_dout(8*11-1 downto 8*10) ) & unsigned(validPacketsFIFO_dout(8*10-1 downto 8*9) ) & unsigned(validPacketsFIFO_dout(8*9-1 downto 8*8) ) & unsigned(validPacketsFIFO_dout(8*8-1 downto 8*7) );

							validPacketsFIFO_rd_en <= '1';

							mst_packet_state <= DECODE_NEW_PACKET;
						end if;

					when DECODE_NEW_PACKET =>
						validPacketsFIFO_rd_en <= '0';

						case (localIncomingPacket.packetTypeByte) is
							when to_unsigned(packetType'pos(PT_DONOTHING), 8) =>
								mst_packet_state <= DONOTHING_PACKET;

							when to_unsigned(packetType'pos(PT_WRITEMEM), 8) =>
								mst_packet_state <= WRITEMEM_PACKET;

							when to_unsigned(packetType'pos(PT_READMEM), 8) =>
								mst_packet_state <= READMEM_PACKET;

							when others => -- Should never get here since we have a validated packet, but might as well test for it
								mst_packet_state <= DONOTHING_PACKET;
						end case;

					when DONOTHING_PACKET =>
						-- Do nothing, just return to the "get next packet" state
						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

					when WRITEMEM_PACKET =>
						if (readyForNewWrite = '1') then
							-- For write packets, the first padding val is the address
							newWriteAddr <= localIncomingPacket.payload0(29 downto 0); -- For write packets, the address is in the first payload val
							newWriteData <= std_logic_vector(localIncomingPacket.payload1); -- For write packets, the data is in the second payload val
							newWriteEnable <= '1';
							mst_packet_state <= WRITEMEM_WAIT_FOR_WRITE_ACK;
						end if;

					when WRITEMEM_WAIT_FOR_WRITE_ACK =>
						if (newWriteAck = '1') then
							newWriteEnable <= '0';
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						end if;

					when READMEM_PACKET =>
						if (readyForNewRead = '1') then
							-- For read packets, the first payload val is the address
							newReadAddr <= localIncomingPacket.payload0;
							newReadEnable <= '1';
							mst_packet_state <= READMEM_WAIT_FOR_READ_DATA;
						end if;

					when READMEM_WAIT_FOR_READ_DATA =>
						newReadEnable <= '0'; -- Deassert after one cycle
						if (newReadDataReady = '1') then
							localOutgoingPacket.magicByte <= to_unsigned(MAGIC_PACKET_BYTE_VALUE, 8);
							localOutgoingPacket.packetTypeByte <= to_unsigned(packetType'pos(PT_READMEMRESPONSE), 8);
							localOutgoingPacket.payload0 <= localIncomingPacket.payload0;
							localOutgoingPacket.payload1 <= unsigned(newReadData);

							mst_packet_state <= READMEM_PUSH_TO_OUT_FIFO;
						end if;

					when READMEM_PUSH_TO_OUT_FIFO =>
						if (returnPacketsFIFO_full = '0') then
							returnPacketsFIFO_din <= std_logic_vector(localOutgoingPacket.payload1) & std_logic_vector(localOutgoingPacket.payload0) & std_logic_vector(localOutgoingPacket.packetTypeByte) & std_logic_vector(localOutgoingPacket.checksum) & std_logic_vector(localOutgoingPacket.magicByte);
							returnPacketsFIFO_wr_en <= '1';
							mst_packet_state <= READMEM_WAIT_FOR_OUT_FIFO_ACK;
						end if;

					when READMEM_WAIT_FOR_OUT_FIFO_ACK =>
						returnPacketsFIFO_wr_en <= '0'; -- Deassert after one cycle
						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
				end case;
			end if;
		end if;
	end process;
                                                                 


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
			if (M_AXI_ARESETN = '0' ) then
				mst_read_state <= READERINITSTATE;
			else
				case (mst_read_state) is
					when READERINITSTATE =>
						has_new_read_data <= '0';
						lastReadData <= (others => '0');
						axi_araddr <= (others => '0');
						readyForNewRead <= '0';
						newReadDataReady <= '0';
						newReadData <= (others => '0');
						axi_arvalid <= '0';
						axi_rready <= '0';
						mst_read_state <= READER_WAIT_FOR_MEM_READY;
	                   
					when READER_WAIT_FOR_MEM_READY =>
						newReadDataReady <= '0';
						if (newReadEnable = '1' and readyForNewRead = '1') then
							axi_araddr <= std_logic_vector(newReadAddr(29 downto 0) );
							axi_arvalid <= '1';
							readyForNewRead <= '0';
							mst_read_state <= READER_WRITE_AND_CHECK_STATUS;
						else
							axi_rready <= '0';
							axi_arvalid <= '0';
							readyForNewRead <= '1';
						end if;
	                   
					when READER_WRITE_AND_CHECK_STATUS =>
						if (axi_arvalid = '1' and M_AXI_ARREADY = '1') then
							axi_rready <= '1';
							axi_arvalid <= '0';
						end if;
						if (M_AXI_RVALID = '1' and axi_rready = '1') then
							axi_rready <= '0';
							newReadData <= M_AXI_RDATA(31 downto 0);
							newReadDataReady <= '1';
							mst_read_state <= READER_WAIT_FOR_MEM_READY;
						end if;
				end case;
			end if;
		end if;
	end process;
                                                                                                                                           
		                                                                                                      
	                                                         
	--implement master command interface state machine                                           
	MASTER_EXECUTION_PROC:process(M_AXI_ACLK)                                                         
	begin                                                                                             
		if (rising_edge (M_AXI_ACLK)) then                                                              
			if (M_AXI_ARESETN = '0' ) then                                                                
				-- reset condition                                                                          
				-- All the signals are ed default values under reset condition                              
				mst_write_state  <= WRITERINITSTATE;                                                            
			else                                                                                          
				-- state transition                                                                         
				case (mst_write_state) is                                                                    
	                                                                                                    
					when WRITERINITSTATE =>
						start_single_write <= '0';
						axi_awaddr <= (others => '0');
						axi_wdata <= (others => '0');
						M_AXI_WSTRB <= (others => '1');
						write_issued   <= '0';                                                                      
						start_single_read  <= '0';                                                                  
						read_issued  <= '0';                                                                        
						compare_done   <= '0';
						axi_wvalid <= '0';    
						axi_awvalid <= '0';
						DBG_LAST_WRITE_ADDR <= (others => '0');
						DBG_LAST_WRITE_DATA <= (others => '0');
						writer_has_consumed_data <= '0';
						readyForNewWrite <= '1';

						if (M_AXI_ARESETN = '1' ) then
							mst_write_state <= WRITER_WAIT_FOR_NEW_DATA;
						end if;
                   
					when WRITER_WAIT_FOR_NEW_DATA =>
						if (newWriteEnable = '1') then
							readyForNewWrite <= '0';
							newWriteAck <= '1';
							axi_awaddr <= std_logic_vector(newWriteAddr(29 downto 0) );
							axi_wdata <= x"00000000000000000000000000000000000000000000000000000000" & newWriteData;
							DBG_LAST_WRITE_ADDR <= "00" & std_logic_vector(newWriteAddr);
							DBG_LAST_WRITE_DATA <= newWriteData;
							mst_write_state <= WRITER_ACK_NEW_DATA;
						else
							readyForNewWrite <= '1';
						end if;

					when WRITER_ACK_NEW_DATA =>
						newWriteAck <= '0'; -- Signal that we want the "has new read data" flag to be cleared
						M_AXI_WSTRB <= (others => '1'); -- All bytes are valid in this strobe
						axi_awvalid <= '1';
						mst_write_state <= WRITER_SEND_DATA_STATE;
                                 
					when WRITER_SEND_DATA_STATE =>
						if (M_AXI_AWREADY = '1' and axi_awvalid = '1') then
							axi_awvalid <= '0';
							axi_wvalid <= '1';
						end if;
						if (M_AXI_WREADY = '1' and axi_wvalid = '1') then
							axi_awvalid <= '0';
							axi_wvalid <= '0';
							axi_awaddr <= (others => '0');
							axi_wdata <= (others => '0');

							mst_write_state <= WRITER_WAIT_FOR_NEW_DATA;
						end if;
				end case;
			end if;
		end if;
	end process;

end Behavioral;
