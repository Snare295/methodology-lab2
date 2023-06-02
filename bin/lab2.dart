import 'dart:io';

import 'package:lab2/double_linked_list.dart';

void main() {
  print("Demonstration of double linked list");
  print("Create object");
  var dl = DoubleLinkedList();
  print(DoubleLinkedList());

  print("Add char a");
  dl.append("a");

  stdin.readByteSync();
  print("Print char in list from get method");
  print(dl.get(0));

  stdin.readByteSync();
  print("Let's extend it");
  var edl = DoubleLinkedList();
  edl.appendCollection([10, 20]);
  dl.extend(edl);
  print(dl.get(0));
  print(dl.get(1));
  print(dl.get(2));

  stdin.readByteSync();
  print("Insert in first");
  dl.insert(10, 0);
  print(dl.get(0));

  stdin.readByteSync();
  print("Find index of first 10 and last 10");
  print(dl.findFirst(10));
  print(dl.findLast(10));

  stdin.readByteSync();
  print("Let's reverse it");
  dl.reverse();
  print(dl.get(0));
  print(dl.get(1));
  print(dl.get(2));
  print(dl.get(3));

  stdin.readByteSync();
  print("Clone it");
  var dl2 = dl.clone();
  print(dl2);
  print(dl2.get(0));
  print(dl2.get(1));
  print(dl2.get(2));
  print(dl2.get(3));

  stdin.readByteSync();
  print("See length");
  print(dl.length());

  stdin.readByteSync();
  print("Delete all 10");
  dl.deleteAll(10);
  print(dl.length());

  stdin.readByteSync();
  print("Delete first, first value of delted, then length");
  print(dl.delete(0));
  print(dl.length());

  stdin.readByteSync();
  print("Clear it and see length");
  dl.clear();
  print(dl.length());

  stdin.readByteSync();
  print("All working :)");
  stdin.readByteSync();
}
