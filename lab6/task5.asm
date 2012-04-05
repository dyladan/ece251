.text
_main::

ldx     #Array3
ldy     #Result1

loop1:
        stx     0,y+
        inx
        ldaa    0,x
        bneq    loop1

ldaa    #$20
        staa    0,y+

ldx     #Array4

loop2:
        stx     0,y+
        inx
        ldaa    0,x
        bneq    loop2

ldx     #Result1
ldy     #Result1

loop3:
        ldab    0,x+
        beq     null
        jsr     tolower
        stab    0,y+
        bra     loop3
null:

ldx     #Result1
jsr     upperfirst


swi

tolower:
        ldaa    #$5b
        cba
        bmi     next
        subb    #$20
        beq     space
        addb    #$40
next:   ldaa    #00
        rts
space:  addb    #$20
        bra     next

upperfirst:
        ldab    0,x
        jsr     [toupper,pcr]
        stab    0,x+
next:
        ldab    0,x+
        beq     out
        subb    #$20
        bneq    next
        ldab    0,x
        jsr     [toupper,pcr]
        stab    0,x+
        bra     next
out:
        rts

