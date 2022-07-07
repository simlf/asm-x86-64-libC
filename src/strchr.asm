BITS 64                                 ; 64-bit mode
SECTION         .text                   ; Code section
GLOBAL          strchr                  ; Export my_strchr

strchr:
    ENTER       0, 0                    ; prologue
    PUSH        rcx                     ; push rcx (ctr) to stack
    XOR         rcx, rcx                ; set rcx to 0
    XOR         rax, rax                ; set rax to 0

_loop:
    CMP         [rdi + rcx], sil        ; is chr found (cmp str[i] with the 2nd parameter in on byte)
    JE          _found_chr

    CMP         BYTE [rdi + rcx], 0         ; is end of string
    JZ          _null                   ; if yes, return

    INC         rcx
    JMP         _loop

_found_chr:
    MOV         rax, rdi                ; rax = rdi -> return value is set to the str
    ADD         rax, rcx                ; add ctr value to rax to return only the str after the chr is found
    POP         rcx                     ; set bk the value from rcx to the heap
    LEAVE                               ; epilogue
    RET

_null:
    XOR          rax, rax               ; rax = 0 -> return value set to 0
    POP          rcx                    ; set bk the value from rcx to the heap
    LEAVE                               ; epilogue
    RET
