base class DoubleNode<T> {
  DoubleNode({required this.data, this.next, this.previous});

  T data;
  DoubleNode<T>? next;
  DoubleNode<T>? previous;
}

base class Node<T> {
  Node({required this.data, this.next});

  T data;
  Node<T>? next;
}
