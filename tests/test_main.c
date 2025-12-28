/**
 * @file test_main.c
 * @brief アセンブリ算術演算ライブラリのテストスイート
 */

#include <stdio.h>
#include <stdlib.h>

#include "../include/libasm.h"


int main(void) {
    // テスト用の値を定数として定義
    const long val_a = 42;
    const long val_b = 10;
    long arith_result;

    printf("=== Assembly Library Test: Start ===\n");

    // --- 算術関数のテスト ---

    // 加算テスト
    arith_result = ft_add(val_a, val_b);
    printf("%s:%d\tft_add(%ld, %ld) -> Expected:  52, Actual: %3ld\n", __FILE__, __LINE__, val_a, val_b, arith_result);

    // 減算テスト
    arith_result = ft_sub(val_b, val_a);
    printf("%s:%d\tft_sub(%ld, %ld) -> Expected: -32, Actual: %3ld\n", __FILE__, __LINE__, val_b, val_a, arith_result);

    // 乗算テスト
    arith_result = ft_mul(val_a, val_b);
    printf("%s:%d\tft_mul(%ld, %ld) -> Expected: 420, Actual: %3ld\n", __FILE__, __LINE__, val_a, val_b, arith_result);

    // 除算テスト
    arith_result = ft_div(val_a, val_b);
    printf("%s:%d\tft_div(%ld, %ld) -> Expected:   4, Actual: %3ld\n", __FILE__, __LINE__, val_a, val_b, arith_result);

    // 除算の余りテスト
    arith_result = ft_mod(val_a, val_b);
    printf("%s:%d\tft_mod(%ld, %ld) -> Expected:   2, Actual: %3ld\n", __FILE__, __LINE__, val_a, val_b, arith_result);

    printf("\n");

    // --- 文字列関数のテスト ---

    // 文字列長計測テスト
    const char *test_str = "Hello, Assembly!";
    size_t len;
    len = ft_strlen(test_str);
    printf("%s:%d\tft_strlen(\"%s\") -> Expected: 16, Actual: %zu\n", __FILE__, __LINE__, test_str, len);
    test_str = "";
    len = ft_strlen(test_str);
    printf("%s:%d\tft_strlen(\"%s\") -> Expected:  0, Actual: %zu\n", __FILE__, __LINE__, test_str, len);

    // 文字列コピーテスト
    char buffer[20];
    ft_strcpy(buffer, "Hello");
    printf("%s:%d\tft_strcpy(buffer, \"Hello\") -> Expected: \"Hello\", Actual: \"%s\"\n", __FILE__, __LINE__, buffer);

    // 文字列比較テスト
    int cmp_result;
    cmp_result = ft_strcmp("abc", "abc");
    printf("%s:%d\tft_strcmp(\"abc\", \"abc\") -> Expected: 0, Actual: %d\n", __FILE__, __LINE__, cmp_result);
    cmp_result = ft_strcmp("abc", "abd");
    printf("%s:%d\tft_strcmp(\"abc\", \"abd\") -> Expected: Negative, Actual: %d\n", __FILE__, __LINE__, cmp_result);
    cmp_result = ft_strcmp("abd", "abc");
    printf("%s:%d\tft_strcmp(\"abd\", \"abc\") -> Expected: Positive, Actual: %d\n", __FILE__, __LINE__, cmp_result);

    printf("\n");

    // --- I/O関数のテスト ---

    // 書き込みテスト
    const char *msg = "Hello, write syscall!\n";
    ssize_t w = ft_write(1, msg, ft_strlen(msg));
    printf("%s:%d\tft_write -> returned %zd\n", __FILE__, __LINE__, w);

    printf("\n");

    printf("=== Assembly Library Test: End ===\n");

    return EXIT_SUCCESS;
}
