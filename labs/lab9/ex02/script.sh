#!/bin/bash

# Цветовые коды
BLUE='\033[0;34m'
NC='\033[0m' # No Color

find . ! -name '*.sh' ! -name '.' -exec rm -rf {} +
rm -rf .git
git init
echo "# Demo project" > README.md
git add README.md
git commit -m "Initial commit"
git switch -c feature/login
git switch main
echo "<form>Login</form>" > login.html
echo "console.log('Login');" > login.js
git add login.html
echo -e "${BLUE}\n=== git status ДО stash ===${NC}"
git status
git stash push -u -m "login feature work"
echo -e "${BLUE}\n=== git status ПОСЛЕ stash ===${NC}"
git status
git switch feature/login
git stash pop
echo -e "${BLUE}\n=== git status ПОСЛЕ stash pop ===${NC}"
git status