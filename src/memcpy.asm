BITS 64                                 ; 64-bit mode
SECTION         .text                   ; Code section
GLOBAL          memcpy                  ; Export memcpy

memcpy:
    ENTER       0, 0                    ; prologue
    XOR         rax, rax                ; set rax to 0
    PUSH        rcx                     ; push rcx (ctr) to stack
    XOR         rcx, rcx                ; set rcx to 0

_loop:
    CMP         rcx, rdx                ; is ctr equal to parameter n (eg. is all the memory crossed)
    JZ          _null                   ; if yes, return

                                        ; swap values
    MOV         r8b, [rsi, rcx]         ; r8b (8 bit rg for r8) = str
    MOV         [rdi, rcx], r8b         ; str = r8b

    INC         rcx
    JMP         _loop

_null:
    MOV          rax, rdi               ; rax = str -> return value set to 1st parameter
    POP          rcx                    ; set bk the value from rcx to the heap
    LEAVE                               ; epilogue
    RET
