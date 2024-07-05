.ORG        0x6a48
    MOV     r3, #0x4a               ; set higher gain

.ORG        0x6a75
    LJMP    ctcssOverride           ; replace original CTCSS frequency function

.ORG        0xf03b                  ; end of firmware, start of mod code

ctcssOverride:
    mov     dptr, #0x142            ; ext mem address of current CTCSS setting (index; 0 is off, 1-50 is 67.0 to 254.1 )
    movx    a, @dptr                ; get current setting, it should be 1-50 as this function isn't called when it's off (0)
    dec     a                       ; reduce it by one to get a 0-index value
    rl      a                       ; multiply it by 2 to get the correct word offet into the table    
    mov     dptr, #ctcssTable       ; move the location of the precomputed table into the dptr
    clr     c                       ; clear the carry bit so it doesn't interfere
    addc    a, dpl                  ; add the offset to the low byte of the dptr
    mov     dpl, a                  ; put the sum back into the dtpr low byte
    clr     a                       ; set a to 0
    addc    a, dph                  ; add 0 to the dptr high byte, this will add 1 if the previous add caused a carry
    mov     dph, a                  ; put this back into the high byte of the dptr
                                    ; the dtpr should now be pointing at the correct byte pair in code memory
    clr     a                       ; set a to 0 for code read
    movc    a, @a+dptr              ; get the first byte (high byte) of the pair
    mov     r5, a                   ; put high byte into r5 consistent with the original routine
    inc     dptr                    ; move to the next byte (low byte) of the pair
    clr     a                       ; set a to 0 for code read
    movc    a, @a+dptr              ; get the low byte of the pair
    mov     r3, a                   ; put low byte into r3 consistent with the original routine
    mov     r7, #0x07               ; register to set goes into r7, consistent with the original routine
    ret                             ; return control to firmware

ctcssTable:
    .byte   0x05,0x67, 0x05,0x97, 0x05,0xCD, 0x06,0x00, 0x06,0x36, 0x06,0x6E, 0x06,0xA8, 0x06,0xE3, 0x07,0x23, 0x07,0x61
    .byte   0x07,0xA6, 0x07,0xDB, 0x08,0x11, 0x08,0x59, 0x08,0xA6, 0x08,0xF2, 0x09,0x42, 0x09,0x95, 0x09,0xEC, 0x0A,0x45
    .byte   0x0A,0xA2, 0x0B,0x03, 0x0B,0x66, 0x0B,0xCB, 0x0C,0x36, 0x0C,0xA4, 0x0C,0xE4, 0x0D,0x15, 0x0D,0x59, 0x0D,0x8B
    .byte   0x0D,0xD1, 0x0E,0x05, 0x0E,0x4D, 0x0E,0x83, 0x0E,0xCD, 0x0F,0x05, 0x0F,0x51, 0x0F,0x8D, 0x0F,0xDC, 0x10,0x17
    .byte   0x10,0x6A, 0x10,0xA8, 0x10,0xFF, 0x11,0x98, 0x12,0x34, 0x12,0x7B, 0x12,0xD8, 0x13,0x81, 0x14,0x30, 0x14,0x7F


