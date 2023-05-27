----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2023 09:11:20 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is

    component FA
        port (
        A: in std_logic;
        B: in std_logic;
        C_in: in std_logic;
        S: out std_logic;
        C_out: out std_logic);
    end component;

    SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C  : std_logic;
    
begin
    FA_0 : FA
        port map (
            A => A0,
            B => B0,
            C_in => '0', -- Set to ground
            S => S0,
            C_Out => FA0_C);
    FA_1 : FA
        port map (
            A => A1,
            B => B1,
            C_in => FA0_C,
            S => S1,
            C_Out => FA1_C); 
    FA_2 : FA
             port map (
             A => A2,
             B => B2,
             C_in => FA1_C,
             S => S2,
             C_Out => FA2_C);
    FA_3 : FA
             port map (
             A => A3,
             B => B3,
             C_in => FA2_C,
             S => S3,
             C_Out => C_out);
end Behavioral; 
