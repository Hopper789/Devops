#!/bin/bash
# Очистка
find . ! -name '*.sh' ! -name '.' -exec rm -rf {} +
rm -rf .git
mkdir repo && cd repo
git init
echo -e "\033[1;34m\n=== Шаг 1: Начальный коммит ===\033[0m"
echo "Line 1: initial" > file.txt
echo "Line 2: unchanged" >> file.txt
echo "Line 3: unchanged" >> file.txt
git add file.txt
git commit -m "Initial commit"

# Ветка feature: изменяет строку 1
git checkout -b feature
echo -e "\033[1;34m\n=== Шаг 2: Ветка feature изменяет первую строку
===\033[0m"
sed -i '1s/.*/Line 1: from feature/' file.txt
git commit -am "Feature: update line 1"

# master: изменяет строку 3
git checkout master
echo -e "\033[1;34m\n=== Шаг 3: master изменяет третью строку ===\033[0m"
sed -i '3s/.*/Line 3: from master/' file.txt
git commit -am "Master: update line 3"
echo -e "\033[1;34m\n=== История коммитов ===\033[0m"
git log --oneline --graph --all
# Rebase

git checkout feature
echo -e "\033[1;34m\n=== Шаг 4: feature + master ===\033[0m"
#git merge master -m "merge feature + master"

git rebase master
# Проверка результата
echo -e "\033[1;34m\n=== Содержимое файла ===\033[0m"
cat file.txt
echo -e "\033[1;34m\n=== История коммитов ===\033[0m"
git log --oneline --graph --all