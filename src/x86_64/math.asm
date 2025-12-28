; =============================================================================
; Module: math.asm
; Description: 基本的な算術演算関数群
; Architecture: x86_64
; Assembler: NASM
; ABI: System V AMD64 ABI (Linux)
; ==============================================================================

global ft_add
global ft_sub
global ft_mul
global ft_div
global ft_mod

section .text

; -----------------------------------------------------------------------------
; Function: ft_add
; Description: 2つの整数の和を返します。
; Arguments:
;   rdi - 第一引数 (int a)
;   rsi - 第二引数 (int b)
; Return:
;   rax - 結果 (a + b)
; -----------------------------------------------------------------------------
ft_add:
    mov     rax, rdi        ; rax = a
    add     rax, rsi        ; rax = rax + b
    ret                     ; 呼び出し元に戻る

; -----------------------------------------------------------------------------
; Function: ft_sub
; Description: 第一引数から第二引数を引いた差を返します。
; Arguments:
;   rdi - 第一引数 (int a)
;   rsi - 第二引数 (int b)
; Return:
;   rax - 結果 (a - b)
; -----------------------------------------------------------------------------
ft_sub:
    mov     rax, rdi        ; rax = a
    sub     rax, rsi        ; rax = rax - b
    ret                     ; 呼び出し元に戻る

; -----------------------------------------------------------------------------
; Function: ft_mul
; Description: 2つの整数の積を返します。
; Arguments:
;   rdi - 第一引数 (int a)
;   rsi - 第二引数 (int b)
; Return:
;   rax - 結果 (a * b)
; -----------------------------------------------------------------------------
ft_mul:
    mov     rax, rdi        ; rax = a
    imul    rax, rsi        ; rax = rax * rsi (符号付き掛け算)
    ret                     ; 呼び出し元に戻る

; -----------------------------------------------------------------------------
; Function: ft_div
; Description: 第一引数を第二引数で割った商を返します。
; Arguments:
;   rdi - 第一引数 (int a)
;   rsi - 第二引数 (int b)
; Return:
;   rax - 商 (a / b)
; -----------------------------------------------------------------------------
ft_div:
    mov     rax, rdi        ; 被除数（割られる数）を rax にセット
    cqo                     ; 符号拡張 (raxを `rdx:rax` の128bitに広げる)
    idiv    rsi             ; rdx:rax / rsi を実行, idivを使用するにはcqoが必要
                            ; 結果：rax = 商, rdx = 余り
    ret

; -----------------------------------------------------------------------------
; Function: ft_mod
; Description: 第一引数を第二引数で割った余りを返します。
; Arguments:
;   rdi - 第一引数 (int a)
;   rsi - 第二引数 (int b)
; Return:
;   rax - 余り (a % b)
; -----------------------------------------------------------------------------
ft_mod:
    mov     rax, rdi
    cqo                     ; 符号拡張 (raxを `rdx:rax` の128bitに広げる)
    idiv    rsi             ; rdx:rax / rsi を実行, idivを使用するにはcqoが必要
                            ; 結果：rax = 商, rdx = 余り
    mov     rax, rdx        ; 余りを rax にセット
    ret
