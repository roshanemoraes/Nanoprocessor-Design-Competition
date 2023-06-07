----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 04:17:40 PM
-- Design Name: 
-- Module Name: NanoProcessor_With_7SegOut - Behavioral
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

entity NanoProcessor_With_7SegOut is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           LED_out : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Cathode_7seg : out STD_LOGIC_VECTOR (3 downto 0);
           Anode_7seg : out STD_LOGIC_VECTOR (6 downto 0));
end NanoProcessor_With_7SegOut;

architecture Behavioral of NanoProcessor_With_7SegOut is

COMPONENT NanoProcessor
    Port ( Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC;
       R7_out : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT Out_control_7seg 
    Port ( R7_out : in STD_LOGIC_VECTOR (3 downto 0);
           Anode_out : out STD_LOGIC_VECTOR (3 downto 0);
           Cathode_out : out STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;

    signal R7_output:std_logic_vector(3 downto 0);
    signal Res_input:std_logic;

begin
NanoProcessor_0 : NanoProcessor
    port map(
           Clk => Clk,
           Reset => Reset,
           Overflow => Overflow,
           Zero => Zero,
           R7_out => R7_output);    
           
Out_control_7seg_0 : Out_control_7seg 
    Port map ( R7_out => R7_output,
               Anode_out => Anode_7seg,
               Cathode_out => Cathode_7seg);

LED_out<=R7_output;

end Behavioral;
