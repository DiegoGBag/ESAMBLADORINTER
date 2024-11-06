; ===============================================
; Autor: Diego Samuel Garcia Bagnis
; Fecha: 6 de Noviembre de 2024
; Descripción: Programa en Asembler64 que convierte 
;              grados Celsius a Fahrenheit.
;              Se incluye una versión en Python para referencia.
; ===============================================

; -------- Código en Python (comentado) ------------
; def celsius_to_fahrenheit(celsius):
;     return celsius * 9 / 5 + 32
; 
; celsius = 25
; fahrenheit = celsius_to_fahrenheit(celsius)
; print("Temperatura en Fahrenheit:", fahrenheit)
; ----------------------------------------------

section .data
    msg db "Temperatura en Fahrenheit: ", 0
    format db "%d", 0 ; Formato para imprimir enteros

section .bss
    temp_celsius resb 4   ; Variable para temperatura en Celsius
    temp_fahrenheit resb 4 ; Variable para temperatura en Fahrenheit

section .text
    global _start

_start:
    ; Cargar la temperatura en Celsius (ejemplo: 25 grados)
    mov eax, 25           ; Almacena 25 en Celsius

    ; Convertir de Celsius a Fahrenheit
    ; Fórmula: F = C * 9 / 5 + 32
    mov ebx, eax          ; Copia Celsius en EBX
    imul ebx, 9           ; C * 9
    idiv dword 5          ; (C * 9) / 5
    add eax, 32           ; (C * 9 / 5) + 32

    ; Almacenar resultado en Fahrenheit
    mov [temp_fahrenheit], eax

    ; Imprimir resultado
    mov eax, 4            ; Llamada al sistema para escribir
    mov ebx, 1            ; Escribir en salida estándar (stdout)
    mov ecx, msg          ; Mensaje a imprimir
    mov edx, len msg      ; Longitud del mensaje
    int 0x80              ; Llamada a la interrupción del sistema

    ; Salir
    mov eax, 1            ; Llamada para salir
    xor ebx, ebx          ; Código de salida 0
    int 0x80

