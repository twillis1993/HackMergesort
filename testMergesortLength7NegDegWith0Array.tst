load mergesortFunction.asm,
output-file testMergesortLength7NegDegWith0Array.out,
compare-to testMergesortLength7NegDegWith0Array.cmp,
output-list RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2 RAM[24]%D2.6.2 RAM[25]%D2.6.2 RAM[26]%D2.6.2,

//breakpoint PC 181,

// Set stack contents
// return address
set RAM[101] 2,
// address of first element
set RAM[102] 20,
// length of array
set RAM[103] 7,

// Set stack pointer
set RAM[0] 103,

// Set memory for arrays
set RAM[20] -2,
set RAM[21] -1,
set RAM[22] 0,
set RAM[23] -2,
set RAM[24] -1,
set RAM[25] -1,
set RAM[26] -1,

repeat 80000 {
	ticktock;
}
output;
