.org        0x54ea
    lcall   hotspotPowerHook

.org        0x7ca5
    .byte   0x00, 0x80
.org        0x7cb8
    .byte   0x00, 0x80              ; disable scramble function
.org        0x80dc
    .byte   0x00, 0x80
.org        0x80ef
    .byte   0x00, 0x80

.org        0x676
    .byte   "ULow Power"            ; change scramble menu

.org        0x74b0                  ; set U for H/L power indicator
    LCALL   uPowerIndicatorHook

.ORG        0xf03b                  ; start of mod code

hotspotPowerHook:
    push    acc
    mov     dptr, #0x2c2
    movx    a, @dptr
    jnb     acc.6, noULP
    pop     acc
    clr     a
    sjmp    hotspotResume
noULP:
    pop     acc
hotspotResume:
    mov     0x34, a
    ljmp    0x69e9

uPowerIndicatorHook:
    jnb     acc.6, noLowPowerIndicator
    mov     dptr, #U
    mov     r2, dph
    mov     r1, dpl
noLowPowerIndicator:
    mov     0x53, 0x4e
    ret
