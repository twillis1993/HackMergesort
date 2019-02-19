load mergeFunction.asm,
output-file testMergeSecondOddLegnthArraysCase.out,
compare-to testMergeSecondOddLengthArraysCase.cmp,
output-list RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2 RAM[24]%D2.6.2,

set RAM[0] 100,

// Set arguments
set RAM[16] 20,
set RAM[17] 2,
set RAM[18] 22,
set RAM[19] 3,

// Set memory for arrays
set RAM[20] 1,
set RAM[21] 3,
set RAM[22] 2,
set RAM[23] 4,
set RAM[24] 6,

repeat 400000 {
	ticktock;
}
output;

//set PC 0;
