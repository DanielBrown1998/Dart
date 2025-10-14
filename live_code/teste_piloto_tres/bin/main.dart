import 'package:teste_piloto_tres/flatten_list.dart';

void main() {
  final flatList = flattenList(nestedListData);

  // Imprime o resultado para verificação.
  // Lista Original: [1, [2, 3, [], 4], [], 5, [6, [7, 8, [9]]], 10]
  // Lista Achatada: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print('Lista Original: $nestedListData');
  print('Lista Achatada: $flatList');
}
