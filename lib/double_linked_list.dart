import 'double_node.dart';
export 'double_node.dart';

base class DoubleLinkedList<T> {
  DoubleLinkedList([T? value]) {
    if (value != null) {
      DoubleNode startNode = DoubleNode(data: value);
      firstNode = startNode;
      lastNode = startNode;
      lengthList = 1;
    }
  }

  DoubleNode? firstNode;
  DoubleNode? lastNode;
  int lengthList = 0;

  int length() {
    return lengthList;
  }

  void append(T value) {
    DoubleNode newNode = DoubleNode(data: value);

    if (lastNode == null) {
      if (lengthList != 0)
        throw FormatException(
            "DoubleLinkedList length != 0 when lastNode is null");

      firstNode = newNode;
      lastNode = newNode;
      lengthList++;
      return;
    }

    lastNode!.next = newNode;
    newNode.previous = lastNode;
    lastNode = newNode;
    lengthList++;
  }

  void insert(T value, int index) {
    if (index < 0) {
      throw FormatException("DoubleLinkedList.insert retrive a negative index");
    }
    if (index > lengthList) {
      throw FormatException(
          "DoubleLinkedList.insert index is out of list's length");
    }

    DoubleNode newNode = DoubleNode(data: value);
    if (index == lengthList) {
      this.append(value);
      return;
    }
    if (index == 0) {
      firstNode!.previous = newNode;
      newNode.next = firstNode;
      firstNode = newNode;
      lengthList++;
      return;
    }

    //Insert isn't first or last node
    DoubleNode before;
    DoubleNode after = firstNode!;
    for (var i = 0; i < index; i++) {
      after = after.next!;
    }
    before = after.previous!;
    before.next = newNode;
    after.previous = newNode;
    newNode.next = after;
    newNode.previous = before;
    lengthList++;
  }
}
