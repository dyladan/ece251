CR = $0D
LF = $0A
printf = $EE88
getchar = $EE84
getcmdline	= $EE8A
cmdlinelen	= 40
minus = $2D

Prompt1: .asciz "Please Enter a Temperature in Farenheit"
	.byte CR,LF,0

Prompt2: .asciz "Want to Continue? (y/n)"
	.bye CR,LF,0

Prompt3: .asciz "Current Temperature"
	.byte CR,LF,0

crlf: .asciz " "
	.byte CR,LF,0

.org	$1100
outbuf:		.blkb 30
inbuf:		.blkb 20
error:		.blkb 1
sign:		.blkb 1
buf1:		.blkb 1
buf2:		.blkb 1

.text
_main::

		lds	#$3C00
		ldy	#0
		ldd	#prompt1
		jsr	[printf,y]	; output a prompt to remind the user to enter

		ldy	#0
		ldd	#cmdlinelen	; an integer
		pshd
		ldd	#inbuf
		call	[getcmdline,y]	; read in a string that represents an integer
		leas	2,sp
	
		ldaa	#FF
		psha
		ldaa	#00
		ldy	#inbuf

loop1:
		ldab	0,y
		cmpb	#$0D
		beq	end1
		cmpb	#00
		beq	end1
		ldx	#$30
		idiv
		pushd
		iny
		bra	loop1
end1:

		ldx	#inbuf
		ldaa	0,x
		cmpa	#minus
		bne	continue
		inc	sign
		inx
continue:	
		ldaa	1,x
		cmpa	#$0
		beq	done
		cmpa	#$30
		blo	in_error
		cmpa	#$39
		bhi	in_error
		suba	#$30
		staa	#buf1
		ldd	#outbuf
		ldy	#10
		emul
		addd	#buf2
		std	#outbuf
		bra	continue
in_error:
		ldaa	#1
		staa	#error
done:
		ldaa	#sign
		cmpa	#00		
		beq	positive
		ldx	#outbuf
		ldaa	0,x
		ldab	1,x
		coma
		comb
		addd	#1
		std	#outbuf
positive:

