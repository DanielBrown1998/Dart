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

void main() {
  print(formatDuration(132030240));
}
