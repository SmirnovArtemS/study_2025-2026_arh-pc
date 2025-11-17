%include 'in_out.asm'

section .data
    msg_x db 'Введите x: ', 0h
    msg_a db 'Введите a: ', 0h
    msg_result db 'f(x) = ', 0h
    newline db 0xA, 0h
section .bss
    x resb 10
    a resb 10
    result resb 10
section .text
global _start
_start:
    ; --- Ввод значения x ---
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    mov eax, x
    call atoi
    mov [x], eax
    ; --- Ввод значения a ---
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    mov eax, a
    call atoi
    mov [a], eax
    ; --- Вычисление функции f(x) ---
    mov ebx, [x]    ; ebx = x
    mov ecx, [a]    ; ecx = a
    cmp ebx, ecx    ; Сравниваем x и a
    jg x_greater    ; Если x > a, переходим к x_greater
    ; Если x <= a, то f(x) = 15
    mov eax, 15
    jmp save_result
x_greater:
    ; Если x > a, то f(x) = 2(x - a)
    sub ebx, ecx    ; ebx = x - a
    mov eax, ebx    ; eax = x - a
    mov ebx, 2      ; ebx = 2
    mul ebx         ; eax = 2 * (x - a)
save_result:
    mov [result], eax
    ; --- Вывод результата ---
    mov eax, msg_result
    call sprint
    mov eax, [result]
    call iprintLF
    call quit