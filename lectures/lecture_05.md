# Лекция 5

## 2. Введение в язык

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

## 3. Compound types

### 1. Указатели

#### 0. Мотивация

Как написать функцию swap, которая принимает на вход две переменные одного типа (например, `int`), а в результате их значения меняются местами?

```C++
void swap(int a, int b) {
    int tmp = b;
    b = a;
    a = tmp;
}
```

<details>
<summary>Выполняет ли поставленную задачу код выше?</summary>
Нет, потому что a и b — копии переданных переменных

То есть нам нужно каким-то образом передавать первоначальные переменные
</details>

#### 1. Variable address

```C++
int x = 7;
std::cout << &x; // выводится целое число в 16-ричной системе 
```

Данное число — адресс переменной в памяти

#### 2. Pointer syntaxis

```C++
int x = 7;
int* p = &x; // <- объявление указателя
```

**Указатель** — новый тип объектов. Записывается как `объявленный_тип*` (здесь `*` является частью названия типа). Для чего нужен данный тип? Для обращение к памяти напрямую

Так что же такое `&x`? В данном контексте `&` — это унарный (один аргумент) оператор, который принмиает на вход идентификатор, а на выходе выдает адресс этой переменной. То есть можно формально записать: `&: T -> T*`

**!** результат данного оператора — rvalue, но выражение, которое оператор принимает на вход должно быть lvalue. То есть:

```C++
int* p = &5; // CE
int* p = &(++a); // OK
int* p = &(a++); // CE
```