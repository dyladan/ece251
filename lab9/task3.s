PORTA   =  $00
PORTB   =  $01
DDRA    =  $02
DDRB    =  $03

.text
_main::

movb #$FF,DDRA
movb #$FF,DDRB

jsr mov_zero
jsr time_delay
jsr mov_one
jsr time_delay
jsr mov_two
jsr time_delay
jsr mov_three
jsr time_delay
jsr mov_four
jsr time_delay
jsr mov_five
jsr time_delay
jsr mov_six
jsr time_delay
jsr mov_seven
jsr time_delay
jsr mov_eight
jsr time_delay
jsr mov_nine
jsr time_delay
jsr mov_a
jsr time_delay
jsr mov_b
jsr time_delay
jsr mov_c
jsr time_delay
jsr mov_d
jsr time_delay
jsr mov_e
jsr time_delay
jsr mov_f
swi

mov_zero:	
	movb #$7E,PORTA
	movb #$00,PORTB
	rts
mov_one:	
	movb #$30,PORTA	
	movb #$01,PORTB
	rts
mov_two:	
	movb #$6D,PORTA	
	movb #$02,PORTB
	rts
mov_three:	
	movb #$79,PORTA
	movb #$03,PORTB	
	rts
mov_four:	
	movb #$33,PORTA	
	movb #$04,PORTB
	rts
mov_five:	
	movb #$5B,PORTA
	movb #$05,PORTB		
	rts
mov_six:	
	movb #$5F,PORTA	
	movb #$06,PORTB
	rts
mov_seven:	
	movb #$70,PORTA
	movb #$07,PORTB
	rts
mov_eight:	
	movb #$7F,PORTA
	movb #$08,PORTB
	rts
mov_nine:	
	movb #$7B,PORTA	
	movb #$09,PORTB
	rts
mov_a:	
	movb #$77,PORTA
	movb #$0A,PORTB
	rts
mov_b:	
	movb #$7F,PORTA
	movb #$0B,PORTB
	rts
mov_c:	
	movb #$4E,PORTA
	movb #$0C,PORTB	
	rts
mov_d:	
	movb #$7E,PORTA	
	movb #$0D,PORTB
	rts
mov_e:	
	movb #$4F,PORTA	
	movb #$0E,PORTB
	rts
mov_f:	
	movb #$47,PORTA	
	movb #$0F,PORTB
	rts

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

