#!/bin/bash
find . ! -name '*.sh' ! -name '.' -exec rm -rf {} +
git init
echo IC > file
git add file
echo 2 >> file
git status
