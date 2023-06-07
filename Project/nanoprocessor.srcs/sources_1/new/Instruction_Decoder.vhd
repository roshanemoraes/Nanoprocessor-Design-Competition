----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 02:40:06 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Check : in STD_LOGIC_VECTOR (3 downto 0); -- register check for jump
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0); 
           Load_Sel : out STD_LOGIC;
           Imd_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Mux_A_sel : out STD_LOGIC_VECTOR (2 downto 0);
           Mux_B_sel : out STD_LOGIC_VECTOR (2 downto 0);
           Sub_Sel : out STD_LOGIC;
           Jmp_Flag : out STD_LOGIC;
           Jmp_Addr : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

COMPONENT Decoder_2_to_4 is
    Port ( I : in STD_LOGIC_VECTOR(1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end COMPONENT;

SIGNAL DECODER_RESULT : STD_LOGIC_VECTOR (3 downto 0); -- Decodes instruction and stores 4-bit value

SIGNAL OP_ADD : STD_LOGIC;
SIGNAL OP_NEG: STD_LOGIC;
SIGNAL OP_MOVI: STD_LOGIC;
SIGNAL OP_JZR: STD_LOGIC;

SIGNAL MUX_A_DISABLED : STD_LOGIC;
SIGNAL MUX_B_DISABLED : STD_LOGIC;

begin
Decoder_2_to_4_0 : Decoder_2_to_4
port map(
    I => Ins (11 downto 10),
    EN => '1',
    Y => DECODER_RESULT);
    
    OP_ADD  <= DECODER_RESULT(0);
    OP_NEG  <= DECODER_RESULT(1);
    OP_MOVI <= DECODER_RESULT(2);
    OP_JZR  <= DECODER_RESULT(3);
    
    MUX_A_DISABLED <= OP_NEG OR OP_MOVI;  -- A has to be disabled in these instructions
    
    -- Setting register address for Mux A
    Mux_A_sel(0) <= Ins(7) AND NOT MUX_A_DISABLED;
    Mux_A_sel(1) <= Ins(8) AND NOT MUX_A_DISABLED;
    Mux_A_sel(2) <= Ins(9) AND NOT MUX_A_DISABLED;
    
    -- B should get instructions in last bits in these instructions
    
    --1) for NEG    - load (13,12,11) to Mux_B
    --2) for others - load (10,9,8)   to Mux_B
    
    Mux_B_sel(0) <= Ins(4) OR (Ins(7) AND OP_NEG);
    Mux_B_sel(1) <= Ins(5) OR (Ins(8) AND OP_NEG);
    Mux_B_sel(2) <= Ins(6) OR (Ins(9) AND OP_NEG);
    
    Sub_Sel <= OP_NEG;
    
    reg_en <= Ins (9 downto 7) AND NOT(OP_JZR, OP_JZR, OP_JZR);
    
    Load_Sel <= OP_MOVI; -- Select whether adder output or immediate value is sent to registers
    
    Imd_Value <= Ins (3 downto 0);
    
    Jmp_Flag <= OP_JZR AND (NOT (Reg_Check(0) OR Reg_Check(1) OR Reg_Check(2) OR Reg_Check(3)));
    -- Jmp_Flag <= OP_JZR AND (NOT Reg_Check(0 to 3));
    
    Jmp_Addr <= Ins(2 downto 0);
    
    
end Behavioral;
