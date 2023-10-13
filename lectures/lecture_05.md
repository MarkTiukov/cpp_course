# Лекция 5

#### 3. Value category

Каждое выражение относится к одной из двух категорий: **lvalue** и **rvalue**. *Неформально*, lvalue -- то, чему можно присваивать, а rvalue -- наоборот

```C++
++x = x++; // OK
x++ = ++x; // не OK (CE)
++x++; // не ОК (CE)
```

### 7. Control statements

#### 1. if-statement

```C++
if (condition) {
    statements;
}
```

Если всего один statement, то можно опустить фигурные скобки, но по кодстайлу так делать плохо!

```C++
if (condition) {
    if_true_statements;
} else {
    if_false_statements; 
}
```

Начиная с C++17:

```C++
if (init_statement; condition) {
    if_true_statements;
} 
```
что эквивалентно:

```C++
{ // <- объявление действительно только на момент if'а
    init_statement;
    if (condition) {
        if_true_statements;
    } 
}
```

#### 2. Switch statement

```C++
switch (expression) {
    case label1:
        statements;
    case label2:
        statements;
        break; // выход
    default: // если не подошла ни одна из меток выше
        statements;
}
```

#### 3. for-loop

```C++
for (init-statement; condition; expression) {
    statements;
}
```

Дополнительные возможности:

* `break` -- выйти из цикла (немедленно)
* `continue` -- переходить к следующей итерации (с выполнением expression)
* ~~goto and labels~~ забыть и не вспоминать

#### 4. while and do-while

```C++
while (condition) {
    statements;
}
```
```C++
do {
    statements;
} while (condition);
```

### 8. Ошибки

#### 1. Ошибки компиляции (Compilation Errors)

Ошибки, которые обнаруживает компилятор. Бывают трех видов:

* лексические
* синтаксические
* семантические

#### 2. Ошибки исполнения (Runtime Errors)

Ошибки, проявляющиеся только при запуске программы, которые прерывают ее работу

#### 3. Неопределенное поведение (Undefined Behavior)

Нет гарантии на то, как заработает написанный код (да, в стандарте не всё описано :/ ). В таком случае поведение зависит от конкретных действий компилятора, которые могут быть полностью непредсказуемы.
