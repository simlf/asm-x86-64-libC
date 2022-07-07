BITS 64                                     ; 64-bit mode
SECTION         .text                       ; Code section
GLOBAL          strlen                      ; Export strlen

strlen:
    ENTER       0, 0                        ; prologue
    PUSH        rcx                         ; push rcx (ctr) to stack
    XOR         rcx, rcx                    ; set rcx to 0
    XOR         rax, rax                    ; set rax to 0

_loop:
    CMP         BYTE [rdi + rcx], 0         ; is end of string
    JZ          _null                       ; if yes, go out from the loop

    INC         rcx
    JMP         _loop                       ; goes to the beginning of the function

_null:
    MOV         rax, rcx                    ; set return value to rcx
    POP         rcx                         ; set bk the value from rcx to the heap
    LEAVE                                   ; epilogue
    RET                                     ; return RAX
