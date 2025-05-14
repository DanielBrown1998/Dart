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

void main() {
  print(primeFactors(2 * 2 * 2 * 2 * 2 * 2 * 3 * 3 * 3 * 5 * 7 * 11 * 19));
  // print(formatDuration(132030240));
}
