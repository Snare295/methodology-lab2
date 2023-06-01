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
}
