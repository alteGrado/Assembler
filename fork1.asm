%include		'functions.asm'

SECTION .data
command1	db	'/bin/ls', 0h
arg1		db	'-l', 0h
arguments1	dd	command1
		dd	arg1
		dd	0h
environment1	dd	0h
command2	db	'/bin/sleep', 0h
arg2		db	'5', 0h
arguments2	dd	command2
		dd	arg2
		dd	0h
environment2	dd	0h

SECTION .text
global _start

_start:

	mov	eax, 2
	int	80h

	cmp	eax, 0
	jz	child

parent:
	mov	edx, environment1
	mov	ecx, arguments1
	mov	ebx, command1
	mov	eax, 11
	int	80h
	push	edx
	push	ecx
	push	ebx
	push	eax
	mov	eax, 0
child:
	mov	edx, environment2
	mov	ecx, arguments2
	mov	ebx, command2
	mov	eax, 11
	int	80h

	call	quit












