Часть про исключения:

Иерархия исключений в STL. Примеры ситуаций, когда уместно то или иное исключение.
Спецификатор и оператор noexcept. Примеры использования. Примеры noexcept и не noexcept функций из stl
Расставить noexcept в каком-нибудь простом классе (vector/string)
Рассказать про exception-safety (строгая и базовая гарантия). Реализовать пример https://gitlab.com/slon/shad-cpp0/-/tree/master/safe-transform для демонстрации строгой гарантии. Лямбды мы еще не проходили, так что используем вместо них указатели на функции (или функторы)


Рассказать про юзинги, которые используются в итераторах: value_type, iterator_category и тд (можно посмотреть на cppref)
На примерах объяснить разницу между input и forward итераторами. (Идея “однопроходного алгоритма”.) Показать примеры алгоритмов, для которых достаточно input, а для которых нужны именно forward. Примеры задач, на которых можно продемонстрировать идею:


https://leetcode.com/problems/best-time-to-buy-and-sell-stock/ и https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/ каких итераторов достаточно в каждом из случаев?

https://leetcode.com/problems/majority-element/ - каких итераторов тут достаточно? (достаточно лишь input-итераторов, см. последнее решение!)

https://leetcode.com/problems/container-with-most-water/ - можно ли обойтись лишь input-итераторами?

https://leetcode.com/problems/trapping-rain-water/ - можно ли обойтись лишь input-итераторами? (Да, см. последнее решение)
