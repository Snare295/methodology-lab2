import 'double_node.dart';
export 'double_node.dart';

base class DoubleLinkedList<T> {
  DoubleLinkedList([T? value]) {
    if (value != null) {
      DoubleNode startNode = DoubleNode(data: value);
      firstNode = startNode;
      lastNode = startNode;
    }
  }

  DoubleNode? firstNode;
  DoubleNode? lastNode;
  int lengthList = 0;

  int length() {
    return lengthList;
  }

  void append<T>(T value) {
    DoubleNode newNode = DoubleNode(data: value);

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
