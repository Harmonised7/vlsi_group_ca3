library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decimal_to_4x4bit is
port
(
    input_decimal : in  integer range 0 to 9999;
    output_bits   : out std_logic_vector(15 downto 0)
);
end entity decimal_to_4x4bit;

architecture rtl of decimal_to_4x4bit is
begin

process (input_decimal)
    variable remainder : integer range 0 to 9999 := input_decimal;
    begin
    for i in 0 to 3 loop
        output_bits(4*i+3 downto 4*i) <= std_logic_vector(to_unsigned(remainder mod 10, 4));
        remainder := remainder / 10;
    end loop;

    -- if remainder > 9999 then
    --     remainder := 0;
    -- end if;

    output_bits(15 downto 12) <= std_logic_vector(to_unsigned(remainder mod 10, 4));
end process;

end architecture rtl;