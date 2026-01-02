#!/bin/bash
find . ! -name '*.sh' ! -name '.' -exec rm -rf {} +
# 1. Демонстрация git rm --cached
echo -e "\033[1;34m\n=== Шаг 1: git rm --cached (удаление из индекса)
===\033[0m"
mkdir -p project
cd project
git init
echo -e "\033[1;34m\n=== Статус после изменения ===\033[0m"
echo "test" > file
git status
git add file
echo -e "\033[1;34m\n=== Статус после add ===\033[0m"
git status
git rm --cached file
echo -e "\033[1;34m\n=== Статус после rm --cached ===\033[0m"
git status
git add file && git commit -m "add file"
echo -e "\033[1;34m\n=== Статус после add + commit ===\033[0m"
git status
echo "test" >> file
git add file
echo -e "\033[1;34m\n=== Статус после изменения файла + add ===\033[0m"
git status
git restore --staged file
echo -e "\033[1;34m\n=== Статус после restore --staged ===\033[0m"
git status
read -p "[Шаг 1] Нажми Enter для продолжения..."
# 2. Демонстрация git commit --amend
echo -e "\033[1;34m\n=== Шаг 2: git commit --amend (перезапись последнего
коммита) ===\033[0m"
git add file
git commit -m "Initial commit"
echo -e "\033[1;34m\n=== Git log: ===\033[0m"
git log --oneline
echo -e "\033[1;34m\n=========\033[0m"
echo "test1" > file
git commit --amend -m "Initial commit amend"
echo -e "\033[1;34m\n=== Git log: ===\033[0m"
git log --oneline
echo -e "\033[1;34m\n=========\033[0m"
read -p "[Шаг 2] Нажми Enter для продолжения..."
# ───────────────────────────────────────────────
# 3. Демонстрация git reset (мягкий / жёсткий)
# ───────────────────────────────────────────────
echo -e "\033[1;34m\n=== Шаг 3: git reset (возврат к предыдущим коммитам)
===\033[0m"
cd ..
rm -rf project/.git
cd project
git init
echo "test" > file
git add file && git commit -m "Initial commit"
echo "test 2" >> file
git add file && git commit -m "Second commit"
echo -e "\033[1;34m\n=== Git log: ===\033[0m"
git log --oneline
echo -e "\033[1;34m\n=========\033[0m"
echo -e "\033[1;34m\n=== Содержимое файла до reset --soft ===\033[0m"
cat file
echo -e "\033[1;34m\n=========\033[0m"
echo -e "\033[1;31m\n=== reset --soft HEAD~1 ===\033[0m"
git reset --soft HEAD~1
echo -e "\033[1;34m\n=== Git log: ===\033[0m"
git log --oneline
echo -e "\033[1;34m\n=========\033[0m"
echo -e "\033[1;34m\n=== Содержимое файла после reset --soft ===\033[0m"
cat file
echo -e "\033[1;34m\n=========\033[0m"
echo -e "\033[1;34m\n=== Изменяем файл + add + commit ===\033[0m"
echo "test 3" >> file
git add file && git commit -m "Third commit"
echo -e "\033[1;34m\n=== Git log: ===\033[0m"
git log --oneline
echo -e "\033[1;34m\n=========\033[0m"
echo -e "\033[1;34m\n=== Содержимое файла до reset --hard ===\033[0m"
cat file
echo -e "\033[1;34m\n=========\033[0m"
echo -e "\033[1;31m\n=== reset --hard HEAD~1 ===\033[0m"
git reset --hard HEAD~1
echo -e "\033[1;34m\n=== Git log: ===\033[0m"
git log --oneline
echo -e "\033[1;34m\n=========\033[0m"
echo -e "\033[1;34m\n=== Содержимое файла после reset --hard ===\033[0m"
cat file
echo -e "\033[1;34m\n=========\033[0m"