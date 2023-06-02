# Doubly linked list on heap and Singly linked list on dart list

## Description

This repository containts 2 implementations of linked list. Doubly is created from double sided nodes and is storaged in heap automatically, dart garbage collector automatically removes waste objects, to which we can't access. Singly is created from single sided nodes that saved on array, this implementation is less classic than last C++ style like, but is very handy with a lot of functionality needed for linked list implemented as methods of dart's list. Each implementation have this methods: length, append, appendCollection, insert, delete, deleteAll, get, clone, reverse, findFirst, findLast, clear, extend. 

## Variant Calculation

My grade book number is 1321.

1321 % 4 = 1, my variant is 1.

Needed implementation:
- Doubly linked list
- Linked list on embeded arrays 

## How to run

Download exe from /bin/lab2.exe

As github doesn't implement downloading individual files, it's better to just <code>git clone https://github.com/Snare295/methodology-lab2</code>

To install for running in runtime use this guide https://github.com/Snare295/methodology-lab1#how-to-install

## Failed tests commit

https://github.com/Snare295/methodology-lab2/commit/123b1e1efdc38dfc78253d5f6fa4c3b96055d3c5

## Conclusion

I have worked already with tests and CI, but this laboratory showed me importance of TDD and good tests, i catched not one error and unexpected behaviour because tests, though in different projects, that isn't that low-coded, i would doubt using them because of time.
