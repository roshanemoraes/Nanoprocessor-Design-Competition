----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 09:51:21 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
component Instruction_Decoder
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : out STD_LOGIC_VECTOR(2 downto 0);
           Load_Sel : out STD_LOGIC;
           Imd_Value : out STD_LOGIC_VECTOR(3 downto 0);
           Mux_A_sel : out STD_LOGIC_VECTOR (2 downto 0);
           Mux_B_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           Sub_Sel : out STD_LOGIC;
           Jmp_Flag : out STD_LOGIC;
           Jmp_Addr : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Load_Sel,Sub_Sel,Jmp_Flag : std_logic;
signal Reg_Check,Imd_Value : STD_LOGIC_VECTOR(3 downto 0);
signal Reg_En, Mux_A_Sel, Mux_B_Sel, Jmp_Addr : STD_LOGIC_VECTOR (2 downto 0);
signal Ins : STD_LOGIC_VECTOR (11 downto 0);

begin
UUT : Instruction_Decoder
        port map (
                   Ins => Ins,
                   Reg_Check => Reg_Check,
                   Reg_En => Reg_En,
                   Load_Sel => Load_Sel,
                   Imd_Value => Imd_Value,
                   Mux_A_Sel => Mux_A_Sel,
                   Mux_B_Sel => Mux_B_Sel,
                   Sub_Sel => Sub_Sel,
                   Jmp_Flag => Jmp_Flag,
                   Jmp_Addr => Jmp_Addr
        );
        

process 
begin
 Ins <= "100010001110"; -- MOVI 001 <- 1110 
 wait for 10ns; -- Reg_En <- 001, Load_Sel <- 1, Imd_Value <- 1110
 
 Ins <= "100100000101"; -- MOVI 010 <- 0101
 wait for 10ns; -- Reg_En <- 010, Load_Sel <- 1, Imd_Value <- 0101
 
 Ins <= "100110001110"; -- MOVI 011 <- 1110
 wait for 10ns; -- Reg_En <- 011, Load_Sel <- 1, Imd_Value <- 1110 
 
 Ins <= "010110000000"; -- NEG  011 <- 0000
 wait for 10ns; -- Sub_Sel <- 1, Mux_B_Sel <- 011, Mux_A_Sel <- 000
 -- Reg_En <- 011
 
 Reg_Check <= "0000";
 
 Ins <= "000010110000"; -- ADD 001 <- [011] + [001]
 wait for 10ns; -- Sub_Sel <- 0, Mux_B_Sel <- 011, Mux_A_Sel <- 001
 -- Reg_En <- 001
 -- Load_Sel <- 0
 
 Ins <= "110010000010"; --JZR 001 <- ( 001 != then jumpTo 010 )  
 wait for 10ns; -- Sub_Sel <- 0, Mux_B_Sel <- 000, Mux_A_Sel <- 001
 -- Load_Sel <- 0
 -- Jmp_Addr <- 010
 -- Jmp_Flag <- 1
 -- Reg_En <- 000 "Okay" -- will be 000 for JZR

 Ins <= "010100000000"; -- NEG  010 <- 0000
 wait for 10ns; -- Sub_Sel <- 1, Mux_B_Sel <- 010, Mux_A_Sel <- 000
 -- Reg_En <- 010
 -- Load_Sel <- 0
 wait;
 
 
end process;
end Behavioral;
