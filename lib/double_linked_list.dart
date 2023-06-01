import 'double_node.dart';
export 'double_node.dart';

base class DoubleLinkedList {
  DoubleLinkedList(DoubleNode? node) {
    firstNode = node;
    lastNode = node;
    if (node != null) lengthList = 1;
  }
  DoubleNode? firstNode;
  DoubleNode? lastNode;
  int lengthList = 0;

  int length() {
    return lengthList;
  }

  void append(DoubleNode newNode) {
    if (lastNode == null) {
      if (lengthList != 0)
        throw "DoubleLinkedList length != 0 when lastNode is null";

      firstNode = newNode;
      lastNode = newNode;
      return;
    }

    lastNode!.next = newNode;
    newNode.previous = lastNode;
    lastNode = newNode;
  }
}
