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
    signal idata_en: std_logic;

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

clk_gen : process
begin
    CLK	<=	'1'; wait for CLK_PERIOD/2;
    CLK	<=	'0'; wait for CLK_PERIOD/2;
end process;

RESET <= '1', '0' after 3*CLK_PERIOD;

process
begin
    idata_a  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 10, 32) );
    idata_b  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 80, 32) );
    wait for 4*CLK_PERIOD;
    idata_en <= '1';
    wait for 10 ns;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for 10 ns;
    end loop;
    ASSERT UNSIGNED(odata) = TO_UNSIGNED( 10, 32) SEVERITY FAILURE; -- On ajoute les asserts
    
    idata_a  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 18, 32) );
    idata_b  <= STD_LOGIC_VECTOR( TO_UNSIGNED( 12, 32) );
    idata_en <= '1';
    wait for 10 ns;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for 10 ns;
    end loop;
    ASSERT UNSIGNED(odata) = TO_UNSIGNED( 8, 32) SEVERITY FAILURE; -- On ajoute les asserts
    wait;
end process;


end Behavioral;
