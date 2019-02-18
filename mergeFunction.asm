// MERGE function merges two arrays
// 0 will be stack pointer, starting at 100
// Input is in 16 (address of first element of first array), 17 (length of first array), 18 (address of first element of second array), 19 (length of second array)
// In place, so we don't need to specify destination address
// Reserve 1-15 as virtual registers
// Push function return address 
//////////////////////////////
// TODO limited to arrays of length 1000 by the temporary memory used in copy
// TODO compute/save length of array, destination address online function body rather than pushing first address twice
// TODO resolve having first array arguments on stack and length second in R5
// TODO current issue with merge loop, I think it relates to how we increment the indices, not breaking out of it even after 20000 ticks
// TODO all over the place, sometimes ends in the merge loop, sometimes outside it
// up to copy seems fine
// tested up until merge loop, seemed fine
// TODO use copy function to finish merge routine rather than current ad hoc approach
/////////////////////////////
// Push return address
@0
M=M+1
@RET_MERGE
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
// Save (but do not pop as the merging requires it) length of first array in R3
@0
A=M
D=M
@3
M=D
// Save (but do not pop as the merging requires it) address of first element of first array in R2
// Peek at penultimate element
@0
A=M-1
D=M
@2
M=D
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
// Current state of stack: [BASE] first address of first array, length of first array [TOP]
// Length of second array is in R5 
// R1 = address of first element of first array
// R2 = length of first array
// R3 = length of second array
// R4 = index into first array
// R5 = index into second array
// R6 = current element in first array
// R7 = current element in second array
// R8 = destination address
// Pop and save length of first array in R2
@0
A=M
D=M
@2
M=D
@0
M=M-1
// Pop and save address of first element of first array in R1 // TODO this was labelled as 1st of 2nd array, make sure there's not a bug here
@0
A=M
D=M
@1
M=D
@0
M=M-1
// Move length of second array from R5 to R3
@5
D=M
@3
M=D
// Index into first array in R4
@4
M=0
// Index into second array in R5
@5
M=0
// Merge arrays
(MERGE_LOOP)
// Check for termination condition for first array
@4
D=M
@2
D=M-D
@COPY_1_LAST
D; JEQ
// Check for termination condition for second array
@5
D=M
@3
D=M-D
@COPY_2_LAST
D; JEQ
// else compare current elements
// current element in first array in R6
@4
D=M
@2000
A=A+D
D=M
@6
M=D
// current element in second array R7
@5
D=M
@3000
A=A+D
D=M
@7
M=D
// compare current elements
@7
D=M
@6
D=D-M
// if D >0, copy second, else copy first, then increment relevant index
@COPY_2_EL
D; JLT
// copying element of first array: get index into destination array as sum of indices into each of the two arrays being merged
@4
D=M
@5
D=D+M
// D is now index into destination array. Add to address of first element to set D to destination address
@1
D=D+M
// Save destination address in R8
@8
M=D
// Get current element of first array in D
@6
D=M
// Write to destination address
@8
A=M
M=D
// Increment index into copy of first array
@4
M=M+1
@MERGE_LOOP
0; JMP
(COPY_2_EL)
// copying element of second array: get index into destination array as sum of indices into each of the two arrays being merged
@4
D=M
@5
D=D+M
// D is now index into destination array. Add to destination address to set D to destination address
@1
D=D+M
// Save destination address in R8
@8
M=D
// Get current element of second array in D
@7
D=M
// Write to destination address
@8
A=M
M=D
// Increment index into copy of second array
@5
M=M+1
@MERGE_LOOP
0; JMP
// if first array still has elements, copy, otherwise copy rest of array 2 elements
(COPY_1_LAST)
@RET_MERGE
0; JMP

(COPY_2_LAST)
@RET_MERGE
0; JMP

//////
// COPY
// Requires operands on the stack 
// [BASE] return address, source address, length of array, destination address [TOP]
(COPY)
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
