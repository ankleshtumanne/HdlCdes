// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.
// Mult.asm
// Multiplies R0 and R1 and stores the result in R2.

@R0         // Load R0 (multiplicand)
D=M         // D = R0
@R2         // Address R2
M=0         // Initialize R2 (product) to 0
@R1         // Load R1 (multiplier)
D=M         // D = R1
@MULT_LOOP  // Jump to MULT_LOOP if R1 > 0
D;JLE       // Exit the loop if D <= 0

(LOOP_START)
@R0         // Load R0
D=M         // D = R0
@R2         // Add R0 to R2
M=M+D       // R2 = R2 + R0
@R1         // Decrement R1
M=M-1       // R1 = R1 - 1
@MULT_LOOP  // If R1 > 0, repeat the loop
D=M         // D = R1
D;JGT       // Loop if R1 > 0

(END)
@END        // Infinite loop to terminate the program
0;JMP

