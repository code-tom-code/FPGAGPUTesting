----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2019 09:15:10 PM
-- Design Name: 
-- Module Name: R8G8B8Quantizer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: This is used for lowering the bit count of R8G8B8 to something like R5G6B5 or R5G5B4 or R3G3B2. It simply copies the topmost bits and removes the lower bits.
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity R8G8B8Quantizer is
	generic(
		-- Assumed to be 8 or less bits for the output (R, G, and B don't have to be the same length)
		R_OUTPUT_BITS : integer := 5;

		-- Assumed to be 8 or less bits for the output (R, G, and B don't have to be the same length)
		G_OUTPUT_BITS : integer := 5;

		-- Assumed to be 8 or less bits for the output (R, G, and B don't have to be the same length)
		B_OUTPUT_BITS : integer := 4
	);
    Port (inRed8 : in STD_LOGIC_VECTOR(7 downto 0);
		inGreen8 : in STD_LOGIC_VECTOR(7 downto 0);
		inBlue8 : in STD_LOGIC_VECTOR(7 downto 0);
		outRedBits : out STD_LOGIC_VECTOR(R_OUTPUT_BITS-1 downto 0);
		outGreenBits : out STD_LOGIC_VECTOR(G_OUTPUT_BITS-1 downto 0);
		outBlueBits : out STD_LOGIC_VECTOR(B_OUTPUT_BITS-1 downto 0) );
end R8G8B8Quantizer;

architecture Behavioral of R8G8B8Quantizer is

begin

	outRedBits <= inRed8(7 downto 8-R_OUTPUT_BITS);
	outGreenBits <= inGreen8(7 downto 8-G_OUTPUT_BITS);
	outBlueBits <= inBlue8(7 downto 8-B_OUTPUT_BITS);

end Behavioral;
