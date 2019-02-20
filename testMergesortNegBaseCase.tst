load mergesortFunction.asm,
output-file testMergesortNegBaseCase.out,
compare-to testMergesortNegBaseCase.cmp,
output-list RAM[20]%D2.6.2,

// Set stack contents
// return address
set RAM[101] 3,
// address of first element
set RAM[102] 20,
// length of array
set RAM[103] 1,

// Set stack pointer
set RAM[0] 103,

// Set memory for arrays
set RAM[20] -1,

repeat 200 {
	ticktock;
}
output;
