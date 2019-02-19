@MERGESORT
0; JMP
(END)
@END
0; JMP
//////////////
// MERGESORT
// Requires operands on the stack
// Args: BASE return address, address of array's first element, length of array TOP
(MERGESORT)
// Save (but do not pop) length of input array in R1
@0
A=M
D=M
@1
M=D
@1
D=M
// Is length of array 1?
@RET_MERGESORT
D-1; JEQ
// else make merge call on mergesorted arrays
// work out length of each subarray
// NB: state of stack [BASE] return address of mergesort, address of array's first element, length of first array [TOP]
// Push function return address 
@0
M=M+1
@RET_DIV
D=A
@0
A=M
M=D
// Push dividend (length of array)
@0
M=M+1
@1
D=M
@0
A=M
M=D
// Push divisor (it's always 2)
@0
M=M+1
@2
D=A
@0
A=M
M=D
@DIV
0; JMP
(RET_DIV)
@1
M=D
// TODO remove me NB: not state now, but to come
// R1: div result i.e. length of first half of array
// R2: length of input array
// R3: address of array's first element
// NB: state of stack [BASE] return address of mergesort, address of array's first element, length of input array [TOP]
// Pop and save length of array in R2
@0
A=M
D=M
@2
M=D
@0
M=M-1
// Pop and save address of array's first element
@0
A=M
D=M
@3
M=D
@0
M=M-1
// State of stack [BASE] return address [TOP]
// Mergesort each array, then call merge on the mergesorted arrays
//call merge on two with the [BASE] return address first address of the first array, length of first array, first address of second array, length of second array
// Push arguments for merge
@0
M=M+1
@RET_MERGESORT_MERGE
D=A
@0
A=M
M=D
// Push address of first element of first half of array
@0
M=M+1
@3
D=M
@0
A=M
M=D
// Push length of first half of array
@0
M=M+1
@1
D=M
@0
A=M
M=D
// Push address of first element of second half of array
@0
M=M+1
@3
D=M
@1
D=D+M
@0
A=M
M=D
// Push length of second half of array
@0
M=M+1
@2
D=M
@1
D=D-M
@0
A=M
M=D
// Push arguments for array 2's mergesort 
// Push return address of recursive call on second half of array
@0
M=M+1
@RET_MERGESORT_2
D=A
@0
A=M
M=D
// Push address of first element of second half of array
@0
M=M+1
@3
D=M
@1
D=D+M
@0
A=M
M=D
// Push length of second half of array
@0
M=M+1
@2
D=M
@1
D=D-M
@0
A=M
M=D
// Push arguments for array 1's mergesort 
// Push return address
@0
M=M+1
@RET_MERGESORT_1
D=A
@0
A=M
M=D
// Push address of first element of first half of array
@0
M=M+1
@3
D=M
@0
A=M
M=D
// Push length of first half of array
@0
M=M+1
@1
D=M
@0
A=M
M=D
// TODO: funny stuff seems to be happening once we hit recursive calls
@MERGESORT
0; JMP
(RET_MERGESORT_1)
@MERGESORT
0; JMP
(RET_MERGESORT_2)
(RET_MERGESORT)
@MERGE
0; JMP
(RET_MERGESORT_MERGE)
// Pop all arguments off and return
// Decrement stack pointer by 2 to get to return address
@2
D=A
@0
M=M-D
// Stack pointer now points to element storing return address
A=M
D=M
@0
M=M-1
A=D
0; JMP
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
// Pop and save address of first element of first array in R1
@0
A=M
D=M
@1
M=D
@0
M=M-1
// Save this address as the destination address, too, for edge case where one array is empty
@8
M=D
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
@COPY_2_LAST
D; JEQ
// Check for termination condition for second array
@5
D=M
@3
D=M-D
@COPY_1_LAST
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
// compare current elements with (current element in second array - current element in first array)
@6
D=D-M
// if D < 0, copy second, else copy first, then increment relevant index
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
// if first array still has elements, copy, otherwise copy rest of second array elements
(COPY_1_LAST)
// Push return address
@0
M=M+1
@RET_MERGE
D=A
@0
A=M
M=D
//  Push address of first remaining element of first array
@0
M=M+1
@4
D=M
@2000
A=A+D
D=A
@0
A=M
M=D
//  Push length of remaining part of first array
@0
M=M+1
@2
D=M
@4
D=D-M
@0
A=M
M=D
//  Push destination address
@0
M=M+1
@8
D=M+1
@0
A=M
M=D
@COPY
0; JMP
(COPY_2_LAST)
// Push return address
@0
M=M+1
@RET_MERGE
D=A
@0
A=M
M=D
//  Push address of first remaining element of second array
@0
M=M+1
@5
D=M
@3000
A=A+D
D=A
@0
A=M
M=D
//  Push length of remaining part of second array
@0
M=M+1
@3
D=M
@5
D=D-M
@0
A=M
M=D
// Push destination address
@0
M=M+1
@8
D=M+1
@0
A=M
M=D
@COPY
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
//////
// DIV
// Requires operands on the stack BASE return address dividend divisor TOP
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
//////////////
