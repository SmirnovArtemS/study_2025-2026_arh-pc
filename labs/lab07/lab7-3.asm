%include 'in_out.asm'

section .data
    a dd 54              ; Переменная a = 54
    b dd 62              ; Переменная b = 62
    c dd 87              ; Переменная c = 87
    msg_min db "Наименьшее число: ",0h
    newline db 0xA,0h    ; Перевод строки

section .bss
    min resb 10

section .text
global _start

_start:
    ; --- Находим наименьшее из трех чисел ---
    ; Сравниваем a и b
    mov eax, [a]         ; eax = a
    mov ebx, [b]         ; ebx = b
    mov ecx, [c]         ; ecx = c
    cmp eax, ebx         ; Сравниваем a и b
    jl compare_a_c       ; Если a < b, переходим к сравнению a и c
    mov eax, ebx         ; Иначе min = b
compare_a_c:
    cmp eax, ecx         ; Сравниваем текущий min с c
    jl save_min          ; Если min < c, переходим к сохранению
    mov eax, ecx         ; Иначе min = c
save_min:
    mov [min], eax       ; Сохраняем наименьшее число
    ; --- Вывод результата ---
    mov eax, msg_min
    call sprint          ; Выводим сообщение "Наименьшее число: "
    mov eax, [min]       ; Загружаем наименьшее число в eax
    call iprintLF        ; Выводим число
    call quit            ; Завершаем программу