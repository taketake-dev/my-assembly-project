; =============================================================================
; File: src/x86_64/system.asm
; Description: システムコール関数群
; Architecture: x86_64
; Assembler: NASM
; ABI: System V AMD64 ABI (Linux)
; =============================================================================

extern  __errno_location        ; Cライブラリのエラー変数場所を特定する関数

global ft_write

section .text

; -----------------------------------------------------------------------------
; Function: ft_write
; Description: 画面（ファイル）に文字を書き込みます。
; Arguments:
;   rdi - ファイルディスクリプタ (fd)
;   rsi - 文字列の番地 (buf)
;   rdx - バイト数 (count)
; Return:
;   rax - 実際に書き込まれたバイト数。エラー時は -1。
; -----------------------------------------------------------------------------
ft_write:
    mov     rax, 1                      ; writeのシステムコール番号は1
    syscall                             ; rax 1: write, rdi: fd, rsi: buf, rdx: count
                                        ; 戻り値は rax
                                        ; rcx: rip, r11: rflags に書き換えられる

    cmp     rax, 0                      ; 結果をチェック
    jl      .error                      ; 0より小さければエラー処理へ
    ret

.error:
    neg     rax                         ; rax = -rax (負のエラー番号を正に変換)
    mov     rdi, rax                    ; rdi に errno を退避（caller-saved）
    ; PIE 対応のため PLT 経由で呼び出す, やらないとコンパイルエラーになる
    call    __errno_location wrt ..plt  ; errnoの住所を取得(raxに住所が入る)
    mov     [rax], rdi                  ; errnoの住所の中身にエラー番号を書き込む

    mov     rax, -1                     ; 関数の戻り値は -1 に固定
    ret
