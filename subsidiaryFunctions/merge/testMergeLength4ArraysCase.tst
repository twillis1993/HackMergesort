load mergeFunction.asm,
output-file testMergeLength4ArraysCase.out,
compare-to testMergeLength4ArraysCase.cmp,
output-list RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2,

breakpoint PC 178,

set RAM[0] 105,

set RAM[101] 2,
set RAM[102] 20,
set RAM[103] 2,
set RAM[104] 22,
set RAM[105] 2,

// Set memory for arrays
set RAM[20] 2,
set RAM[21] 4,
set RAM[22] 1,
set RAM[23] 3,

repeat 400000 {
	ticktock;
}
output;

