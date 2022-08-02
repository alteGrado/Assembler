SECTION .data
msg	db	'Hello, brave new World!', 0Ah    ;назначьте переменную msg вашей строкой сообщения

SECTION .text
global _start

_start:

    mov    edx, 13        ;колличество записываемых байтов-по одному на каждую букву плюс 0Ah (символ перевода строки) 
    mov    ecx, msg       ;переместить адрес памяти нашей строки сообщения в ecx
    mov    ebx, 1         ;записать в файл STDOUT
    mov    eax, 4         ;вызвать SYS_WRITE (код операции ядра 4)
    int    80h

    mov    ebx, 0	  ;вернуть 0 статус при выходе-"Нет ошибок"
    mov    eax, 1         ;вызвать sys_exit (код операции ядра 1) 
    int    80h
