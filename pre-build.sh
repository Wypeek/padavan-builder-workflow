#!/bin/bash
set -e

# 1. Скачиваем исходники amneziawg-tools
git clone https://github.com/amnezia-vpn/amneziawg-tools.git /tmp/amneziawg-tools
cd /tmp/amneziawg-tools/src

# 2. Находим компилятор в скачанном тулчейне
# Путь может отличаться, проверьте структуру папки padavan-ng/toolchain-*
CC=$(find /__w/*/padavan-ng -name "mipsel-linux-uclibc-gcc" | head -1)

# 3. Собираем статически (чтобы не зависеть от библиотек роутера)
make CC="$CC" CFLAGS="-O2 -static" LDFLAGS="-static"

# 4. Копируем бинарник в исходники прошивки, чтобы он попал в итоговый образ
# Точный путь к папке, где лежат системные бинарники в исходниках Padavan, может отличаться
cp awg /__w/*/padavan-ng/trunk/user/rc/awg
