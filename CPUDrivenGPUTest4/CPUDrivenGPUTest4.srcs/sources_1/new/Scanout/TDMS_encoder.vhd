----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Description: TDMS Encoder
--		8 bits colour, 2 control bits and one blanking bits in
--		10 bits of TDMS encoded data out
--	Clocked at the pixel clock
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TDMS_encoder is
	Generic (isGreenLane : boolean := false;
		isChannel0 : boolean := false
	);
	Port (clk	: in STD_LOGIC;
		data	: in STD_LOGIC_VECTOR (7 downto 0);
		c		: in STD_LOGIC_VECTOR (1 downto 0);
		blank	: in STD_LOGIC;
		guardBandEnable : in STD_LOGIC;
		guardBandType : in STD_LOGIC; -- 0: Video guard band. 1: Data island guard band.
		isTERC4Region : in STD_LOGIC; -- 0: Normal control/video region. 1: TERC4 encoded data island region.
		TERC4Character : in STD_LOGIC_VECTOR(3 downto 0);
		encoded	: out STD_LOGIC_VECTOR (9 downto 0) );
end TDMS_encoder;

architecture Behavioral of TDMS_encoder is

	-- Converts from 4-bit data to 10-bit TERC4 encoding
	pure function TERC4Encode(inData : std_logic_vector(3 downto 0) ) return std_logic_vector is
	begin
		case inData is
			when X"0" =>
				return "1010011100";
			when X"1" =>
				return "1001100011";
			when X"2" =>
				return "1011100100";
			when X"3" =>
				return "1011100010";
			when X"4" =>
				return "0101110001";
			when X"5" =>
				return "0100011110";
			when X"6" =>
				return "0110001110";
			when X"7" =>
				return "0100111100";
			when X"8" =>
				return "1011001100";
			when X"9" =>
				return "0100111001";
			when X"A" =>
				return "0110011100";
			when X"B" =>
				return "1011000110";
			when X"C" =>
				return "1010001110";
			when X"D" =>
				return "1001110001";
			when X"E" =>
				return "0101100011";
			when others => -- when X"F" =>
				return "1011000011";
		end case;
	end function;

	-- Encodes the HSync and VSync signals into TDMS Channel 0's TERC4 encoding for use during the Data Island Guard Band periods (both leading and trailing)
	pure function TERC4EncodeChannel0HSyncVSync(inHSync : std_logic; inVSync : std_logic) return std_logic_vector is
	begin
		return TERC4Encode('1' & '1' & inVSync & inHSync);
	end function;
	
	signal xored				: STD_LOGIC_VECTOR (8 downto 0);
	signal xnored				: STD_LOGIC_VECTOR (8 downto 0);
   
	signal ones					: STD_LOGIC_VECTOR (3 downto 0);
	signal data_word			: STD_LOGIC_VECTOR (8 downto 0);
	signal data_word_inv		: STD_LOGIC_VECTOR (8 downto 0);
	signal data_word_disparity	: STD_LOGIC_VECTOR (3 downto 0);
	signal dc_bias				: STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	signal e					: STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
begin
	encoded <= e;

	-- Work our the two different encodings for the byte
	xored(0) <= data(0);
	xored(1) <= data(1) xor xored(0);
	xored(2) <= data(2) xor xored(1);
	xored(3) <= data(3) xor xored(2);
	xored(4) <= data(4) xor xored(3);
	xored(5) <= data(5) xor xored(4);
	xored(6) <= data(6) xor xored(5);
	xored(7) <= data(7) xor xored(6);
	xored(8) <= '1';

	xnored(0) <= data(0);
	xnored(1) <= data(1) xnor xnored(0);
	xnored(2) <= data(2) xnor xnored(1);
	xnored(3) <= data(3) xnor xnored(2);
	xnored(4) <= data(4) xnor xnored(3);
	xnored(5) <= data(5) xnor xnored(4);
	xnored(6) <= data(6) xnor xnored(5);
	xnored(7) <= data(7) xnor xnored(6);
	xnored(8) <= '0';

	-- Count how many ones are set in data
	ones <= "0000" + data(0) + data(1) + data(2) + data(3)
			+ data(4) + data(5) + data(6) + data(7);

	-- Decide which encoding to use
	process(ones, data(0), xnored, xored)
	begin
		if ones > 4 or (ones = 4 and data(0) = '0') then
			data_word     <= xnored;
			data_word_inv <= NOT(xnored);
		else
			data_word     <= xored;
			data_word_inv <= NOT(xored);
		end if;
	end process;

	-- Work out the DC bias of the dataword;
	data_word_disparity  <= "1100" + data_word(0) + data_word(1) + data_word(2) + data_word(3) 
									+ data_word(4) + data_word(5) + data_word(6) + data_word(7);

	-- Now work out what the output should be
	process(clk)
	begin
		if rising_edge(clk) then
			if blank = '1' then 
				if (guardBandEnable = '1') then
					if (guardBandType = '0') then -- 0: Video guard band.
						if (isGreenLane) then
							e <= "0100110011";
						else
							e <= "1011001100";
						end if;
					else -- 1: Data island guard band.
						if (isChannel0) then
							e <= std_logic_vector(TERC4EncodeChannel0HSyncVSync(c(0), c(1) ) );
						else
							e <= "0100110011";
						end if;
					end if;
				elsif (isTERC4Region = '1') then
					e <= TERC4Encode(TERC4Character);
				else
					case c is
						when "00"   => e <= "1101010100"; -- Standard control region signals
						when "01"   => e <= "0010101011";
						when "10"   => e <= "0101010100";
						when others => e <= "1010101011";
					end case;
				end if;

				-- In the control periods, all values already have a DC-balanced bit count
				dc_bias <= (others => '0');
			else
				if dc_bias = "00000" or data_word_disparity = 0 then
					-- dataword has no disparity
					if data_word(8) = '1' then
						e <= "01" & data_word(7 downto 0);
						dc_bias <= dc_bias + data_word_disparity;
					else
						e <= "10" & data_word_inv(7 downto 0);
						dc_bias <= dc_bias - data_word_disparity;
					end if;
				elsif (dc_bias(3) = '0' and data_word_disparity(3) = '0') or 
					(dc_bias(3) = '1' and data_word_disparity(3) = '1') then
					e <= '1' & data_word(8) & data_word_inv(7 downto 0);
					dc_bias <= dc_bias + data_word(8) - data_word_disparity;
				else
					e <= '0' & data_word;
					dc_bias <= dc_bias - data_word_inv(8) + data_word_disparity;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
