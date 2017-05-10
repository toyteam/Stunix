#ifndef BOOT_STRING_H
#define BOOT_STRING_H

void *memcpy(void *dst, const void *src, size_t len);
void *memset(void *dst, int c, size_t len);
int memcmp(const void *s1, const void *s2, size_t len);

#endif /* BOOT_STRING_H */