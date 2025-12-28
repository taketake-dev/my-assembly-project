# My Assembly Project

## 概要

低レイヤの理解を深めるために x86_64 アーキテクチャのアセンブリ言語を学習し、
C 言語との相互呼び出しやシステムコールの操作を実装するプロジェクトです。

## 技術スタック

- **Architecture:** x86_64 (Intel 64-bit)
- **Assembler:** NASM
- **Syntax:** Intel Syntax
- **Platform:** Linux (WSL2 / Ubuntu)
- **Language for Testing:** C11 (GCC)

## ディレクトリ構成

- `src/x86_64/`: アセンブリソースコード
- `src/arm64/`: 将来的な拡張用（現在は空）
- `tests/`: C 言語によるテストプログラム
- `Makefile`: ビルド自動化スクリプト

## 実装済み機能

- **Math**: `ft_add`, `ft_sub`, `ft_mul`, `ft_div`, `ft_mod`
- **String**: `ft_strlen`, `ft_strcpy`, `ft_strcmp`
- **System**: `ft_write`

## 動作環境

- OS: Linux (Ubuntu 20.04+ recommended)
- Architecture: x86_64
- Tools: NASM, GCC, GNU Make
