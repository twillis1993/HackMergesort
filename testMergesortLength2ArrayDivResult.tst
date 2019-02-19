load mergesortFunction.asm,
output-file testMergesortLength2ArrayDivResult.out,
compare-to testMergesortLength2ArrayDivResult.cmp,
output-list RAM[15]%D2.6.2,

// Set stack contents
// return address
set RAM[101] 3,
// address of first element
set RAM[102] 20,
// length of array
set RAM[103] 2,

// Set stack pointer
set RAM[0] 103,

// Set memory for arrays
set RAM[20] 2,
set RAM[21] 1,

repeat 100 {
	ticktock;
}
output;
