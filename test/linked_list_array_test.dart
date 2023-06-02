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

  test('Test delete', () {
    var l = LinkedListArray(10);
    l.append(20);
    l.append(30);
    l.append(40);
    l.append(50);

    expect(() => l.delete(5), throwsFormatException);
    expect(() => l.delete(-1), throwsFormatException);

    expect(l.delete(2), 30);
    expect(l.delete(2), 40);
    expect(l.delete(2), 50);
    expect(l.delete(0), 10);
    expect(l.delete(0), 20);

    expect(() => l.delete(0), throwsFormatException);
  });

  test('Test get', () {
    var l = LinkedListArray();
    l.appendCollection([10, 20, 30, 40, 50, 10, 20]);

    expect(l.get(3), 40);
    expect(l.get(5), 10);
    expect(l.get(0), 10);
    expect(l.get(6), 20);

    var l2 = LinkedListArray();
    expect(() => l2.get(0), throwsException);
    expect(() => l2.get(-3), throwsException);
    expect(() => l2.get(3), throwsException);
  });

  test('Test deleteAll', () {
    var l = LinkedListArray();
    l.appendCollection([10, 20, 30, 10, 20, 30, 10]);

    l.deleteAll(30);
    expect(l.get(2), 10);
    expect(l.get(4), 10);

    l.deleteAll(20);
    expect(l.get(0), 10);
    expect(l.get(1), 10);
    expect(l.get(2), 10);

    l.deleteAll(10);
    expect(() => l.get(0), throwsException);
  });
}
