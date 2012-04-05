.text
_main::

ldx     #Array2
ldy     #Result1
ldaa    #00

loop1:
ldab    0,x+
beq     null
jsr     tolower
stab    0,y+
bra     loop1

null:

swi

tolower:
        addd    #$20
        rts

