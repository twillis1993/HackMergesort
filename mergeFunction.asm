// MERGE function merges two arrays
// 0 will be stack pointer, starting at 100
// Input is in 16 (address of first element of first array), 17 (length of first array), 18 (address of first element of second array), 19 (length of second array)
// In place, so we don't need to specify destination address
// Reserve 1-15 as virtual registers
// Push function return address 
//////////////////////////////
// TODO is copying a and b to 2000 and 3000 ok?
// TODO limited to arrays of length 1000 by the temporary memory used in copy
// TODO what information does merge need once both copies return?
//	destination address (address of first element of first array)
// 	length of merged array	
// TODO compute/save length of array, destination address online function body rather than pushing first address twice
/////////////////////////////
// Push return address
@0
M=M+1
@RET_MERGE
D=A
@0
A=M
M=D
// Push address of length of merged array
@0
M=M+1
@17
D=M
@19
D=D+M
@0
A=M
M=D
// Push address of first element array TODO don't pop me in second copy call
@0
M=M+1
@16
D=M
@0
A=M
M=D
// Push length of first array
@0
M=M+1
@17
D=M
@0
A=M
M=D
// Push address of second element array
@0
M=M+1
@18
D=M
@0
A=M
M=D
// Push length of second array
@0
M=M+1
@19
D=M
@0
A=M
M=D
//Call DIV
@MERGE
0; JMP
(RET_MERGE)
// END
(END)
@END
0;JMP
//////////////
// MERGE
// Requires operands on the stack
(MERGE)
// Clear virtual registers
//@1
//M=0
//@2
//M=0
//@3
//M=0
//@4
//M=0
//@5
//M=0
// Pop and save length of second array in R5
@0
A=M
D=M
@5
M=D
@0
M=M-1
// Pop and save address of first element of second array in R4
@0
A=M
D=M
@4
M=D
@0
M=M-1
// COPY to 3000 onwards
// Push function return address
@0
M=M+1
@RET_COPY_ONE
D=A
@0
A=M
M=D
// Push address of first element of second array
@0
M=M+1
@4
D=M
@0
A=M
M=D
// Push length of second array
@0
M=M+1
@5
D=M
@0
A=M
M=D
// Push destination address
@0
M=M+1
@3000
D=A
@0
A=M
M=D
@COPY
0; JMP
(RET_COPY_ONE)
// Clear virtual registers
//@1
//M=0
//@2
//M=0
//@3
//M=0
//@4
//M=0
//@5
//M=0
// Save length of first array in R3
@0
A=M
D=M
@3
M=D
@0
M=M-1
// Save address of first element of first array in R2
@0
A=M
D=M
@2
M=D
@0
M=M-1
// COPY to 2000 onwards
// Push function return address
@0
M=M+1
@RET_COPY_TWO
D=A
@0
A=M
M=D
// Push address of first element of first array
@0
M=M+1
@2
D=M
@0
A=M
M=D
// Push length of first array
@0
M=M+1
@3
D=M
@0
A=M
M=D
// Push destination address
@0
M=M+1
@2000
D=A
@0
A=M
M=D
@COPY
0; JMP
(RET_COPY_TWO)
// Arrays copied, time to merge
//To merge, need source addresses (2000 and 3000), length of each array, first address of first array
//
@RET_MERGE
0; JMP
//////
// COPY
// Requires operands on the stack
(COPY)
// Clear virtual registers
//@1
//M=0
//@2
//M=0
//@3
//M=0
//@4
//M=0
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
//////////////
