# Лекция 3

## 2. Введение в язык

### 4. Основные операции над базовыми типами

#### 1. Внутри одного типа

* арифметические операции (+, -, *, /, %)
* побитовые операции (&, |, ^, <<, >>, ~)
* логические операции (&&, ||, !)

***Замечание:*** если в результате операции значение выходит за пределы установленного диапозона значений, то случается **переполнение** типа. В таком случае поведение бывает различным:

* в случае беззнаковых типов вычисления происходят по модулю длины диапозоны
* в случае знаковых типов такая программа считается неправильной и ошибочной (UB)

#### 2. Приведение типов

1. **Integer promotion**: если операция производится над разными типами, где один "больше" другого, то меньший приводится к большему и этот тип будет итоговым типом выражения. Например, `int -> long long` или `short -> int`. Неприятным случаем является приведение знакового инта к беззнаковому, потому что биты просто начинают интерпретироваться иначе.
1. Аналогично **Floating point promotion**
1. char <-> int
1. bool <-> int
1. Приведение большего к меньшему возможно: double->int отбрасывает дробную часть. НО такое лучше не делать :)

#### 3. Литералы

Для всех основных типов можно использовать различные форматированные строковые константы или шестнадцатиричное представление значений:
    
    * 7    | int 
    * 7u   | unsigned int
    * 7.0  | double
    * 7.0f | float
    * 'a'  | char
    * 07   | int, но в 8-ричной системе
    * 0x2a | int, но в 16-ричной системе 
    * u - unsingned, l - long, ll - long long

#### 4. Понятие идентификатора

https://en.cppreference.com/w/cpp/language/identifiers

### 5. Стандартные контейнеры

#### 1. std::string

Объект, для удобной работы со строками.

```C++
std::string s = "abcdef";
s[1]; // 'b' (нумерация с 0)
s.size(); // 6
s.length(); // 6
s.substr(3, 2); // "de"
s += 'g';
```

#### 2. std::vector

Контейнер для хранения неопределенного количества объектов (одного типа)

```C++
std::vector<int> v; // пустой
std::vector<int> v(10); // изначальный размер
v[3]; // обращение к 4му элементу (обращаться за пределы размера нельзя)
v.size(); // размер вектора
v.resize(20); // изменение размера
v.push_back(3); // добавление элемента в конец (с увеличением размера)
v.pop_back(); // удаление последнего элемента
```
