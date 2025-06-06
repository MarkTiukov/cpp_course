# Лекция 1

## 0. Орг вопросы

### 1. Контакты

Лектор — Марк Тюков (t.me/mark_tiukov)

[Канал](https://t.me/+EwpnBTp4d983Yzk6) и [чат](https://t.me/+8OqQ7D3VGG5lOGRi) курса

### 2. Домашки

В течение семестра будет много различных задач для самостоятельного решения. Часть из этих задач будет с ревью (то есть с дополнительной проверкой кода семинаристом/ассистентом). Куда и как сдавать будет объявлено позже

### 3. Отчетность

Правила отчетности описаны в канале и в [файлике](../exams/fall_rules.md)

### 4. Скат

Задачи будут проверятся в конце семестра через систему антиплагиата. Штраф получают **все участники**, то есть вне зависимости от того "списал" или  "дал списать". Штраф зависит от числа пойманных задач:

* 1 задача — баллы за задачу аннулируются, после чего из суммы баллов вычитается стоимость задачи
* 2 задачи — пересдача + разговор с учебным офисом

## 1. Введение

### 1. Почему C++?

* [tiobe index;](https://www.tiobe.com/tiobe-index/)
* C++ сочетает в себе свойства и низкоуровневых языков и высокоуровневых;
* C++ быстрый;
* Почти полная обратная совместимость с язоком C;
* Широкая распространненость.

### 2. История

Создатель — Бьёрн Страуструп (1983 г.)

Язык развивается и по сей день. Раз в три года выходит новый [стандарт](https://isocpp.org/std/the-standard). 

Но читать стандарт ~~невозможно~~ очень трудно, поэтому предлагается использовать портал [cppreference](https://en.cppreference.com/w/), а также научиться пользоваться [StackOverflow](https://stackoverflow.com).

### 3. Еще немного фактов о языке

* компилируемый;
* статическая типизация;
* реализует ООП и обобщенное программирование.

### 4. Первая программа

**!!!DISCLAIMER:** всем участникам курса рекомендуется переходить на Linux

В файле `my_programm.cpp` пишем:

```c++
#include <iostream>

int main() {
    int a;
    std::cin >> a;
    std::cout << a + 1 << '\n';
}
```

Компилируем: `g++ my_programm.cpp` или `clang++ my_programm.cpp`. На выходе получаем исполняемый файл `a.out`.

Запускаем: `./a.out`

#### Пояснения

* `#include <iostream>` — подключение библиотеки ввода/вывода
* `int main()` — объявление функции `main`, которая является точкой входа в программу
* `int a` — объявление переменной
* работа с потока вводы/вывода
