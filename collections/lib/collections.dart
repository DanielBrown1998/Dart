void imprimeFunc(List<int> idLista) {
  for (int item in idLista) {
    print(item);
  }
}

int countItems(dynamic obj, List<dynamic> listItem) {
  int cont = 0;
  for (dynamic item in listItem) {
    if (item == obj) {
      cont++;
    }
  }

  return cont;
}

List visitedNotCart(List cart, List visited) {
  List noCart = [];
  for (var item in visited) {
    if (!visited.contains(item)) {
      noCart.add(item);
    }
  }

  return noCart;
}

bool disponivel(Set items, dynamic item) {
  return items.contains(item);
}

Set or(Set one, Set two) {
  for (var item in one) {
    two.add(item);
  }
  return two;
}

