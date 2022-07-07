BITS 64                                 ; 64-bit mode
SECTION         .text                   ; Code section
GLOBAL          memset                  ; Export memset

memset:
    ENTER       0, 0                    ; prologue
    PUSH        rcx                     ; push rcx (ctr) to stack
    XOR         rax, rax                ; set rax to 0
    XOR         rcx, rcx                ; set rcx to 0

_loop:
    CMP         rcx, rdx                ; is ctr equal to parameter n (eg. is all the memory crossed)
    JZ          _null                   ; if yes, return

    MOV         [rdi + rcx], sil        ; assign the 3st param the 1st one (eg. str[i] = c)

    INC         rcx
    JMP         _loop

_null:
    MOV          rax, rdi               ; rax = 0 -> return value set to 0
    POP          rcx                    ; set bk the value from rcx to the heap
    LEAVE                               ; epilogue
    RET
