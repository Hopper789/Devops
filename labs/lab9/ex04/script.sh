#!/bin/bash
# Очистка окружения
find . ! -name '*.sh' ! -name '.' -exec rm -rf {} +
rm -rf .git

# Подготовка: создаём репозиторий и начальный коммит
echo -e "\033[1;34m\n=== Шаг 1: Инициализация репозитория и первый коммит
===\033[0m"
mkdir repo && cd repo
git init
echo "строка из main" > file.txt
git add file.txt
git commit -m "initial commit"

# Переименование master → main (если нужно)
current_branch=$(git symbolic-ref --short HEAD)
if [ "$current_branch" = "master" ]; then
 echo -e "\033[1;34m\n=== Переименование ветки master в main ===\033[0m"
 git branch -m main
fi

# Создание и изменение в ветке feature
echo -e "\033[1;34m\n=== Шаг 2: Создание ветки feature и изменение file.txt
===\033[0m"
git checkout -b feature
echo "строка из feature" > file.txt
git commit -am "изменение в feature"

# Возвращение в main и изменение того же файла
echo -e "\033[1;34m\n=== Шаг 3: Изменение file.txt в main ===\033[0m"
git checkout main
echo "строка из main ветки (другая)" > file.txt
git commit -am "изменение в main"

# Попытка слияния feature в main (конфликт!)
echo -e "\033[1;34m\n=== Шаг 4: Попытка git merge feature (конфликт)
===\033[0m"
git merge feature || true

# Показ содержимого с конфликтом
echo -e "\033[1;34m\n=== Содержимое file.txt с конфликтом ===\033[0m"
cat file.txt