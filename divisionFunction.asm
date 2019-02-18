// DIV function performs integer division
// 0 will be stack pointer, starting at 100
// Input is in 16 (dividend) and 17 (divisor)
// Output is in 18
// Reserve 1-15 as virtual registers
// The next 7 lines place a single argument from 0 on to the stack
// Push function return address 
@0
M=M+1
@RET_DIV
D=A
@0
A=M
M=D
// Push dividend
@0
M=M+1
@16
D=M
@0
A=M
M=D
// Push divisor
@0
M=M+1
@17
D=M
@0
A=M
M=D
//Call DIV
@DIV
0; JMP
(RET_DIV)
// Save return value
@18
M=D
// END
(END)
@END
0;JMP
//////
// DIV
// Requires operands on the stack
(DIV)
// Clear virtual registers
@1
M=0
@2
M=0
@3
M=0
@4
M=0
// Save divisor in R3 
@0
A=M
D=M
@3
M=D
@0
M=M-1
// Save dividend in R2
@0
A=M
D=M
@2
M=D
@0 
M=M-1
// Save return address in R1
@0
A=M
D=M
@1
M=D
@0
M=M-1
(DIV_LOOP)
@2
D=M
@3
D=D-M
@DIV_END
D; JLT
@2
M=D
@4
M=M+1
@DIV_LOOP
0; JMP
(DIV_END)
@4
D=M
@1
A=M
0; JMP
/////
