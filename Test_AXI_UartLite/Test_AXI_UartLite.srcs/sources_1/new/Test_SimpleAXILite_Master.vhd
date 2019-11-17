library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Test_SimpleAXILite_Master is
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
		C_M_AXI_ADDR_WIDTH	: integer	:= 32;
		-- Width of M_AXI data bus. 
    -- The master issues write data and accept read data where the width of the data bus is C_M_AXI_DATA_WIDTH
		C_M_AXI_DATA_WIDTH	: integer	:= 32;
		-- Transaction number is the number of write 
    -- and read transactions the master will perform as a part of this example memory test.
		C_M_TRANSACTIONS_NUM	: integer	:= 4
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
		M_AXI_RREADY	: out std_logic
	);
end Test_SimpleAXILite_Master;

architecture implementation of Test_SimpleAXILite_Master is

	-- function called clogb2 that returns an integer which has the
	-- value of the ceiling of the log base 2
	function clogb2 (bit_depth : integer) return integer is            
	 	variable depth  : integer := bit_depth;                               
	 	variable count  : integer := 1;                                       
	 begin                                                                   
	 	 for clogb2 in 1 to bit_depth loop  -- Works for up to 32 bit integers
	      if (bit_depth <= 2) then                                           
	        count := 1;                                                      
	      else                                                               
	        if(depth <= 1) then                                              
	 	       count := count;                                                
	 	     else                                                             
	 	       depth := depth / 2;                                            
	          count := count + 1;                                            
	 	     end if;                                                          
	 	   end if;                                                            
	   end loop;                                                             
	   return(count);        	                                              
	 end;                                                                    

	-- Example user application signals

	-- TRANS_NUM_BITS is the width of the index counter for
	-- number of write or read transaction..
	 constant  TRANS_NUM_BITS  : integer := clogb2(C_M_TRANSACTIONS_NUM-1);

	-- Example State machine to initialize counter, initialize write transactions, 
	 -- initialize read transactions and comparison of read data with the 
	 -- written data words.
	 type writerState is ( WRITERINITSTATE,
	                 WAIT_FOR_NEW_READ,
	                 SEND_DATA_STATE	 );
	                 
	 type readerState is ( READERINITSTATE,
	                       WAIT_FOR_RX_STATUS,
	                       CHECK_RX_STATUS,
	                       WAIT_FOR_RX_FIFO);

	 signal mst_write_state  : writerState := WRITERINITSTATE;
	 signal mst_read_state  : readerState := READERINITSTATE;
	 signal has_new_read_data : std_logic := '0';
	 signal writer_has_consumed_data : std_logic := '0';
	 signal lastReadData : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	 signal writerDataCopy : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	 signal lastReadStatusReg : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

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
	--Flag write errors                                                    
	  write_resp_error <= (axi_bready and M_AXI_BVALID and M_AXI_BRESP(1));
                                                                                                                            
	                                                                        
	--Flag write errors                                                     
	  read_resp_error <= (axi_rready and M_AXI_RVALID and M_AXI_RRESP(1));  
	  
	  process(M_AXI_ACLK)
	  begin
	    if (rising_edge(M_AXI_ACLK) ) then
	       if (M_AXI_ARESETN = '0' ) then
	           mst_read_state <= READERINITSTATE;
	       else
	           if (writer_has_consumed_data = '1') then
                  has_new_read_data <= '0';
               end if;
	           case (mst_read_state) is
	               when READERINITSTATE =>
	                   has_new_read_data <= '0';
	                   lastReadData <= (others => '0');
	                   axi_araddr <= (others => '0');
	                   lastReadStatusReg <= (others => '0');
	                   axi_arvalid <= '0';
	                   axi_rready <= '0';
	                   mst_read_state <= WAIT_FOR_RX_STATUS;
	                   
	               when WAIT_FOR_RX_STATUS =>
	                   axi_araddr <= x"00000008"; -- Address 0x08 is the status register
	                   if (M_AXI_RVALID = '1' and axi_rready = '1') then
	                       lastReadStatusReg <= M_AXI_RDATA;
	                       axi_rready <= '0';
	                       axi_arvalid <= '0';
	                       mst_read_state <= CHECK_RX_STATUS;
	                   else
	                       axi_rready <= '1';
	                       axi_arvalid <= '1';
	                   end if;
	                   
	               when CHECK_RX_STATUS =>
	                   if (lastReadStatusReg(0) = '1') then
	                       mst_read_state <= WAIT_FOR_RX_FIFO;
	                   else
	                       mst_read_state <= WAIT_FOR_RX_STATUS;
	                   end if;
	                   
	               when WAIT_FOR_RX_FIFO =>
	                   if (has_new_read_data = '0' and writer_has_consumed_data = '0') then
	                       axi_araddr <= x"00000000"; -- Address 0x00 is the RX FIFO
	                       if (M_AXI_RVALID = '1' and axi_arvalid = '1' and axi_rready = '1' and has_new_read_data = '0' and writer_has_consumed_data = '0') then
                                 lastReadData <= M_AXI_RDATA;
                                 has_new_read_data <= '1';
                                 axi_rready <= '0';
                                 axi_arvalid <= '0';
                                 mst_read_state <= WAIT_FOR_RX_STATUS;
                           else
                                 axi_rready <= '1';
                                 axi_arvalid <= '1';
                           end if;
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
	               axi_wdata <= x"00000000";
	               M_AXI_WSTRB <= "1111";                                                                  
                   write_issued   <= '0';                                                                      
                   start_single_read  <= '0';                                                                  
                   read_issued  <= '0';                                                                        
                   compare_done   <= '0';
                   axi_wvalid <= '0';    
                   axi_awvalid <= '0';
                   axi_awaddr <= x"00000000";
                   writerDataCopy <= (others => '0');
                   writer_has_consumed_data <= '0';                                                                  
                   if (M_AXI_ARESETN = '1' ) then
                        mst_write_state <= WAIT_FOR_NEW_READ;
                   end if;
                   
               when WAIT_FOR_NEW_READ =>
                    if (has_new_read_data = '1') then
                        writer_has_consumed_data <= '1';
                        writerDataCopy <= STD_LOGIC_VECTOR(unsigned(lastReadData) + 1);
                        mst_write_state <= SEND_DATA_STATE;
                    end if;           
                                 
               when SEND_DATA_STATE =>
                    axi_awaddr <= std_logic_vector(to_unsigned(4, 32) ); -- Set write address to 0x04 for the write FIFO
                    writer_has_consumed_data <= '0'; -- Signal that we want the "has new read data" flag to be cleared
                    M_AXI_WSTRB <= "1111"; -- All bytes are valid in this strobe
                    if (M_AXI_AWREADY = '1' and M_AXI_WREADY = '1' and axi_awvalid = '1' and axi_wvalid = '1') then
                        axi_awvalid <= '0';
                        axi_wvalid <= '0';
                        axi_wdata <= (others => '0');
                        mst_write_state <= WAIT_FOR_NEW_READ;
                    else
                        axi_awvalid <= '1';
                        axi_wvalid <= '1';
                        axi_wdata <= writerDataCopy;                        
                    end if;                     
	        end case  ;                                                                                 
	      end if;                                                                                       
	    end if;                                                                                         
	  end process;                                                                                                                                                                                                                                                                  
	                                                                                                                                                                                                                                                                                                                                                            

	-- Add user logic here

	-- User logic ends

end implementation;
