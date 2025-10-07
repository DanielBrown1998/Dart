int threeSumClosest(List<int> nums, int target) {
  nums.sort(); // Ordena a lista: O(n log n)
  int closestSum = nums[0] + nums[1] + nums[2];

  for (int i = 0; i < nums.length - 2; i++) {
    if (i > 0 && nums[i] == nums[i - 1]) {
      continue;
    }

    int left = i + 1;
    int right = nums.length - 1;

    while (left < right) {
      int currentSum = nums[i] + nums[left] + nums[right];

      if (currentSum == target) {
        return target; // Encontrou a soma exata, é a mais próxima possível.
      }

      if ((target - currentSum).abs() < (target - closestSum).abs()) {
        closestSum = currentSum;
      }

      if (currentSum < target) {
        left++;
      } else {
        right--;
      }
    }
  }
  return closestSum;
}

int myThreeSumClosest(List<int> nums, int target) {
  List<int> solutionsSum = [];
  List<int> parcSol = [];
  int? resp;
  double diff = double.infinity;
  nums.sort();
  for (int i = 0; i < nums.length - 2; i++) {
    parcSol.add(nums[i]);
    List<int> sub = nums.sublist(i + 1);
    for (int j = 0; j < sub.length; j++) {
      parcSol.add(sub[j]);
      List<int> subSub = sub.sublist(j + 1);
      for (int k = 0; k < subSub.length; k++) {
        parcSol.add(subSub[k]);
        int sum = parcSol.reduce((a, b) => a + b);
        if (sum == target) return target;
        solutionsSum.add(sum);
        int validate = (target - sum).abs();
        if (validate > 0 && validate < diff) {
          diff = validate.toDouble();
          resp = sum;
        }
        parcSol.removeAt(2);
      }
      parcSol.removeAt(1);
    }
    parcSol.clear();
  }
  resp ??= 0;
  return resp;
}

void main() {
  print(threeSumClosest([-1, 2, 1, -4], 1));
  print(threeSumClosest([0, 0, 0], 1));
  print(threeSumClosest([1, 1, 1, 0], -100));
  print(threeSumClosest([4, 0, 5, -5, 3, 3, 0, -4, -5], -2));
  print(threeSumClosest([-1000, -1000, -1000], 10000));
}
