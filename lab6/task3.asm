.text
_main::

ldx     #Array1
ldy     #Result1
ldaa    #00

loop1:
ldab    0,x+
beq     null
jsr     [toupper,pcr]
stab    0,y+
bra     loop1

null:

swi
