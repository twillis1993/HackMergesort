load test,
output-file testOut.out,
compare-to testOut.cmp,
output-list RAM[4000]%D2.6.2 RAM[4001]%D2.6.2 RAM[4002]%D2.6.2 RAM[4003]%D2.6.2 RAM[4004]%D2.6.2 RAM[4005]%D2.6.2,

set RAM[101] 2,
set RAM[102] 4000,
set RAM[103] 6,

set RAM[0] 103,
set RAM[4000] -100,
set RAM[4001] -61,
set RAM[4002] -34,
set RAM[4003] -92,
set RAM[4004] 88,
set RAM[4005] -30,
repeat 80000 {
	ticktock;
}
output;
