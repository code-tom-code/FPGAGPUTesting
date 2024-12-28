
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity UNORM8ToFloat is
	generic (
			-- Depending on how many FPGA resources you have, using a lookup method versus calculating the result using math may be better
			Use_Mantissa_Lut : boolean := true;
			Use_Exponent_Lut : boolean := true);
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

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

type mantissaArray is array(255 downto 0) of unsigned(22 downto 0);
type exponentArray is array(255 downto 0) of unsigned(7 downto 0);

constant exponentBits : exponentArray :=
(
to_unsigned(0, 8), -- 0/255.0f
to_unsigned(119, 8), -- 1/255.0f
to_unsigned(120, 8), -- 2/255.0f
to_unsigned(120, 8), -- 3/255.0f
to_unsigned(121, 8), -- 4/255.0f
to_unsigned(121, 8), -- 5/255.0f
to_unsigned(121, 8), -- 6/255.0f
to_unsigned(121, 8), -- 7/255.0f
to_unsigned(122, 8), -- 8/255.0f
to_unsigned(122, 8), -- 9/255.0f
to_unsigned(122, 8), -- 10/255.0f
to_unsigned(122, 8), -- 11/255.0f
to_unsigned(122, 8), -- 12/255.0f
to_unsigned(122, 8), -- 13/255.0f
to_unsigned(122, 8), -- 14/255.0f
to_unsigned(122, 8), -- 15/255.0f
to_unsigned(123, 8), -- 16/255.0f
to_unsigned(123, 8), -- 17/255.0f
to_unsigned(123, 8), -- 18/255.0f
to_unsigned(123, 8), -- 19/255.0f
to_unsigned(123, 8), -- 20/255.0f
to_unsigned(123, 8), -- 21/255.0f
to_unsigned(123, 8), -- 22/255.0f
to_unsigned(123, 8), -- 23/255.0f
to_unsigned(123, 8), -- 24/255.0f
to_unsigned(123, 8), -- 25/255.0f
to_unsigned(123, 8), -- 26/255.0f
to_unsigned(123, 8), -- 27/255.0f
to_unsigned(123, 8), -- 28/255.0f
to_unsigned(123, 8), -- 29/255.0f
to_unsigned(123, 8), -- 30/255.0f
to_unsigned(123, 8), -- 31/255.0f
to_unsigned(124, 8), -- 32/255.0f
to_unsigned(124, 8), -- 33/255.0f
to_unsigned(124, 8), -- 34/255.0f
to_unsigned(124, 8), -- 35/255.0f
to_unsigned(124, 8), -- 36/255.0f
to_unsigned(124, 8), -- 37/255.0f
to_unsigned(124, 8), -- 38/255.0f
to_unsigned(124, 8), -- 39/255.0f
to_unsigned(124, 8), -- 40/255.0f
to_unsigned(124, 8), -- 41/255.0f
to_unsigned(124, 8), -- 42/255.0f
to_unsigned(124, 8), -- 43/255.0f
to_unsigned(124, 8), -- 44/255.0f
to_unsigned(124, 8), -- 45/255.0f
to_unsigned(124, 8), -- 46/255.0f
to_unsigned(124, 8), -- 47/255.0f
to_unsigned(124, 8), -- 48/255.0f
to_unsigned(124, 8), -- 49/255.0f
to_unsigned(124, 8), -- 50/255.0f
to_unsigned(124, 8), -- 51/255.0f
to_unsigned(124, 8), -- 52/255.0f
to_unsigned(124, 8), -- 53/255.0f
to_unsigned(124, 8), -- 54/255.0f
to_unsigned(124, 8), -- 55/255.0f
to_unsigned(124, 8), -- 56/255.0f
to_unsigned(124, 8), -- 57/255.0f
to_unsigned(124, 8), -- 58/255.0f
to_unsigned(124, 8), -- 59/255.0f
to_unsigned(124, 8), -- 60/255.0f
to_unsigned(124, 8), -- 61/255.0f
to_unsigned(124, 8), -- 62/255.0f
to_unsigned(124, 8), -- 63/255.0f
to_unsigned(125, 8), -- 64/255.0f
to_unsigned(125, 8), -- 65/255.0f
to_unsigned(125, 8), -- 66/255.0f
to_unsigned(125, 8), -- 67/255.0f
to_unsigned(125, 8), -- 68/255.0f
to_unsigned(125, 8), -- 69/255.0f
to_unsigned(125, 8), -- 70/255.0f
to_unsigned(125, 8), -- 71/255.0f
to_unsigned(125, 8), -- 72/255.0f
to_unsigned(125, 8), -- 73/255.0f
to_unsigned(125, 8), -- 74/255.0f
to_unsigned(125, 8), -- 75/255.0f
to_unsigned(125, 8), -- 76/255.0f
to_unsigned(125, 8), -- 77/255.0f
to_unsigned(125, 8), -- 78/255.0f
to_unsigned(125, 8), -- 79/255.0f
to_unsigned(125, 8), -- 80/255.0f
to_unsigned(125, 8), -- 81/255.0f
to_unsigned(125, 8), -- 82/255.0f
to_unsigned(125, 8), -- 83/255.0f
to_unsigned(125, 8), -- 84/255.0f
to_unsigned(125, 8), -- 85/255.0f
to_unsigned(125, 8), -- 86/255.0f
to_unsigned(125, 8), -- 87/255.0f
to_unsigned(125, 8), -- 88/255.0f
to_unsigned(125, 8), -- 89/255.0f
to_unsigned(125, 8), -- 90/255.0f
to_unsigned(125, 8), -- 91/255.0f
to_unsigned(125, 8), -- 92/255.0f
to_unsigned(125, 8), -- 93/255.0f
to_unsigned(125, 8), -- 94/255.0f
to_unsigned(125, 8), -- 95/255.0f
to_unsigned(125, 8), -- 96/255.0f
to_unsigned(125, 8), -- 97/255.0f
to_unsigned(125, 8), -- 98/255.0f
to_unsigned(125, 8), -- 99/255.0f
to_unsigned(125, 8), -- 100/255.0f
to_unsigned(125, 8), -- 101/255.0f
to_unsigned(125, 8), -- 102/255.0f
to_unsigned(125, 8), -- 103/255.0f
to_unsigned(125, 8), -- 104/255.0f
to_unsigned(125, 8), -- 105/255.0f
to_unsigned(125, 8), -- 106/255.0f
to_unsigned(125, 8), -- 107/255.0f
to_unsigned(125, 8), -- 108/255.0f
to_unsigned(125, 8), -- 109/255.0f
to_unsigned(125, 8), -- 110/255.0f
to_unsigned(125, 8), -- 111/255.0f
to_unsigned(125, 8), -- 112/255.0f
to_unsigned(125, 8), -- 113/255.0f
to_unsigned(125, 8), -- 114/255.0f
to_unsigned(125, 8), -- 115/255.0f
to_unsigned(125, 8), -- 116/255.0f
to_unsigned(125, 8), -- 117/255.0f
to_unsigned(125, 8), -- 118/255.0f
to_unsigned(125, 8), -- 119/255.0f
to_unsigned(125, 8), -- 120/255.0f
to_unsigned(125, 8), -- 121/255.0f
to_unsigned(125, 8), -- 122/255.0f
to_unsigned(125, 8), -- 123/255.0f
to_unsigned(125, 8), -- 124/255.0f
to_unsigned(125, 8), -- 125/255.0f
to_unsigned(125, 8), -- 126/255.0f
to_unsigned(125, 8), -- 127/255.0f
to_unsigned(126, 8), -- 128/255.0f
to_unsigned(126, 8), -- 129/255.0f
to_unsigned(126, 8), -- 130/255.0f
to_unsigned(126, 8), -- 131/255.0f
to_unsigned(126, 8), -- 132/255.0f
to_unsigned(126, 8), -- 133/255.0f
to_unsigned(126, 8), -- 134/255.0f
to_unsigned(126, 8), -- 135/255.0f
to_unsigned(126, 8), -- 136/255.0f
to_unsigned(126, 8), -- 137/255.0f
to_unsigned(126, 8), -- 138/255.0f
to_unsigned(126, 8), -- 139/255.0f
to_unsigned(126, 8), -- 140/255.0f
to_unsigned(126, 8), -- 141/255.0f
to_unsigned(126, 8), -- 142/255.0f
to_unsigned(126, 8), -- 143/255.0f
to_unsigned(126, 8), -- 144/255.0f
to_unsigned(126, 8), -- 145/255.0f
to_unsigned(126, 8), -- 146/255.0f
to_unsigned(126, 8), -- 147/255.0f
to_unsigned(126, 8), -- 148/255.0f
to_unsigned(126, 8), -- 149/255.0f
to_unsigned(126, 8), -- 150/255.0f
to_unsigned(126, 8), -- 151/255.0f
to_unsigned(126, 8), -- 152/255.0f
to_unsigned(126, 8), -- 153/255.0f
to_unsigned(126, 8), -- 154/255.0f
to_unsigned(126, 8), -- 155/255.0f
to_unsigned(126, 8), -- 156/255.0f
to_unsigned(126, 8), -- 157/255.0f
to_unsigned(126, 8), -- 158/255.0f
to_unsigned(126, 8), -- 159/255.0f
to_unsigned(126, 8), -- 160/255.0f
to_unsigned(126, 8), -- 161/255.0f
to_unsigned(126, 8), -- 162/255.0f
to_unsigned(126, 8), -- 163/255.0f
to_unsigned(126, 8), -- 164/255.0f
to_unsigned(126, 8), -- 165/255.0f
to_unsigned(126, 8), -- 166/255.0f
to_unsigned(126, 8), -- 167/255.0f
to_unsigned(126, 8), -- 168/255.0f
to_unsigned(126, 8), -- 169/255.0f
to_unsigned(126, 8), -- 170/255.0f
to_unsigned(126, 8), -- 171/255.0f
to_unsigned(126, 8), -- 172/255.0f
to_unsigned(126, 8), -- 173/255.0f
to_unsigned(126, 8), -- 174/255.0f
to_unsigned(126, 8), -- 175/255.0f
to_unsigned(126, 8), -- 176/255.0f
to_unsigned(126, 8), -- 177/255.0f
to_unsigned(126, 8), -- 178/255.0f
to_unsigned(126, 8), -- 179/255.0f
to_unsigned(126, 8), -- 180/255.0f
to_unsigned(126, 8), -- 181/255.0f
to_unsigned(126, 8), -- 182/255.0f
to_unsigned(126, 8), -- 183/255.0f
to_unsigned(126, 8), -- 184/255.0f
to_unsigned(126, 8), -- 185/255.0f
to_unsigned(126, 8), -- 186/255.0f
to_unsigned(126, 8), -- 187/255.0f
to_unsigned(126, 8), -- 188/255.0f
to_unsigned(126, 8), -- 189/255.0f
to_unsigned(126, 8), -- 190/255.0f
to_unsigned(126, 8), -- 191/255.0f
to_unsigned(126, 8), -- 192/255.0f
to_unsigned(126, 8), -- 193/255.0f
to_unsigned(126, 8), -- 194/255.0f
to_unsigned(126, 8), -- 195/255.0f
to_unsigned(126, 8), -- 196/255.0f
to_unsigned(126, 8), -- 197/255.0f
to_unsigned(126, 8), -- 198/255.0f
to_unsigned(126, 8), -- 199/255.0f
to_unsigned(126, 8), -- 200/255.0f
to_unsigned(126, 8), -- 201/255.0f
to_unsigned(126, 8), -- 202/255.0f
to_unsigned(126, 8), -- 203/255.0f
to_unsigned(126, 8), -- 204/255.0f
to_unsigned(126, 8), -- 205/255.0f
to_unsigned(126, 8), -- 206/255.0f
to_unsigned(126, 8), -- 207/255.0f
to_unsigned(126, 8), -- 208/255.0f
to_unsigned(126, 8), -- 209/255.0f
to_unsigned(126, 8), -- 210/255.0f
to_unsigned(126, 8), -- 211/255.0f
to_unsigned(126, 8), -- 212/255.0f
to_unsigned(126, 8), -- 213/255.0f
to_unsigned(126, 8), -- 214/255.0f
to_unsigned(126, 8), -- 215/255.0f
to_unsigned(126, 8), -- 216/255.0f
to_unsigned(126, 8), -- 217/255.0f
to_unsigned(126, 8), -- 218/255.0f
to_unsigned(126, 8), -- 219/255.0f
to_unsigned(126, 8), -- 220/255.0f
to_unsigned(126, 8), -- 221/255.0f
to_unsigned(126, 8), -- 222/255.0f
to_unsigned(126, 8), -- 223/255.0f
to_unsigned(126, 8), -- 224/255.0f
to_unsigned(126, 8), -- 225/255.0f
to_unsigned(126, 8), -- 226/255.0f
to_unsigned(126, 8), -- 227/255.0f
to_unsigned(126, 8), -- 228/255.0f
to_unsigned(126, 8), -- 229/255.0f
to_unsigned(126, 8), -- 230/255.0f
to_unsigned(126, 8), -- 231/255.0f
to_unsigned(126, 8), -- 232/255.0f
to_unsigned(126, 8), -- 233/255.0f
to_unsigned(126, 8), -- 234/255.0f
to_unsigned(126, 8), -- 235/255.0f
to_unsigned(126, 8), -- 236/255.0f
to_unsigned(126, 8), -- 237/255.0f
to_unsigned(126, 8), -- 238/255.0f
to_unsigned(126, 8), -- 239/255.0f
to_unsigned(126, 8), -- 240/255.0f
to_unsigned(126, 8), -- 241/255.0f
to_unsigned(126, 8), -- 242/255.0f
to_unsigned(126, 8), -- 243/255.0f
to_unsigned(126, 8), -- 244/255.0f
to_unsigned(126, 8), -- 245/255.0f
to_unsigned(126, 8), -- 246/255.0f
to_unsigned(126, 8), -- 247/255.0f
to_unsigned(126, 8), -- 248/255.0f
to_unsigned(126, 8), -- 249/255.0f
to_unsigned(126, 8), -- 250/255.0f
to_unsigned(126, 8), -- 251/255.0f
to_unsigned(126, 8), -- 252/255.0f
to_unsigned(126, 8), -- 253/255.0f
to_unsigned(126, 8), -- 254/255.0f
to_unsigned(127, 8) -- 255/255.0f
);

constant mantissaBits : mantissaArray :=
(
to_unsigned(0, 23), -- 0/255.0f
to_unsigned(0, 23), -- 1/255.0f
to_unsigned(0, 23), -- 2/255.0f
to_unsigned(4194304, 23), -- 3/255.0f
to_unsigned(0, 23), -- 4/255.0f
to_unsigned(2097152, 23), -- 5/255.0f
to_unsigned(4194304, 23), -- 6/255.0f
to_unsigned(6291456, 23), -- 7/255.0f
to_unsigned(0, 23), -- 8/255.0f
to_unsigned(1048576, 23), -- 9/255.0f
to_unsigned(2097152, 23), -- 10/255.0f
to_unsigned(3145728, 23), -- 11/255.0f
to_unsigned(4194304, 23), -- 12/255.0f
to_unsigned(5242880, 23), -- 13/255.0f
to_unsigned(6291456, 23), -- 14/255.0f
to_unsigned(7340032, 23), -- 15/255.0f
to_unsigned(0, 23), -- 16/255.0f
to_unsigned(524288, 23), -- 17/255.0f
to_unsigned(1048576, 23), -- 18/255.0f
to_unsigned(1572864, 23), -- 19/255.0f
to_unsigned(2097152, 23), -- 20/255.0f
to_unsigned(2621440, 23), -- 21/255.0f
to_unsigned(3145728, 23), -- 22/255.0f
to_unsigned(3670016, 23), -- 23/255.0f
to_unsigned(4194304, 23), -- 24/255.0f
to_unsigned(4718592, 23), -- 25/255.0f
to_unsigned(5242880, 23), -- 26/255.0f
to_unsigned(5767168, 23), -- 27/255.0f
to_unsigned(6291456, 23), -- 28/255.0f
to_unsigned(6815744, 23), -- 29/255.0f
to_unsigned(7340032, 23), -- 30/255.0f
to_unsigned(7864320, 23), -- 31/255.0f
to_unsigned(0, 23), -- 32/255.0f
to_unsigned(262144, 23), -- 33/255.0f
to_unsigned(524288, 23), -- 34/255.0f
to_unsigned(786432, 23), -- 35/255.0f
to_unsigned(1048576, 23), -- 36/255.0f
to_unsigned(1310720, 23), -- 37/255.0f
to_unsigned(1572864, 23), -- 38/255.0f
to_unsigned(1835008, 23), -- 39/255.0f
to_unsigned(2097152, 23), -- 40/255.0f
to_unsigned(2359296, 23), -- 41/255.0f
to_unsigned(2621440, 23), -- 42/255.0f
to_unsigned(2883584, 23), -- 43/255.0f
to_unsigned(3145728, 23), -- 44/255.0f
to_unsigned(3407872, 23), -- 45/255.0f
to_unsigned(3670016, 23), -- 46/255.0f
to_unsigned(3932160, 23), -- 47/255.0f
to_unsigned(4194304, 23), -- 48/255.0f
to_unsigned(4456448, 23), -- 49/255.0f
to_unsigned(4718592, 23), -- 50/255.0f
to_unsigned(4980736, 23), -- 51/255.0f
to_unsigned(5242880, 23), -- 52/255.0f
to_unsigned(5505024, 23), -- 53/255.0f
to_unsigned(5767168, 23), -- 54/255.0f
to_unsigned(6029312, 23), -- 55/255.0f
to_unsigned(6291456, 23), -- 56/255.0f
to_unsigned(6553600, 23), -- 57/255.0f
to_unsigned(6815744, 23), -- 58/255.0f
to_unsigned(7077888, 23), -- 59/255.0f
to_unsigned(7340032, 23), -- 60/255.0f
to_unsigned(7602176, 23), -- 61/255.0f
to_unsigned(7864320, 23), -- 62/255.0f
to_unsigned(8126464, 23), -- 63/255.0f
to_unsigned(0, 23), -- 64/255.0f
to_unsigned(131072, 23), -- 65/255.0f
to_unsigned(262144, 23), -- 66/255.0f
to_unsigned(393216, 23), -- 67/255.0f
to_unsigned(524288, 23), -- 68/255.0f
to_unsigned(655360, 23), -- 69/255.0f
to_unsigned(786432, 23), -- 70/255.0f
to_unsigned(917504, 23), -- 71/255.0f
to_unsigned(1048576, 23), -- 72/255.0f
to_unsigned(1179648, 23), -- 73/255.0f
to_unsigned(1310720, 23), -- 74/255.0f
to_unsigned(1441792, 23), -- 75/255.0f
to_unsigned(1572864, 23), -- 76/255.0f
to_unsigned(1703936, 23), -- 77/255.0f
to_unsigned(1835008, 23), -- 78/255.0f
to_unsigned(1966080, 23), -- 79/255.0f
to_unsigned(2097152, 23), -- 80/255.0f
to_unsigned(2228224, 23), -- 81/255.0f
to_unsigned(2359296, 23), -- 82/255.0f
to_unsigned(2490368, 23), -- 83/255.0f
to_unsigned(2621440, 23), -- 84/255.0f
to_unsigned(2752512, 23), -- 85/255.0f
to_unsigned(2883584, 23), -- 86/255.0f
to_unsigned(3014656, 23), -- 87/255.0f
to_unsigned(3145728, 23), -- 88/255.0f
to_unsigned(3276800, 23), -- 89/255.0f
to_unsigned(3407872, 23), -- 90/255.0f
to_unsigned(3538944, 23), -- 91/255.0f
to_unsigned(3670016, 23), -- 92/255.0f
to_unsigned(3801088, 23), -- 93/255.0f
to_unsigned(3932160, 23), -- 94/255.0f
to_unsigned(4063232, 23), -- 95/255.0f
to_unsigned(4194304, 23), -- 96/255.0f
to_unsigned(4325376, 23), -- 97/255.0f
to_unsigned(4456448, 23), -- 98/255.0f
to_unsigned(4587520, 23), -- 99/255.0f
to_unsigned(4718592, 23), -- 100/255.0f
to_unsigned(4849664, 23), -- 101/255.0f
to_unsigned(4980736, 23), -- 102/255.0f
to_unsigned(5111808, 23), -- 103/255.0f
to_unsigned(5242880, 23), -- 104/255.0f
to_unsigned(5373952, 23), -- 105/255.0f
to_unsigned(5505024, 23), -- 106/255.0f
to_unsigned(5636096, 23), -- 107/255.0f
to_unsigned(5767168, 23), -- 108/255.0f
to_unsigned(5898240, 23), -- 109/255.0f
to_unsigned(6029312, 23), -- 110/255.0f
to_unsigned(6160384, 23), -- 111/255.0f
to_unsigned(6291456, 23), -- 112/255.0f
to_unsigned(6422528, 23), -- 113/255.0f
to_unsigned(6553600, 23), -- 114/255.0f
to_unsigned(6684672, 23), -- 115/255.0f
to_unsigned(6815744, 23), -- 116/255.0f
to_unsigned(6946816, 23), -- 117/255.0f
to_unsigned(7077888, 23), -- 118/255.0f
to_unsigned(7208960, 23), -- 119/255.0f
to_unsigned(7340032, 23), -- 120/255.0f
to_unsigned(7471104, 23), -- 121/255.0f
to_unsigned(7602176, 23), -- 122/255.0f
to_unsigned(7733248, 23), -- 123/255.0f
to_unsigned(7864320, 23), -- 124/255.0f
to_unsigned(7995392, 23), -- 125/255.0f
to_unsigned(8126464, 23), -- 126/255.0f
to_unsigned(8257536, 23), -- 127/255.0f
to_unsigned(0, 23), -- 128/255.0f
to_unsigned(65536, 23), -- 129/255.0f
to_unsigned(131072, 23), -- 130/255.0f
to_unsigned(196608, 23), -- 131/255.0f
to_unsigned(262144, 23), -- 132/255.0f
to_unsigned(327680, 23), -- 133/255.0f
to_unsigned(393216, 23), -- 134/255.0f
to_unsigned(458752, 23), -- 135/255.0f
to_unsigned(524288, 23), -- 136/255.0f
to_unsigned(589824, 23), -- 137/255.0f
to_unsigned(655360, 23), -- 138/255.0f
to_unsigned(720896, 23), -- 139/255.0f
to_unsigned(786432, 23), -- 140/255.0f
to_unsigned(851968, 23), -- 141/255.0f
to_unsigned(917504, 23), -- 142/255.0f
to_unsigned(983040, 23), -- 143/255.0f
to_unsigned(1048576, 23), -- 144/255.0f
to_unsigned(1114112, 23), -- 145/255.0f
to_unsigned(1179648, 23), -- 146/255.0f
to_unsigned(1245184, 23), -- 147/255.0f
to_unsigned(1310720, 23), -- 148/255.0f
to_unsigned(1376256, 23), -- 149/255.0f
to_unsigned(1441792, 23), -- 150/255.0f
to_unsigned(1507328, 23), -- 151/255.0f
to_unsigned(1572864, 23), -- 152/255.0f
to_unsigned(1638400, 23), -- 153/255.0f
to_unsigned(1703936, 23), -- 154/255.0f
to_unsigned(1769472, 23), -- 155/255.0f
to_unsigned(1835008, 23), -- 156/255.0f
to_unsigned(1900544, 23), -- 157/255.0f
to_unsigned(1966080, 23), -- 158/255.0f
to_unsigned(2031616, 23), -- 159/255.0f
to_unsigned(2097152, 23), -- 160/255.0f
to_unsigned(2162688, 23), -- 161/255.0f
to_unsigned(2228224, 23), -- 162/255.0f
to_unsigned(2293760, 23), -- 163/255.0f
to_unsigned(2359296, 23), -- 164/255.0f
to_unsigned(2424832, 23), -- 165/255.0f
to_unsigned(2490368, 23), -- 166/255.0f
to_unsigned(2555904, 23), -- 167/255.0f
to_unsigned(2621440, 23), -- 168/255.0f
to_unsigned(2686976, 23), -- 169/255.0f
to_unsigned(2752512, 23), -- 170/255.0f
to_unsigned(2818048, 23), -- 171/255.0f
to_unsigned(2883584, 23), -- 172/255.0f
to_unsigned(2949120, 23), -- 173/255.0f
to_unsigned(3014656, 23), -- 174/255.0f
to_unsigned(3080192, 23), -- 175/255.0f
to_unsigned(3145728, 23), -- 176/255.0f
to_unsigned(3211264, 23), -- 177/255.0f
to_unsigned(3276800, 23), -- 178/255.0f
to_unsigned(3342336, 23), -- 179/255.0f
to_unsigned(3407872, 23), -- 180/255.0f
to_unsigned(3473408, 23), -- 181/255.0f
to_unsigned(3538944, 23), -- 182/255.0f
to_unsigned(3604480, 23), -- 183/255.0f
to_unsigned(3670016, 23), -- 184/255.0f
to_unsigned(3735552, 23), -- 185/255.0f
to_unsigned(3801088, 23), -- 186/255.0f
to_unsigned(3866624, 23), -- 187/255.0f
to_unsigned(3932160, 23), -- 188/255.0f
to_unsigned(3997696, 23), -- 189/255.0f
to_unsigned(4063232, 23), -- 190/255.0f
to_unsigned(4128768, 23), -- 191/255.0f
to_unsigned(4194304, 23), -- 192/255.0f
to_unsigned(4259840, 23), -- 193/255.0f
to_unsigned(4325376, 23), -- 194/255.0f
to_unsigned(4390912, 23), -- 195/255.0f
to_unsigned(4456448, 23), -- 196/255.0f
to_unsigned(4521984, 23), -- 197/255.0f
to_unsigned(4587520, 23), -- 198/255.0f
to_unsigned(4653056, 23), -- 199/255.0f
to_unsigned(4718592, 23), -- 200/255.0f
to_unsigned(4784128, 23), -- 201/255.0f
to_unsigned(4849664, 23), -- 202/255.0f
to_unsigned(4915200, 23), -- 203/255.0f
to_unsigned(4980736, 23), -- 204/255.0f
to_unsigned(5046272, 23), -- 205/255.0f
to_unsigned(5111808, 23), -- 206/255.0f
to_unsigned(5177344, 23), -- 207/255.0f
to_unsigned(5242880, 23), -- 208/255.0f
to_unsigned(5308416, 23), -- 209/255.0f
to_unsigned(5373952, 23), -- 210/255.0f
to_unsigned(5439488, 23), -- 211/255.0f
to_unsigned(5505024, 23), -- 212/255.0f
to_unsigned(5570560, 23), -- 213/255.0f
to_unsigned(5636096, 23), -- 214/255.0f
to_unsigned(5701632, 23), -- 215/255.0f
to_unsigned(5767168, 23), -- 216/255.0f
to_unsigned(5832704, 23), -- 217/255.0f
to_unsigned(5898240, 23), -- 218/255.0f
to_unsigned(5963776, 23), -- 219/255.0f
to_unsigned(6029312, 23), -- 220/255.0f
to_unsigned(6094848, 23), -- 221/255.0f
to_unsigned(6160384, 23), -- 222/255.0f
to_unsigned(6225920, 23), -- 223/255.0f
to_unsigned(6291456, 23), -- 224/255.0f
to_unsigned(6356992, 23), -- 225/255.0f
to_unsigned(6422528, 23), -- 226/255.0f
to_unsigned(6488064, 23), -- 227/255.0f
to_unsigned(6553600, 23), -- 228/255.0f
to_unsigned(6619136, 23), -- 229/255.0f
to_unsigned(6684672, 23), -- 230/255.0f
to_unsigned(6750208, 23), -- 231/255.0f
to_unsigned(6815744, 23), -- 232/255.0f
to_unsigned(6881280, 23), -- 233/255.0f
to_unsigned(6946816, 23), -- 234/255.0f
to_unsigned(7012352, 23), -- 235/255.0f
to_unsigned(7077888, 23), -- 236/255.0f
to_unsigned(7143424, 23), -- 237/255.0f
to_unsigned(7208960, 23), -- 238/255.0f
to_unsigned(7274496, 23), -- 239/255.0f
to_unsigned(7340032, 23), -- 240/255.0f
to_unsigned(7405568, 23), -- 241/255.0f
to_unsigned(7471104, 23), -- 242/255.0f
to_unsigned(7536640, 23), -- 243/255.0f
to_unsigned(7602176, 23), -- 244/255.0f
to_unsigned(7667712, 23), -- 245/255.0f
to_unsigned(7733248, 23), -- 246/255.0f
to_unsigned(7798784, 23), -- 247/255.0f
to_unsigned(7864320, 23), -- 248/255.0f
to_unsigned(7929856, 23), -- 249/255.0f
to_unsigned(7995392, 23), -- 250/255.0f
to_unsigned(8060928, 23), -- 251/255.0f
to_unsigned(8126464, 23), -- 252/255.0f
to_unsigned(8192000, 23), -- 253/255.0f
to_unsigned(8257536, 23), -- 254/255.0f
to_unsigned(8323072, 23) -- 255/255.0f
);

-- Note that this function assumes that the special cases of 00 (0.0f) and FF (1.0f) have both already been handled and
-- that our UNORM value already lies somewhere inbetween the two!
pure function GetExponentFromUNORM8(unorm8 : unsigned(7 downto 0) ) return unsigned is
begin
	if (Use_Exponent_Lut = false) then
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
	else
		return exponentBits(to_integer(unorm8) );
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
	if (Use_Mantissa_Lut = false) then
		-- The upper 7 bits, the middle 8 bits, and the lower 8 bits are all computed separately and get concatenated like this:
		return GetUpper7MantissaBitsFromUNORM8(unorm8) & GetMiddle8MantissaBitsFromUNORM8(unorm8) & GetLower8MantissaBitsFromUNORM8(unorm8);
	else
		return mantissaBits(to_integer(unorm8) );
	end if;
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
