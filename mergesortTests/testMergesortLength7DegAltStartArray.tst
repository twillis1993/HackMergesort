load mergesortFunction.asm,
output-file testMergesortLength7DegAltStartArray.out,
compare-to testMergesortLength7DegAltStartArray.cmp,
output-list RAM[4000]%D2.6.2 RAM[4001]%D2.6.2 RAM[4002]%D2.6.2 RAM[4003]%D2.6.2 RAM[4004]%D2.6.2 RAM[4005]%D2.6.2 RAM[4006]%D2.6.2,

//breakpoint PC 181,

// Set stack contents
// return address
set RAM[101] 2,
// address of first element
set RAM[102] 4000,
// length of array
set RAM[103] 7,

// Set stack pointer
set RAM[0] 103,

// Set memory for arrays
set RAM[4000] 2,
set RAM[4001] 1,
set RAM[4002] 1,
set RAM[4003] 2,
set RAM[4004] 1,
set RAM[4005] 1,
set RAM[4006] 1,

repeat 80000 {
	ticktock;
}
output;
