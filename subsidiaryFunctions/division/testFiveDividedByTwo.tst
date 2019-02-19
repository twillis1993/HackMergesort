load divisionFunction.asm,
output-file testFiveDividedByTwo.out,
compare-to testFiveDividedByTwo.cmp,
output-list RAM[15]%D2.6.2,

// Set stack contents
// return address
set RAM[101] 2,
// dividend
set RAM[102] 5,
// divisor
set RAM[103] 2,

// Set stack pointer
set RAM[0] 103,

repeat 100 {
	ticktock;
}
output;
