import 'package:lab2/linked_list_array.dart';
import 'package:test/test.dart';

void main() {
  test('Test append', () {
    var l = LinkedListArray(20);

    expect(l.array[0].data, 20);

    l.append(40);
    expect(l.array[0].data, 20);
    expect(l.array[1].data, 40);
    expect(l.array[0].next, l.array[1]);
  });

  test('Test appendCollection', () {
    var l = LinkedListArray();

    l.appendCollection([10, 20, 30]);
    expect(l.array[0].data, 10);
    expect(l.array[1].data, 20);
    expect(l.array[2].data, 30);
    expect(l.array[0].next, l.array[1]);
    expect(l.array[1].next, l.array[2]);
    expect(l.array[2].next, null);

    var l2 = LinkedListArray();
    l2.appendCollection([]);
    expect(l2.array.isEmpty, true);
  });

  test('Test insert', () {
    var l = LinkedListArray(10);
    l.append(20);
    l.append(30);
    expect(l.length(), 3);

    l.insert(15, l.length());
    expect(l.array.last.data, 15);

    l.insert(-10, 0);
    expect(l.array.first.data, -10);
    expect(l.length(), 5);

    l.insert(125, 2);
    expect(l.array[2].data, 125);
  });
}
