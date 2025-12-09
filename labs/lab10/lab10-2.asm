%include 'in_out.asm'
SECTION .data
    сообщение: DB 'Как Вас зовут? ',0
    файл: DB 'name.txt',0
    приветствие: DB 'Меня зовут ',0
SECTION .bss
    ввод: RESB 80
SECTION .text
    global _start
_start:
    mov eax,сообщение
    call sprint
    mov ecx,ввод
    mov edx,80
    call sread
    mov ecx,0777o
    mov ebx,файл
    mov eax,8
    int 80h
    push eax
    mov eax,приветствие
    call slen
    mov edx,eax
    mov ecx,приветствие
    pop ebx
    push ebx
    mov eax,4
    int 80h
    pop ebx
    mov eax,6
    int 80h
    mov ecx,2
    mov ebx,файл
    mov eax,5
    int 80h
    mov esi,eax
    mov edx,2
    mov ecx,0
    mov ebx,eax
    mov eax,19
    int 80h
    mov eax,ввод
    call slen
    mov edx,eax
    mov ecx,ввод
    mov ebx,esi
    mov eax,4
    int 80h
    mov ebx,esi
    mov eax,6
    int 80h
    call quit