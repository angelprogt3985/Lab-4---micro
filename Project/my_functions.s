    AREA |.text|, CODE, READONLY, ALIGN=2
    THUMB
    REQUIRE8
    PRESERVE8

    EXPORT my_strcpy
    EXPORT my_capitalize

my_strcpy
loop
    ldrb r2, [r0]      ; Load byte into r2 from src pointer
    adds r0, #1        ; Increment src pointer
    strb r2, [r1]      ; Store byte in r2 into dst pointer
    adds r1, #1        ; Increment dst pointer
    cmp  r2, #0        ; Was the byte 0?
    bne  loop          ; If not, repeat the loop
    bx   lr            ; Else return from subroutine

my_capitalize
cap_loop
    ldrb r1, [r0]      ; Load byte into r1 from str pointer
    cmp  r1, #'a'-1    ; Compare with the character before 'a'
    bls  cap_skip      ; If is lower or same, then skip
    cmp  r1, #'z'      ; Compare it with the 'z' character
    bhi  cap_skip      ; If it is higher, then skip this byte
    subs r1, #32       ; Else capitalize it
    strb r1, [r0]      ; Store the byte back in memory
cap_skip
    adds r0, r0, #1    ; Increment str pointer
    cmp  r1, #0        ; Was the byte 0?
    bne  cap_loop      ; If not, repeat the loop
    bx   lr            ; Else return from subroutine

    END