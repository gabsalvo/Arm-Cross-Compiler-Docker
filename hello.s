.section .text
.global _start

_start:
    MOV R0, #1          // File descriptor 1 (stdout)
    LDR R1, =message    // Message to print
    LDR R2, =len        // Message length
    MOV R7, #4          // System call for sys_write
    SWI 0               // Invoke operating system call

    MOV R0, #0          // Use 0 exit status
    MOV R7, #1          // System call for sys_exit
    SWI 0               // Invoke operating system call

.section .data
message:
    .ascii  "Hello, ARM World!\n"
len = . - message      // Length of the message
