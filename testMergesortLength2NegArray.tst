load mergesortFunction.asm,
output-file testMergesortLength2NegArray.out,
compare-to testMergesortLength2NegArray.cmp,
output-list RAM[20]%D2.6.2 RAM[21]%D2.6.2,

// Set stack contents
// return address
set RAM[101] 2,
// address of first element
set RAM[102] 20,
// length of array
set RAM[103] 2,

// Set stack pointer
set RAM[0] 103,

// Set memory for arrays
set RAM[20] -1,
set RAM[21] -2,

repeat 40000 {
	ticktock;
}
output;
