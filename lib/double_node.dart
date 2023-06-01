base class DoubleNode<T> {
  DoubleNode({required this.data, this.next, this.previous});

  T data;
  DoubleNode<T>? next;
  DoubleNode<T>? previous;
}
