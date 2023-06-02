import 'node.dart';
export 'node.dart';

base class LinkedListArray<T> {
  LinkedListArray([T? value]) {
    if (value != null) {
      array.add(Node(data: value));
    }
  }
  List<Node> array = [];

  int length() {
    return array.length;
  }

  void append(T value) {
    Node newNode = Node(data: value);
    if (array.isNotEmpty) {
      array.last.next = newNode;
    }
    array.add(newNode);
  }

  void appendCollection(List<T> list) {
    for (var element in list) {
      this.append(element);
    }
  }

  void insert(T value, int index) {
    if (index < 0) {
      throw FormatException("LinkedListArray.insert retrive a negative index");
    }
    if (index > array.length) {
      throw FormatException(
          "LinkedListArray.insert index is out of list's length");
    }

    Node newNode = Node(data: value);

    newNode.next = array.elementAtOrNull(index);
    if (index != 0) {
      array.elementAt(index - 1).next = newNode;
    }
    array.insert(index, newNode);
  }

  T delete(int index) {
    T value;
    if (index < 0) {
      throw FormatException("LinkedListArray.delete retrive a negative index");
    }
    if (index >= array.length) {
      throw FormatException(
          "LinkedListArray.delete index is out of list's length");
    }

    if (index == 0) {
      value = array.removeAt(0).data;
      return value;
    }
    if (index == array.length - 1) {
      value = array.removeLast().data;
      array.last.next = null;
      return value;
    }
    value = array.removeAt(index).data;
    array.elementAt(index - 1).next = array.elementAt(index);
    return value;
  }

  void deleteAll(T value) {
    if (array.isEmpty) {
      return;
    }
    for (var i = 0; i < array.length; i++) {
      if (array[i].data == value) {
        delete(i);
        i--;
      }
    }
  }

  T get(int index) {
    if (index < 0) {
      throw FormatException("DoubleLinkedList.get retrive a negative index");
    }
    if (index >= array.length) {
      throw FormatException(
          "DoubleLinkedList.get index is out of list's length");
    }

    return array[index].data;
  }

  int findFirst(T value) {
    return array.indexWhere((element) => element.data == value);
  }

  int findLast(T value) {
    return array.lastIndexWhere((element) => element.data == value);
  }

  LinkedListArray clone() {
    LinkedListArray copy = LinkedListArray();
    copy.array = this.array.toList();
    return copy;
  }

  void reverse() {
    array = array.reversed.toList();
  }

  void clear() {
    array.clear();
  }
}
