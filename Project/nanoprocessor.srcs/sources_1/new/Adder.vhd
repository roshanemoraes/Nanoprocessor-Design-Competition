----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 10:39:21 PM
-- Design Name: 
-- Module Name: Adder - Behavioral
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

entity Adder is
    Port ( Addr : in STD_LOGIC_VECTOR (2 downto 0);
           Addr_out : out STD_LOGIC_VECTOR (2 downto 0));
end Adder;

architecture Behavioral of Adder is

component HA
    port (
    A: in std_logic;
    B: in std_logic;
    S: out std_logic;
    C: out std_logic);
end component; 

SIGNAL HA0_C, HA1_C, HA2_C : std_logic;


begin
HA_0 : HA
    port map ( 
        A => Addr(0),
        B => '1',
        S => Addr_out(0),
        C => HA0_C);

HA_1: HA
    port map ( 
        A => Addr(1),
        B => HA0_C,
        S => Addr_out(1),
        C => HA1_C);

HA_2 : HA
    port map (
        A => Addr(2),
        B => HA1_C,
        S => Addr_out(2),
        C => HA2_C);
        
-- Alternative implementation: (used same amount of LUTs as above (2))...
-- Addr_out <= Addr + 1;

end Behavioral;
