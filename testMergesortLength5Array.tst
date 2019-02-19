load mergesortFunction.asm,
output-file testMergesortLength5Array.out,
compare-to testMergesortLength5Array.cmp,
output-list RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2 RAM[24]%D2.6.2,

// Set stack contents
// return address
set RAM[101] 2,
// address of first element
set RAM[102] 20,
// length of array
set RAM[103] 5,

// Set stack pointer
set RAM[0] 103,

// Set memory for arrays
set RAM[20] 5,
set RAM[21] 3,
set RAM[22] 1,
set RAM[23] 4,
set RAM[24] 2,

repeat 80000 {
	ticktock;
}
output;
