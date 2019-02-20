load mergeFunction.asm,
output-file testMergeOddLengthArraysCase.out,
compare-to testMergeOddLengthArraysCase.cmp,
output-list RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2 RAM[24]%D2.6.2 RAM[25]%D2.6.2 RAM[26]%D2.6.2,

set RAM[0] 105,

set RAM[101] 2,
set RAM[102] 20,
set RAM[103] 3,
set RAM[104] 23,
set RAM[105] 4,

// Set memory for arrays
set RAM[20] 2,
set RAM[21] 4,
set RAM[22] 6,
set RAM[23] 1,
set RAM[24] 3,
set RAM[25] 5,
set RAM[26] 7,

repeat 400000 {
	ticktock;
}
output;

//set PC 0;
