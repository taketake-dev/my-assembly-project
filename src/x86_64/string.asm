; =============================================================================
; Module: string.asm
; Description: 文字列操作関数群
; Architecture: x86_64
; Assembler: NASM
; ABI: System V AMD64 ABI (Linux)
; =============================================================================

global ft_strlen
global ft_strcpy
global ft_strcmp

section .text

; -----------------------------------------------------------------------------
; Function: ft_strlen
; Description: ヌル終端文字列の長さを返します。
; Arguments:
;   rdi - 文字列へのポインタ (const char *s)
; Return:
;   rax - 文字列の長さ (size_t)
; -----------------------------------------------------------------------------
ft_strlen:
    xor     rax, rax                   ; 長さカウンターを0に

.loop:
    cmp     byte [rdi + rax], 0        ; 現在の文字がヌル文字かチェック
    je      .done                      ; RFLAGSのZFがヌル文字なら終了
    inc     rax                        ; カウンターを増やす
    jmp     .loop                      ; 次の文字へ

.done:
    ret

; -----------------------------------------------------------------------------
; Function: ft_strcpy
; Description: 文字列をコピーします。
; Arguments:
;   rdi - コピー先のアドレス (char *dest)
;   rsi - コピー元のアドレス (const char *src)
; Return:
;   rax - コピー先のアドレス (dest)
; -----------------------------------------------------------------------------
ft_strcpy:
    xor     rcx, rcx                    ; カウンター(rcx)を0に初期化

.loop:
    mov     al, byte [rsi + rcx]        ; コピー元のrcx番目の文字をalに入れる
    mov     byte [rdi + rcx], al        ; alの値をコピー先のrcx番目に書き込む

    cmp     al, 0                       ; 今コピーした文字が 0 (終端) だったか？
    je      .done                       ; 0 ならコピー完了なので脱出

    inc     rcx                         ; 次の文字へ
    jmp     .loop                       ; ループ続行

.done:
    mov     rax, rdi                    ; 戻り値としてdestのアドレスをraxに入れる
    ret

; -----------------------------------------------------------------------------
; Function: ft_strcmp
; Description: 2つの文字列を比較します。
; Arguments:
;   rdi - s1のアドレス
;   rsi - s2のアドレス
; Return:
;   rax - 差分 (s1[i] - s2[i])。同じなら 0。
; -----------------------------------------------------------------------------

ft_strcmp:
    xor     rcx, rcx                    ; インデックスカウンターを0に初期化

.loop:
    mov     al, byte [rdi + rcx]        ; s1のrcx番目の文字をalにロード
    mov     dl, byte [rsi + rcx]        ; s2のrcx番目の文字をdlにロード

    cmp     al, dl                      ; 2つの文字を比較
    jne     .done                       ; 違っていたら (Not Equal) ループ脱出

    cmp     al, 0                       ; ヌル文字かチェック
    je      .done                       ; 終端なら (Equal) 全く同じなので脱出

    inc     rcx
    jmp     .loop

.done:
    movzx   rax, al                     ; 8ビットの al を 64ビットの rax に拡張してコピー
    movzx   rdx, dl                     ; 8ビットの dl を 64ビットの rdx に拡張してコピー
    sub     rax, rdx
    ret
