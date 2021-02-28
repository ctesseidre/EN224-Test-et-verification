----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2021 13:57:35
-- Design Name: 
-- Module Name: PGCD_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PGCD_tb is
--  Port ( );
end PGCD_tb;

architecture Behavioral of PGCD_tb is

    constant CLK_PERIOD : time := 10 ns;

    signal CLK : std_logic;
    signal RESET : std_logic;

    signal idata_a: std_logic_vector(31 downto 0);
    signal idata_b: std_logic_vector(31 downto 0);
    signal idata_en: std_logic := '0';

    signal odata: std_logic_vector(31 downto 0);
    signal odata_en: std_logic;

begin

    inst_PGCD : entity work.PGCD
    port map(
        CLK      =>CLK,
        RESET    =>RESET,

        idata_a  =>idata_a,
        idata_b  =>idata_b,
        idata_en =>idata_en,

        odata    =>odata,
        odata_en =>odata_en
    );

    RESET <= '0', '1' after 3*CLK_PERIOD;

    clk_gen : process
    begin
        CLK	<=	'1'; wait for CLK_PERIOD/2;
        CLK	<=	'0'; wait for CLK_PERIOD/2;
    end process;

    process
    begin

        -- Equal values
        idata_a <= x"00000008";
        idata_b <= x"00000008";
        wait until RESET = '1';
        wait for CLK_PERIOD;
        idata_en <= '1';
        wait for CLK_PERIOD;
        idata_en <= '0';
        wait until odata_en = '1';
        assert unsigned(odata) = to_unsigned(8, 32) report "Results mismatch" severity error;

        -- A = 0
        idata_a <= x"00000000";
        idata_b <= x"00000005";
        wait for CLK_PERIOD;
        idata_en <= '1';
        wait for CLK_PERIOD;
        idata_en <= '0';
        wait until odata_en = '1';
        assert unsigned(odata) = to_unsigned(5, 32) report "Results mismatch" severity error;

        -- B = 0
        idata_a <= x"0000000A";
        idata_b <= x"00000000";
        wait for CLK_PERIOD;
        idata_en <= '1';
        wait for CLK_PERIOD;
        idata_en <= '0';
        wait until odata_en = '1';

        -- A > B
        idata_a <= x"0000000C";
        idata_b <= x"00000006";
        wait for CLK_PERIOD;
        idata_en <= '1';
        wait for CLK_PERIOD;
        idata_en <= '0';
        wait until odata_en = '1';

        -- A < B
        idata_a <= x"00000003";
        idata_b <= x"0000000C";
        wait for CLK_PERIOD;
        idata_en <= '1';
        wait for CLK_PERIOD;
        idata_en <= '0';
        wait until odata_en = '1';
        wait;

    end process;

end Behavioral;
