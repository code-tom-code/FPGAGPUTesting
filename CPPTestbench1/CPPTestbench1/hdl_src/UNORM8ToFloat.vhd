
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity UNORM8ToFloat is
    Port (clk : in STD_LOGIC;

		Enable : in STD_LOGIC;
		D3DColorIn : in STD_LOGIC_VECTOR(31 downto 0);
		FloatXOut : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FloatYOut : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FloatZOut : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FloatWOut : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
		);
end UNORM8ToFloat;

architecture Behavioral of UNORM8ToFloat is

-- Note that this function assumes that the special cases of 00 (0.0f) and FF (1.0f) have both already been handled and
-- that our UNORM value already lies somewhere inbetween the two!
pure function GetExponentFromUNORM8(unorm8 : unsigned(7 downto 0) ) return unsigned is
begin
	if (unorm8(7) = '1') then -- unorm8 >= 128
		return to_unsigned(126, 8); -- exp -1
	elsif (unorm8(6) = '1') then -- unorm8 >= 64
		return to_unsigned(125, 8); -- exp -2
	elsif (unorm8(5) = '1') then -- unorm8 >= 32
		return to_unsigned(124, 8); -- exp -3
	elsif (unorm8(4) = '1') then -- unorm8 >= 16
		return to_unsigned(123, 8); -- exp -4
	elsif (unorm8(3) = '1') then -- unorm8 >= 8
		return to_unsigned(122, 8); -- exp -5
	elsif (unorm8(2) = '1') then -- unorm8 >= 4
		return to_unsigned(121, 8); -- exp -6
	elsif (unorm8(1) = '1') then -- unorm8 >= 2
		return to_unsigned(120, 8); -- exp -7
	else -- (unorm8(0) = '1') then -- unorm8 >= 1
		return to_unsigned(119, 8); -- exp -8
	end if;
end function;

pure function GetUpper7MantissaBitsFromUNORM8(unorm8 : unsigned(7 downto 0) ) return unsigned is
begin
	if (unorm8(7) = '1') then -- For values 128 and above, the top 7 bits are just the lower 7 bits of the UNORM value
		return unorm8(6 downto 0);
	elsif (unorm8(6) = '1') then -- For values 64 to 127, the top 7 bits are just the lower 6 bits shifted left once
		return unorm8(5 downto 0) & '0';
	elsif (unorm8(5) = '1') then -- For values 32 to 63, the top 7 bits are just the lower 5 bits shifted left twice
		return unorm8(4 downto 0) & "00";
	elsif (unorm8(4) = '1') then -- For values 16 to 31, the top 7 bits are just the lower 4 bits shifted left three times
		return unorm8(3 downto 0) & "000";
	elsif (unorm8(3) = '1') then -- For values 8 to 15, the top 7 bits are just the lower 3 bits shifted left four times
		return unorm8(2 downto 0) & "0000";
	elsif (unorm8(2) = '1') then -- For values 4 to 7, the top 7 bits are just the lower 2 bits shifted left five times
		return unorm8(1 downto 0) & "00000";
	elsif (unorm8(1) = '1') then -- For values 2 to 3, the top 7 bits are just the lowest 1 bit shifted left six times
		return unorm8(0) & "000000";
	else -- For value 1, the top 7 bits are all zeroes
		return "0000000";
	end if;
end function;

pure function GetMiddle8MantissaBitsFromUNORM8(unorm8 : unsigned(7 downto 0) ) return unsigned is
begin
	-- The middle 8 bits look to be an exact replica of the upper 7 bits, but with a 1 bit appended to the MSB
	return '1' & GetUpper7MantissaBitsFromUNORM8(unorm8);
end function;

pure function GetLower8SpecialBiasBits(unorm8 : unsigned(7 downto 0) ) return unsigned is
begin
	if (unorm8(6) = '1') then -- For values 64 to 127
		return "0000001";
	elsif (unorm8(5) = '1') then -- For values 32 to 63
		return "0000011";
	elsif (unorm8(4) = '1') then -- For values 16 to 31
		return "0000111";
	elsif (unorm8(3) = '1') then -- For values 8 to 15
		return "0001111";
	elsif (unorm8(2) = '1') then -- For values 4 to 7
		return "0011111";
	elsif (unorm8(1) = '1') then -- For values 2 to 3
		return "0111111";
	else -- For value 1
		return "1111111";
	end if;
end function;

pure function GetLower8MantissaBitsFromUNORM8(unorm8 : unsigned(7 downto 0) ) return unsigned is
begin
	-- The lower 8 bits look to be an exact replica of the middle 8 bits, but offset by +1.
	-- There's a special bias applied in the lowest bits for values below 128 as well.
	if (unorm8(7) = '1') then -- For values 128 and above, no modification of the LSB's
		return '1' & GetUpper7MantissaBitsFromUNORM8(unorm8 + 1);
	else
		return '1' & (GetUpper7MantissaBitsFromUNORM8(unorm8 + 1) - GetLower8SpecialBiasBits(unorm8) );
	end if;
end function;

pure function GetMantissaFromUNORM8(unorm8 : unsigned(7 downto 0) ) return unsigned is
begin
	-- The upper 7 bits, the middle 8 bits, and the lower 8 bits are all computed separately and get concatenated like this:
	return GetUpper7MantissaBitsFromUNORM8(unorm8) & GetMiddle8MantissaBitsFromUNORM8(unorm8) & GetLower8MantissaBitsFromUNORM8(unorm8);
end function;

pure function ConvertUNORM8ToFloat(unorm8 : unsigned(7 downto 0) ) return unsigned is
begin
	if (unorm8 = X"00") then
		return '0' & X"00" & "00000000000000000000000"; -- Early out for 0.0f case
	elsif (unorm8 = X"FF") then
		return '0' & X"7F" & "00000000000000000000000"; -- Early out for 1.0f case
	else
		return '0' & GetExponentFromUNORM8(unorm8) & GetMantissaFromUNORM8(unorm8); -- Typical middle case
	end if;
end function;

begin

process(clk)
begin
	if (rising_edge(clk) ) then
		if (Enable = '1') then
			-- Color comes in as ARGB and needs to come out as RGBA:
			FloatXOut <= std_logic_vector(ConvertUNORM8ToFloat(unsigned(D3DColorIn(23 downto 16) ) ) );
			FloatYOut <= std_logic_vector(ConvertUNORM8ToFloat(unsigned(D3DColorIn(15 downto 8) ) ) );
			FloatZOut <= std_logic_vector(ConvertUNORM8ToFloat(unsigned(D3DColorIn(7 downto 0) ) ) );
			FloatWOut <= std_logic_vector(ConvertUNORM8ToFloat(unsigned(D3DColorIn(31 downto 24) ) ) );
		end if;
	end if;
end process;

end Behavioral;
