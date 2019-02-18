// COPY function copies array of numbers from one address range to another 
// 0 will be stack pointer, starting at 100
// Input is in 16 (address of first element), 17 (length of array), 18 (destination address)
// Take as default destination address 19
// Take source array as beginning at 1000
// Reserve 1-15 as virtual registers
// The next 7 lines place a single argument from 0 on to the stack
// Push function return address 
@0
M=M+1
@RET_COPY
D=A
@0
A=M
M=D
// Push address of first element array
@0
M=M+1
@16
D=M
@0
A=M
M=D
// Push length of array
@0
M=M+1
@17
D=M
@0
A=M
M=D
// Push destination address
@0
M=M+1
@18
D=M
@0
A=M
M=D
//Call DIV
@COPY
0; JMP
(RET_COPY)
// END
(END)
@END
0;JMP
//////
// COPY
// Requires operands on the stack
(COPY)
// Clear virtual registers
@1
M=0
@2
M=0
@3
M=0
@4
M=0
// Save destination address in R4
@0
A=M
D=M
@4
M=D
@0
M=M-1
// Save length of array in R3
@0
A=M
D=M
@3
M=D
@0 
M=M-1
// Save source address in R2
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
// Copy logic
(COPY_LOOP)
// Check for loop termination condition
@3
D=M
@1
A=M
D; JEQ
@3
M=M-1
@2
A=M
D=M
@2
M=M+1
@4
A=M
M=D
@4
M=M+1
@COPY_LOOP
0; JMP
