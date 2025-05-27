String formatDuration(int totalSeconds) {
  if (totalSeconds == 0) return "now";

  if (totalSeconds < 60 && totalSeconds != 1) {
    return "$totalSeconds seconds";
  } else if (totalSeconds == 1) {
    return "$totalSeconds second";
  }

  int rest;
  int div;
  String result = "";

  Map<String, int> times = {
    "year": 365 * 24 * 3600,
    "day": 24 * 3600,
    "hour": 3600,
    "minute": 60
  };

  Iterable<String> keys = times.keys;

  for (String key in keys) {
    rest = totalSeconds % times[key]!;
    div = (totalSeconds ~/ times[key]!);
    if (div == 1) {
      if (rest > 60) {
        result += "$div $key, ";
      } else if (rest == 0) {
        if (result == "") {
          result += "$div $key";
        } else {
          result = result.substring(0, result.length - 2);
          result += " and $div $key";
        }
      } else {
        result += "$div $key ";
      }
    } else if (div > 1) {
      if (rest > 60) {
        result += "$div ${key}s, ";
      } else if (rest == 0) {
        if (result == "") {
          result += "$div ${key}s";
        } else {
          result = result.substring(0, result.length - 2);
          result += " and $div ${key}s";
        }
      } else {
        result += "$div ${key}s ";
      }
    }
    totalSeconds = rest;
  }
  if (totalSeconds != 0) {
    if (totalSeconds == 1) {
      result += "and $totalSeconds second";
    } else {
      result += "and $totalSeconds seconds";
    }
  }
  return result;
}

bool isPrime(int number) {
  if (number <= 1) {
    return false; // 1 e números negativos não são primos
  }
  if (number == 2) return true;
  if (number % 2 == 0) return false;
  for (int i = 3; i * i <= number; i += 2) {
    if (number % i == 0) {
      return false; // Se for divisível por algum número, não é primo
    }
  }
  return true; // Se não for divisível por nenhum, é primo
}

String primeFactors(int n) {
  String num = "";
  int cont = 0;
  String part = "";
  if (n % 2 == 0) {
    while (n % 2 == 0) {
      n = n ~/ 2;
      cont++;
    }
    part += cont != 1 ? "(2**$cont)" : "(2)";
  }
  num += part;
  part = "";
  cont = 0;
  for (int i = 3; i <= n; i += 2) {
    if (isPrime(i) && n % i == 0) {
      while (n % i == 0) {
        n = n ~/ i;
        cont++;
      }
      part = cont != 1 ? "($i**$cont)" : "($i)";
      cont = 0;
    }
    num += part;
    part = "";
  }
  return num;
}

String intToRoman(int num) {
  Map<String, dynamic> romanNums = {
    "M": 1000,
    "CM": 900,
    'D': 500,
    'CD': 400,
    "C": 100,
    "XC": 90,
    "L": 50,
    "XL": 40,
    "X": 10,
    "IX": 9,
    "V": 5,
    "IV": 4,
    "III": 3,
    "II": 2,
    "I": 1,
  };
  String result = "";
  while (num > 0) {
    int e = 0;
    for (int roman in romanNums.values) {
      if (num >= roman) {
        num -= roman;
        result += romanNums.keys.elementAt(e);
        break;
      }
      e++;
    }
  }
  return result;
}

int romanToInt(String s) {
  Map<String, dynamic> romanNums = {
    "M": 1000,
    "CM": 900,
    'D': 500,
    'CD': 400,
    "C": 100,
    "XC": 90,
    "L": 50,
    "XL": 40,
    "X": 10,
    "IX": 9,
    "V": 5,
    "IV": 4,
    "I": 1,
  };

  num result = 0;
  String next = "";
  String atual = "";
  int i = 0;
  List<String> x = s.trim().split("");
  while (i < (x).length) {
    atual = x.elementAt(i);
    next = x.elementAt(i + 1 < x.length ? i + 1 : x.length - 1);

    if (romanNums[atual] < romanNums[next]) {
      result += romanNums[atual + next];
      i++;
    } else if (romanNums[atual] >= romanNums[next]) {
      result += romanNums[atual];
    }
    i++;
  }
  return result.toInt();
}

List<String> letterCombinations(String digits) {
  if (digits.isEmpty) return [];

  Map<String, List<String>> map = {
    "2": ["a", "b", "c"],
    "3": ["d", "e", "f"],
    "4": ["g", "h", "i"],
    "5": ["j", "k", "l"],
    "6": ["m", "n", "o"],
    "7": ["p", "q", "r", "s"],
    "8": ["t", "u", "v"],
    "9": ["w", "x", "y", "z"]
  };

  if (digits.length == 1) {
    return map[digits[0]]!;
  } else if (digits.length == 2) {
    List<String> result = [];
    for (String i in map[digits[0]]!) {
      for (String j in map[digits[1]]!) {
        result.add(i + j);
      }
    }
    return result;
  } else if (digits.length == 3) {
    List<String> result = [];
    for (String i in map[digits[0]]!) {
      for (String j in map[digits[1]]!) {
        for (String k in map[digits[2]]!) {
          result.add(i + j + k);
        }
      }
    }
    return result;
  } else if (digits.length == 4) {
    List<String> result = [];
    for (String i in map[digits[0]]!) {
      for (String j in map[digits[1]]!) {
        for (String k in map[digits[2]]!) {
          for (String l in map[digits[3]]!) {
            result.add(i + j + k + l);
          }
        }
      }
    }
    return result;
  }
  return [];
}

class ListNode {
    int val;
    ListNode? next;
    ListNode([this.val = 0, this.next]);
}

ListNode no = ListNode(0);
List<int> twoNumber(List<int> listOne, List<int> listTwo) {
  int max = [listOne.length, listTwo.length].reduce((a, b) => a > b ? a : b);
  List<int> result = [];
  int next = 0;
  int uniSum = 0;
  if (max == 0) return result; // Se ambas as listas estiverem vazias, retorna uma lista vazia
  if (max == 1 && listOne.isEmpty) return listTwo; // Se apenas a primeira lista estiver vazia, retorna a segunda
  if (max == 1 && listTwo.isEmpty) return listOne; // Se apenas a segunda lista estiver vazia, retorna a primeira
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
    } else if (i < listOne.length && i >= listTwo.length) {
      uniSum = listOne[i] + next;
      if (uniSum >= 10) {
        uniSum = uniSum % 10;
        next = 1;
      } else {
        next = 0;
      }
      result.add(uniSum);
    } else if (i >= listOne.length && i < listTwo.length) {
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
  }
  return result;
  }else{

  }  
}

void main() {
  List<int> listOne = [9, 9, 1];
  List<int> listTwo = [5, 4, 6];
  List<int> result = twoNumber(listOne, listTwo);
  print("List One: $listOne");
  print("List Two: $listTwo");
  print("Result: $result");
}
