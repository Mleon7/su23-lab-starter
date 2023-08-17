.import utils.s

.text
main:
    # This program will fill an array of size 10 with 0's

    # Allocate an array of size 10
    li a0 40   # 10 ints, 4 bytes each
    jal malloc # malloc is defined in utils.s
    mv t0 a0   # the pointer is returned in a0

    # Fill the array with 0's
    li t1 0  # t1 is the index
    li t2 9 # t2 is the size of the array

loop:
    # Store 0 at the current index
    sw x0 0(t0)
    # Increment the index
    addi t1 t1 1
    # Increment the pointer
    addi t0 t0 4
    # Check if we are done
    # If not, loop
    bge t2 t1 loop

    # Calculate the beginning of the array using the pointer to the last element (t0)
    # Move it into a0
    addi t0 t0 -40  # Move back by 9 elements (9 * 4 bytes)
    mv a0 t0

    # Call free to deallocate the memory
    jal free

    # Exit the program
    li a0 0
    jal exit
