import 'package:teste_piloto_tres/flatten_list.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    final result = flattenList(nestedListData);
    expect(result, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  });
}
