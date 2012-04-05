.org $1010
Array1: .byte $6b,$12,$7a,$21,$80,$19,$c5,$d7,$aa,$17,$f9,$12,$5a,$63,$a8,$33

.org $1020
Array2: .byte $56,$2f,$72,$b2,$aa,$3d,$cd,$2a,$f5,$46,$21,$ab,$7b,$2d,$3c,$05

.org $1030
Array3: .byte $85,$15,$19,$21,$02,$01,$32,$23,$90,$45,$03,$67,$11,$03,$00,$55

.org $1040
Array4: $0791553676826302, $8185929915224900

.org $1110
Array5: 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00

.org $1120
Array6: 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00

.org $1140
Array7: 0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000

.org $1180
Array8: 0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000

.org $11C0
Array9: 0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000,0000

lds	$3c00		;initialize stack pointer
ldy	#16		;initialize b as loop counter (16 bytes in Array1)
ldx	#Array1		;initialize x as pointer to Array1 base address

stackloop:		;label for stackloop
ldab	x		;load the value pointed to by c to accumulator a
pshb			;push the value in a onto the stack
inx			;increment x
dbne	y,stackloop	;decrement b then if b != 0 then go to stackloop

ldx	#15		;initialize x as loop counter
pulb			;load the top value from the stack to a
addloop:		;label for addloop
adcb	sp		;add the value on top of the stack to a with carry
ins			;increment sp
dbne	x,addloop	;decrement loop counter and if not equal to 0 go to addloop

std	$1100

ldb     #16             ;initialize b as loop counter (16 bytes in Array1)
ldx     #Array1         ;initialize x as pointer to Array1 base address

stackloop2:             ;label for stackloop
ldaa    x               ;load the value pointed to by c to accumulator a
psha                    ;push the value in a onto the stack
inx                     ;increment x
dbne    b,stackloop2    ;decrement b then if b != 0 then go to stackloop

ldx     #15             ;initialize x as loop counter
pula                    ;load the top value from the stack to a
addloop2:               ;label for addloop
adda    0,sp            ;add the value on top of the stack to a with carry
ins                     ;increment sp
dbne    x,addloop2      ;decrement loop counter and if not equal to 0 go to addloop

std     $1104

;task3
ldx	#Array2		;load a pointer to array2 into x
ldab	#16		;load a loop counter into register b

stackloop3:		;label for stackloop
ldaa	x		;load the value pointed to by x to a
psha			;push a to the stack
inx			;increment x
dbne	b,stackloop3	;decrement b then if not equal to zero go to stackloop

ldy	#16		;load a loop counter into register y
ldx	#Array6		;load the address of Array6 into x
ldab	#00		;clear b to be a counter

checkloop:		;label checkloop
pula			;pull the top value from the stack to a
cmpa	$3c		;compute a-$3c and update ccr but don't store result
bmi	count		;if N is set go to count
dbne	y,checkloop	;decrement y and if not 0 go to checkloop
bra	done		;go to done

count:			;label for count
sta	x		;store the value in a to the location at x
inx			;incrememt x
inb			;increment b
dbne	y,checkloop	;decrement y and if not 0 go to checkloop
done:			;label done

stab	$112f		;store count to $112f

;task4
ldx	#Array2
ldy	#Array3
lds	#Array5
mov	#16,$1200

compareloop:
ldaa	x
ldab	y
cba
bmi	bbigger

stab	sp
ins
dbne	$1200,compareloop
bra	done2

bbigger:
staa	sp
ins
dbne	$1200,compareloop

done2:
lds	#Array5

ldx     #Array5
ldy     #Array4
lds     #Array5
mov     #16,$1200

compareloop2:
ldaa    x
ldab    y
cba
bmi     bbigger2

stab    sp
inx
iny
ins
dbne    $1200,compareloop2
bra     done3

bbigger2:
staa    sp
ins
inx
iny
dbne    $1200,compareloop2

done3:

;task5

