
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GPRQuad2 is
    Port (clk : in STD_LOGIC;

		-- Which GPR quad are we accessing (00, 01, 10, or 11)? Reads and writes may access different quads on the same cycle!
		readQuadIndex : in STD_LOGIC_VECTOR(1 downto 0);
		writeQuadIndex : in STD_LOGIC_VECTOR(1 downto 0);

		-- Port A is our first read port:
		portA_en : in STD_LOGIC;
		portA_regType : in STD_LOGIC_VECTOR(1 downto 0); -- Register type: v# = 0 (input reg), o# = 1 (output reg), r# = 2 (GPR), x# = 3 (special temporary reg)
		portA_regIdx : in STD_LOGIC_VECTOR(2 downto 0); -- Register index (unsigned int from 0 to 7)
		portA_regChan : in STD_LOGIC_VECTOR(1 downto 0); -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel
		portA_readOutData : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');

		-- Port B is our second read port:
		portB_en : in STD_LOGIC;
		portB_regType : in STD_LOGIC_VECTOR(1 downto 0); -- Register type: v# = 0 (input reg), o# = 1 (output reg), r# = 2 (GPR), x# = 3 (special temporary reg)
		portB_regIdx : in STD_LOGIC_VECTOR(2 downto 0); -- Register index (unsigned int from 0 to 7)
		portB_regChan : in STD_LOGIC_VECTOR(1 downto 0); -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel
		portB_readOutData : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');

		-- Port W is our write port:
		portW_en : in STD_LOGIC;
		portW_regType : in STD_LOGIC_VECTOR(1 downto 0); -- Register type: v# = 0 (input reg), o# = 1 (output reg), r# = 2 (GPR), x# = 3 (special temporary reg)
		portW_regIdx : in STD_LOGIC_VECTOR(2 downto 0); -- Register index (unsigned int from 0 to 7)
		portW_regChan : in STD_LOGIC_VECTOR(1 downto 0); -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel
		portW_writeInData : in STD_LOGIC_VECTOR(127 downto 0);

		-- BRAM0 services lane 0 port 0:
		 clka_bram0 : out STD_LOGIC;
		addra_bram0 : out STD_LOGIC_VECTOR(8 downto 0);
		 dina_bram0 : out STD_LOGIC_VECTOR(31 downto 0);
		  ena_bram0 : out STD_LOGIC;
		  wea_bram0 : out STD_LOGIC_VECTOR(0 downto 0);
		 clkb_bram0 : out STD_LOGIC;
		addrb_bram0 : out STD_LOGIC_VECTOR(8 downto 0);
		  enb_bram0 : out STD_LOGIC;
		doutb_bram0 : in STD_LOGIC_VECTOR(31 downto 0);

		-- BRAM1 services lane 0 port 1:
		 clka_bram1 : out STD_LOGIC;
		addra_bram1 : out STD_LOGIC_VECTOR(8 downto 0);
		 dina_bram1 : out STD_LOGIC_VECTOR(31 downto 0);
		  ena_bram1 : out STD_LOGIC;
		  wea_bram1 : out STD_LOGIC_VECTOR(0 downto 0);
		 clkb_bram1 : out STD_LOGIC;
		addrb_bram1 : out STD_LOGIC_VECTOR(8 downto 0);
		  enb_bram1 : out STD_LOGIC;
		doutb_bram1 : in STD_LOGIC_VECTOR(31 downto 0);

		-- BRAM2 services lane 1 port 0:
		 clka_bram2 : out STD_LOGIC;
		addra_bram2 : out STD_LOGIC_VECTOR(8 downto 0);
		 dina_bram2 : out STD_LOGIC_VECTOR(31 downto 0);
		  ena_bram2 : out STD_LOGIC;
		  wea_bram2 : out STD_LOGIC_VECTOR(0 downto 0);
		 clkb_bram2 : out STD_LOGIC;
		addrb_bram2 : out STD_LOGIC_VECTOR(8 downto 0);
		  enb_bram2 : out STD_LOGIC;
		doutb_bram2 : in STD_LOGIC_VECTOR(31 downto 0);

		-- BRAM3 services lane 1 port 1:
		 clka_bram3 : out STD_LOGIC;
		addra_bram3 : out STD_LOGIC_VECTOR(8 downto 0);
		 dina_bram3 : out STD_LOGIC_VECTOR(31 downto 0);
		  ena_bram3 : out STD_LOGIC;
		  wea_bram3 : out STD_LOGIC_VECTOR(0 downto 0);
		 clkb_bram3 : out STD_LOGIC;
		addrb_bram3 : out STD_LOGIC_VECTOR(8 downto 0);
		  enb_bram3 : out STD_LOGIC;
		doutb_bram3 : in STD_LOGIC_VECTOR(31 downto 0);

		-- BRAM4 services lane 2 port 0:
		 clka_bram4 : out STD_LOGIC;
		addra_bram4 : out STD_LOGIC_VECTOR(8 downto 0);
		 dina_bram4 : out STD_LOGIC_VECTOR(31 downto 0);
		  ena_bram4 : out STD_LOGIC;
		  wea_bram4 : out STD_LOGIC_VECTOR(0 downto 0);
		 clkb_bram4 : out STD_LOGIC;
		addrb_bram4 : out STD_LOGIC_VECTOR(8 downto 0);
		  enb_bram4 : out STD_LOGIC;
		doutb_bram4 : in STD_LOGIC_VECTOR(31 downto 0);

		-- BRAM5 services lane 2 port 1:
		 clka_bram5 : out STD_LOGIC;
		addra_bram5 : out STD_LOGIC_VECTOR(8 downto 0);
		 dina_bram5 : out STD_LOGIC_VECTOR(31 downto 0);
		  ena_bram5 : out STD_LOGIC;
		  wea_bram5 : out STD_LOGIC_VECTOR(0 downto 0);
		 clkb_bram5 : out STD_LOGIC;
		addrb_bram5 : out STD_LOGIC_VECTOR(8 downto 0);
		  enb_bram5 : out STD_LOGIC;
		doutb_bram5 : in STD_LOGIC_VECTOR(31 downto 0);

		-- BRAM6 services lane 3 port 0:
		 clka_bram6 : out STD_LOGIC;
		addra_bram6 : out STD_LOGIC_VECTOR(8 downto 0);
		 dina_bram6 : out STD_LOGIC_VECTOR(31 downto 0);
		  ena_bram6 : out STD_LOGIC;
		  wea_bram6 : out STD_LOGIC_VECTOR(0 downto 0);
		 clkb_bram6 : out STD_LOGIC;
		addrb_bram6 : out STD_LOGIC_VECTOR(8 downto 0);
		  enb_bram6 : out STD_LOGIC;
		doutb_bram6 : in STD_LOGIC_VECTOR(31 downto 0);

		-- BRAM7 services lane 3 port 1:
		 clka_bram7 : out STD_LOGIC;
		addra_bram7 : out STD_LOGIC_VECTOR(8 downto 0);
		 dina_bram7 : out STD_LOGIC_VECTOR(31 downto 0);
		  ena_bram7 : out STD_LOGIC;
		  wea_bram7 : out STD_LOGIC_VECTOR(0 downto 0);
		 clkb_bram7 : out STD_LOGIC;
		addrb_bram7 : out STD_LOGIC_VECTOR(8 downto 0);
		  enb_bram7 : out STD_LOGIC;
		doutb_bram7 : in STD_LOGIC_VECTOR(31 downto 0)
		);
end GPRQuad2;

architecture Behavioral of GPRQuad2 is

ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of  clka_bram0: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0W CLK";
ATTRIBUTE X_INTERFACE_INFO of   ena_bram0: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0W EN";
ATTRIBUTE X_INTERFACE_INFO of  dina_bram0: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0W DIN";
ATTRIBUTE X_INTERFACE_INFO of   wea_bram0: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0W WE";
ATTRIBUTE X_INTERFACE_INFO of addra_bram0: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0W ADDR";
ATTRIBUTE X_INTERFACE_INFO of addrb_bram0: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0R ADDR";
ATTRIBUTE X_INTERFACE_INFO of  clkb_bram0: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0R CLK";
ATTRIBUTE X_INTERFACE_INFO of doutb_bram0: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0R DOUT";
ATTRIBUTE X_INTERFACE_INFO of   enb_bram0: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0R EN";

ATTRIBUTE X_INTERFACE_INFO of  clka_bram1: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1W CLK";
ATTRIBUTE X_INTERFACE_INFO of   ena_bram1: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1W EN";
ATTRIBUTE X_INTERFACE_INFO of  dina_bram1: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1W DIN";
ATTRIBUTE X_INTERFACE_INFO of   wea_bram1: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1W WE";
ATTRIBUTE X_INTERFACE_INFO of addra_bram1: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1W ADDR";
ATTRIBUTE X_INTERFACE_INFO of addrb_bram1: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1R ADDR";
ATTRIBUTE X_INTERFACE_INFO of  clkb_bram1: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1R CLK";
ATTRIBUTE X_INTERFACE_INFO of doutb_bram1: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1R DOUT";
ATTRIBUTE X_INTERFACE_INFO of   enb_bram1: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1R EN";

ATTRIBUTE X_INTERFACE_INFO of  clka_bram2: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2W CLK";
ATTRIBUTE X_INTERFACE_INFO of   ena_bram2: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2W EN";
ATTRIBUTE X_INTERFACE_INFO of  dina_bram2: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2W DIN";
ATTRIBUTE X_INTERFACE_INFO of   wea_bram2: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2W WE";
ATTRIBUTE X_INTERFACE_INFO of addra_bram2: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2W ADDR";
ATTRIBUTE X_INTERFACE_INFO of addrb_bram2: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2R ADDR";
ATTRIBUTE X_INTERFACE_INFO of  clkb_bram2: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2R CLK";
ATTRIBUTE X_INTERFACE_INFO of doutb_bram2: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2R DOUT";
ATTRIBUTE X_INTERFACE_INFO of   enb_bram2: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2R EN";

ATTRIBUTE X_INTERFACE_INFO of  clka_bram3: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3W CLK";
ATTRIBUTE X_INTERFACE_INFO of   ena_bram3: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3W EN";
ATTRIBUTE X_INTERFACE_INFO of  dina_bram3: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3W DIN";
ATTRIBUTE X_INTERFACE_INFO of   wea_bram3: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3W WE";
ATTRIBUTE X_INTERFACE_INFO of addra_bram3: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3W ADDR";
ATTRIBUTE X_INTERFACE_INFO of addrb_bram3: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3R ADDR";
ATTRIBUTE X_INTERFACE_INFO of  clkb_bram3: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3R CLK";
ATTRIBUTE X_INTERFACE_INFO of doutb_bram3: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3R DOUT";
ATTRIBUTE X_INTERFACE_INFO of   enb_bram3: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3R EN";

ATTRIBUTE X_INTERFACE_INFO of  clka_bram4: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM4W CLK";
ATTRIBUTE X_INTERFACE_INFO of   ena_bram4: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM4W EN";
ATTRIBUTE X_INTERFACE_INFO of  dina_bram4: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM4W DIN";
ATTRIBUTE X_INTERFACE_INFO of   wea_bram4: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM4W WE";
ATTRIBUTE X_INTERFACE_INFO of addra_bram4: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM4W ADDR";
ATTRIBUTE X_INTERFACE_INFO of addrb_bram4: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM4R ADDR";
ATTRIBUTE X_INTERFACE_INFO of  clkb_bram4: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM4R CLK";
ATTRIBUTE X_INTERFACE_INFO of doutb_bram4: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM4R DOUT";
ATTRIBUTE X_INTERFACE_INFO of   enb_bram4: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM4R EN";

ATTRIBUTE X_INTERFACE_INFO of  clka_bram5: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM5W CLK";
ATTRIBUTE X_INTERFACE_INFO of   ena_bram5: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM5W EN";
ATTRIBUTE X_INTERFACE_INFO of  dina_bram5: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM5W DIN";
ATTRIBUTE X_INTERFACE_INFO of   wea_bram5: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM5W WE";
ATTRIBUTE X_INTERFACE_INFO of addra_bram5: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM5W ADDR";
ATTRIBUTE X_INTERFACE_INFO of addrb_bram5: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM5R ADDR";
ATTRIBUTE X_INTERFACE_INFO of  clkb_bram5: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM5R CLK";
ATTRIBUTE X_INTERFACE_INFO of doutb_bram5: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM5R DOUT";
ATTRIBUTE X_INTERFACE_INFO of   enb_bram5: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM5R EN";

ATTRIBUTE X_INTERFACE_INFO of  clka_bram6: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM6W CLK";
ATTRIBUTE X_INTERFACE_INFO of   ena_bram6: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM6W EN";
ATTRIBUTE X_INTERFACE_INFO of  dina_bram6: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM6W DIN";
ATTRIBUTE X_INTERFACE_INFO of   wea_bram6: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM6W WE";
ATTRIBUTE X_INTERFACE_INFO of addra_bram6: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM6W ADDR";
ATTRIBUTE X_INTERFACE_INFO of addrb_bram6: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM6R ADDR";
ATTRIBUTE X_INTERFACE_INFO of  clkb_bram6: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM6R CLK";
ATTRIBUTE X_INTERFACE_INFO of doutb_bram6: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM6R DOUT";
ATTRIBUTE X_INTERFACE_INFO of   enb_bram6: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM6R EN";

ATTRIBUTE X_INTERFACE_INFO of  clka_bram7: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM7W CLK";
ATTRIBUTE X_INTERFACE_INFO of   ena_bram7: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM7W EN";
ATTRIBUTE X_INTERFACE_INFO of  dina_bram7: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM7W DIN";
ATTRIBUTE X_INTERFACE_INFO of   wea_bram7: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM7W WE";
ATTRIBUTE X_INTERFACE_INFO of addra_bram7: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM7W ADDR";
ATTRIBUTE X_INTERFACE_INFO of addrb_bram7: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM7R ADDR";
ATTRIBUTE X_INTERFACE_INFO of  clkb_bram7: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM7R CLK";
ATTRIBUTE X_INTERFACE_INFO of doutb_bram7: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM7R DOUT";
ATTRIBUTE X_INTERFACE_INFO of   enb_bram7: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM7R EN";

begin

	-- Lane 0 clocks
	clka_bram0 <= clk;
	clkb_bram0 <= clk;
	clka_bram1 <= clk;
	clkb_bram1 <= clk;

	-- Lane 1 clocks
	clka_bram2 <= clk;
	clkb_bram2 <= clk;
	clka_bram3 <= clk;
	clkb_bram3 <= clk;

	-- Lane 2 clocks
	clka_bram4 <= clk;
	clkb_bram4 <= clk;
	clka_bram5 <= clk;
	clkb_bram5 <= clk;

	-- Lane 3 clocks
	clka_bram6 <= clk;
	clkb_bram6 <= clk;
	clka_bram7 <= clk;
	clkb_bram7 <= clk;

	-- Lane 0 write data
	ena_bram0 <= portW_en;
	ena_bram1 <= portW_en;
	wea_bram0 <= (others => '1');
	wea_bram1 <= (others => '1');
	dina_bram0 <= portW_writeInData(32*1-1 downto 32*0);
	dina_bram1 <= portW_writeInData(32*1-1 downto 32*0);

	-- Lane 1 write data
	ena_bram2 <= portW_en;
	ena_bram3 <= portW_en;
	wea_bram2 <= (others => '1');
	wea_bram3 <= (others => '1');
	dina_bram2 <= portW_writeInData(32*2-1 downto 32*1);
	dina_bram3 <= portW_writeInData(32*2-1 downto 32*1);

	-- Lane 2 write data
	ena_bram4 <= portW_en;
	ena_bram5 <= portW_en;	
	wea_bram4 <= (others => '1');
	wea_bram5 <= (others => '1');	
	dina_bram4 <= portW_writeInData(32*3-1 downto 32*2);
	dina_bram5 <= portW_writeInData(32*3-1 downto 32*2);

	-- Lane 3 write data
	ena_bram6 <= portW_en;
	ena_bram7 <= portW_en;
	wea_bram6 <= (others => '1');
	wea_bram7 <= (others => '1');
	dina_bram6 <= portW_writeInData(32*4-1 downto 32*3);
	dina_bram7 <= portW_writeInData(32*4-1 downto 32*3);

	-- Lane 0 read data
	portA_readOutData(32*1-1 downto 32*0) <= doutb_bram0;
	portB_readOutData(32*1-1 downto 32*0) <= doutb_bram1;
	enb_bram0 <= portA_en;
	enb_bram1 <= portA_en;

	-- Lane 1 read data
	portA_readOutData(32*2-1 downto 32*1) <= doutb_bram2;
	portB_readOutData(32*2-1 downto 32*1) <= doutb_bram3;
	enb_bram2 <= portB_en;
	enb_bram3 <= portB_en;

	-- Lane 2 read data
	portA_readOutData(32*3-1 downto 32*2) <= doutb_bram4;
	portB_readOutData(32*3-1 downto 32*2) <= doutb_bram5;
	enb_bram4 <= portA_en;
	enb_bram5 <= portA_en;

	-- Lane 3 read data
	portA_readOutData(32*4-1 downto 32*3) <= doutb_bram6;
	portB_readOutData(32*4-1 downto 32*3) <= doutb_bram7;
	enb_bram6 <= portB_en;
	enb_bram7 <= portB_en;

	-- Lane 0 read address
	addrb_bram0 <= readQuadIndex & portA_regType & portA_regIdx & portA_regChan;
	addrb_bram1 <= readQuadIndex & portA_regType & portA_regIdx & portA_regChan;

	-- Lane 1 read address
	addrb_bram2 <= readQuadIndex & portB_regType & portB_regIdx & portB_regChan;
	addrb_bram3 <= readQuadIndex & portB_regType & portB_regIdx & portB_regChan;

	-- Lane 2 read address
	addrb_bram4 <= readQuadIndex & portA_regType & portA_regIdx & portA_regChan;
	addrb_bram5 <= readQuadIndex & portA_regType & portA_regIdx & portA_regChan;

	-- Lane 3 read address
	addrb_bram6 <= readQuadIndex & portB_regType & portB_regIdx & portB_regChan;
	addrb_bram7 <= readQuadIndex & portB_regType & portB_regIdx & portB_regChan;

	-- Lane 0 write address
	addra_bram0 <= writeQuadIndex & portW_regType & portW_regIdx & portW_regChan;
	addra_bram1 <= writeQuadIndex & portW_regType & portW_regIdx & portW_regChan;

	-- Lane 1 write address
	addra_bram2 <= writeQuadIndex & portW_regType & portW_regIdx & portW_regChan;
	addra_bram3 <= writeQuadIndex & portW_regType & portW_regIdx & portW_regChan;

	-- Lane 2 write address
	addra_bram4 <= writeQuadIndex & portW_regType & portW_regIdx & portW_regChan;
	addra_bram5 <= writeQuadIndex & portW_regType & portW_regIdx & portW_regChan;

	-- Lane 3 write address
	addra_bram6 <= writeQuadIndex & portW_regType & portW_regIdx & portW_regChan;
	addra_bram7 <= writeQuadIndex & portW_regType & portW_regIdx & portW_regChan;

end Behavioral;
