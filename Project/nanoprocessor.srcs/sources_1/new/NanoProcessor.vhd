----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 11:44:26 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end NanoProcessor;

architecture Behavioral of NanoProcessor is

COMPONENT Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
END COMPONENT;

COMPONENT Register_Bank
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
END COMPONENT;

COMPONENT TSB_Mux_8_way_4_bit
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
       I1 : in STD_LOGIC_VECTOR (3 downto 0);
       I2 : in STD_LOGIC_VECTOR (3 downto 0);
       I3 : in STD_LOGIC_VECTOR (3 downto 0);
       I4 : in STD_LOGIC_VECTOR (3 downto 0);
       I5 : in STD_LOGIC_VECTOR (3 downto 0);
       I6 : in STD_LOGIC_VECTOR (3 downto 0);
       I7 : in STD_LOGIC_VECTOR (3 downto 0);
       Sel : in STD_LOGIC_VECTOR (2 downto 0);
       Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT TSB_Mux_2_way_4_bit
PORT (
    I0 : in STD_LOGIC_VECTOR (3 downto 0);
    I1 : in STD_LOGIC_VECTOR (3 downto 0);
    Sel : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT TSB_Mux_2_way_3_bit
PORT (
    I0 : in STD_LOGIC_VECTOR (2 downto 0);
    I1 : in STD_LOGIC_VECTOR (2 downto 0);
    Sel : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

COMPONENT Add_Sub_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       Sub_Sel : in STD_LOGIC;
       Zero:out std_logic;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       Overflow : out STD_LOGIC);
END COMPONENT;

COMPONENT Instruction_Decoder
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
       Reg_Check : in STD_LOGIC_VECTOR (3 downto 0);
       Reg_En : out STD_LOGIC_VECTOR (2 downto 0); 
       Load_Sel : out STD_LOGIC;
       Imd_Value : out STD_LOGIC_VECTOR (3 downto 0);
       Mux_A_sel : out STD_LOGIC_VECTOR (2 downto 0);
       Mux_B_sel : out STD_LOGIC_VECTOR (2 downto 0);
       Sub_Sel : out STD_LOGIC;
       Jmp_Flag : out STD_LOGIC;
       Jmp_Addr : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

COMPONENT Adder
    Port ( Addr : in STD_LOGIC_VECTOR (2 downto 0);
       Addr_out : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

COMPONENT ROM
Port ( Addr : in STD_LOGIC_VECTOR (2 downto 0);
       Data : out STD_LOGIC_VECTOR (11 downto 0));
END COMPONENT;

COMPONENT Program_Counter
Port ( D : in STD_LOGIC_VECTOR (2 downto 0) := "000";
       Clk : in STD_LOGIC;
       Res : in STD_LOGIC := '0';
       Q : out STD_LOGIC_VECTOR (2 downto 0) := "000");
END COMPONENT;

SIGNAL slow_clock : STD_LOGIC;
SIGNAL reg_en : STD_LOGIC_VECTOR (2 downto 0); -- Register enable
SIGNAL data : STD_LOGIC_VECTOR (3 downto 0); -- Register input
SIGNAL r0, r1, r2, r3, r4, r5, r6, r7 : STD_LOGIC_VECTOR (3 downto 0); -- Register outputs

SIGNAL muxA_sel, muxB_sel : STD_LOGIC_VECTOR (2 downto 0); -- 8-way-4-bit muxes selectors
signal yA, yB : STD_LOGIC_VECTOR (3 downto 0); -- Output from 8-way-4-bit muxes

SIGNAL load_sel : STD_LOGIC; -- Load selector from instruction decoder to mux
SIGNAL imd_value : STD_LOGIC_VECTOR (3 downto 0); -- Immediate value from instruction decoder to mux

SIGNAL sub_sel : STD_LOGIC; -- add/sub selector from instruction decoder to add/sub unit

SIGNAL jmp_flag : STD_LOGIC; -- jmp_flag from instruction decoder to 2-way-3-bit mux
SIGNAL jmp_addr : STD_LOGIC_VECTOR (2 downto 0); -- jmp_flag from instruction decoder to 2-way-3-bit mux

SIGNAL add_sub_out : STD_LOGIC_VECTOR (3 downto 0);

SIGNAL ins : STD_LOGIC_VECTOR (11 downto 0); -- The instruction

SIGNAL rom_sel : STD_LOGIC_VECTOR (2 downto 0); -- The ROM selector

SIGNAL pc_in : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL adder_out : STD_LOGIC_VECTOR (2 downto 0); -- Output of the 3-bit Adder

begin

slow_clock_0 : Slow_Clk 
port map(
    Clk_in => Clk,
    Clk_out => slow_clock);

Register_Bank_0: Register_Bank
    port map (
        Clk => slow_clock,
        Reg_En => reg_en,
        Reg_in => data,
        Reg_out0 => r0,
        Reg_out1 => r1,
        Reg_out2 => r2,
        Reg_out3 => r3,
        Reg_out4 => r4,
        Reg_out5 => r5,
        Reg_out6 => r6,
        Reg_out7 => R7_out);

TSB_Mux_8_way_4_bit_0 : TSB_Mux_8_way_4_bit
    port map (
        I0 => r0,
        I1 => r1,
        I2 => r2,
        I3 => r3,
        I4 => r4,
        I5 => r5,
        I6 => r6,
        I7 => r7,
        Sel => muxA_sel,
        Y => yA);

TSB_Mux_8_way_4_bit_1 : TSB_Mux_8_way_4_bit
    port map (
        I0 => r0,
        I1 => r1,
        I2 => r2,
        I3 => r3,
        I4 => r4,
        I5 => r5,
        I6 => r6,
        I7 => r7,
        Sel => muxB_sel,
        Y => yB);

TSB_Mux_2_way_4_bit_0 : TSB_Mux_2_way_4_bit
port map(
    I0 => imd_value,
    I1 => add_sub_out,
    Sel => load_sel,
    Y => data);

Instruction_Decoder_0 : Instruction_Decoder
port map ( 
       Ins => ins,
       Reg_Check => yA,
       Reg_En => reg_en,
       Load_Sel => load_sel,
       Imd_Value => imd_value,
       Mux_A_sel => muxA_sel,
       Mux_B_sel => muxB_sel,
       Sub_Sel => sub_sel,
       Jmp_Flag => jmp_flag,
       Jmp_Addr => jmp_addr);

Add_Sub_4bit_0 : Add_Sub_4bit
port map ( 
       A => yA,
       B => yB,
       Sub_Sel => sub_sel,
       Zero => Zero,
       S => add_sub_out,
       Overflow => Overflow);

ROM_0 : ROM 
port map (
       Addr => rom_sel,
       Data => ins);

Program_Counter_0 : Program_Counter
port map (
       D => pc_in,
       Clk => slow_clock,
       Res => Reset,
       Q => rom_sel);

Adder_0 : Adder 
port map (
       Addr => rom_sel,
       Addr_out => adder_out);

TSB_Mux_2_way_3_bit_0 : TSB_Mux_2_way_3_bit
port map (
    I0 => jmp_addr,
    I1 => adder_out,
    Sel => jmp_flag,
    Y => pc_in);
    
    
end Behavioral;
