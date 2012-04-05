.area program(abs)

toupper = $ee94

.org $1000
;Array1: .byte $57, $65, $6c, $43, $4f, $6d, $65, $21, $21, $21, $21, $20, $54, $6f, $20, $45, $63, $65, $32, $35, $31, $30, $25, $25, $25, $25, $25, $25, $00
Array1: .ascii "WelCOme!!!! To Ece2510%%%%%%"
	.byte $00

.org $1020
;Array2: .byte $44, $45, $50, $41, $52, $54, $4d, $45, $4e, $54, $20, $4f, $46, $20, $43, $4f, $4d, $50, $55, $54, $45, $52, $20, $45, $4e, $47, $49, $4e, $45, $45, $52, $49, $4e, $47, $00
Array2: .ascii "DEPARTMENT OF COMPUTER ENGINEERING"
	.byte $00

.org $1050
;Array3: .byte $54, $68, $45, $20, $63, $6c, $65, $76, $65, $72, $20, $66, $4f, $78, $20, $4a, $75, $6d, $70, $65, $64, $00
Array3: .ascii "ThE clever fOx Jumped"
	.byte $00

.org $1070
;Array4: .byte $4f, $76, $45, $72, $20, $74, $68, $45, $20, $4c, $61, $5a, $59, $20, $62, $52, $6f, $77, $4e, $20, $64, $6f, $47, $00
Array4: .ascii "OvEr thE LaZY bRowN doG"
	.byte $00

.org $1090
;Array5: .byte $57, $65, $6c, $63, $6f, $6d, $65, $20, $74, $6f, $20, $61, $6e, $64, $20, $43, $6f, $6d, $70, $75, $74, $65, $72, $00
Array5: .ascii "Welcome to and Computer"
	.byte $00

.org $1100
;Array6: .byte $45, $6c, $65, $63, $74, $72, $69, $63, $61, $6c, $00
Array6: .ascii "Electrical"
	.byte $00

.org $1110
;Array7: .byte $45, $6e, $67, $69, $6e, $65, $65, $72, $69, $6e, $67, $00
Array7: .ascii "Engineering"
	.byte $00

.org $1150
Result1: .byte $00, $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00, $00, $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00


;task 3

.text
_main::

ldx	#Array1
ldy	#Result1
ldaa	#00

loop1:
ldab	0,x+
beq	null
jsr	[toupper,pcr]
stab	0,y+
bra	loop1

null:

swi


;task 4
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

;task 5
.text
_main::

ldx	#Array3
ldy	#Result1

loop1:
	stx	0,y+
	inx
	ldaa	0,x
	bneq	loop1

ldaa	#$20
	staa	0,y+

ldx	#Array4

loop2:
	stx	0,y+
	inx
	ldaa	0,x
	bneq	loop2

ldx	#Result1
ldy	#Result1

loop3:
	ldab	0,x+
	beq	null
	jsr	tolower
	stab	0,y+
	bra	loop3
null:

ldx	#Result1
jsr	upperfirst


swi

tolower:
	ldaa	#$5b
	cba
	bmi	next
	subb	#$20
	beq	space



	addb	#$40
next:	ldaa 	#00
	rts
space:	addb	#$20
	bra	next

upperfirst:
	ldab	0,x
	jsr	[toupper,pcr]
	stab	0,x+
next:
	ldab	0,x+
	beq	out
	subb	#$20
	bneq	next
	ldab	0,x
	jsr	[toupper,pcr]
	stab	0,x+
	bra	next
out:	
	rts
