load mergeFunction.asm,
output-file testMergeEvenLengthArraysCase.out,
compare-to testMergeEvenLengthArraysCase.cmp,
output-list RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2 RAM[24]%D2.6.2 RAM[25]%D2.6.2 RAM[26]%D2.6.2 RAM[27]%D2.6.2,

set RAM[0] 100,

// Set arguments
set RAM[16] 20,
set RAM[17] 4,
set RAM[18] 24,
set RAM[19] 4,

// Set memory for arrays
set RAM[20] 1,
set RAM[21] 3,
set RAM[22] 5,
set RAM[23] 7,
set RAM[24] 2,
set RAM[25] 4,
set RAM[26] 6,
set RAM[27] 8,

repeat 400000 {
	ticktock;
}
output;

//set PC 0;
