PORTA   =  $00
PORTB   =  $01
DDRA    =  $02
DDRB    =  $03

.org $1000
temp .blkb 1

.text
_main::

movb #$00,DDRA
movb #$FF,DDRB


repeatloop:

ldaa PORTA
ldab PORTA
jsr time_delay ;start delay
jsr or_logic ;start the NOR logic
jsr display


bra repeatloop ;repeat until user interrupt

swi


or_logic:
anda #$F0
andb #$0F
stab temp
lsra ;shift a over 4 bits
lsra
lsra
lsra
oraa temp ;or a with b
coma   ;take the compliment at A



time_delay:
	ldaa  #250	; 1 E cycles
out_loop:
	ldy   #9,999	; 1 E cycles
	psha		; 2 E cycles
	pula		; 3 E cycles
	nop		; 1 E cycle
	nop		; 1 E cycle
	nop		; 1 E cycle

in_loop:	
	psha		; 2 E cycles
	pula		; 3 E cycles
	nop		; 1 E cycle
	nop		; 1 E cycle
	nop		; 1 E cycle
	nop		; 1 E cycle
	dbne  y,in_loop	; 3/3 E cycles

	dbne  a,out_loop	; 3/3 E cycles
	rts
	
display:
	ldab #$00
	cba
	bne mov_one
	movb #$7E,PORTB
	rts
mov_one:	
	ldab #$01
	cba
	bne mov_two
	movb #$30,PORTB	
	rts
mov_two:	
	ldab #$02
	cba
	bne mov_three
	movb #$6D,PORTB	
	rts
mov_three:	
	ldab #$03
	cba
	bne mov_four
	movb #$79,PORTB
	rts
mov_four:	
	ldab #$04
	cba
	bne mov_five
	movb #$33,PORTB	
	rts
mov_five:	
	ldab #$05
	cba
	bne mov_six
	movb #$5B,PORTB		
	rts
mov_six:	
	ldab #$06
	cba
	bne mov_seven
	movb #$5F,PORTB	
	rts
mov_seven:
	ldab #$07
	cba
	bne mov_eight
	movb #$70,PORTB
	rts
mov_eight:	
	ldab #$08
	cba
	bne mov_nine
	movb #$7F,PORTB
	rts
mov_nine:	
	ldab #$09
	cba
	bne mov_a
	movb #$7B,PORTB	
	rts
mov_a:	
	ldab #$0A
	cba
	bne mov_b
	movb #$77,PORTB
	rts
mov_b:	
	ldab #$0B
	cba
	bne mov_c
	movb #$7F,PORTB
	rts
mov_c:	
	ldab #$0C
	cba
	bne mov_d
	movb #$4E,PORTB	
	rts
mov_d:	
	ldab #$0D
	cba
	bne mov_e
	movb #$7E,PORTB	
	rts
mov_e:	
	ldab #$0e
	cba
	bne mov_f
	movb #$4F,PORTB	
	rts
mov_f:	
	movb #$47,PORTB	
	rts