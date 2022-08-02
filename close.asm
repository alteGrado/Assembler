%include	'functions.asm'

SECTION .data
filename db 'readme2', 0h
contents db 'learning to think!', 0h

SECTION .bss
fileContents resb 255,

SECTION .text
global _start

_start:

	mov	ecx, 0777
	mov	ebx, filename
	mov	eax, 8              ;create
	int	80h

	mov	edx, 18
	mov	ecx, contents
	mov	ebx, eax
	mov	eax, 4              ;write
	int	80h

	mov	ecx, 0
	mov	ebx, filename
	mov	eax, 5              ;open
	int	80h

	mov	edx, 18
	mov	ecx, fileContents
	mov	ebx, eax
	mov	eax, 3              ;read
	int	80h

	mov	eax, fileContents
	call	sprintLF

	mov	ebx, ebx
	mov	eax, 6              ;close
	int	80h

	call	quit              
