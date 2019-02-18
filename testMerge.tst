load mergeFunction.asm,
output-file testMerge.out,
compare-to testMerge.cmp,
output-list RAM[2000]%D2.6.2 RAM[2001]%D2.6.2 RAM[3000]%D2.6.2 RAM[3001]%D2.6.2,
//RAM[2002]%D2.6.2 RAM[2003]%D2.6.2 RAM[2004]%D2.6.2 RAM[3002]%D2.6.2 RAM[3003]%D2.6.2 RAM[3004]%D2.6.2,

set RAM[0] 100,

// Set arguments
set RAM[16] 20,
set RAM[17] 2,
set RAM[18] 22,
set RAM[19] 2,

// Set memory for arrays
set RAM[20] 3,
set RAM[21] 2,
set RAM[22] 1,
set RAM[23] 4,

repeat 400 {
	ticktock;
}
output;

//set PC 0;
