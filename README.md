# Имитационная модель канала связи OFDM в Matlab

## Lab1  Знаковое кодирование

Задание: Реализовать знаковое кодирование и декодирование текстового сообщения

<img src = "scrin/1.jpg">

Используемый алфавит:

- a = [1,0,0,0,0,1,1]
- v = [0,1,1,0,1,1,1]
- k = [1,1,0,1,0,1,1]
- l = [0,0,1,1,0,1,1]
- o = [1,1,1,1,0,1,1]
- u = [1,0,1,0,1,1,1]

Пример работы: 

<img src = "scrin/2.jpg">


## Lab2  Помехоустойчивое кодирование

Задание: Реализовать операцию сверточного кодирования и витерби декодирования битового сообщения

<img src = "scrin/4.jpg">

<img src = "scrin/5.jpg">

Пример работы: 

<img src = "scrin/3.jpg">

## Lab3  Перемежение

Задание: Реализовать операцию прямого и обратного перемежения закодированного битового сообщения

<img src = "scrin/6.jpg">

Вектор перемежения генерируется с помощью функции в Matlab:

ran_index = randperm(length(conv_massage));

<img src = "scrin/7.jpg">

<img src = "scrin/8.jpg">


Пример работы:

<img src = "scrin/9.jpg">

## Рефакторинг 

код переработан в лайф скрипт, каждая функция в отдельном файле

<img src = "scrin/10.jpg">

## Lab4 QPSK Модуляция

Задание: Реализовать операцию QPSK-модуляции битового сообщения и QPSK-демодуляции символов модуляции

<img src = "scrin/11.jpg">

Пример работы:

<img src = "scrin/12.jpg">

## Lab5 OFDM модуляция

Задание: Реализовать формирование OFDM-символа, включающего в себя QPSK-символы и опорные сигналы

<img src = "scrin/13.jpg">

Пример работы:

<img src = "scrin/14.jpg">