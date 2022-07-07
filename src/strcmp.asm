BITS 64                                 ; 64-bit mode
SECTION         .text                   ; Code section
GLOBAL          strcmp                  ; Export my_strcmp

; int strcmp(const char *s1, const char *s2);

strcmp:
    ENTER       0, 0                    ; prologue
    XOR         rax, rax                ; set rax to 0
    XOR         r8b, r8b                ; set r8b to 0
    XOR         r9b, r9b                ; set r9b to 0
    PUSH        rcx                     ; push rcx (ctr) to stack
    XOR         rcx, rcx                ; set rcx to 0

_loop:
    MOV         r8b, BYTE [rdi]         ; r8b = rdi
    MOV         r9b, BYTE [rsi]         ; r9b = rsi

    CMP         r9b, 0                  ; check if r9b is equal to 0
    JZ          _null

    CMP         r8b, 0                  ; check if r8b is equal to 0
    JZ          _null

    CMP         r8b, r9b                ; check if r8b is equal to r9b
    JNZ         _null

    INC         rdx
    INC         rsi

    JMP         _loop

_null:
    MOVZX       rbx, r9b                ; rbx = r9b (movzx is used to cpy because r9b is a register smaller than rax so it fills the rest with 0)
    MOVZX       rax, r8b                ; rax = r8b (movzx is used to cpy because r8b is a register smaller than rax so it fills the rest with 0)
    SUB         rax, rbx                ; rax = rax - rbx
    LEAVE                               ; epilogue
    RET
