%include		'functions.asm'

SECTION .data
filename db 'readme2', 0h
contents db 'learning to think!', 0h

SECTION .text
global _start

_start:

	mov	ecx, 0777
	mov	ebx, filename
	mov	eax, 8
	int	80h

	mov	edx, 18
	mov	ecx, contents
	mov	ebx, eax
	mov	eax, 4
	int 	80h

	mov	ecx, 0
	mov	ebx, filename
	mov	eax, 5
	int	80h

	call	iprintLF
	call	quit










