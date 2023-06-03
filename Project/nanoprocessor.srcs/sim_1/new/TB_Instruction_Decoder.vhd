----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 03:33:34 PM
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

    -- Component declaration for the Instruction_Decoder module
    component Instruction_Decoder is
        Port ( 
            Ins : in STD_LOGIC_VECTOR (11 downto 0);
            Reg_Check : in STD_LOGIC_VECTOR (3 downto 0);
            reg_en : out STD_LOGIC_VECTOR (2 downto 0); 
            Load_Sel : out STD_LOGIC;
            Imd_Value : out STD_LOGIC_VECTOR (3 downto 0);
            Mux_A_sel : out STD_LOGIC_VECTOR (2 downto 0);
            Mux_B_sel : out STD_LOGIC_VECTOR (2 downto 0);
            Sub_Sel : out STD_LOGIC;
            Jmp_Flag : out STD_LOGIC;
            Jmp_Addr : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Signal declarations
    signal ins_tb : STD_LOGIC_VECTOR (11 downto 0);
    signal reg_check_tb : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal reg_en_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal load_sel_tb : STD_LOGIC;
    signal im_value_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Mux_A_sel_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Mux_B_sel_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal sub_sel_tb : STD_LOGIC;
    signal jmp_flag_tb : STD_LOGIC;
    signal jmp_addr_tb : STD_LOGIC_VECTOR (2 downto 0);
   

begin

    -- Instantiate the Instruction_Decoder module
    uut: Instruction_Decoder port map (
        Ins => ins_tb,
        Reg_Check => reg_check_tb,
        reg_en => reg_en_tb,
        Load_Sel => load_sel_tb,
        Imd_Value => im_value_tb,
        Mux_A_sel => Mux_A_sel_tb,
        Mux_B_sel => Mux_B_sel_tb,
        Sub_Sel => sub_sel_tb,
        Jmp_Flag => jmp_flag_tb,
        Jmp_Addr => jmp_addr_tb
    );

    -- Stimulus process
    stimulus: process
    begin
        -- Test case 1 -- testing JZR 
        ins_tb <= "110010000100";
        reg_check_tb <= "0000";
        wait for 10ns; -- Jmp_Flag should be 1, Jmp_Addr should be 100
        reg_check_tb <= "0010";
        wait;

        -- Test case 2
--        ins_tb <= "000000000010";
--        reg_check_tb <= "0001";
--        wait for 10 ns;

--        -- Test case 3
--        ins_tb <= "000000000011";
--        reg_check_tb <= "0010";
--        wait for 10 ns;

--        -- Add more test cases as needed

        wait;
    end process;

    -- Assertion process (optional)
    assertion_process: process
    begin
        -- Add assertions to verify the output signals if needed

        wait;
    end process;

end Behavioral;
