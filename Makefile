# =============================================================================
# @file    Makefile
# @brief   x86_64 Assembly Math Library Build Script
# @details nasmとgccを用いてアセンブリ関数をリンクしたテストバイナリを作成
# =============================================================================

# --- Directories and File Names ---
OBJ_DIR  := obj
BIN_DIR  := bin
INC_DIR  := include
LIB_DIR  := lib
LIB_NAME := lib/libasm.a

# --- Tools ---
AS       := nasm                        # Assembler
ASFLAGS  := -f elf64 	                # アセンブラフラグ
CC       := gcc                         # C Compiler
CFLAGS   := -Wall -Wextra -I$(INC_DIR)  # コンパイラフラグ
AR       := ar                          # Archiver
ARFLAGS  := rcs                         # r:置換, c:作成, s:索引作成

# --- Target ---
NAME := asm_test
TARGET := $(BIN_DIR)/$(NAME)

# --- Assembly Sources ---
ASM_SRC := math.asm string.asm system.asm
ASM_OBJ := $(ASM_SRC:%.asm=$(OBJ_DIR)/%.o)

# --- C Sources ---
C_SRC := test_main.c
C_OBJ := $(C_SRC:%.c=$(OBJ_DIR)/%.o)


## @brief デフォルトターゲット：ビルドして実行
run: $(TARGET)
	@./$(TARGET)

## @brief 実行ファイルをビルド（ライブラリとリンクする）
$(TARGET): $(C_OBJ) $(LIB_NAME)
	@mkdir -p $(BIN_DIR)
	$(CC) $^ -Llib -lasm -o $@

## @brief 静的ライブラリを作成
$(LIB_NAME): $(ASM_OBJ)
	@mkdir -p $(LIB_DIR)
	$(AR) $(ARFLAGS) $@ $^

## @brief asm ファイルのアセンブル
$(OBJ_DIR)/%.o: src/x86_64/%.asm
	@mkdir -p $(OBJ_DIR)
	$(AS) $(ASFLAGS) $< -o $@

## @brief C ファイルのコンパイル（共通ルール）
$(OBJ_DIR)/%.o: tests/%.c $(INC_DIR)/libasm.h
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@


## @brief 生成されたオブジェクトファイルとバイナリを削除
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR)


.PHONY: run clean
