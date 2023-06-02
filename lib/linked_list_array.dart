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
}
