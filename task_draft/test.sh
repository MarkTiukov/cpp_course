#! /usr/bin/env bash

echo "begin testing $1"

echo "Check for banned words"
python3 banned_words_checker.py --solution=$1.hpp --banned-words=banned_words.json
if [[ ! $? -eq 0 ]]
then
  echo "В вашем коде есть забаненые слова!"
  exit 1
fi


echo "clang-tidy check"
clang-tidy -extra-arg=-std=c++20 -quiet $1.hpp
if [[ ! $? -eq 0 ]]
then
  echo "Проверка clang-tidy не пройдена"
  exit 1
fi


echo "clang-format check"
clang-format -i -style=file $1.hpp &&
git diff --ignore-submodules --color $1.hpp > diff &&
cat diff
if [[ -s diff ]]
then
  echo "Проверка clang-format не пройдена"
  exit 1
fi
echo "clang-format achieved"


echo "Начинаем билдить"

echo "Build with clang"
mkdir build
cd build
cmake -DCMAKE_CXX_COMPILER=clang++-13 ..
if [[ ! $? -eq 0 ]]
then
  echo "Сборка cmake с clang не сработала"
  exit 1
fi
make
if [[ ! $? -eq 0 ]]
then
  echo "Make с clang не сработал"
  exit 1
fi
cd ..
echo "Build with clang achieved"


echo "Build with g++"
rm -r build
mkdir build
cd build
cmake -DCMAKE_CXX_COMPILER=g++ ..
if [[ ! $? -eq 0 ]]
then
  echo "Сборка cmake с g++ не сработала"
  exit 1
fi
make
if [[ ! $? -eq 0 ]]
then
  echo "Make с g++ не сработал"
  exit 1
fi
echo "Build with g++ achieved"


echo "Running tests"
./$1
if [[ ! $? -eq 0 ]]
then
  echo "Тесты не пройдены"
  exit 1
fi
echo "Google tests achieved"


echo "Попробуем valgrind!"
valgrind --leak-check=yes --log-file=log.txt ./$1
echo "Valgrind log:"
cat log.txt
python3 ../valgrind_parser.py
if [[ ! $? -eq 0 ]]
then
  echo "А кто украл free?"
  exit 1
fi
echo "Valgrind achieved"


echo "Вы потрясающие!"