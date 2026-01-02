#!/bin/bash
# Очистка рабочей директории (кроме .sh и .)
find . ! -name '*.sh' ! -name '.' -exec rm -rf {} +
rm -rf .git
# Создание структуры
mkdir -p project/dir1 project/dir2
cd project
# Инициализация репозитория
git init
# Создание файлов
echo "original" > dir1/file1.txt
echo "original" > dir2/file2.txt
# Первый коммит
git add .
git commit -m "initial commit"
# Модификация: удаление и изменение
rm dir1/file1.txt
echo "updated" >> dir2/file2.txt
# Переход в поддиректорию
cd dir2
# Добавление изменений
git add .
echo -e "\033[1;34m\n=== git status после 'git add .' (из dir2) ===\033[0m"
git status
# Отмена добавления
git reset
# Добавление всех изменений
git add --all
echo -e "\033[1;34m\n=== git status после 'git add --all' (из dir2)
===\033[0m"
git status
