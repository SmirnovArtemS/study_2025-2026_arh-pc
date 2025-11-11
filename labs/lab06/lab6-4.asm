%include 'in_out.asm'
SECTION .data
msg: DB 'Введите x: ',0
div: DB 'Результат: ',0
SECTION .bss
rezultat: RESB 80
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax,msg
call sprintLF
mov ecx,x
mov edx,80
call sread
mov eax,x
call atoi
mov ebx,9
mul ebx
sub eax,8
mov ebx,8
div ebx
mov ebx,eax
mov eax,div
call sprint
mov eax,rezultat
mov eax,ebx
call iprintLF
call quit