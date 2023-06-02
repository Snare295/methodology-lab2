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

  void appendCollection(List<T> list) {
    for (var element in list) {
      this.append(element);
    }
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

  T delete(int index) {
    T value;
    if (index < 0) {
      throw FormatException("DoubleLinkedList.delete retrive a negative index");
    }
    if (index >= lengthList) {
      throw FormatException(
          "DoubleLinkedList.delete index is out of list's length");
    }

    if (lengthList == 1) {
      value = lastNode!.data;
      lastNode = null;
      firstNode = null;
      lengthList--;
      return value;
    }
    if (index == lengthList - 1) {
      value = lastNode!.data;
      lastNode!.previous!.next = null;
      lastNode = lastNode!.previous;
      lengthList--;
      return value;
    }
    if (index == 0) {
      value = firstNode!.data;
      firstNode!.next!.previous = null;
      firstNode = firstNode!.next;
      lengthList--;
      return value;
    }

    //Delete if isn't only, last, first node
    DoubleNode current = firstNode!;
    for (var i = 0; i < index; i++) {
      current = current.next!;
    }
    value = current.data;
    current.previous!.next = current.next;
    current.next!.previous = current.previous;
    lengthList--;
    return value;
  }

  void deleteAll(T value) {
    if (lengthList == 0) {
      return;
    }
    DoubleNode pointer = firstNode!;
    for (var i = 0; i < lengthList; i++) {
      if (pointer.data == value) {
        delete(i);
        i--;
      }
      if (i == lengthList - 1) {
        return;
      }
      pointer = pointer.next!;
    }
  }

  T get(int index) {
    T value;

    if (index < 0) {
      throw FormatException("DoubleLinkedList.get retrive a negative index");
    }
    if (index >= lengthList) {
      throw FormatException(
          "DoubleLinkedList.get index is out of list's length");
    }
    if (lengthList == 0) {
      throw FormatException(
          "DoubleLinkedList.get trying to get value from empty list");
    }

    DoubleNode pointer = firstNode!;
    for (var i = 0; i < index; i++) {
      pointer = pointer.next!;
    }
    value = pointer.data;
    return value;
  }

  void reverse() {
    for (int i = lengthList - 1; i >= 0; i--) {
      T value = this.delete(i);
      this.append(value);
    }
  }

  int findFirst(T value) {
    if (lengthList == 0) {
      return -1;
    }

    DoubleNode current = firstNode!;
    for (var i = 0; i < lengthList; i++) {
      if (current.data == value) {
        return i;
      }
      if (i == lengthList - 1) {
        return -1;
      }
      current = current.next!;
    }

    throw FormatException(
        "DoubleLinkedList.findFirst is not returned index or -1");
  }

  int findLast(T value) {
    if (lengthList == 0) {
      return -1;
    }

    DoubleNode current = lastNode!;
    for (var i = lengthList - 1; i >= 0; i--) {
      if (current.data == value) {
        return i;
      }
      if (i == 0) {
        return -1;
      }
      current = current.previous!;
    }

    throw FormatException(
        "DoubleLinkedList.findLast is not returned index or -1");
  }

  DoubleLinkedList clone() {
    DoubleLinkedList copy = DoubleLinkedList();
    if (lengthList == 0) {
      return copy;
    }

    DoubleNode current = firstNode!;
    for (var i = 0; i < lengthList; i++) {
      copy.append(current.data);
      if (i == lengthList - 1) {
        return copy;
      }
      current = current.next!;
    }

    throw FormatException("DoubleLinkedList.clone is not returned clone");
  }

  void clear() {
    if (lengthList == 0) {
      return;
    }

    int length = lengthList;
    for (var i = 0; i < length; i++) {
      this.delete(0);
    }
  }
}
