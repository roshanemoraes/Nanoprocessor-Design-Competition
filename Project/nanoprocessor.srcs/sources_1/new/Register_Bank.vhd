----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 04:46:54 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

entity Register_Bank is
    Port ( Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_in : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Reg_out0 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out4 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out7 : out STD_LOGIC_VECTOR (3 downto 0));
           
end Register_Bank;

architecture Behavioral of Register_Bank is

COMPONENT Decoder_3_to_8
PORT (
    I : in STD_LOGIC_VECTOR (2 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (7 downto 0)
);
END COMPONENT;

COMPONENT Reg
PORT (
    Clk : in STD_LOGIC;
    En : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR (3 downto 0);
    Q : out STD_LOGIC_VECTOR (3 downto 0) := "0000");
    
END COMPONENT;

SIGNAL Decoded_result : STD_LOGIC_VECTOR(7 downto 0);

begin

Decoder_3_to_8_0 : Decoder_3_to_8
port map (
    I => Reg_en,
    EN => '1',
    Y => Decoded_result
);

Reg_0 : Reg
port map (
    Clk => Clk,
    D => "0000", -- Hard-coding R0 to 0000
    EN => Decoded_result(0),
    Q => Reg_out0
);

Reg_1 : Reg
PORT MAP (
	Clk => Clk,
	D => Reg_en,
	EN => Decoded_result(1),
	Q => Reg_out1
);

Reg_2 : Reg
PORT MAP (
	Clk => Clk,
	D => Reg_en,
	EN => Decoded_result(2),
	Q => Reg_out2
);

Reg_3 : Reg
PORT MAP (
	Clk => Clk,
	D => Reg_en,
	EN => Decoded_result(3),
	Q => Reg_out3
);

Reg_4 : Reg
PORT MAP (
	Clk => Clk,
	D => Reg_en,
	EN => Decoded_result(4),
	Q => Reg_out4
);

Reg_5 : Reg
PORT MAP (
	Clk => Clk,
	D => Reg_en,
	EN => Decoded_result(5),
	Q => Reg_out5
);

Reg_6 : Reg
PORT MAP (
	Clk => Clk,
	D => Reg_en,
	EN => Decoded_result(6),
	Q => Reg_out6
);

Reg_7 : Reg
PORT MAP (
	Clk => Clk,
	D => Reg_en,
	EN => Decoded_result(7),
	Q => Reg_out7
);


end Behavioral;
