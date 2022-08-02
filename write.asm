%include		'functions.asm'

SECTION .data
filename db 'readme1', 0h
contents db 'The contents to write.', 0h

SECTION .text
global _start

_start:

	mov	ecx, 0777
	mov	ebx, filename
	mov	eax, 8
	int	80h

	mov	edx, 22
	mov	ecx, contents
	mov	ebx, eax
	mov	eax, 4
	int	80h

	call	quit
