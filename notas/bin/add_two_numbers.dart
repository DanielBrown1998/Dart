class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  List<int> listNodeToList(ListNode? no) {
    if (no == null) {
      return [];
    }
    List<int> result = [];
    ListNode? node = no;
    while (node != null) {
      result.add(node.val);
      node = node.next;
    }
    return result;
  }

  ListNode? listToListNode(List<int> list) {
    if (list.length == 1) return ListNode(list[0]);
    List<int> listReverse = list.toList();
    ListNode aux = ListNode();
    ListNode node = ListNode(listReverse[0], aux);
    for (int i = 1; i < listReverse.length; i++) {
      aux.val = listReverse[i];
      if (i < listReverse.length - 1) {
        aux.next = ListNode();
        aux = aux.next!;
      } else {
        aux.next = null;
      }
    }
    return node;
  }

  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    List<int> listOne = listNodeToList(l1);
    List<int> listTwo = listNodeToList(l2);

    int max = [listOne.length, listTwo.length].reduce((a, b) => a > b ? a : b);
    List<int> result = [];

    if (max == 0) {
      return listToListNode(
          []); // Se ambas as listas estiverem vazias, retorna uma lista vazia
    }
    if (max == 1 && listOne.isEmpty) {
      return listToListNode(
          listTwo); // Se apenas a primeira lista estiver vazia, retorna a segunda
    }
    if (max == 1 && listTwo.isEmpty) {
      return listToListNode(
          listOne); // Se apenas a segunda lista estiver vazia, retorna a primeira
    }

    int next = 0;
    int uniSum = 0;

    for (int i = 0; i < max; i++) {
      if (i < listOne.length && i < listTwo.length) {
        uniSum = listOne[i] + listTwo[i] + next;
        if (uniSum >= 10) {
          uniSum = uniSum % 10;
          next = 1;
        } else {
          next = 0;
        }
        result.add(uniSum);
      }
      if (i < listOne.length && i >= listTwo.length) {
        uniSum = listOne[i] + next;
        if (uniSum >= 10) {
          uniSum = uniSum % 10;
          next = 1;
        } else {
          next = 0;
        }
        result.add(uniSum);
      }
      if (i >= listOne.length && i < listTwo.length) {
        uniSum = listTwo[i] + next;
        if (uniSum >= 10) {
          uniSum = uniSum % 10;
          next = 1;
        } else {
          next = 0;
        }
        result.add(uniSum);
      }
    }
    if (next > 0) {
      result.add(1);
      next = 0;
    }
    return listToListNode(result);
  }
}

void main() {
  Solution solution = Solution();
  ListNode? result = solution.addTwoNumbers(
      solution.listToListNode([0]), solution.listToListNode([0]));
  print(solution.listNodeToList(result));
}
