load mergesortFunction.asm,
output-file testMergesortLength3ArrayDivResult.out,
compare-to testMergesortLength3ArrayDivResult.cmp,
output-list RAM[15]%D2.6.2,

// Set stack contents
// return address
set RAM[101] 3,
// address of first element
set RAM[102] 20,
// length of array
set RAM[103] 3,

// Set stack pointer
set RAM[0] 103,

// Set memory for arrays
set RAM[20] 2,
set RAM[21] 1,
set RAM[22] 3,

repeat 200 {
	ticktock;
}
output;
