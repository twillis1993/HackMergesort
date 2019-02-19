load mergesortFunction.asm,
output-file testMergesortLength5ArrayDivResult.out,
compare-to testMergesortLength5ArrayDivResult.cmp,
output-list RAM[15]%D2.6.2,

// Set stack contents
// return address
set RAM[101] 3,
// address of first element
set RAM[102] 20,
// length of array
set RAM[103] 5,

// Set stack pointer
set RAM[0] 103,

// Set memory for arrays
set RAM[20] 2,
set RAM[21] 1,
set RAM[22] 3,
set RAM[23] 1,
set RAM[24] 3,

repeat 200 {
	ticktock;
}
output;
