int sumOfIntervals(List<List<int>> intervals) {
  int value = 0;

  //ordenando os intervalos
  intervals.sort(
    (a, b) => a[0] != b[0] ? a[0].compareTo(b[0]) : a[1].compareTo(b[1]),
  );
  //inicializando o intervalo
  int min_value = intervals[0][0];
  int max_value = intervals[0][1];
  value = max_value - min_value;

  for (int i = 1; i < intervals.length; i++) {
    if (intervals[i][0] >= max_value) {
      value += intervals[i][1] - intervals[i][0];
      max_value = intervals[i][1];
    } else if (intervals[i][0] <= max_value) {
      if (intervals[i][1] < max_value) {
        continue;
      } else {
        value += intervals[i][1] - max_value;
        max_value = intervals[i][1];
      }
    }
  }

  return value;
}

void main() {
  List<List<int>> intervals = [
    [1, 5],
    [1, 3],
    [10, 20],
    [1, 6],
    [2, 3],
    [4, 5],
    [6, 7],
    [8, 9],
    [10, 11],
    [12, 13],
    [14, 15],
    [16, 17],
    [18, 19],
  ];

  print(sumOfIntervals(intervals)); // Output: 17;
}
