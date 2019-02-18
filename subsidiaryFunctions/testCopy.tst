load copyFunction.asm,
output-file testCopy.out,
compare-to testCopy.cmp,
output-list RAM[1010]%D2.6.2 RAM[1011]%D2.6.2 RAM[1012]%D2.6.2 RAM[1013]%D2.6.2 RAM[1014]%D2.6.2,

set RAM[0] 100,
set RAM[16] 1000,
set RAM[17] 5,
set RAM[18] 1010,
set RAM[1000] 1,
set RAM[1001] 1,
set RAM[1002] 1,
set RAM[1003] 1,
set RAM[1004] 1;

repeat 200 {
	ticktock;
}
output;

//set PC 0;
