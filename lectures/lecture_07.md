# Лекция 7

## 3. Compound types

### 3. Массивы

**Массив** (в С++) — упорядочный набор элементов одного типа, расположенный последовательно в памяти. 

#### 1. Статические массивы

```C++
int a[10]; // объявление массива интов на 10 элементов. Значения будут мусорными
int a[5] = {1, 2, 3, 4, 5}; // объявление с инициализацией путем перечисления всех элементов
int a[] = {1, 2, 3, 4, 5}; // размер вычисляется за нас
int a[5] = {1, 2}; // перечисляем только первые 2 элемента, остальные равны 0 (дефолтному значению)

// '=' можно опустить и писать слитно
int a[3]{6, 7, 8};

// обращение к i-му элементу (нумерация с 0)
a[i];
```

При обращении к элементу, мы можем указать значение индекса за пределами длины массива. Это UB (может вернуться мусорное значение, может SegFault, а может еще какая ошибка, кто знает), поэтому надо внимательно следить за логикой в своем коде, чтобы такого не происходило

#### 2. Массив <-> указатель

В этом разделе мы сравним указатели с массивами и поймем, что это очеень близкие сущности. Давайте посмотрим, когда массив ведет себя как указатель. Далее везде мы считаем, что `a` — массив, а `p` — указатель

* Массвы можно разыменовывать: `*a` — значение первого элемента
* `*(a + 3)` значение 4го элемента, то есть как если бы мы написали `a[3]`

Теперь посмотрим, когда указатель ведет себя как массив:

```C++
int* p = a + 3; // указатель на 4й элемент
std::cout << p[-1]; // указатель на 3й (4-1) элемент
```

То есть `a[i]` == `*(a + i)`. Это порождает такую конструкцию `2[a]`.
<details>
<summary>Что она значит?</summary>
2[a] ~ *(2 + a) ~ *(a + 2) ~ a[2]
</details>

Когда же массив не ведет себя как указатель?

* статические массы нельзя изменять, воспринимая их как указатели: 
```C++
int a[5];
int b[5];
a = b; // CE
a += 1; // CE
```

* `sizeof(a)` даст нам размер массива в байтах (то есть `длина * sizeof(тип)`)

#### 3. Динамический массив

До этого мы научились запрашивать память у ОС во время работы программы, но только для одного элемента. А что если мы хотим массив элементов? — поможет оператор `new[]` (и оператор `delete[]` для освобождения этой памяти!!) 

```C++
int n;
...
int* a = new int[n]; // да, вся разница (синтаксически) только в скобках...
...
delete[] a;
```

#### 4. Двумерный массив

На самом деле, это не какой-то новый объект, а лишь акцентирование на то, что мы уже знаем!

**Двумерный массив** — это массив массивов:

```C++
int a[5][10]; // 5 массивов длины 10
```

Такая конструкция задает матрицу размера `5x10`

Важно различать:

```C++
int* b[5]; // массив из 5 указателей на int
int (*c)[5]; // указатель на массив из 5 интов
```

#### 5. С-строки

Можно завести вот такой массив:

```C++
char s[] = "abcde";
```

Но `sizeof(s) == 7`, потому что на самом деле в конце дописывается символ `'\0'` — символ конца строки (null terminator)

Он нужен, чтобы `char[]` можно было передавать в поток вывода и вывод прекращался, когда встречается `'\0'`. Это пораждает вот такой нюанс:

```C++
const char* s = "abc\0d";
std::cout << s; // выведет abc
```
