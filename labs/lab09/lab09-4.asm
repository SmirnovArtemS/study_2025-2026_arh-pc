%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0
func db "Функция: f(x) = 4x + 3",0
SECTION .text
global _start

_start:
pop ecx
pop edx
sub ecx,1
mov esi, 0

next:
pop eax
call atoi
call _calcul
loop next

_calcul:
cmp ecx,0h
jz _end
imul eax, 4
add eax, 3
add esi,eax
ret

_end:
mov eax, func
call sprintLF
mov eax, msg
call sprint
mov eax, esi
call iprintLF
call quit