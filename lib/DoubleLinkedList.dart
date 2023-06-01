import './DoubleNode.dart';

base class DoubleLinkedList {
  DoubleLinkedList({this.firstNode});

  DoubleNode? firstNode;
  DoubleNode? lastNode;
  int length = 0;
}
