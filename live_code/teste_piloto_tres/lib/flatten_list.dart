// ENTRADA: Uma lista aninhada. Não modifique esta lista.
const nestedListData = [
  1,
  [2, 3, [], 4],
  [],
  5,
  [
    6,
    [
      7,
      8,
      [9],
    ],
    10,
  ],
];

/*
 * Complete a função abaixo.
 * Ela deve receber uma lista aninhada 'nestedList' e retornar
 * uma única lista achatada contendo todos os inteiros.
 */
List<int> flattenList(List<dynamic> nestedList) {
  List<int> result = [];
  for (var item in nestedList) {
    // print("$item ${item.runtimeType}");
    if (item is List<dynamic> && item.isNotEmpty) {
      result.addAll(flattenList(item));
    } else if (item is List<dynamic> && item.isEmpty) {
      continue;
    } else {
      result.add(item);
    }
  }
  return result;
}
