.globl factorial

.data
n: .word 8

.text
# Don't worry about understanding the code in main
# You'll learn more about function calls in lecture soon
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# factorial takes one argument:
# a0 contains the number which we want to compute the factorial of
# The return value should be stored in a0
factorial:
    # chatgpt:
    # Initialize t0 as 1, which will be used to accumulate the factorial value
    li t0, 1

    # Loop starts here
factorial_loop:
    # If a0 is 0, the factorial is 1 (base case)
    beqz a0, factorial_done

    # Multiply the current factorial value (t0) by the current value of a0
    mul t0, t0, a0

    # Decrement a0 by 1 for the next iteration
    addi a0, a0, -1

    # Repeat the loop
    j factorial_loop

    # Loop ends here
factorial_done:
    # Store the result in a0
    mv a0, t0

    # This is how you return from a function. You'll learn more about this later.
    # This should be the last line in your program.
    jr ra
