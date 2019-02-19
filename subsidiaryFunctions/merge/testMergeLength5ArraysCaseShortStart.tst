load mergeFunction.asm,
output-file testMergeLength5ArraysCaseShortStart.out,
compare-to testMergeLength5ArraysCase.cmp,
output-list RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2 RAM[24]%D2.6.2,

set RAM[0] 105,

set RAM[101] 4,
set RAM[102] 20,
set RAM[103] 2,
set RAM[104] 22,
set RAM[105] 3,

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
