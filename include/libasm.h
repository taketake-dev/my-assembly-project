/**
 * @file libasm.h
 * @brief x86_64 アセンブリ数学ライブラリのヘッダー
 */

#ifndef LIBASM_H
#define LIBASM_H

# include <unistd.h>  /* ssize_t, size_t */

/* ============================================================================
 * Arithmetic functions
 * ========================================================================= */

long    ft_add(long a, long b);
long    ft_sub(long a, long b);
long    ft_mul(long a, long b);
long    ft_div(long a, long b);
long    ft_mod(long a, long b);

/* ============================================================================
 * String functions
 * ========================================================================= */

size_t  ft_strlen(const char *s);
char   *ft_strcpy(char *dest, const char *src);
int     ft_strcmp(const char *s1, const char *s2);

/* ============================================================================
 * I/O functions
 * ========================================================================= */

ssize_t ft_write(int fd, const void *buf, size_t count);

#endif /* LIBASM_H */
