library ieee;
use std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package exam_utility is

function "*" (x,y : bit_vector)
return bit_vector;

end exam_utility;

package body exam_utility is

function "*" (x,y : bit_vector)

return bit_vector is
begin
return x*y;
end "*";
end exam_utility;
