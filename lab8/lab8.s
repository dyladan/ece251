printf = $EE88

.org $1000
Prompt: .asciz "The sum of the selected integers is %d"
.org $1100
Array1: .blkb 200
.org $1180
Sum: .blkb 2

.text
_main::

ldy Array1
ldd #$FFFF
pshd
loop1:
puld
adcb #03
cpd #300
bhi exit
pshd
ldx #03
idiv
cba
bne loop1
puld
pshd
std 0,y
iny
iny
bra loop1
exit
ldx #0
ldy Array1
loop2:
cpx 0,y
beq exit2
adcb 0,y
iny
iny
bra loop2
exit2:
ldy #00
std 0,Sum
pshd
ldd #Prompt
jsr [printf,y]
swi
