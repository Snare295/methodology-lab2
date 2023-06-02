import 'dart:math';

import 'package:lab2/double_linked_list.dart';
import 'package:test/test.dart';

void main() {
  test('Test append', () {
    var l = DoubleLinkedList(20);

    expect(l.firstNode!.data, 20);
    expect(l.lastNode!.data, 20);

    l.append(30);
    expect(l.lastNode!.data, 30);
    expect(l.firstNode!.data, 20);
    expect(l.firstNode!.next!.data, 30);
    expect(l.lastNode!.previous!.data, 20);
  });

  test('Test appendCollection', () {
    var l = DoubleLinkedList();

    l.appendCollection([10, 20, 30, 40, 50]);
    expect(l.firstNode!.data, 10);
    expect(l.lastNode!.data, 50);
    expect(l.firstNode!.next!.next!.data, 30);

    var l2 = DoubleLinkedList();
    l2.appendCollection([]);
    expect(l2.firstNode, null);
  });

  test('Test insert', () {
    var l = DoubleLinkedList(10);
    l.append(20);
    l.append(30);
    expect(l.length(), 3);

    l.insert(15, l.length());
    expect(l.lastNode!.data, 15);

    l.insert(-10, 0);
    expect(l.firstNode!.data, -10);
    expect(l.length(), 5);

    l.insert(125, 2);
    expect(l.firstNode!.next!.next!.data, 125);
  });

  test('Test delete', () {
    var l = DoubleLinkedList(10);
    l.append(20);
    l.append(30);
    l.append(40);
    l.append(50);

    expect(() => l.delete(5), throwsFormatException);
    expect(() => l.delete(-1), throwsFormatException);

    expect(l.delete(2), 30);
    expect(l.delete(2), 40);
    expect(l.delete(2), 50);
    expect(l.delete(0), 10);
    expect(l.delete(0), 20);

    expect(() => l.delete(0), throwsFormatException);
  });

  test('Test get', () {
    var l = DoubleLinkedList();
    l.appendCollection([10, 20, 30, 40, 50, 10, 20]);

    expect(l.get(3), 40);
    expect(l.get(5), 10);
    expect(l.get(0), 10);
    expect(l.get(6), 20);

    var l2 = DoubleLinkedList();
    expect(() => l2.get(0), throwsException);
    expect(() => l2.get(-3), throwsException);
    expect(() => l2.get(3), throwsException);
  });

  test('Test deleteAll', () {
    var l = DoubleLinkedList();
    l.appendCollection([10, 20, 30, 10, 20, 30, 10]);

    l.deleteAll(30);
    expect(l.get(2), 10);
    expect(l.get(4), 10);

    l.deleteAll(20);
    expect(l.get(0), 10);
    expect(l.get(1), 10);
    expect(l.get(2), 10);

    l.deleteAll(10);
    expect(() => l.get(0), throwsException);
  });

  test('Test reverse', () {
    var l = DoubleLinkedList();
    l.appendCollection([10, 20, 30, 40, 50, 60]);

    l.reverse();
    expect(l.get(0), 60);
    expect(l.get(1), 50);
    expect(l.get(2), 40);
    expect(l.get(3), 30);
    expect(l.get(4), 20);
    expect(l.get(5), 10);

    var l2 = DoubleLinkedList();
    l2.reverse();
  });

  test('Test findFirst', () {
    var l = DoubleLinkedList();
    l.appendCollection([10, 20, 10, 30, 40]);

    expect(l.findFirst(10), 0);
    expect(l.findFirst(30), 3);
    expect(l.findFirst(40), 4);

    var l2 = DoubleLinkedList();

    expect(l2.findFirst(10), -1);

    l2.appendCollection([10, 20, 30, 40]);
    expect(l2.findFirst(50), -1);
  });

  test('Test findLast', () {
    var l = DoubleLinkedList();
    l.appendCollection([50, 20, 10, 30, 10]);

    expect(l.findLast(10), 4);
    expect(l.findLast(30), 3);
    expect(l.findLast(50), 0);

    var l2 = DoubleLinkedList();

    expect(l2.findLast(10), -1);

    l2.appendCollection([10, 20, 30, 40]);
    expect(l2.findLast(50), -1);
  });

  test('Test clone', () {
    var l = DoubleLinkedList();
    l.appendCollection(["a", "b", "c"]);

    var c = l.clone();
    expect(c.get(0), "a");
    expect(c.get(1), "b");
    expect(c.get(2), "c");

    var l2 = DoubleLinkedList("V");
    var c2 = l2.clone();
    expect(c2.get(0), "V");

    var l3 = DoubleLinkedList();
    var c3 = l3.clone();
    expect(c3.firstNode, null);
    expect(c3.lastNode, null);
  });

  test('Test clear', () {
    var l = DoubleLinkedList();
    l.appendCollection([10, 20, 30, 40]);

    l.clear();
    expect(() => l.get(0), throwsException);
    expect(() => l.get(1), throwsException);
    expect(() => l.get(2), throwsException);
    expect(() => l.get(3), throwsException);
    expect(l.firstNode, null);
    expect(l.lastNode, null);
    expect(l.lengthList, 0);
  });
}
