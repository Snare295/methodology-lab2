import 'package:lab2/double_linked_list.dart';
import 'package:test/test.dart';

void main() {
  test('Test append', () {
    var l = DoubleLinkedList(20);

    expect(l.firstNode!.data, 20);
    expect(l.lastNode!.data, 20);

    l.append(30);
    expect(l.lastNode!.data, 30);
    expect(l.firstNode!.data, 20);
    expect(l.firstNode!.next!.data, 30);
    expect(l.lastNode!.previous!.data, 20);
  });

  test('Test insert', () {
    var l = DoubleLinkedList(10);
    l.append(20);
    l.append(30);
    expect(l.length(), 3);

    l.insert(15, l.length());
    expect(l.lastNode!.data, 15);

    l.insert(-10, 0);
    expect(l.firstNode!.data, -10);
    expect(l.length(), 5);

    l.insert(125, 2);
    expect(l.firstNode!.next!.next!.data, 125);
  });
}
