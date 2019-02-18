load copyFunction.asm,
output-file testCopy.out,
output-list RAM[1010]%D2.6.2 RAM[1011]%D2.6.2;
compare-to testCopy.cmp,

set RAM[0] 100,
set RAM[16] 1000,
set RAM[17] 2,
set RAM[18] 1010,
set RAM[1000] 1,
set RAM[1001] 1,
repeat 200 {
	ticktock;
}
output;
